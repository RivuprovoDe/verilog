module add_4(s,co,a,b,ci);
  output [3:0] s;
  output co;
  wire [2:0] c;
  input [3:0] a,b;
  input ci;

  full_adder fa0(a[0],b[0],ci,s[0],c[0]);
  full_adder fa1(a[1],b[1],c[0],s[1],c[1]);
  full_adder fa2(a[2],b[2],c[1],s[2],c[2]);
  full_adder fa3(a[3],b[3],c[2],s[3],co);
endmodule

module full_adder(
  input a, b, cin,
  output sum, cout
);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
