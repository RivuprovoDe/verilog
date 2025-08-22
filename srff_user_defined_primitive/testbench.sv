`timescale 1ns/1ps
module tb_srff_udp;

  reg clk, s, r;
  wire q;
  integer i;

  srff_udp uut (.q(q), .clk(clk), .s(s), .r(r));

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    $dumpfile("tb_srff_udp.vcd");
    $dumpvars(0,uut);
    s=0;
    r=0;
    #2 s=0;r=1;
    #1 s=1;r=0;
    #2 s=0;r=0;
    #2 s=0;r=1;
    #2 s=1;r=0;
    #2 s=0;r=1;
    #2 s=1;r=1;
    #2 s=0;r=1;
    #2 s=1;r=0;
    #2 s=0;r=0;
  end
  initial begin
    $monitor("time=%g | clk=%b s=%b r=%b q=%b", $time, clk, s, r, q);
    #26 $finish;
  end

endmodule
