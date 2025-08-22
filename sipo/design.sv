`timescale 1ns/1ps
module sipo(
  input clk,clear,d,
  output reg [3:0] q
);
  reg [3:0] temp;
  always @(posedge clk) begin
    if(!clear)
      q<=4'b0000;
    else
      begin
        temp=q>>1;
        q<={d,temp[2:0]};
      end
  end

endmodule
