`timescale 1ns/1ps
module tb_adder16;

  reg  [15:0] a, b;
  reg         cin;
  wire [15:0] sum;
  wire        cout;

  // Instantiate DUT
  adder16 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $display("       a        b   cin  |      sum     cout");
    $display("--------------------------------------------");

    // Try some test vectors
    a = 16'h0001; b = 16'h0001; cin = 0; #5;
    $display("%h  %h   %b   |   %h    %b", a, b, cin, sum, cout);

    a = 16'hFFFF; b = 16'h0001; cin = 0; #5;
    $display("%h  %h   %b   |   %h    %b", a, b, cin, sum, cout);

    a = 16'h1234; b = 16'h4321; cin = 1; #5;
    $display("%h  %h   %b   |   %h    %b", a, b, cin, sum, cout);

    $finish;
  end
endmodule
