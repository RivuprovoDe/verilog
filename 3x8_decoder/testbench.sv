`timescale 1ns/1ps
module tb_decoder_3x8();

  reg  [2:0] in;
  wire [7:0] out;
  integer i;

  decoder_3x8 uut (.in(in), .out(out));

  initial begin
    $dumpfile("tb_decoder_3x8.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      in = i;
      #2;
    end
  end

  initial begin
    $monitor("time=%g | in=%b | out=%b", $time, in, out);
    #20 $finish;
  end

endmodule
