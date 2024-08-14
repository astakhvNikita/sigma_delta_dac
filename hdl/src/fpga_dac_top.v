`timescale 1ns / 1ps

module fpga_dac_top
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

    // Normally AXI is automatically inferred.  However, if the names of your ports do not match, you can force the
    // the creation of an interface and map the physical ports to the logical ports by using the X_INTERFACE_INFO
    // attribute before each physical port
    // Typical parameters the user might specify: PROTOCOL {AXI4, AXI4LITE, AXI3}, SUPPORTS_NARROW_BURST {0, 1}, NUM_READ_OUTSTANDING, NUM_WRITE_OUTSTANDING, MAX_BURST_LENGTH
    // The PROTOCOL can be typically be inferred from the set of signals.
    // aximm - AMBA AXI Interface (slave directions)
    // 
    // Allowed parameters:
    //  CLK_DOMAIN                - Clk Domain                (string default: <blank>) 
    //  PHASE                     - Phase                     (float) 
    //  MAX_BURST_LENGTH          - Max Burst Length          (long default: 256) [1, 256]
    //  NUM_WRITE_OUTSTANDING     - Num Write Outstanding     (long default: 1) [0, 32]
    //  NUM_READ_OUTSTANDING      - Num Read Outstanding      (long default: 1) [0, 32]
    //  SUPPORTS_NARROW_BURST     - Supports Narrow Burst     (long default: 1) [0, 1]
    //  READ_WRITE_MODE           - Read Write Mode           (string default: READ_WRITE) {READ_WRITE,READ_ONLY,WRITE_ONLY}
    //  BUSER_WIDTH               - Buser Width               (long) 
    //  RUSER_WIDTH               - Ruser Width               (long) 
    //  WUSER_WIDTH               - Wuser Width               (long) 
    //  ARUSER_WIDTH              - Aruser Width              (long) 
    //  AWUSER_WIDTH              - Awuser Width              (long) 
    //  ADDR_WIDTH                - Addr Width                (long default: 32) [1, 64]
    //  ID_WIDTH                  - Id Width                  (long) 
    //  FREQ_HZ                   - Frequency                 (float default: 100000000) 
    //  PROTOCOL                  - Protocol                  (string default: AXI4) {AXI4,AXI4LITE,AXI3}
    //  DATA_WIDTH                - Data Width                (long default: 32) {32,64,128,256,512,1024}
    //  HAS_BURST                 - Has BURST                 (long default: 1) {0,1}
    //  HAS_CACHE                 - Has CACHE                 (long default: 1) {0,1}
    //  HAS_LOCK                  - Has LOCK                  (long default: 1) {0,1}
    //  HAS_PROT                  - Has PROT                  (long default: 1) {0,1}
    //  HAS_QOS                   - Has QOS                   (long default: 1) {0,1}
    //  HAS_REGION                - Has REGION                (long default: 1) {0,1}
    //  HAS_WSTRB                 - Has WSTRB                 (long default: 1) {0,1}
    //  HAS_BRESP                 - Has BRESP                 (long default: 1) {0,1}
    //  HAS_RRESP                 - Has RRESP                 (long default: 1) {0,1}

    input s0_axi_aclk,
    input s0_axi_aresetn,
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWID" *)
    // Uncomment the following to set interface specific parameter on the bus interface.
    //  (* X_INTERFACE_PARAMETER = "CLK_DOMAIN <value>,PHASE <value>,MAX_BURST_LENGTH <value>,NUM_WRITE_OUTSTANDING <value>,NUM_READ_OUTSTANDING <value>,SUPPORTS_NARROW_BURST <value>,READ_WRITE_MODE <value>,BUSER_WIDTH <value>,RUSER_WIDTH <value>,WUSER_WIDTH <value>,ARUSER_WIDTH <value>,AWUSER_WIDTH <value>,ADDR_WIDTH <value>,ID_WIDTH <value>,FREQ_HZ <value>,PROTOCOL <value>,DATA_WIDTH <value>,HAS_BURST <value>,HAS_CACHE <value>,HAS_LOCK <value>,HAS_PROT <value>,HAS_QOS <value>,HAS_REGION <value>,HAS_WSTRB <value>,HAS_BRESP <value>,HAS_RRESP <value>" *)
    input [31:0] s0_axi_awid, // Write address ID (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWADDR" *)
    input [31:0] s0_axi_awaddr, // Write address (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWSIZE" *)
    input [2:0] s0_axi_awsize, // Burst size (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWBURST" *)
    input [1:0] s0_axi_awburst, // Burst type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWCACHE" *)
    input [3:0] s0_axi_awcache, // Cache type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWPROT" *)
    input [2:0] s0_axi_awprot, // Protection type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWREGION" *)
    input [3:0] s0_axi_awregion, // Write address slave region (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWQOS" *)
    input [3:0] s0_axi_awqos, // Transaction Quality of Service token (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWVALID" *)
    input s0_axi_awvalid, // Write address valid (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWREADY" *)
    output s0_axi_awready, // Write address ready (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WDATA" *)
    input [31:0] s0_axi_wdata, // Write data (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WLAST" *)
    input s0_axi_wlast, // Write last beat (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WVALID" *)
    input s0_axi_wvalid, // Write valid (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WREADY" *)
    output s0_axi_wready, // Write ready (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BRESP" *)
    output [1:0] s0_axi_bresp, // Write response (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BVALID" *)
    output s0_axi_bvalid, // Write response valid (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BREADY" *)
    input s0_axi_bready, // Write response ready (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARADDR" *)
    input [31:0] s0_axi_araddr, // Read address (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARSIZE" *)
    input [2:0] s0_axi_arsize, // Burst size (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARBURST" *)
    input [1:0] s0_axi_arburst, // Burst type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARCACHE" *)
    input [3:0] s0_axi_arcache, // Cache type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARPROT" *)
    input [2:0] s0_axi_arprot, // Protection type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARQOS" *)
    input [3:0] s0_axi_arqos, // Quality of service token (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARVALID" *)
    input s0_axi_arvalid, // Read address valid (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARREADY" *)
    output s0_axi_arready, // Read address ready (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RDATA" *)
    output [31:0] s0_axi_rdata, // Read data (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RRESP" *)
    output [1:0] s0_axi_rresp, // Read response (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RLAST" *)
    output s0_axi_rlast, // Read last beat (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RVALID" *)
    output s0_axi_rvalid, // Read valid (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RREADY" *)
    input s0_axi_rready // Read ready (optional)
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
    always @ (posedge clk) begin
        if (rst)
            led_cntr <= 0;
        else
            led_cntr <= led_cntr + 1'b1;
    end

endmodule
