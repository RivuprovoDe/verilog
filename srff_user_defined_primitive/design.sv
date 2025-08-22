`timescale 1ns/1ps
module srff_udp(q, clk, s, r);
  input clk, s, r;
  output q;
  sr_udp sr(q, clk, s, r);
endmodule

primitive sr_udp(q, clk, s, r);
  output reg q;
  input clk, s, r;
  table
  // clk s r : q : q+
     (01) 0 0 : 0 : 0;  // no change
     (01) 0 0 : 1 : 1;  // no change
     (01) 0 1 : ? : 0;  // set
     (01) 1 0 : ? : 1;  // reset
     (01) 1 1 : ? : x;  // invalid
     (10) ? ? : ? : -;
  endtable
endprimitive
