// Code your design here
`timescale 10ns/1ns 
module half_str(s,c,a,b); 
  input a,b; 
  output s,c; 
  assign s=a^b;
  assign c=a&b;
  
endmodule