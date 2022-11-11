`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 03:13:03 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_fetch(input clk, input rst, input [31:0] pc, output reg [31:0] ins_mem);

reg [31:0] ins_mem1 [31:0];

always @ (posedge clk) begin
case (pc)
32'h00000000 : ins_mem1[pc] <= 32'h00001020; // ADD rs, rt, rd;
32'h00000001 : ins_mem1[pc] <= 32'h20220004; // ADDI rs, st, imm
32'h00000002 : ins_mem1[pc] <= 32'h8C010001; // LW rs, rt, imm
32'h00000003 : ins_mem1[pc] <= 32'hAC010001; // SW rs, rt, imm
default : ins_mem1[pc] <= 32'hx; // default statement
endcase
end

always @ (posedge clk) begin
if (rst) // active high reset
ins_mem <= 32'h00000000;
else
ins_mem <= ins_mem1[pc];
end

endmodule
