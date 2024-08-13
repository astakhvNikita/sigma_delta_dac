// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Aug 13 23:13:26 2024
// Host        : DESKTOP-MKJA6P7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Git/zynq_fpga_dac/hdl/bd/zynq_fpga_dac_top_design/ip/zynq_fpga_dac_top_design_fpga_dac_top_0_0/zynq_fpga_dac_top_design_fpga_dac_top_0_0_sim_netlist.v
// Design      : zynq_fpga_dac_top_design_fpga_dac_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zynq_fpga_dac_top_design_fpga_dac_top_0_0,fpga_dac_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fpga_dac_top,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module zynq_fpga_dac_top_design_fpga_dac_top_0_0
   (pl_clk_50m_i,
    pl_key_i,
    i2s_in_sck_i,
    i2s_in_sck_nc_i,
    i2s_in_bck_i,
    i2s_in_lrck_i,
    i2s_in_sdata_i,
    ext_key_i,
    dsd_oe_i,
    pl_led_o,
    dsm_clk_o,
    dsm_out_o);
  input pl_clk_50m_i;
  input [1:0]pl_key_i;
  input i2s_in_sck_i;
  input i2s_in_sck_nc_i;
  input i2s_in_bck_i;
  input i2s_in_lrck_i;
  input i2s_in_sdata_i;
  input [3:0]ext_key_i;
  input dsd_oe_i;
  output [3:0]pl_led_o;
  output dsm_clk_o;
  output [1:0]dsm_out_o;

  wire \<const0> ;
  wire dsd_oe_i;

  assign dsm_clk_o = \<const0> ;
  assign dsm_out_o[1] = \<const0> ;
  assign dsm_out_o[0] = \<const0> ;
  assign pl_led_o[3] = \<const0> ;
  assign pl_led_o[1] = dsd_oe_i;
  GND GND
       (.G(\<const0> ));
endmodule

(* ORIG_REF_NAME = "clock_pll" *) 
module zynq_fpga_dac_top_design_fpga_dac_top_0_0_clock_pll
   ();

  wire clk_fb;
  wire NLW_i_MMCME2_BASE_CLKFBOUTB_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKINSTOPPED_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT0_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT0B_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT1_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT1B_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT2_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT2B_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT3_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT3B_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT4_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT5_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_CLKOUT6_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_DRDY_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_LOCKED_UNCONNECTED;
  wire NLW_i_MMCME2_BASE_PSDONE_UNCONNECTED;
  wire [15:0]NLW_i_MMCME2_BASE_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "MMCME2_BASE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("LOW"),
    .CLKFBOUT_MULT_F(64.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(81.379997),
    .CLKIN2_PERIOD(10.000000),
    .CLKOUT0_DIVIDE_F(64.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(32),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT2_DIVIDE(16),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.000000),
    .STARTUP_WAIT("FALSE")) 
    i_MMCME2_BASE
       (.CLKFBIN(clk_fb),
        .CLKFBOUT(clk_fb),
        .CLKFBOUTB(NLW_i_MMCME2_BASE_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_i_MMCME2_BASE_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(1'b0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_i_MMCME2_BASE_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(NLW_i_MMCME2_BASE_CLKOUT0_UNCONNECTED),
        .CLKOUT0B(NLW_i_MMCME2_BASE_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_i_MMCME2_BASE_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_i_MMCME2_BASE_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_i_MMCME2_BASE_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_i_MMCME2_BASE_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_i_MMCME2_BASE_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_i_MMCME2_BASE_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_i_MMCME2_BASE_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_i_MMCME2_BASE_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_i_MMCME2_BASE_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_i_MMCME2_BASE_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_i_MMCME2_BASE_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_i_MMCME2_BASE_LOCKED_UNCONNECTED),
        .PSCLK(1'b0),
        .PSDONE(NLW_i_MMCME2_BASE_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
endmodule

(* ORIG_REF_NAME = "fpga_dac_top" *) 
module zynq_fpga_dac_top_design_fpga_dac_top_0_0_fpga_dac_top
   ();


endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
