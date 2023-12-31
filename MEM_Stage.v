module MEM_Stage (
    clk,
    rst,
    PC_in,
    WB_en_in,
    Mem_R_en_in,
    Mem_W_en_in,
    ALU_result_in,
    Val_Rm,
    Dest_in,
    ready,
    SRAM_WE_N,
    SRAM_ADDR,
    PC,
    WB_en,
    Mem_R_en,
    ALU_result,
    Dest,
    Data_mem_out,
    SRAM_DQ
);
    input clk, rst;
    input [31:0] PC_in;
    input WB_en_in, Mem_R_en_in, Mem_W_en_in;
    input [31:0] ALU_result_in;
    input [31:0] Val_Rm;
    input [3:0] Dest_in;

    output ready;
    output SRAM_WE_N;
    output [16:0] SRAM_ADDR;
    output [31:0] PC;
    output WB_en, Mem_R_en;
    output [31:0] ALU_result;
    output [3:0] Dest;
    output [31:0] Data_mem_out;
    inout [31:0] SRAM_DQ;

    wire [3:0] SRAM_Cont;

    assign PC = PC_in;
    assign ALU_result = ALU_result_in;
    assign WB_en = WB_en_in;
    assign Mem_R_en = Mem_R_en_in;
    assign Dest = Dest_in;

    //Memory dataMemory(clk, rst, Mem_W_en_in, Mem_R_en_in, ALU_result_in, Val_Rm, Data_mem_out);

    SRAM_Controller sram_cont(
        clk, 
        rst,
        Mem_W_en_in, 
        Mem_R_en_in,
        ALU_result_in,
        Val_Rm,
        Data_mem_out,
        ready,
        SRAM_ADDR,
        SRAM_Cont[0],
        SRAM_Cont[1],
        SRAM_WE_N,
        SRAM_Cont[2],
        SRAM_Cont[3],
        SRAM_DQ
    );

endmodule

