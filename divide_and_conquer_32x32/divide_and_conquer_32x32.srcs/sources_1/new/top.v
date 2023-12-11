`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 13.06.2023 11:33:55
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  a divide-and-conquer approach for a 32 x 32 multiplier implemented 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
//  input [31:0] operand_a,
//  input [31:0] operand_b,
  input clk_in1_n,
  input clk_in1_p
//  input rst,
//  output reg [63:0] result
);

   wire clk;
     wire [31:0] operand_a;
  wire [31:0] operand_b;
  wire rst;
  reg [63:0] result;
  reg [15:0] a_upper;
  reg [15:0] a_lower;
  reg [15:0] b_upper;
  reg [15:0] b_lower;
  

  wire [31:0] p0;
  wire [31:0] p1;
  wire [31:0] p2;
  wire [31:0] p3;
  reg [63:0] p0_padded, p1_padded, p2_padded, p3_padded;
  
  
  
//  assign a_upper = operand_a[31:16];
//  assign a_lower = operand_a[15:0];
//  assign b_upper = operand_b[31:16];
//  assign b_lower = operand_b[15:0];

  // Stage 1
  multiplier_16x16 u0 (
    .a(a_upper),
    .b(b_upper),
    .clk (clk),
    .rst (rst),
    .p(p0)
  );

  // Stage 2
  multiplier_16x16 u1 (
    .a(a_upper),
    .b(b_lower),
    .clk (clk),
    .rst (rst),
    .p(p1)
  );
  multiplier_16x16 u2 (
    .a(a_lower),
    .b(b_upper),
    .clk (clk),
    .rst (rst),
    .p(p2)
  );
  multiplier_16x16 u3 (
    .a(a_lower),
    .b(b_lower),
    .clk (clk),
    .rst (rst),
    .p(p3)
  );
  
  always @(*) begin
  
   a_upper = operand_a[31:16];
   a_lower = operand_a[15:0];
   b_upper = operand_b[31:16];
   b_lower = operand_b[15:0];

    // Pad the partial products with zeros to align for addition
    p0_padded = {p0, 32'h0000};
    p1_padded = {16'h0000, p1, 16'h0000};
    p2_padded = {16'h0000, p2, 16'h0000};
    p3_padded = {32'h0000, p3};

    // Add the partial products to obtain the final product
    result = p0_padded + p1_padded + p2_padded + p3_padded;
  end

  // Stage 3 - Combine results
//  always @(posedge clk) begin
////   if (!rst)begin 
////   result <= 64'd0000;
////   end

////   else begin
//    result = {p0, p1[15:0], p2[15:0], p3[31:16]};
////  end
//  end


  clk_wiz_0 clk_wiz
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
    // Status and control signals
    .reset(rst), // input reset
    .locked(),       // output locked
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n)    // input clk_in1_n
);

//ila
//ila_0 your_instance_name (
//	.clk(clk), // input wire clk


//	.probe0(rst), // input wire [0:0]  probe0  
//	.probe1(operand_a), // input wire [31:0]  probe1 
//	.probe2(operand_b), // input wire [31:0]  probe2 
//	.probe3(result), // input wire [63:0]  probe3 
//	.probe4(u0.a), // input wire [15:0]  probe4 
//	.probe5(u0.b), // input wire [15:0]  probe5 
//	.probe6(u1.a), // input wire [15:0]  probe6 
//	.probe7(u1.b), // input wire [15:0]  probe7 
//	.probe8(u2.a), // input wire [15:0]  probe8 
//	.probe9(u2.b) // input wire [15:0]  probe9
//);

vio_0 your_instance_name (
  .clk(clk),                // input wire clk
  .probe_in0(result),    // input wire [63 : 0] probe_in0
  .probe_out0(rst),  // output wire [0 : 0] probe_out0
  .probe_out1(operand_a),  // output wire [31 : 0] probe_out1
  .probe_out2(operand_b)  // output wire [31 : 0] probe_out2
);

//vio_0 vio_multiplier (
//  .clk(clk),              // input wire clk
//  .probe_in0(rst),  // input wire [0 : 0] probe_in0
//  .probe_in1(operand_a),  // input wire [31 : 0] probe_in1
//  .probe_in2(operand_b)  // input wire [31 : 0] probe_in2
//);
endmodule
