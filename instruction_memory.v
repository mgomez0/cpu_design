 module instr_mem(pc, instruction);  
      input     [15:0]         pc;  
      output wire     [15:0]   instruction;
      wire [3 : 0] rom_addr = pc[3 : 0];  
      reg [7:0] rom[65535:0];  
      initial  
      begin  
                $readmemh("final_project/myHexFile.hex"), rom, 0, 49);
      end  
      assign instruction = {rom[rom_addr+1],rom[rom_addr]};  
 endmodule   