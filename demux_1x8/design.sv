// Code your design here
`timescale 1ns/1ps

module demux_1x8(s,in,out);
  output [7:0]out;
  input in;
  input [2:0] s;
  wire [5:0]k;
  demux_1x2 m0(s[2],in,k[1:0]);
  demux_1x2 m1(s[1],k[1],k[5:4]);
  demux_1x2 m2(s[1],k[0],k[3:2]);
  demux_1x2 m3(s[0],k[5],out[7:6]);
  demux_1x2 m4(s[0],k[4],out[5:4]);
  demux_1x2 m5(s[0],k[3],out[3:2]);
  demux_1x2 m6(s[0],k[2], out[1:0]);
endmodule

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