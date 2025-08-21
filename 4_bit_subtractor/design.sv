module subtr_4(d, bo, a, b);
  output [3:0] d;
  output bo;
  input [3:0] a, b;
  wire [2:0] c;

  full_adder fa0(a[0], ~b[0], 1'b1, d[0], c[0]);
  full_adder fa1(a[1], ~b[1], c[0], d[1], c[1]);
  full_adder fa2(a[2], ~b[2], c[1], d[2], c[2]);
  full_adder fa3(a[3], ~b[3], c[2], d[3], bo);
endmodule

module full_adder(
  input a, b, cin,
  output sum, cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
