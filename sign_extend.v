`timescale 1ns / 1ns


module sign_extend(in, out);
input [15:0] in;
output reg out [31:0];

assign out = {16'h0000, in};

end module;