// Code your testbench here
// or browse Examples
`timescale 10ns/1ns
module tb_half_str;
  reg a, b;       // Inputs
  wire s, c;      // Outputs

  // Instantiate the half adder
  half_str uut (
    .s(s),
    .c(c),
    .a(a),
    .b(b)
  );
	initial begin
   $dumpfile("tb_half_str.vcd");
    $dumpvars(0, uut);
    $display("a b | s c | Expected s c");
    $display("------------------------");

    a=0; b=0; #10;
    $display("%b %b | %b %b |    0 0", a, b, s, c);

    a=0; b=1; #10;
    $display("%b %b | %b %b |    1 0", a, b, s, c);

    a=1; b=0; #10;
    $display("%b %b | %b %b |    1 0", a, b, s, c);

    a=1; b=1; #10;
    $display("%b %b | %b %b |    0 1", a, b, s, c);

    $finish;
  end
endmodule
