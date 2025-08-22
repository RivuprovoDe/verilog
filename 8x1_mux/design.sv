// Code your design here
`timescale 1ns/1ps
module mux_8x1(s,in,out);
  output out;
  input [7:0]in;
  input [2:0] s;
  wire [5:0]k;
  mux_2x1 m0(s[0],in[1:0],k[0]);
  mux_2x1 m1(s[0],in[3:2],k[1]);
  mux_2x1 m2(s[0],in[5:4],k[2]);
  mux_2x1 m3(s[0],in[7:6],k[3]);
mux_2x1 m4(s[1], {k[1],k[0]}, k[4]);
mux_2x1 m5(s[1], {k[3],k[2]}, k[5]);
mux_2x1 m6(s[2], {k[5],k[4]}, out);
endmodule



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