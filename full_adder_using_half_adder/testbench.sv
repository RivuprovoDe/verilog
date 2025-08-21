`timescale 1ns/1ps
module tb_full_adder;
  reg a, b, c;
  wire sum, cout;

  full_adder uut (
    .a(a),
    .b(b),
    .cin(c),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    a = 0; b = 0; c = 0;
    $dumpfile("tb_full_adder.vcd");
    $dumpvars(0, uut);
  end

  always #4 a = a + 1'b1;
  always #2 b = b + 1'b1;
  always #1 c = c + 1'b1;

  initial  $monitor("%b %b %b | %b %b", a, b, c, sum, cout);
  initial #8 $finish;   // <-- only 8 rows now
endmodule
