// Code your design here
`timescale 10ns/1ns 
module half_str(s,c,a,b); 
  input a,b; 
  output reg s,c; 
  always @(*)
    begin 
      s=a^b;
      c=a&b;
    end
  
endmodule