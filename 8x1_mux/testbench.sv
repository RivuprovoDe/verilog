// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_mux_8x1();
  reg [2:0]s;
  reg [7:0]in;
  wire out;
  integer i,j;
  mux_8x1 uut(
    .s(s),.in(in),.out(out));
  initial
    begin
      s=3'b000;
      in=8'b00000000;
      $dumpfile("tb_mux_8x1.vcd");
    $dumpvars(0, uut);
    end
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      s = i;
      for (j = 0; j < 256; j = j + 1) begin
        in = j;
        #2;
      end
    end
  end
  initial 
    begin
      $monitor("time=%g,s=%b,in=%b,out=%b",$time,s,in,out);
  #5000 $finish;
    end
endmodule
  