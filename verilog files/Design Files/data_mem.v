`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 01:42:26 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(input we, input re, input clk, input rst, input [31:0] address,input [31:0] write_data_mem, input [31:0] ins_mem, output reg [31:0] data_mem_out);

reg [31:0] data_mem [31:0];
reg [31:0] read_data;

always @ (posedge clk) begin
case(address)
32'h00000000 : data_mem[address] = 32'h00000001;
32'h00000001 : data_mem[address] = 32'h00000002;
32'h00000002 : data_mem[address] = 32'h00000003;
32'h00000003 : data_mem[address] = 32'h00000020;
32'h00000004 : data_mem[address] = 32'h00000005;
32'h00000005 : data_mem[address] = 32'h00000006;
32'h00000006 : data_mem[address] = 32'h00000007;
32'h00000007 : data_mem[address] = 32'h00000008;
32'h00000008 : data_mem[address] = 32'h00000009;
32'h00000009 : data_mem[address] = 32'h0000000a;
32'h0000000a : data_mem[address] = 32'h0000000b;
32'h0000000b : data_mem[address] = 32'h0000000c;
32'h0000000c : data_mem[address] = 32'h0000000d;
32'h0000000d : data_mem[address] = 32'h0000000e;
32'h0000000e : data_mem[address] = 32'h0000000f;
32'h0000000f : data_mem[address] = 32'h00000010;
default : data_mem[address] = 32'hx;
endcase
end

always @ (posedge clk) begin 
if (!rst && re) read_data <= data_mem[address]; //LW
else if (!rst && !re) read_data <= 32'hz;
else  read_data <= 32'h0; // extra only. later try to remove it.
end 

always @ (posedge clk) begin 
if (!rst && we) data_mem[address] <= write_data_mem; //SW
else if (!rst && !we) data_mem[address] <= 32'hz;
else  data_mem[address] <= 32'h0; // extra only. later try to remove it.
end 

always @ (posedge clk) begin
if (re) data_mem_out <= (ins_mem[31:26] == 6'b100011) ? read_data : address;
else if (we) data_mem_out <= 32'hz;
end

endmodule
