`timescale 1ns/1ps
module dff(output reg q,qbar,input d,clk,clear);
  always @ (posedge clk or negedge clear)
    if(clear==1'b0)
      begin
        q<=1'b0;
        qbar<=1'b1;
      end
  else 
    begin
      q<=d;
      qbar<=~d;
    end
endmodule