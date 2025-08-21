// Code your design here
`timescale 10ns/1ns 
module half_str(s,c,a,b); 
  input a,b; 
  output s,c; 
  xor(s,a,b); 
  and(c,a,b);
  
endmodule