`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 13.06.2023 11:36:42
// Design Name: 
// Module Name: multiplier_16x16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_16x16 (
  input [15:0] a,
  input [15:0] b,
  input clk,
  input rst,
  output reg [31:0] p
);

  always @(posedge clk) begin
  
  if (!rst)begin 
  p <= 16'd0000;
  end
  
  else
  p <= a * b;
  end

endmodule

