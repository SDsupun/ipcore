`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2018 05:06:08 PM
// Design Name: 
// Module Name: ComputePad
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


module ComputePad(

    input DATA_LENGTH,
    output PAD_SIZE);
    
    wire PAD_SIZE;
    wire pad;
    parameter MIN_FRAME_SIZE = 512;
    parameter ADDR_SIZE = 48;
    
    assign pad = MIN_FRAME_SIZE - (DATA_LENGTH + 2*ADDR_SIZE + 48);
    assign PAD_SIZE = (pad>0? pad: 0);    
endmodule
