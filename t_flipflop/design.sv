`timescale 1ns/1ps
module t_ff(output reg q,qbar,input t,clk,clear);
  always @ (posedge clk  or negedge clear)
    if(!clear)
      begin
        q<=1'b0;
        qbar<=1'b1;
      end
  else 
    begin
      casex(t)
      1'b0:begin q<=q;qbar<=qbar; end
      1'b1:begin q<=~q;qbar<=~qbar; end
      default: {q,qbar} <= 2'bxx;
    endcase
    end
endmodule