`timescale 1ns / 1ns
module instruction_memory_tb;

reg[15:0] pc;
wire[15:0] instruction;
integer i;
instr_mem u1(pc, instruction);

initial
begin
    pc = 0;
    for(i = 0; i < 8'h32; i = i+1)
        begin
            #20 pc = pc + 2'h2;
            $monitor("Mem Address=%h instruction=%h",pc,instruction);
        end
end


initial begin
		$dumpfile("instruction_memory.vcd");
		$dumpvars(0, instruction_memory_tb);
	end
endmodule