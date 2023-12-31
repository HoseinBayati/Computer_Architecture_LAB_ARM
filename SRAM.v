module SRAM (
    clk,
    rst,
    SRAM_WE_N,
    SRAM_ADDR,    
    SRAM_DQ           
);

    input clk;
    input rst;
    input SRAM_WE_N;
    input [16:0] SRAM_ADDR;    
    inout [31:0] SRAM_DQ;

    reg [31:0] memory[0:511]; //65535

    assign #30 SRAM_DQ = SRAM_WE_N ? memory[SRAM_ADDR]: 32'bzzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz;
    
    always @(posedge clk) begin
        if (~SRAM_WE_N) begin
            memory[SRAM_ADDR] <= SRAM_DQ;
        end
    end

endmodule
