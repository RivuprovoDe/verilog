`timescale 10ns/1ns
module tb_str;
  reg a, b, c;      // Inputs
  wire s, co;       // Outputs

  // Instantiate the full adder
  str uut (
    .s(s),
    .co(co),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    $dumpfile("tb_str.vcd");
    $dumpvars(0, uut);  // dump DUT only (no duplicates)

    $display("a b c | s co | Expected s co");
    $display("----------------------------");

    // Apply all 8 input combinations
    a=0; b=0; c=0; #10;
    $display("%b %b %b | %b %b |    0 0", a, b, c, s, co);

    a=0; b=0; c=1; #10;
    $display("%b %b %b | %b %b |    1 0", a, b, c, s, co);

    a=0; b=1; c=0; #10;
    $display("%b %b %b | %b %b |    1 0", a, b, c, s, co);

    a=0; b=1; c=1; #10;
    $display("%b %b %b | %b %b |    0 1", a, b, c, s, co);

    a=1; b=0; c=0; #10;
    $display("%b %b %b | %b %b |    1 0", a, b, c, s, co);

    a=1; b=0; c=1; #10;
    $display("%b %b %b | %b %b |    0 1", a, b, c, s, co);

    a=1; b=1; c=0; #10;
    $display("%b %b %b | %b %b |    0 1", a, b, c, s, co);

    a=1; b=1; c=1; #10;
    $display("%b %b %b | %b %b |    1 1", a, b, c, s, co);

    $finish;
  end
endmodule
