`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Moratuwa, Sri Lanka.
// Engineer: S.D.S.Madusanka
// 
// Create Date: 05/02/2018 05:06:08 PM
// Design Name: Frame Chack Sequence Generator
// Module Name: CRC32
// Project Name: 40G Ethernet 
// Target Devices: VIRTEX-7 VC709
// Tool Versions: 2015.4
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CRC32(
    input CLK,
    input RESETN,
    input [127:0] DATA_IN,
    input [31:0] CRC_INIT,
    input CRC_IN,
    output reg [0:31]FCS
    );
    
    // wires from the output of the LUTs
    wire [31:0] LUT3_OUT_4_4BYTE;
    wire [31:0] LUT3_OUT_4_3BYTE;
    wire [31:0] LUT3_OUT_4_2BYTE;
    wire [31:0] LUT3_OUT_4_1BYTE;
    
    wire [31:0] LUT2_OUT_4_4BYTE;
    wire [31:0] LUT2_OUT_4_3BYTE;
    wire [31:0] LUT2_OUT_4_2BYTE;
    wire [31:0] LUT2_OUT_4_1BYTE;
    
    wire [31:0] LUT1_OUT_4_4BYTE;
    wire [31:0] LUT1_OUT_4_3BYTE;
    wire [31:0] LUT1_OUT_4_2BYTE;
    wire [31:0] LUT1_OUT_4_1BYTE;
        
    wire [31:0] LUT0_OUT_4_4BYTE;
    wire [31:0] LUT0_OUT_4_3BYTE;
    wire [31:0] LUT0_OUT_4_2BYTE;
    wire [31:0] LUT0_OUT_4_1BYTE;
    
    //wires in the TXOR block
    wire [31:0] TXOR_IN_LUT3;
    wire [31:0] TXOR_IN_LUT2;
    wire [31:0] TXOR_IN_LUT1;
    wire [31:0] TXOR_IN_LUT0;
    
    //input wires for the LUTs
    wire [31:0] LUT3_IN;
    wire [31:0] LUT2_IN;
    wire [31:0] LUT1_IN;
    wire [31:0] LUT0_IN;
    
    wire [31:0] TXOR_OUT;
    
    //assign LUT input wires from the input data
    assign LUT3_IN = (CRC_IN)?(CRC_INIT^DATA_IN[127:96]):(FCS^DATA_IN[127:96]);
    assign LUT2_IN = DATA_IN[95:64];
    assign LUT1_IN = DATA_IN[63:32];
    assign LUT0_IN = DATA_IN[31:0];

    //TXOR operation
    assign  TXOR_IN_LUT3 = LUT3_OUT_4_4BYTE^LUT3_OUT_4_3BYTE^LUT3_OUT_4_2BYTE^LUT3_OUT_4_1BYTE;
    assign  TXOR_IN_LUT2 = LUT2_OUT_4_4BYTE^LUT2_OUT_4_3BYTE^LUT2_OUT_4_2BYTE^LUT2_OUT_4_1BYTE;
    assign  TXOR_IN_LUT1 = LUT1_OUT_4_4BYTE^LUT1_OUT_4_3BYTE^LUT1_OUT_4_2BYTE^LUT1_OUT_4_1BYTE;
    assign  TXOR_IN_LUT0 = LUT0_OUT_4_4BYTE^LUT0_OUT_4_3BYTE^LUT0_OUT_4_2BYTE^LUT0_OUT_4_1BYTE;
        
    assign TXOR_OUT = TXOR_IN_LUT3^TXOR_IN_LUT2^TXOR_IN_LUT1^TXOR_IN_LUT0;
    
    //memory blocks; LUTs
    dist_mem_gen_0 lut3_4_4byte(
    .a(LUT3_IN[31:24]),
    .spo(LUT3_OUT_4_4BYTE)
    );
    
    dist_mem_gen_0 lut3_4_3byte(
    .a(LUT3_IN[23:16]),
    .spo(LUT3_OUT_4_3BYTE)
    );
    
    dist_mem_gen_0 lut3_4_2byte(
    .a(LUT3_IN[15:8]),
    .spo(LUT3_OUT_4_2BYTE)
    );
    
    dist_mem_gen_0 lut3_4_1byte(
    .a(LUT3_IN[7:0]),
    .spo(LUT3_OUT_4_1BYTE)
    );

    
    dist_mem_gen_0 lut2_4_4byte(
    .a(LUT2_IN[31:24]),
    .spo(LUT2_OUT_4_4BYTE)
    );
    
    dist_mem_gen_0 lut2_4_3byte(
    .a(LUT2_IN[23:16]),
    .spo(LUT2_OUT_4_3BYTE)
    );
    
    dist_mem_gen_0 lut2_4_2byte(
    .a(LUT2_IN[15:8]),
    .spo(LUT2_OUT_4_2BYTE)
    );
    
    dist_mem_gen_0 lut2_4_1byte(
    .a(LUT2_IN[7:0]),
    .spo(LUT2_OUT_4_1BYTE)
    );

    
    dist_mem_gen_0 lut1_4_4byte(
    .a(LUT1_IN[31:24]),
    .spo(LUT1_OUT_4_4BYTE)
    );
    
    dist_mem_gen_0 lut1_4_3byte(
    .a(LUT1_IN[23:16]),
    .spo(LUT1_OUT_4_3BYTE)
    );
    
    dist_mem_gen_0 lut1_4_2byte(
    .a(LUT1_IN[15:8]),
    .spo(LUT1_OUT_4_2BYTE)
    );
    
    dist_mem_gen_0 lut1_4_1byte(
    .a(LUT1_IN[7:0]),
    .spo(LUT1_OUT_4_1BYTE)
    );
    
    
    dist_mem_gen_0 lut0_4_4byte(
    .a(LUT0_IN[31:24]),
    .spo(LUT0_OUT_4_4BYTE)
    );
    
    dist_mem_gen_0 lut0_4_3byte(
    .a(LUT0_IN[23:16]),
    .spo(LUT0_OUT_4_3BYTE)
    );
    
    dist_mem_gen_0 lut0_4_2byte(
    .a(LUT0_IN[15:8]),
    .spo(LUT0_OUT_4_2BYTE)
    );
    
    dist_mem_gen_0 lut0_4_1byte(
    .a(LUT0_IN[7:0]),
    .spo(LUT0_OUT_4_1BYTE)
    );
    
    //sample the CRC
    always@(posedge CLK, negedge RESETN)
    begin
        if(~RESETN)
        begin
            FCS = 32'b0;
        end
        else
        begin
            FCS = TXOR_OUT;
        end
    end
endmodule
