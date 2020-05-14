`timescale 1ns / 1ns
module three_to_one_mux(d0,d1,d2,s,y);
input [15:0] d0, d1, d2;
input [1:0] s;
output [15:0] y;
reg [15:0] y;

always@(d0 or d1 or d2 or s)
begin
case(s)
      2'b00  : y = d0;
      2'b01  : y = d1;
      2'b10  : y = d2;
      default : y = d0; 
endcase
end
endmodule