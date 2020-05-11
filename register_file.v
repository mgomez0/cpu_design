 module register_file  
 (  
      input                    clk,  
      input                    rst,  
      // write port  
      input                    reg_write_en,  
      input          [3:0]     reg_write_dest,  
      input          [15:0]     reg_write_data,  
      //read port 1  
      input          [3:0]     reg_read_addr_1,  
      output          [15:0]     reg_read_data_1,  
      //read port 2  
      input          [3:0]     reg_read_addr_2,  
      output          [15:0]     reg_read_data_2  
 );  
      reg     [15:0]     reg_array [15:0];  
      // write port  
      //reg [2:0] i;  
      always @ (posedge clk or posedge rst) begin  
           if(rst) begin  
                reg_array[0] <= 16'h0;  
                reg_array[1] <= 16'h0F00;  
                reg_array[2] <= 16'h0050;  
                reg_array[3] <= 16'hFF0F;  
                reg_array[4] <= 16'hF0FF;  
                reg_array[5] <= 16'h0040;  
                reg_array[6] <= 16'h0024;  
                reg_array[7] <= 16'h00FF;
                reg_array[8] <= 16'hAAAA;
                reg_array[9] <= 16'h0000;
                reg_array[10] <= 16'h0000;
                reg_array[11] <= 16'h0000;
                reg_array[12] <= 16'hFFFF;
                reg_array[13] <= 16'h0002;
                reg_array[14] <= 16'h0000;
                reg_array[15] <= 16'h0000;

           end  
           else begin  
                if(reg_write_en) begin  
                     reg_array[reg_write_dest] <= reg_write_data;  
                end  
           end  
      end  
      assign reg_read_data_1 = ( reg_read_addr_1 == 0)? 16'b0 : reg_array[reg_read_addr_1];  
      assign reg_read_data_2 = ( reg_read_addr_2 == 0)? 16'b0 : reg_array[reg_read_addr_2];  
 endmodule  