// Code your design here
`timescale 1ns/1ps
module mux_2x1(s,in,out);
  input s;
  input[1:0] in;
  output reg out;
  always @(*)
  casex(s)
    1'b0:begin out=in[0]; end
    1'b1:begin out=in[1];end
    default:out=1'bx;
  endcase
endmodule