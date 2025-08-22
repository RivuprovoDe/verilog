`timescale 1ns/1ps
module piso(v,clk,sel,clr,d);
  reg [3:0] q;
  input [3:0]d;
  input sel,clk,clr;
  output reg v;
  always @ (posedge clk)
    if(clr==1)
      q<=4'b0000;
  else if(sel==0)
    q<=d;
  else
    begin
      v<=q[0];
      q<=q>>1;
    end
endmodule

