`timescale 1ns / 1ps

module i2s_receiver
(
    input               clk_i,
    input               rst_i,

    input               bck_i,
    input               lrck_i,
    input               sdata_i,

    output logic [31:0] data_l_o,
    output              data_l_stb_o,
    output logic [31:0] data_r_o,
    output              data_r_stb_o
);

    logic        bck_r;
    logic        bck_posedge;
    logic        lrck_r;
    logic        lrck_posedge;
    logic        lrck_negedge;

    logic [31:0] shift, shift_r;

    assign bck_posedge  =  bck_i  & ~bck_r;
    assign lrck_posedge =  lrck_i & ~lrck_r;  // Lch strobe signal
    assign lrck_negedge = ~lrck_i &  lrck_r;  // Rch strobe signal

    assign shift        = { shift_r[30:0], sdata_i };  // MSB first

    assign data_l_stb_o = lrck_posedge;
    assign data_r_stb_o = lrck_negedge;

    // BCK edge detector flip-flop
    always_ff @ (posedge clk_i) begin
        if (rst_i)
            bck_r <= '0;
        else
            bck_r <= bck_i;
    end

    // LRCK edge detector flip-flop
    always_ff @ (posedge clk_i) begin
        if (rst_i)
            lrck_r <= '0;
        else if (bck_posedge)
            lrck_r <= lrck_i;
    end

    // Serial data shift reg
    always_ff @ (posedge clk_i) begin
        if (rst_i) begin
            shift_r      <= '0;
            data_l_o     <= '0;
            data_r_o     <= '0;
        end
        else if (bck_posedge) begin
            shift_r      <= shift;
            if (lrck_posedge)
                data_l_o <= shift;
            if (lrck_negedge)
                data_r_o <= shift;
        end
    end

endmodule
