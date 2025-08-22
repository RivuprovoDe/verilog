`timescale 1ns/1ps
module tb_siso_right;
  reg clk, rst, d;
  wire [3:0] q;

  siso_right uut (.clk(clk), .rst(rst), .d(d), .q(q));

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("tb_siso_right.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    rst = 1; d = 0;
    #10 rst = 0; d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #20 $finish;
  end

  initial begin
    $monitor("time=%0t | d=%b | q=%b", $time, d, q);
  end
endmodule
