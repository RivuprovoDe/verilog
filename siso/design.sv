`timescale 1ns/1ps
module siso_right(
  input clk, rst, d,
  output reg [3:0] q
);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 4'b0000;
    else
      q <= {d, q[3:1]};
  end
endmodule
