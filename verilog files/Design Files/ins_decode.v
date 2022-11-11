`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 03:44:17 PM
// Design Name: 
// Module Name: ins_decode
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


module instruction_decode(input clk, input rst, input [31:0] ins_mem, output reg [4:0] read_register1, output reg [4:0] read_register2, output reg [4:0] write_register);

always @ (posedge clk) 
begin
if(!rst) begin
 read_register1 <= ins_mem[25:21];
 read_register2 <= ins_mem[20:16];
 write_register <= ins_mem[31:26] ? ins_mem[20:16] : ins_mem[15:11]; // simply written if needed it can be rewritten.
end

else begin
read_register1 <= 5'bx;
 read_register2 <= 5'bx;
 write_register <= 5'bx;
end

end

endmodule


//initial
//begin 
////write_register = 5'b00000;
//if (ins_mem[31:26] == 6'b000000)
// write_register = ins_mem[15:11];
//else
// write_register = ins_mem[20:16];
//end

//initial
//begin 
//write_register = 5'b00000;
//case(ins_mem[31:26])
//6'b000000 : write_register = ins_mem[15:11];
//6'b001000 : write_register = ins_mem[20:16];
//endcase
//end