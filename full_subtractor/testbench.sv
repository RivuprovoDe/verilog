`timescale 10ns/1ns
module tb_str;
  reg a, b, c;     // Inputs
  wire s, co;      // Outputs

  // Instantiate DUT
  str uut (
    .s(s),
    .co(co),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    $dumpfile("tb_str.vcd");
    $dumpvars(0, uut); // dump DUT signals only

    $display("a b c | d br");
    $display("---------------");

    a=0; b=0; c=0; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=0; b=0; c=1; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=0; b=1; c=0; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=0; b=1; c=1; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=1; b=0; c=0; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=1; b=0; c=1; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=1; b=1; c=0; #10; $display("%b %b %b | %b %b", a, b, c, s, co);
    a=1; b=1; c=1; #10; $display("%b %b %b | %b %b", a, b, c, s, co);

    $finish;
  end
endmodule
