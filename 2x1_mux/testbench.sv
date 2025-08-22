// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_mux_2x1();
  reg s;
  reg [1:0]in;
  wire out;
  integer i;
  mux_2x1 uut(
    .s(s),.in(in),.out(out));
  initial
    begin
      s=0;
      in=2'b00;
    $dumpfile("tb_mux_2x1.vcd");
    $dumpvars(0, uut);
    end
//   initial
//     begin
//      for (i=0; i<8; i=i+1) begin
//        {s,in} = i;
//     #2;
//   end
//     end
  always #4 s=s+1;
  always #1 in=in+1;
  initial 
    begin
      $monitor("time=%g,s=%b,a=%b,b=%b,out=%b",$time,s,in[1],in[0],out);
  #16 $finish;
    end
endmodule
  