`timescale 1ns/1ps
module tb_up_down_counter_3to12();

  reg clk;
  reg reset;
  reg up_down;
  reg load;
  reg [3:0] d;
  wire [3:0] q;

  up_down_counter_3to12 uut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .load(load),
    .d(d),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("tb_up_down_counter_3to12.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    reset = 1; load = 0; up_down = 1; d = 4'd0;
    #10 reset = 0;

    up_down = 1;
    #100;

    up_down = 0;
    #100;

    load = 1; d = 4'd7;
    #10 load = 0;
    up_down = 1;
    #50;

    $finish;
  end

  initial begin
    $monitor("time=%0t | reset=%b | load=%b | up_down=%b | q=%d",
             $time, reset, load, up_down, q);
  end

endmodule
