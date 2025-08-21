`timescale 1ns/1ps
module jk_ff(output reg q,qbar,input j,k,clk,clear);
  always @ (posedge clk  or negedge clear)
    if(clear==1'b0)
      begin
        q<=1'b0;
        qbar<=1'b1;
      end
  else 
    begin
    casex({j,k})
      2'b00:begin q<=q;qbar<=qbar; end
      2'b01:begin q<=1'b0;qbar<=1'b1; end
      2'b10:begin q<=1'b1;qbar<=1'b0; end
      2'b11:begin q<=~q;qbar<=~qbar; end
      default:{q,qbar}<=2'bxx;
    endcase
    end
endmodule