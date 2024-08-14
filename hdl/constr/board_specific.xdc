## Clocks
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports { pl_clk_50m }];  # IO_L12P_T1_MRCC_35 / PL_CLK_50M
create_clock -add -name pl_clk_50m -period 20.00 -waveform {0.00 10.00} [get_ports { pl_clk_50m }];
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { i2s_in_sck_i_0 }];  # IO_L11P_T1_SRCC_34 / FPGA_GPIO_11P_34
create_clock -add -name i2s_in_sck_i_0 -period 80.00 -waveform {0.00 40.00} [get_ports { i2s_in_sck_i_0 }];

## Buttons
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { pl_key_i_0[1] }];  # IO_L7P_T1_AD2N_35 / FPGA_PL_KEY2
set_property -dict { PACKAGE_PIN M20 IOSTANDARD LVCMOS33 } [get_ports { pl_key_i_0[0] }];  # IO_L7N_T1_AD2P_35 / FPGA_PL_KEY1
set_property -dict { PACKAGE_PIN Y18 IOSTANDARD LVCMOS33 } [get_ports { ext_key_i_0[3] }];  # IO_L17P_T2_34 / FPGA_GPIO_17P_34
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { ext_key_i_0[2] }];  # IO_L21P_T3_DQS_34 / FPGA_GPIO_21P_34
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { ext_key_i_0[1] }];  # IO_L10P_T1_34 / FPGA_GPIO_10P_34
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { ext_key_i_0[0] }];  # IO_L24P_T3_34 / FPGA_GPIO_24P_34

## LEDs
#set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports { pl_led[3] }];  # IO_L4N_T0_34 / FPGA_PL_LED4
#set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports { pl_led[2] }];  # IO_L4P_T0_34 / FPGA_PL_LED3
#set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports { pl_led[1] }];  # IO_L2N_T0_34 / FPGA_PL_LED2
#set_property -dict { PACKAGE_PIN T12 IOSTANDARD LVCMOS33 } [get_ports { pl_led[0] }];  # IO_L2P_T0_34 / FPGA_PL_LED1

# I2S Input
set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports { i2s_in_sck_nc_i_0 }];  # IO_L22P_T3_34 / FPGA_GPIO_22P_34
set_property -dict { PACKAGE_PIN V18 IOSTANDARD LVCMOS33 } [get_ports { i2s_in_bck_i_0 }];  # IO_L21N_T3_DQS_34 / FPGA_GPIO_21N_34
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { i2s_in_lrck_i_0 }];  # IO_L9N_T1_DQS_34 / FPGA_GPIO_9N_34
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 } [get_ports { i2s_in_sdata_i_0 }];  # IO_L10N_T1_34 / FPGA_GPIO_10N_34

## Amanero Header
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 PULLDOWN TRUE } [get_ports { dsd_oe_i_0 }];  # IO_L20P_T3_34 / FPGA_GPIO_20P_34

## DSM Out
#set_property -dict { PACKAGE_PIN N20 IOSTANDARD LVCMOS33 SLEW FAST } [get_ports { dsm_clk }];  # IO_L14P_T2_SRCC_34 / FPGA_GPIO_14P_34
#set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 SLEW FAST } [get_ports { dsm_out_o[1] }];  # IO_L9P_T1_DQS_34 / FPGA_GPIO_9P_34
#set_property -dict { PACKAGE_PIN P19 IOSTANDARD LVCMOS33 SLEW FAST } [get_ports { dsm_out_o[0] }];  # IO_L13N_T2_MRCC_34 / FPGA_GPIO_13N_34
