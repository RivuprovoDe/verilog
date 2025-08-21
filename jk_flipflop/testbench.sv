`timescale 1ns/1ps
module tb_jk_ff;
  reg j,k,clk,clear;
  wire q,qbar;
  
  jk_ff uut(.j(j),.k(k),.qbar(qbar),.q(q),.clk(clk),.clear(clear));
  
  initial
    begin
      clk=1'b0;
      forever #5 clk=~clk;
    end
  initial
    begin
      j=1'b0;
      k=1'b0;
      clear=1'b1;
       clear = 1'b0;    // start with reset active
    #5 clear = 1'b1; // release reset before first posedge clk
      $dumpfile("tb_jk_ff.vcd");
    	$dumpvars(0, uut);
    end
  always #2 j=~j;
  always #1 k=~k;
  initial
    begin
      $monitor("time=%g,j=%b,k=%b,clk=%b,clear=%b,q=%b,qbar=%b",$time,j,k,clk,clear,q,qbar);
  #100 $finish;
    end
endmodule
