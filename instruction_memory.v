 `timescale 1ns / 1ns
 module instr_mem(pc, instruction);  
      input     [15:0]         pc;  
      output wire     [15:0]   instruction;
      wire [3 : 0] rom_addr = pc[4 : 1];  
      reg [7:0] rom[65535:0];  
      initial  
      begin  
                $readmemh("myHexFile.hex", rom, 0, 149);
      end  
      assign instruction = (pc < 16'h32 ?  {rom[rom_addr+1],rom[rom_addr]} : 16'h0);  
 endmodule   