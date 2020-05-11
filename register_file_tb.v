`timescale 1ns / 1ns
module register_file_tb;

reg clk, rst, reg_write_en;
reg[3:0] reg_read_addr_1, reg_read_addr_2, reg_write_dest;
reg[15:0] reg_write_data;
wire[15:0] reg_read_data_1, reg_read_data_2;
integer i;
register_file u1(clk, rst, reg_write_en,reg_write_dest, reg_write_data, reg_read_addr_1, reg_read_data_1, 
reg_read_addr_2, reg_read_data_2);  

always
#20 clk = ~clk;


initial
begin
    clk = 0;
    reset = 1;
    reg_read_addr_1 = 0;
    reg_read_addr_2 = 0;
    #10 reset = 0;
    for(i = 0; i < 8'h32; i = i+1)
        begin
            $monitor("Reading port 1... Register %h: %h", i, reg_read_data_1);
            $monitor("Reading port 2... Register %h: %h", i, reg_read_data_2);
            #20 reg_read_addr_1 = reg_read_addr_1 +1; reg_read_addr_2 = reg_read_addr_2 + 1;
        end
end


initial begin
		$dumpfile("register_file.vcd");
		$dumpvars(0, register_file_tb);
	end
endmodule