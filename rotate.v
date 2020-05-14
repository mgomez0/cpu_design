module rotate_right(n, value, result);
	input [15:0] n, value;
	output reg [15:0] result;
	reg [15:0] temp, temp2;
	
	always@(*)
	begin
		case(n[3:0])
			0:
				begin
				result <= value;
				end
			1:
				begin
				temp <= { {15 - 1 + 1{1'b0}}, value[1 - 1: 0] };
				temp2 <= value >> 1;
				result <= {temp[1 - 1: 0] , temp2[15 - 1: 0]};
				end
			2:
				begin
				temp <= { {15 - 2 + 1{1'b0}}, value[2 - 1: 0] };
				temp2 <= value >> 2;
				result <= {temp[2 - 1: 0] , temp2[15 - 2: 0]};
				end
			3:
				begin
				temp <= { {15 - 3 + 1{1'b0}}, value[3 - 1: 0] };
				temp2 <= value >> 3;
				result <= {temp[3 - 1: 0] , temp2[15 - 3: 0]};
				end
			4:
				begin
				temp <= { {15 - 4 + 1{1'b0}}, value[4 - 1: 0] };
				temp2 <= value >> 4;
				result <= {temp[4 - 1: 0] , temp2[15 - 4: 0]};
				end
			5:
				begin
				temp <= { {15 - 5 + 1{1'b0}}, value[5 - 1: 0] };
				temp2 <= value >> 5;
				result <= {temp[5 - 1: 0] , temp2[15 - 5: 0]};
				end
			6:
				begin
				temp <= { {15 - 6 + 1{1'b0}}, value[6 - 1: 0] };
				temp2 <= value >> 6;
				result <= {temp[6 - 1: 0] , temp2[15 - 6: 0]};
				end
			7:
				begin
				temp <= { {15 - 7 + 1{1'b0}}, value[7 - 1: 0] };
				temp2 <= value >> 7;
				result <= {temp[7 - 1: 0] , temp2[15 - 7: 0]};
				end
			8:
				begin
				temp <= { {15 - 8 + 1{1'b0}}, value[8 - 1: 0] };
				temp2 <= value >> 8;
				result <= {temp[8 - 1: 0] , temp2[15 - 8: 0]};
				end
			9:
				begin
				temp <= { {15 - 9 + 1{1'b0}}, value[9 - 1: 0] };
				temp2 <= value >> 9;
				result <= {temp[9 - 1: 0] , temp2[15 - 9: 0]};
				end
			10:
				begin
				temp <= { {15 - 10 + 1{1'b0}}, value[10 - 1: 0] };
				temp2 <= value >> 10;
				result <= {temp[10 - 1: 0] , temp2[15 - 10: 0]};
				end
			11:
				begin
				temp <= { {15 - 11 + 1{1'b0}}, value[11 - 1: 0] };
				temp2 <= value >> 11;
				result <= {temp[11 - 1: 0] , temp2[15 - 11: 0]};
				end
			12:
				begin
				temp <= { {15 - 12 + 1{1'b0}}, value[12 - 1: 0] };
				temp2 <= value >> 12;
				result <= {temp[12 - 1: 0] , temp2[15 - 12: 0]};
				end
			13:
				begin
				temp <= { {15 - 13 + 1{1'b0}}, value[13 - 1: 0] };
				temp2 <= value >> 13;
				result <= {temp[13 - 1: 0] , temp2[15 - 13: 0]};
				end
			14:
				begin
				temp <= { {15 - 14 + 1{1'b0}}, value[14 - 1: 0] };
				temp2 <= value >> 14;
				result <= {temp[14 - 1: 0] , temp2[15 - 14: 0]};
				end
			15:
				begin
				temp <= { {15 - 15 + 1{1'b0}}, value[15 - 1: 0] };
				temp2 <= value >> 15;
				result <= {temp[15 - 1: 0] , temp2[15 - 15: 0]};
				end
		endcase
	end
endmodule

module rotate_left(n, value, result);
	input [15:0] n, value;
	output reg [15:0] result;
	reg [15:0] temp, temp2;
	
	always@(*)
	begin
		case(n[3:0])
			0:
				begin
				result <= value;
				end
			1:
				begin
				temp <= { {15 - 1 + 1{1'b0}}, value[15:15 - 1 + 1] };
				temp2 <= value << 1;
				result <= {temp2[15:1] , temp[1 - 1:0]};
				end
			2:
				begin
				temp <= { {15 - 2 + 1{1'b0}}, value[15:15 - 2 + 1] };
				temp2 <= value << 2;
				result <= {temp2[15:2] , temp[2 - 1:0]};
				end
			3:
				begin
				temp <= { {15 - 3 + 1{1'b0}}, value[15:15 - 3 + 1] };
				temp2 <= value << 3;
				result <= {temp2[15:3] , temp[3 - 1:0]};
				end
			4:
				begin
				temp <= { {15 - 4 + 1{1'b0}}, value[15:15 - 4 + 1] };
				temp2 <= value << 4;
				result <= {temp2[15:4] , temp[4 - 1:0]};
				end
			5:
				begin
				temp <= { {15 - 5 + 1{1'b0}}, value[15:15 - 5 + 1] };
				temp2 <= value << 5;
				result <= {temp2[15:5] , temp[5 - 1:0]};
				end
			6:
				begin
				temp <= { {15 - 6 + 1{1'b0}}, value[15:15 - 6 + 1] };
				temp2 <= value << 6;
				result <= {temp2[15:6] , temp[6 - 1:0]};
				end
			7:
				begin
				temp <= { {15 - 7 + 1{1'b0}}, value[15:15 - 7 + 1] };
				temp2 <= value << 7;
				result <= {temp2[15:7] , temp[7 - 1:0]};
				end
			8:
				begin
				temp <= { {15 - 8 + 1{1'b0}}, value[15:15 - 8 + 1] };
				temp2 <= value << 8;
				result <= {temp2[15:8] , temp[8 - 1:0]};
				end
			9:
				begin
				temp <= { {15 - 9 + 1{1'b0}}, value[15:15 - 9 + 1] };
				temp2 <= value << 9;
				result <= {temp2[15:9] , temp[9 - 1:0]};
				end
			10:
				begin
				temp <= { {15 - 10 + 1{1'b0}}, value[15:15 - 10 + 1] };
				temp2 <= value << 10;
				result <= {temp2[15:10] , temp[10 - 1:0]};
				end
			11:
				begin
				temp <= { {15 - 11 + 1{1'b0}}, value[15:15 - 11 + 1] };
				temp2 <= value << 11;
				result <= {temp2[15:11] , temp[11 - 1:0]};
				end
			12:
				begin
				temp <= { {15 - 12 + 1{1'b0}}, value[15:15 - 12 + 1] };
				temp2 <= value << 12;
				result <= {temp2[15:12] , temp[12 - 1:0]};
				end
			13:
				begin
				temp <= { {15 - 13 + 1{1'b0}}, value[15:15 - 13 + 1] };
				temp2 <= value << 13;
				result <= {temp2[15:13] , temp[13 - 1:0]};
				end
			14:
				begin
				temp <= { {15 - 14 + 1{1'b0}}, value[15:15 - 14 + 1] };
				temp2 <= value << 14;
				result <= {temp2[15:14] , temp[14 - 1:0]};
				end
			15:
				begin
				temp <= { {15 - 15 + 1{1'b0}}, value[15:15 - 15 + 1] };
				temp2 <= value << 15;
				result <= {temp2[15:15] , temp[15 - 1:0]};
				end
		endcase
	end
endmodule