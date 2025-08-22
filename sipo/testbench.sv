`timescale 1ns/1ps
module tb_sipo();

  reg clk, clear, d;
  wire [3:0] q;
  integer i;
  integer seed = 123;
  sipo uut (
    .clk(clk),
    .clear(clear),
    .d(d),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    clear = 0; d = 0;
    #12;
    clear = 1;

    for (i = 0; i < 8; i = i + 1) begin
      d = $random(seed) % 2;
      #10;
    end

    #100 $finish;
  end

  initial begin
    $dumpfile("tb_sipo.vcd");
    $dumpvars(0, uut);
    $monitor("time=%0t | clk=%b | clear=%b | d=%b | q=%b", $time, clk, clear, d, q);
  end

endmodule
