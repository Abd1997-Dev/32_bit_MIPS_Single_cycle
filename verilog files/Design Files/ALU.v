`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 03:07:54 PM
// Design Name: 
// Module Name: ALU
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


module ALU(clk, rst, read_data1, read_data2, ALU_result, ins_mem);

input clk, rst;
input [31:0] read_data1, read_data2, ins_mem;
output reg [31:0] ALU_result;

reg [31:0] sign_ext;

always@(posedge clk) begin
sign_ext <= {{16{ins_mem[15]}}, ins_mem[15:0]};

if (!rst) begin
if (ins_mem[31:26]) ALU_result <= read_data1 + ((ins_mem[31:26]) ? sign_ext: read_data2);
else ALU_result <= read_data1 + read_data2; 
end

else  ALU_result <= 32'hz;
end

endmodule
