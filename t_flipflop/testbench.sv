`timescale 1ns/1ps
module tb_t_ff;
  reg t,clk,clear;
  wire q,qbar;
  
  t_ff uut(.t(t),.qbar(qbar),.q(q),.clk(clk),.clear(clear));
  
  initial
    begin
      clk=1'b0;
      forever #5 clk=~clk;
    end
  initial
    begin
      t=1'b0;
       clear = 1'b0;    // start with reset active
    #5 clear = 1'b1; // release reset before first posedge clk
      $dumpfile("tb_t_ff.vcd");
    	$dumpvars(0, uut);
    end
  always #10 t=~t;
  initial
    begin
      $monitor("time=%g,t=%b,clk=%b,clear=%b,q=%b,qbar=%b",$time,t,clk,clear,q,qbar);
  #100 $finish;
    end
endmodule