`timescale 1ns / 1ns

module alu_control(alu_cnt, alu_op,funct_code);
 output reg[3:0] alu_cnt;
 input [1:0] alu_op;  // refers to type A, type B, type C, type D
//type A: 00
//type B: 01
//type C: 10
//type D: 11
 input [3:0]funct_code;
 wire [5:0] alu_control_in;
 assign alu_control_in = {alu_op,funct_code};
 always @(alu_control_in)
 casex (alu_control_in)
   //6'b10xxxx: alu_cnt=4'b0000; //branching
   //6'b11xxxx: alu_cnt=4'b0000; //halt
   6'b01xxxx: alu_cnt = 4'b1111;   //type B (load, store)
   6'b00xxxx: alu_cnt = alu_control_in[3:0];
   default: alu_cnt=4'b0000;
  endcase
endmodule