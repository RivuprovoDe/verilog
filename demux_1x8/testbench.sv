// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_demux_1x8();
  reg  [2:0] s;
  reg in;
  wire [7:0] out;
  integer i,j;
  demux_1x8 uut(
    .s(s),.in(in),.out(out));
  initial
    begin
      s=3'b000;
      in=1'b0;
      $dumpfile("tb_demux_1x8.vcd");
    $dumpvars(0, uut);
    end
  initial begin
    for (i = 0; i <8; i = i + 1) begin
      s = i;
      for (j = 0; j <= 1; j = j + 1) begin
        in = j;
        #2;
      end
    end
  end
  initial 
    begin
      $monitor("time=%g,s=%b,in=%b,out=%b",$time,s,in,out);
  #32 $finish;
    end
endmodule
  