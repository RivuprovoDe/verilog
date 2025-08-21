`timescale 1ns/1ps
module adder16 (
  input  [15:0] a, b,    // 16-bit inputs
  input         cin,     // carry in
  output reg [15:0] sum, // 16-bit sum
  output reg    cout     // carry out
);

  always @(*) begin
    {cout, sum} = a + b + cin; // behavioral addition
  end

endmodule
