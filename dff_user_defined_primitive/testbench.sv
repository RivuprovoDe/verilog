`timescale 1ns/1ps
module tb_dff_udp;

  reg clk, d;
  wire q;
  integer i;

  dff_udp uut (.q(q), .clk(clk), .d(d));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    d = 0;
    for (i = 0; i < 10; i = i + 1) begin
      #7 d = ~d;
    end
    #40 $finish;
  end

  initial begin
    $dumpfile("tb_dff_udp.vcd");
    $dumpvars(0, tb_dff_udp);
    $monitor("time=%0t | clk=%b d=%b q=%b", $time, clk, d, q);
  end

endmodule
