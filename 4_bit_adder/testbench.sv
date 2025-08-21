module tb_add_4;
  reg [3:0] a, b;
  reg ci;
  wire [3:0] s;
  wire co;
  integer count;
  add_4 dut(.s(s), .co(co), .a(a), .b(b), .ci(ci));

  initial begin
    $display("   a     b   ci  |   s     co");
    $display("-------------------------------");
    count=0;
    for (ci = 0; ci < 2; ci = ci + 1) begin
      for (a = 0; a < 16; a = a + 1) begin
        for (b = 0; b < 16; b = b + 1) begin
          #1 $display("%4b  %4b   %b  | %4b     %b", a, b, ci, s, co);
          count = count + 1;
          if (count == 100) $finish;
        end
      end
    end
   $finish;
  end
endmodule
