`timescale 1ns/1ps
module tb_dff;
  reg d,clk,clear;
  wire q,qbar;
  
  dff uut(.q(q),.qbar(qbar),.d(d),.clk(clk),.clear(clear));
  
  initial
    begin
      clk=1'b0;
      forever #5 clk=~clk;
    end
  initial
    begin
      d=1'b0;
      clear=1'b1;
       clear = 1'b0;    // start with reset active
    #5 clear = 1'b1; // release reset before first posedge clk
      $dumpfile("tb_dff.vcd");
    	$dumpvars(0, uut);
    end
  always #2 d=~d;
  initial
    begin
      $monitor("time=%g,d=%b,clk=%b,clear=%b,q=%b,qbar=%b",$time,d,clk,clear,q,qbar);
  #100 $finish;
    end
endmodule