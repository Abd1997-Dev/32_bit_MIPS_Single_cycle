`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 03:57:40 PM
// Design Name: 
// Module Name: regfile1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module regfile(input clk, input rst, input [4:0] read_register1, input [4:0] read_register2, input [4:0] write_register, input[31:0] write_data, output reg [31:0] read_data1, output reg [31:0] read_data2);

reg [31:0] reg_mem [31:0]; // try using textfile

always @ (read_register1, read_register2, write_register) begin
//always @ (posedge clk) begin
case(read_register1)
5'b00000 : reg_mem[read_register1] = 32'h00000004;
5'b00001 : reg_mem[read_register1] = 32'h00000002;
5'b00010 : reg_mem[read_register1] = 32'h00000003;
5'b00011 : reg_mem[read_register1] = 32'h00000005;
default :  reg_mem[read_register1] = 32'h00000000;
endcase 

case(read_register2)
5'b00000 : reg_mem[read_register2] = 32'h00000004;
5'b00001 : reg_mem[read_register2] = 32'h00000002;
5'b00010 : reg_mem[read_register2] = 32'h00000003;
5'b00011 : reg_mem[read_register2] = 32'h00000005;
default :  reg_mem[read_register2] = 32'h00000000;
endcase 
end



always @ (posedge clk) begin
if (!rst) begin
read_data1 <= reg_mem[read_register1];
read_data2 <= reg_mem[read_register2];
reg_mem[write_register] <= write_data;
end 

else begin
read_data1 <= 32'hz;
read_data2 <= 32'hz;
reg_mem[write_register] <= 32'hx;
end
end

endmodule




//initial // need not be synthesized
//begin // using blocking procedural assignment statements because of combinational logic
//reg_mem[0] = 32'h00000004;
//reg_mem[1] = 32'h00000002;
//reg_mem[2] = 32'h00000003;
//reg_mem[3] = 32'h00000000;
//reg_mem[4] = 32'h00000000;
//reg_mem[5] = 32'h00000000;
//reg_mem[6] = 32'h00000000;
//reg_mem[7] = 32'h00000000;
//reg_mem[8] = 32'h00000000;
//reg_mem[9] = 32'h00000000;
//reg_mem[10] = 32'h00000000;
//reg_mem[11] = 32'h00000020;
//reg_mem[12] = 32'h00000020;
//reg_mem[13] = 32'h00000020;
//reg_mem[14] = 32'h00000020;
//reg_mem[15] = 32'h00000020;
//reg_mem[16] = 32'h00000020;
//reg_mem[17] = 32'h00000020;
//reg_mem[18] = 32'h00000020;
//reg_mem[19] = 32'h00000020;
//reg_mem[20] = 32'h00000020;
//reg_mem[21] = 32'h00000020;
//reg_mem[22] = 32'h00000020;
//reg_mem[23] = 32'h00000020;
//reg_mem[24] = 32'h00000020;
//reg_mem[25] = 32'h00000020;
//reg_mem[26] = 32'h00000020;
//reg_mem[27] = 32'h00000020;
//reg_mem[28] = 32'h00000020;
//reg_mem[29] = 32'h00000020;
//reg_mem[30] = 32'h00000020;
//reg_mem[31] = 32'h00002222;
//end 

//assign read_data1 = reg_mem[read_register1];
//assign read_data2 = reg_mem[read_register2];
