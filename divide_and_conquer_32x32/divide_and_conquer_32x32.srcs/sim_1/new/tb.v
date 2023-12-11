`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 13.06.2023 11:39:23
// Design Name: 
// Module Name: tb
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


module tb;

  reg [31:0] operand_a;
  reg [31:0] operand_b;
  reg clk, rst;
  wire [63:0] result;
  integer i;

  top dut (
    .operand_a(operand_a),
    .operand_b(operand_b),
    .clk (clk),
    .rst (rst),
    .result(result)
  );

 
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clock every 5 time units
  end
  
//   initial begin
//    rst = 1'b0;
//    @(posedge clk)
//    rst = 1'b1;
  
//  end 
  
  
  initial begin
    rst = 1'b0;
    @(posedge clk)
    rst = 1'b1;  

    for (i =0; i<=40; i=i+1) begin
    @(posedge clk)
    operand_a = $urandom_range(10, 3000) ;
    operand_b = $urandom_range(4, 10000) ;
    end

    $finish;
  end

  always @(posedge clk) begin
    $display("Result: %d", result);
  end

endmodule

