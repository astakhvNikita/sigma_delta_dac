// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Aug 13 23:13:26 2024
// Host        : DESKTOP-MKJA6P7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Git/zynq_fpga_dac/hdl/bd/zynq_fpga_dac_top_design/ip/zynq_fpga_dac_top_design_fpga_dac_top_0_0/zynq_fpga_dac_top_design_fpga_dac_top_0_0_stub.v
// Design      : zynq_fpga_dac_top_design_fpga_dac_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fpga_dac_top,Vivado 2019.1" *)
module zynq_fpga_dac_top_design_fpga_dac_top_0_0(pl_clk_50m_i, pl_key_i, i2s_in_sck_i, 
  i2s_in_sck_nc_i, i2s_in_bck_i, i2s_in_lrck_i, i2s_in_sdata_i, ext_key_i, dsd_oe_i, pl_led_o, 
  dsm_clk_o, dsm_out_o)
/* synthesis syn_black_box black_box_pad_pin="pl_clk_50m_i,pl_key_i[1:0],i2s_in_sck_i,i2s_in_sck_nc_i,i2s_in_bck_i,i2s_in_lrck_i,i2s_in_sdata_i,ext_key_i[3:0],dsd_oe_i,pl_led_o[3:0],dsm_clk_o,dsm_out_o[1:0]" */;
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
endmodule
