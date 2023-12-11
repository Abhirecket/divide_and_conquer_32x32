// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Jun 16 17:46:29 2023
// Host        : LAPTOP-KB4NR7PR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/abhis/divide_and_conquer_32x32/divide_and_conquer_32x32.gen/sources_1/ip/vio_0/vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2022.2" *)
module vio_0(clk, probe_in0, probe_out0, probe_out1, 
  probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[63:0],probe_out0[0:0],probe_out1[31:0],probe_out2[31:0]" */;
  input clk;
  input [63:0]probe_in0;
  output [0:0]probe_out0;
  output [31:0]probe_out1;
  output [31:0]probe_out2;
endmodule
