`timescale 1ns/1ps
module tb_sr_ff;
  reg s,r,clk,clear;
  reg q,qbar;
  
  sr_ff uut(.s(s),.r(r),.qbar(qbar),.q(q),.clk(clk),.clear(clear));
  
  initial
    begin
      clk=1'b0;
      forever #5 clk=~clk;
    end
  initial
    begin
      s=1'b0;
      r=1'b0;
       clear = 1'b0;    // start with reset active
    #5 clear = 1'b1; // release reset before first posedge clk
      $dumpfile("tb_sr_ff.vcd");
    	$dumpvars(0, uut);
    end
  always #10 s=~s;
  always #15 r=~r;
  initial
    begin
      $monitor("time=%g,s=%b,r=%b,clk=%b,clear=%b,q=%b,qbar=%b",$time,s,r,clk,clear,q,qbar);
  #100 $finish;
    end
endmodule