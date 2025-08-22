`timescale 1ns/1ps
module tb_priority_encoder();

  reg  [7:0] in;
  wire [2:0] out;
  integer i;

  priority_encoder uut (.in(in), .out(out));

  initial begin
    $dumpfile("tb_priority_encoder.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    in = 8'h00;
    #2;
    for (i = 0; i < 256; i = i + 1) begin
      in = in + 1;
      #2;
    end
  end

  initial begin
    $monitor("time=%g | in=%b | out=%b", $time, in, out);
    #512 $finish;
  end

endmodule
