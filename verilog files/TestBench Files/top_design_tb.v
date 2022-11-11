`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 08:55:37 PM
// Design Name: 
// Module Name: top_design_tb
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


module top_design_tb();
reg clk;
reg rst;
reg we, re;
reg [31:0] pc;
//reg [31:0] pc;
// reg [31:0] read_data_ALU, read_data_ALU;
//reg [31:0] write_data;
wire [31:0] ins_mem;
wire [4:0] read_register1, read_register2, write_register;
wire [31:0] read_data1, read_data2;
wire [31:0] ALU_result;
wire [31:0] data_out;
//wire [31:0] ALU_result;

instruction_fetch if1(.clk(clk), .rst(rst), .pc(pc), .ins_mem(ins_mem));
instruction_decode id1(.clk(clk), .rst(rst), .ins_mem(ins_mem), .read_register1(read_register1), .read_register2(read_register2), .write_register(write_register));
regfile rf1(.clk(clk), .rst(rst), .read_register1(read_register1), .read_register2(read_register2), .read_data1(read_data1), .read_data2(read_data2), .write_register(write_register), .write_data(data_out)); // add clk and rst
ALU alu1(.clk(clk), .rst(rst), .read_data1(read_data1), .read_data2(read_data2), .ALU_result(ALU_result), .ins_mem(ins_mem));
data_mem dm1(.we(we), .re(re), .clk(clk), .rst(rst), .address(ALU_result), .ins_mem(ins_mem), .data_mem_out(data_out));

initial begin
clk = 1'b0;
rst = 1'b1;
we = 1'b0;
re = 1'b0;
repeat(2) #10 clk = ~clk;
rst = 1'b0;
//repeat(4) #10 clk = ~clk;
//rst = 1'b1;
forever #10 clk = ~clk; // generate a clock
end

initial 
begin
pc = 32'h00000000;
#20 re = 1'b1;
we = 1'b0;
#120 pc = 32'h00000001;
#140 pc = 32'h00000002;
#120 pc = 32'h00000003;
we = 1'b1;
re = 1'b0;
#100 pc = 32'h00000006;
we = 1'b0;
re = 1'b0;
end

endmodule
