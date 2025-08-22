`timescale 1ns/1ps
module tb_pipo;

  reg clk, rst;
  reg [3:0] d;
  wire [3:0] q;

  pipo #(4) uut (.clk(clk), .rst(rst), .d(d), .q(q));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("tb_pipo.vcd");
    $dumpvars(0,uut);

    rst = 1; d = 4'b0000; #10;
    rst = 0;

    d = 4'b1010; #10;
    d = 4'b1100; #10;
    d = 4'b1111; #10;

    #20 $finish;
  end

  initial $monitor("time=%0t | clk=%b rst=%b d=%b q=%b", $time, clk, rst, d, q);

endmodule
