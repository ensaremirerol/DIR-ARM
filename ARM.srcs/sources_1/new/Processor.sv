`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 12:22:36 AM
// Design Name: 
// Module Name: Processor
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


module Processor(
    input reg clk
    );
    wire [24:0] INST;
    wire [7:0] PC, PCP, PCPP, SP, IMM, RESULT, RD1, RD2, ALUSRC2_1, ALUSRC2_2, ALU_RESULT, SHIFTER_RESULT, ALU_SHIFTER_SEL, DATA_MEM_WD, DATA_MEM_RD;
    wire [3:0] COND, OP, FLAGS;
    wire [2:0] FUNC, RD, tRA, tRB, RA, RB, RegSrc;
    wire [1:0] ResultSel, MemWDSel, AluControl;
    wire PCSrc, MemWrite, RegWrite, Pop, Push, ImmSrc, ZeroSrc, AluSrc;
    PCPlus pc_next(PC, PCP);
    PCPlus pc_skp(PCP, PCPP);
    PCControl pc_ctrl(clk, PCSrc, RESULT, PCP, PC);
    instructionMemory inst_mem(PC, INST);
    instruction inst_splitter(INST, COND, OP, FUNC, RD, tRA, tRB, IMM);
    ControlUnit control_u(clk, FLAGS, COND, OP, FUNC, PCSrc,
                          MemWrite, RegWrite, Pop, Push, ImmSrc,
                          ZeroSrc, AluSrc, RegSrc, ResultSel, MemWDSel, AluControl);
    mux_4_3bit ra_selector(tRA, 7, 6, 0, RegSrc[2:1], RA);
    mux_2_3bit rb_selector(tRB, RD, RegSrc[0], RB);
    SPControl sp_ctrl(clk, Pop, Push, SP);
    register reg_file(clk, RA, RB, RD, RESULT, PCPP, SP, RegWrite, RD1, RD2);
    mux_2 imm_select(RD2, IMM, ImmSrc, ALUSRC2_1);
    mux_2 zero_select(ALUSRC2_1, 0, ZeroSrc, ALUSRC2_2);
    ALU alu(RD1, ALUSRC2_2, AluControl, ALU_RESULT, FLAGS);
    Shifter shifter(RD1, ALU_SRC2_1, AluControl, SHIFTER_RESULT);
    mux_2 alu_shifter_select(ALU_RESULT, SHIFTER_RESULT, AluSrc, ALU_SHIFTER_SEL);
    mux_4 data_mem_wd_select(RD2, IMM, PCPP, 0, MemWDSel, DATA_MEM_WD);
    DataMemory data_mem(clk, MemWrite, ALU_SHIFTER_SEL, DATA_MEM_WD, DATA_MEM_RD);
    mux_4 result_sel(ALU_SHIFTER_SEL, DATA_MEM_RD, IMM, 0, ResultSel, RESULT);
endmodule
