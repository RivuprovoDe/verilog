// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_mux_2x1();
  reg s;
  reg in;
  wire [1:0] out;
  integer i,j;
  demux_1x2 uut(
    .s(s),.in(in),.out(out));
  initial
    begin
      s=1'b0;
      in=1'b0;
      $dumpfile("tb_demux_1x2.vcd");
    $dumpvars(0, uut);
    end
  initial begin
    for (i = 0; i <= 1; i = i + 1) begin
      s = i;
      for (j = 0; j <= 1; j = j + 1) begin
        in = j;
        #2;
      end
    end
  end
  initial 
    begin
      $monitor("time=%g,s=%b,in=%b,out1=%b,out2=%b",$time,s,in,out[1],out[0]);
  #8 $finish;
    end
endmodule
  