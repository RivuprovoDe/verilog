// Code your design here
`timescale 1ns/1ps
module demux_1x2(s,in,out);
  input s;
  input in;
  output reg [1:0]out;
  always @(*)
  casex(s)
    1'b0:begin out[0]=in;out[1]=1'b0;end
    1'b1:begin out[1]=in;out[0]=1'b0;end
    default:out=2'bxx;
  endcase
endmodule