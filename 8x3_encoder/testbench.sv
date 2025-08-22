`timescale 1ns/1ps
module tb_encoder_8x3();

  reg  [7:0] in;
  wire [2:0] out;
  integer i;

  encoder_8x3 uut (.in(in), .out(out));

  initial begin
    $dumpfile("tb_encoder_8x3.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    in = 8'b00000000;
    #2;
    for (i = 0; i < 8; i = i + 1) begin
      in = 8'b1 << i;
      #2;
    end
  end

  initial begin
    $monitor("time=%g | in=%b | out=%b", $time, in, out);
    #20 $finish;
  end

endmodule
