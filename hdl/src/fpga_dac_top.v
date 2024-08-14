`timescale 1ns / 1ps

module fpga_dac_top
#(
    parameter S0_AXI_DATA_W = 32
)
(
    input        pl_clk_50m_i,
    input  [1:0] pl_key_i,

    input        i2s_in_sck_i,  // 256fs
    input        i2s_in_sck_nc_i,
    input        i2s_in_bck_i,
    input        i2s_in_lrck_i,
    input        i2s_in_sdata_i,

    input  [3:0] ext_key_i,

    input        dsd_oe_i,

    output [3:0] pl_led_o,

    output       dsm_clk_o,
    output [1:0] dsm_out_o,

    input        s0_axi_aclk,
    input        s0_axi_aresetn,
    input  [S0_AXI_DATA_W - 1:0] s0_axi_awaddr,
    input        s0_axi_awvalid,
    output       s0_axi_awready,
    input  [S0_AXI_DATA_W - 1:0] s0_axi_wdata,
    input  [S0_AXI_DATA_W / 8 - 1:0] s0_axi_wstrb,
    input        s0_axi_wvalid,
    output       s0_axi_wready,
    output [1:0] s0_axi_bresp,
    output       s0_axi_bvalid,
    input        s0_axi_bready,
    input  [S0_AXI_DATA_W - 1:0] s0_axi_araddr,
    input        s0_axi_arvalid,
    output       s0_axi_arready,
    output [S0_AXI_DATA_W - 1:0] s0_axi_rdata,
    output [1:0] s0_axi_rresp,
    output       s0_axi_rvalid,
    input        s0_axi_rready
);

`ifdef __ICARUS__
    wire                  clk = i2s_in_sck_i;
`elsif XILINX_SIMULATOR
    wire                  clk = i2s_in_sck_i;
`else
    wire                  clk;
`endif
    reg  [$clog2(1024):0] clk_div;
    wire                  clk_1024fs_stb;
    wire                  clk_512fs_stb;
    wire                  clk_256fs_stb;
    wire                  clk_128fs_stb;
    wire                  clk_64fs_stb;
    wire                  clk_32fs_stb;
    wire                  clk_16fs_stb;
    wire                  clk_8fs_stb;
    wire                  clk_4fs_stb;
    wire                  clk_2fs_stb;
    wire                  clk_fs_stb;

    wire                  rst = ~ext_key_i[0];

    reg                   i2s_in_bck_r;
    reg                   i2s_in_lrck_r;
    reg                   i2s_in_sdata_r;

    wire [          31:0] data_l, data_r;
    wire                  data_l_stb, data_r_stb;

    reg  [          25:0] led_cntr;

    assign pl_led_o[1]    = dsd_oe_i;
    assign pl_led_o[3]    = led_cntr[25];

    assign dsm_clk_o      = dsd_oe_i ? i2s_in_bck_r :
        (ext_key_i[1] ? clk : clk_64fs_stb);
    assign dsm_out_o[0]   = 1'b0;
    assign dsm_out_o[1]   = 1'b0;

    assign clk_1024fs_stb = 1'b1;
    assign clk_512fs_stb  = (clk_div & 10'b0000000001) == 10'b0000000001;
    assign clk_256fs_stb  = (clk_div & 10'b0000000011) == 10'b0000000011;
    assign clk_128fs_stb  = (clk_div & 10'b0000000111) == 10'b0000000111;
    assign clk_64fs_stb   = (clk_div & 10'b0000001111) == 10'b0000001111;
    assign clk_32fs_stb   = (clk_div & 10'b0000011111) == 10'b0000011111;
    assign clk_16fs_stb   = (clk_div & 10'b0000111111) == 10'b0000111111;
    assign clk_8fs_stb    = (clk_div & 10'b0001111111) == 10'b0001111111;
    assign clk_4fs_stb    = (clk_div & 10'b0011111111) == 10'b0011111111;
    assign clk_2fs_stb    = (clk_div & 10'b0111111111) == 10'b0111111111;
    assign clk_fs_stb     = (clk_div & 10'b1111111111) == 10'b1111111111;

`ifndef __ICARUS__
`ifndef XILINX_SIMULATOR
    // Clock PLL
    clock_pll i_clock_pll
    (
        .clk_i      ( i2s_in_sck_i ),
        .rst_i      ( rst ),

        .pll_lock_o ( pl_led_o[0] ),

        //.clk_x2_out ( clk )  // For Amanero board
        .clk_x4_o   ( clk )  // For Tenor board
    );
`endif
`endif

    // I2S receiver
    i2s_receiver i_i2s_receiver
    (
        .clk_i        ( clk ),
        .rst_i        ( rst ),

        .bck_i        ( i2s_in_bck_r ),
        .lrck_i       ( i2s_in_lrck_r ),
        .sdata_i      ( i2s_in_sdata_r ),

        .data_l_o     ( data_l ),
        .data_l_stb_o ( data_l_stb ),
        .data_r_o     ( data_r ),
        .data_r_stb_o ( data_r_stb )
    );

    // Clock div counter
    always @ (posedge clk) begin
        if (rst)
            clk_div <= 0;
        else
            clk_div <= clk_div + 1'b1;
    end

    // I2S Input resync
    always @ (posedge clk) begin
        i2s_in_bck_r   <= i2s_in_bck_i;
        i2s_in_lrck_r  <= i2s_in_lrck_i;
        i2s_in_sdata_r <= i2s_in_sdata_i;
    end

    // LED blink counter
    always @ (posedge pl_clk_50m_i) begin
        if (rst)
            led_cntr <= 0;
        else
            led_cntr <= led_cntr + 1'b1;
    end

endmodule
