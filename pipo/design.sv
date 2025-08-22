`timescale 1ns/1ps
module pipo #(parameter N=4)(
  input clk,
  input rst,
  input [N-1:0] d,
  output reg [N-1:0] q
);

  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= {N{1'b0}};
    else
      q <= d;
  end

endmodule
