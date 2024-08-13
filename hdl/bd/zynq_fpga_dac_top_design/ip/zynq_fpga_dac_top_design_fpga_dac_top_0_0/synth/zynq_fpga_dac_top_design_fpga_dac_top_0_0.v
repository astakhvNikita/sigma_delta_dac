// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:fpga_dac_top:1.0
// IP Revision: 1

(* X_CORE_INFO = "fpga_dac_top,Vivado 2019.1" *)
(* CHECK_LICENSE_TYPE = "zynq_fpga_dac_top_design_fpga_dac_top_0_0,fpga_dac_top,{}" *)
(* CORE_GENERATION_INFO = "zynq_fpga_dac_top_design_fpga_dac_top_0_0,fpga_dac_top,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fpga_dac_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module zynq_fpga_dac_top_design_fpga_dac_top_0_0 (
  pl_clk_50m_i,
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
  dsm_out_o
);

input wire pl_clk_50m_i;
input wire [1 : 0] pl_key_i;
input wire i2s_in_sck_i;
input wire i2s_in_sck_nc_i;
input wire i2s_in_bck_i;
input wire i2s_in_lrck_i;
input wire i2s_in_sdata_i;
input wire [3 : 0] ext_key_i;
input wire dsd_oe_i;
output wire [3 : 0] pl_led_o;
output wire dsm_clk_o;
output wire [1 : 0] dsm_out_o;

  fpga_dac_top inst (
    .pl_clk_50m_i(pl_clk_50m_i),
    .pl_key_i(pl_key_i),
    .i2s_in_sck_i(i2s_in_sck_i),
    .i2s_in_sck_nc_i(i2s_in_sck_nc_i),
    .i2s_in_bck_i(i2s_in_bck_i),
    .i2s_in_lrck_i(i2s_in_lrck_i),
    .i2s_in_sdata_i(i2s_in_sdata_i),
    .ext_key_i(ext_key_i),
    .dsd_oe_i(dsd_oe_i),
    .pl_led_o(pl_led_o),
    .dsm_clk_o(dsm_clk_o),
    .dsm_out_o(dsm_out_o)
  );
endmodule
