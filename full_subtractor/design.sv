// Code your design here
`timescale 10ns/1ns 
module str(s,co,a,b,c); 
  input a,b,c; 
  output reg s,co; 
  always @(*)
    begin 
      s=a^b^c;
      co=(~a)&b|(c&(~(a^b)));
    end
  
endmodule