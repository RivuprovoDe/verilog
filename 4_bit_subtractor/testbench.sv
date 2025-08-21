`timescale 1ns/1ps
module tb_subtr_4;

  reg  [3:0] a, b;
  wire [3:0] d;
  wire bo;

  // Instantiate DUT
  subtr_4 uut (
    .d(d),
    .bo(bo),
    .a(a),
    .b(b)
  );

  integer i, j, count;

  initial begin
    count = 0;
    $display("  A    B   |  A-B   | BorrowOut");
    $display("-------------------------------");

    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        a = i; b = j;
        #1;  // wait for outputs to settle
        $display("%2d (%b) - %2d (%b) = %2d (%b), bo=%b",
                 a, a, b, b, d, d, bo);

        count = count + 1;
        if (count == 100) begin
          $finish;
        end
      end
    end
  end
endmodule
