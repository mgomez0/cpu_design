`timescale 1ns / 1ns
module alu_control_tb;
reg [1:0] alu_op;  // refers to type A, type B, type C, type D
//type A: 00
//type B: 01
//type C: 10
//type D: 11
reg [3:0]funct_code;
wire [3:0] alu_cnt;
alu_control u1(alu_cnt, alu_op, funct_code); 

initial 
    begin
        alu_op = 2'b00;
        funct_code = 4'b1111;
        #40
        funct_code = 4'b1110;
        #40
        funct_code = 4'b1101;
        #40
        funct_code = 4'b1100;
        #40 
        alu_op = 2'b01;
        #40
        funct_code = 4'b1100;
        #40
        funct_code = 4'b1010;
        #40
        funct_code = 4'b1011;
        #40 $stop;
    end

initial 
    begin
		$dumpfile("alu_control.vcd");
		$dumpvars(0, alu_control_tb);
	end

endmodule
