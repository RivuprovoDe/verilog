`timescale 1ns/1ps
module dff_udp(q,clk,d);
  input d,clk;
  output q;
  dudp d1(q,clk,d);
endmodule

primitive dudp(q,clk,d);
output reg q;
input clk,d;

table
// clk d : q : q+
  (01) 0 : ? : 0;
  (01) 1 : ? : 1;
  (10) ? : ? : -;
endtable
endprimitive
