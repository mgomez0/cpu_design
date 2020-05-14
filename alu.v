`timescale 1ns / 1ns
module alu(a,b,s,result,zero_detection);
input [15:0] a, b;
input [3:0] s;
output [15:0] result;
output reg zero_detection;
wire [15:0] rol_result, ror_result;
reg [15:0] other_result;
reg [1:0] mux_select;
wire [15:0] temp_result;

rotate_left rl1(.n(a), .value(b), .result(rol_result));
rotate_right rr1(.n(a), .value(b), .result(ror_result));
three_to_one_mux mux_1(.d0(rol_result),.d1(ror_result),.d2(other_result),.s(mux_select),.y(temp_result));

always@(a,b,s)
begin
 case(s)
      4'b1111: begin other_result = a + b; mux_select = 3'h2;end  // add
      4'b1110: begin other_result = a - b; mux_select = 3'h2;end // sub
      4'b1101: begin other_result = a & b; mux_select = 3'h2;end// and
      4'b1100: begin other_result = a | b; mux_select = 3'h2;end// or
      4'b0001: begin other_result = a * b; mux_select = 3'h2;end
      4'b1100: begin other_result = a / b; mux_select = 3'h2;end
      4'b1010: begin other_result = a<<b; mux_select = 3'h2;end
      4'b1011: begin other_result = a>>b; mux_select = 3'h2;end
      
      4'b1000:    begin 
                  if (a < b) 
                        begin 
                              other_result = 16'd1; 
                              mux_select = 3'h2; 
                        end
                  else
                        begin
                              other_result = 0;
                              mux_select = 3'h2; 
                        end
                  end 
      4'b1001:    begin 
                  if(a > b) 
                        begin
                              other_result = 16'd1; 
                              mux_select = 3'h2;
                        end
                  else
                        begin
                              other_result = 0;
                              mux_select = 3'h2; 
                        end
                  end
      4'b1001: begin mux_select = 3'h0;end
      4'b1010: begin mux_select = 3'h1; end
      
endcase      

if(result == 0)
      zero_detection = 1;
else
      zero_detection = 0;
end 

assign result = temp_result;
endmodule