`timescale 1ns / 1ns


module alu(a,b,s,cin,f);
input [31:0] a,b;
input [2:0] s;
input cin;
output [3:0] f;
reg [3:0] f;

always@(a,b,s,cin)
begin
case(s)
      3'b000  : f = a+b+cin;
      3'b001  : f = a+(~b)+cin;
      3'b010  : f = b;
      3'b011  : f = a;
      3'b100  : f = a & b;
      3'b101  : f = a | b;
      3'b110  : f = ~a;
      3'b111  : f = a ^ b;
      default : f = a+b+cin;
endcase      
end 
endmodule