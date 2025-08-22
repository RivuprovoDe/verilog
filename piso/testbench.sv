`timescale 1ns/1ps
module tb_piso;

    reg clk, sel, clr;
    reg [3:0] d;
    wire v;

    piso uut(
        .clk(clk),
        .sel(sel),
        .clr(clr),
        .d(d),
        .v(v)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_piso.vcd");
        $dumpvars(0, uut);
    end

    initial begin
        clr = 1; sel = 0; d = 4'b1011;  
        #10 clr = 0;                     

        #10 sel = 1;                      
        #40;                              

        sel = 0; d = 4'b1100;             
        #10 sel = 1;                      
        #40;                              

        $finish;
    end

    initial begin
        $monitor("time=%0t | clr=%b sel=%b d=%b v=%b q=%b", 
                  $time, clr, sel, d, v, uut.q);
    end

endmodule
