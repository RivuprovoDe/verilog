`timescale 1ns/1ps
module up_down_counter_3to12(
    input clk,
    input reset,       // synchronous active-high reset
    input up_down,     // 1 = up, 0 = down
    input load,        // synchronous load enable
    input [3:0] d,     // parallel load value
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 4'd3;  // start from 3
        else if (load)
            q <= d;
        else if (up_down) begin
            if (q == 4'd12)
                q <= 4'd3;
            else
                q <= q + 1;
        end else begin
            if (q == 4'd3)
                q <= 4'd12;
            else
                q <= q - 1;
        end
    end

endmodule
