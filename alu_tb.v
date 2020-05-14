`timescale 1ns / 1ns
module alu_tb;

reg [15:0] a, b;
reg [3:0] s;
wire [15:0] result;
wire zero_detection;

alu u1(a,b,s,result,zero_detection); 

initial 
    begin
        s = 0;
        a = 32'h0004;
        b = 32'h0005;
        #40
        s = 4'h1;
        #40
        s = 4'h2;
        #40
        s = 4'h3;
        #40
        s = 4'h4;
        #40
        s = 4'h5;
        #40
        s = 4'h6;
        #40
        s = 4'h7;
        #40
        s = 4'h8;
        #40
        s = 4'h9;
        #40
        s = 4'hA;
        #40
        s = 4'hB;
        #40
        s = 4'hC;
        #40 $stop; 
    end

initial 
    begin
		$dumpfile("alu.vcd");
		$dumpvars(0, alu_tb);
	end

endmodule
