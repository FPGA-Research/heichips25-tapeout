// Copyright 2025 Leo Moser
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module IHP_SRAM_1024x32_wrapper (
    input  [ 9:0] ADDR,
    input  [31:0] BM,
    input  [31:0] DIN,
    input         WEN,
    input         MEN,
    input         REN,
    output [31:0] DOUT
);
    IHP_SRAM_1024x32 i_IHP_SRAM_1024x32 (
        .ADDR0    (ADDR[0]),
        .ADDR1    (ADDR[1]),
        .ADDR2    (ADDR[2]),
        .ADDR3    (ADDR[3]),
        .ADDR4    (ADDR[4]),
        .ADDR5    (ADDR[5]),
        .ADDR6    (ADDR[6]),
        .ADDR7    (ADDR[7]),
        .ADDR8    (ADDR[8]),
        .ADDR9    (ADDR[9]),
        
        .BM0   (BM[0]),
        .BM1   (BM[1]),
        .BM2   (BM[2]),
        .BM3   (BM[3]),
        .BM4   (BM[4]),
        .BM5   (BM[5]),
        .BM6   (BM[6]),
        .BM7   (BM[7]),
        .BM8   (BM[8]),
        .BM9   (BM[9]),
        .BM10   (BM[10]),
        .BM11   (BM[11]),
        .BM12   (BM[12]),
        .BM13   (BM[13]),
        .BM14   (BM[14]),
        .BM15   (BM[15]),
        .BM16   (BM[16]),
        .BM17   (BM[17]),
        .BM18   (BM[18]),
        .BM19   (BM[19]),
        .BM20   (BM[20]),
        .BM21   (BM[21]),
        .BM22   (BM[22]),
        .BM23   (BM[23]),
        .BM24   (BM[24]),
        .BM25   (BM[25]),
        .BM26   (BM[26]),
        .BM27   (BM[27]),
        .BM28   (BM[28]),
        .BM29   (BM[29]),
        .BM30   (BM[30]),
        .BM31   (BM[31]),
        
        .DIN0    (DIN[0]),
        .DIN1    (DIN[1]),
        .DIN2    (DIN[2]),
        .DIN3    (DIN[3]),
        .DIN4    (DIN[4]),
        .DIN5    (DIN[5]),
        .DIN6    (DIN[6]),
        .DIN7    (DIN[7]),
        .DIN8    (DIN[8]),
        .DIN9    (DIN[9]),
        .DIN10    (DIN[10]),
        .DIN11    (DIN[11]),
        .DIN12    (DIN[12]),
        .DIN13    (DIN[13]),
        .DIN14    (DIN[14]),
        .DIN15    (DIN[15]),
        .DIN16    (DIN[16]),
        .DIN17    (DIN[17]),
        .DIN18    (DIN[18]),
        .DIN19    (DIN[19]),
        .DIN20    (DIN[20]),
        .DIN21    (DIN[21]),
        .DIN22    (DIN[22]),
        .DIN23    (DIN[23]),
        .DIN24    (DIN[24]),
        .DIN25    (DIN[25]),
        .DIN26    (DIN[26]),
        .DIN27    (DIN[27]),
        .DIN28    (DIN[28]),
        .DIN29    (DIN[29]),
        .DIN30    (DIN[30]),
        .DIN31    (DIN[31]),
        
        .WEN     (WEN),
        .MEN     (MEN),
        .REN     (REN),
        
        .DOUT0    (DOUT[0]),
        .DOUT1    (DOUT[1]),
        .DOUT2    (DOUT[2]),
        .DOUT3    (DOUT[3]),
        .DOUT4    (DOUT[4]),
        .DOUT5    (DOUT[5]),
        .DOUT6    (DOUT[6]),
        .DOUT7    (DOUT[7]),
        .DOUT8    (DOUT[8]),
        .DOUT9    (DOUT[9]),
        .DOUT10    (DOUT[10]),
        .DOUT11    (DOUT[11]),
        .DOUT12    (DOUT[12]),
        .DOUT13    (DOUT[13]),
        .DOUT14    (DOUT[14]),
        .DOUT15    (DOUT[15]),
        .DOUT16    (DOUT[16]),
        .DOUT17    (DOUT[17]),
        .DOUT18    (DOUT[18]),
        .DOUT19    (DOUT[19]),
        .DOUT20    (DOUT[20]),
        .DOUT21    (DOUT[21]),
        .DOUT22    (DOUT[22]),
        .DOUT23    (DOUT[23]),
        .DOUT24    (DOUT[24]),
        .DOUT25    (DOUT[25]),
        .DOUT26    (DOUT[26]),
        .DOUT27    (DOUT[27]),
        .DOUT28    (DOUT[28]),
        .DOUT29    (DOUT[29]),
        .DOUT30    (DOUT[30]),
        .DOUT31    (DOUT[31])
    );

endmodule

module CPU_IF_wrapper (
    input  [15:0] I,
    output [15:0] O,
);

    CPU_IF i_CPU_IF (
        .I0     (I[0]),
        .I1     (I[1]),
        .I2     (I[2]),
        .I3     (I[3]),
        .I4     (I[4]),
        .I5     (I[5]),
        .I6     (I[6]),
        .I7     (I[7]),
        .I8     (I[8]),
        .I9     (I[9]),
        .I10     (I[10]),
        .I11     (I[11]),
        .I12     (I[12]),
        .I13     (I[13]),
        .I14     (I[14]),
        .I15     (I[15]),

        .O0     (O[0]),
        .O1     (O[1]),
        .O2     (O[2]),
        .O3     (O[3]),
        .O4     (O[4]),
        .O5     (O[5]),
        .O6     (O[6]),
        .O7     (O[7]),
        .O8     (O[8]),
        .O9     (O[9]),
        .O10     (O[10]),
        .O11     (O[11]),
        .O12     (O[12]),
        .O13     (O[13]),
        .O14     (O[14]),
        .O15     (O[15])
    );

endmodule

module WARMBOOT_wrapper (
    input  [3:0] SLOT,
    input        BOOT,
    output       RESET
);

    WARMBOOT i_WARMBOOT (
        .SLOT0  (SLOT[0]),
        .SLOT1  (SLOT[1]),
        .SLOT2  (SLOT[2]),
        .SLOT3  (SLOT[3]),
        .BOOT   (BOOT),
        .RESET  (RESET)
    );

endmodule

module CPU_IRQ_wrapper (
    input  [3:0] IRQ,
);

    CPU_IRQ i_CPU_IRQ (
        .IRQ0   (IRQ[0]),
        .IRQ1   (IRQ[1]),
        .IRQ2   (IRQ[2]),
        .IRQ3   (IRQ[3])
    );

endmodule

module xif_wrapper (
    output [31:0] RS1,
    output [31:0] RS2,
    input  [31:0] RESULT,
);

    wire [63:0] O, I;
    
    assign RS1 = O[31:0];
    assign RS2 = O[63:32];
    
    assign I[31:0] = RESULT;

    (* keep, BEL="X5Y15.A" *) CPU_IF i_CPU_IF_0 (
        .I0     (I[0]),
        .I1     (I[1]),
        .I2     (I[2]),
        .I3     (I[3]),
        .I4     (I[4]),
        .I5     (I[5]),
        .I6     (I[6]),
        .I7     (I[7]),
        .I8     (I[8]),
        .I9     (I[9]),
        .I10     (I[10]),
        .I11     (I[11]),
        .I12     (I[12]),
        .I13     (I[13]),
        .I14     (I[14]),
        .I15     (I[15]),

        .O0     (O[0]),
        .O1     (O[1]),
        .O2     (O[2]),
        .O3     (O[3]),
        .O4     (O[4]),
        .O5     (O[5]),
        .O6     (O[6]),
        .O7     (O[7]),
        .O8     (O[8]),
        .O9     (O[9]),
        .O10     (O[10]),
        .O11     (O[11]),
        .O12     (O[12]),
        .O13     (O[13]),
        .O14     (O[14]),
        .O15     (O[15])
    );
    
    (* keep, BEL="X6Y15.A" *) CPU_IF i_CPU_IF_1 (
        .I0     (I[16]),
        .I1     (I[17]),
        .I2     (I[18]),
        .I3     (I[19]),
        .I4     (I[20]),
        .I5     (I[21]),
        .I6     (I[22]),
        .I7     (I[23]),
        .I8     (I[24]),
        .I9     (I[25]),
        .I10     (I[26]),
        .I11     (I[27]),
        .I12     (I[28]),
        .I13     (I[29]),
        .I14     (I[30]),
        .I15     (I[31]),

        .O0     (O[16]),
        .O1     (O[17]),
        .O2     (O[18]),
        .O3     (O[19]),
        .O4     (O[20]),
        .O5     (O[21]),
        .O6     (O[22]),
        .O7     (O[23]),
        .O8     (O[24]),
        .O9     (O[25]),
        .O10     (O[26]),
        .O11     (O[27]),
        .O12     (O[28]),
        .O13     (O[29]),
        .O14     (O[30]),
        .O15     (O[31])
    );
    
    (* keep, BEL="X8Y15.A" *) CPU_IF i_CPU_IF_2 (
        .I0     (I[32]),
        .I1     (I[33]),
        .I2     (I[34]),
        .I3     (I[35]),
        .I4     (I[36]),
        .I5     (I[37]),
        .I6     (I[38]),
        .I7     (I[39]),
        .I8     (I[40]),
        .I9     (I[41]),
        .I10     (I[42]),
        .I11     (I[43]),
        .I12     (I[44]),
        .I13     (I[45]),
        .I14     (I[46]),
        .I15     (I[47]),

        .O0     (O[32]),
        .O1     (O[33]),
        .O2     (O[34]),
        .O3     (O[35]),
        .O4     (O[36]),
        .O5     (O[37]),
        .O6     (O[38]),
        .O7     (O[39]),
        .O8     (O[40]),
        .O9     (O[41]),
        .O10     (O[42]),
        .O11     (O[43]),
        .O12     (O[44]),
        .O13     (O[45]),
        .O14     (O[46]),
        .O15     (O[47])
    );
    
    (* keep, BEL="X9Y15.A" *) CPU_IF i_CPU_IF_3 (
        .I0     (I[48]),
        .I1     (I[49]),
        .I2     (I[50]),
        .I3     (I[51]),
        .I4     (I[52]),
        .I5     (I[53]),
        .I6     (I[54]),
        .I7     (I[55]),
        .I8     (I[56]),
        .I9     (I[57]),
        .I10     (I[58]),
        .I11     (I[59]),
        .I12     (I[60]),
        .I13     (I[61]),
        .I14     (I[62]),
        .I15     (I[63]),

        .O0     (O[48]),
        .O1     (O[49]),
        .O2     (O[50]),
        .O3     (O[51]),
        .O4     (O[52]),
        .O5     (O[53]),
        .O6     (O[54]),
        .O7     (O[55]),
        .O8     (O[56]),
        .O9     (O[57]),
        .O10     (O[58]),
        .O11     (O[59]),
        .O12     (O[60]),
        .O13     (O[61]),
        .O14     (O[62]),
        .O15     (O[63])
    );

endmodule

module peripheral_wrapper (
    output        REQ,
    output        WE,
    output [3: 0] BE,
    output [23:0] ADDR,
    output [31:0] WDATA,
    
    input         GNT,
    input         RVALID,
    input  [31:0] RDATA
);

    wire [63:0] O, I;

    assign WDATA = O[31:0];
    assign ADDR  = O[55:32];
    assign BE    = O[59:56];
    assign WE    = O[60];
    assign REQ   = O[61];
    
    assign I[31:0] = RDATA;
    assign I[32]   = RVALID;
    assign I[33]   = GNT;

    (* keep, BEL="X5Y15.A" *) CPU_IF i_CPU_IF_0 (
        .I0     (I[0]),
        .I1     (I[1]),
        .I2     (I[2]),
        .I3     (I[3]),
        .I4     (I[4]),
        .I5     (I[5]),
        .I6     (I[6]),
        .I7     (I[7]),
        .I8     (I[8]),
        .I9     (I[9]),
        .I10     (I[10]),
        .I11     (I[11]),
        .I12     (I[12]),
        .I13     (I[13]),
        .I14     (I[14]),
        .I15     (I[15]),

        .O0     (O[0]),
        .O1     (O[1]),
        .O2     (O[2]),
        .O3     (O[3]),
        .O4     (O[4]),
        .O5     (O[5]),
        .O6     (O[6]),
        .O7     (O[7]),
        .O8     (O[8]),
        .O9     (O[9]),
        .O10     (O[10]),
        .O11     (O[11]),
        .O12     (O[12]),
        .O13     (O[13]),
        .O14     (O[14]),
        .O15     (O[15])
    );
    
    (* keep, BEL="X6Y15.A" *) CPU_IF i_CPU_IF_1 (
        .I0     (I[16]),
        .I1     (I[17]),
        .I2     (I[18]),
        .I3     (I[19]),
        .I4     (I[20]),
        .I5     (I[21]),
        .I6     (I[22]),
        .I7     (I[23]),
        .I8     (I[24]),
        .I9     (I[25]),
        .I10     (I[26]),
        .I11     (I[27]),
        .I12     (I[28]),
        .I13     (I[29]),
        .I14     (I[30]),
        .I15     (I[31]),

        .O0     (O[16]),
        .O1     (O[17]),
        .O2     (O[18]),
        .O3     (O[19]),
        .O4     (O[20]),
        .O5     (O[21]),
        .O6     (O[22]),
        .O7     (O[23]),
        .O8     (O[24]),
        .O9     (O[25]),
        .O10     (O[26]),
        .O11     (O[27]),
        .O12     (O[28]),
        .O13     (O[29]),
        .O14     (O[30]),
        .O15     (O[31])
    );
    
    (* keep, BEL="X8Y15.A" *) CPU_IF i_CPU_IF_2 (
        .I0     (I[32]),
        .I1     (I[33]),
        .I2     (I[34]),
        .I3     (I[35]),
        .I4     (I[36]),
        .I5     (I[37]),
        .I6     (I[38]),
        .I7     (I[39]),
        .I8     (I[40]),
        .I9     (I[41]),
        .I10     (I[42]),
        .I11     (I[43]),
        .I12     (I[44]),
        .I13     (I[45]),
        .I14     (I[46]),
        .I15     (I[47]),

        .O0     (O[32]),
        .O1     (O[33]),
        .O2     (O[34]),
        .O3     (O[35]),
        .O4     (O[36]),
        .O5     (O[37]),
        .O6     (O[38]),
        .O7     (O[39]),
        .O8     (O[40]),
        .O9     (O[41]),
        .O10     (O[42]),
        .O11     (O[43]),
        .O12     (O[44]),
        .O13     (O[45]),
        .O14     (O[46]),
        .O15     (O[47])
    );
    
    (* keep, BEL="X9Y15.A" *) CPU_IF i_CPU_IF_3 (
        .I0     (I[48]),
        .I1     (I[49]),
        .I2     (I[50]),
        .I3     (I[51]),
        .I4     (I[52]),
        .I5     (I[53]),
        .I6     (I[54]),
        .I7     (I[55]),
        .I8     (I[56]),
        .I9     (I[57]),
        .I10     (I[58]),
        .I11     (I[59]),
        .I12     (I[60]),
        .I13     (I[61]),
        .I14     (I[62]),
        .I15     (I[63]),

        .O0     (O[48]),
        .O1     (O[49]),
        .O2     (O[50]),
        .O3     (O[51]),
        .O4     (O[52]),
        .O5     (O[53]),
        .O6     (O[54]),
        .O7     (O[55]),
        .O8     (O[56]),
        .O9     (O[57]),
        .O10     (O[58]),
        .O11     (O[59]),
        .O12     (O[60]),
        .O13     (O[61]),
        .O14     (O[62]),
        .O15     (O[63])
    );

endmodule

module MULADD_wrapper #(
    parameter A_reg=0,
    parameter B_reg=0,
    parameter C_reg=0,
    parameter signExtension=0,
    parameter ACC=0,
    parameter ACCout=0
) (
    input [7:0] A,
    input [7:0] B,
    input [19:0] C,
    input clr,
    
    output [19:0] Q
);

    MULADD #(
        .A_reg  (A_reg),
        .B_reg  (B_reg),
        .C_reg  (C_reg),
        
        .signExtension  (signExtension),
        .ACC            (ACC),
        .ACCout         (ACCout),
    ) muladd (
        .A0 (A[0]),
        .A1 (A[1]),
        .A2 (A[2]),
        .A3 (A[3]),
        .A4 (A[4]),
        .A5 (A[5]),
        .A6 (A[6]),
        .A7 (A[7]),

        .B0 (B[0]),
        .B1 (B[1]),
        .B2 (B[2]),
        .B3 (B[3]),
        .B4 (B[4]),
        .B5 (B[5]),
        .B6 (B[6]),
        .B7 (B[7]),
        
        .C0 (C[0]),
        .C1 (C[1]),
        .C2 (C[2]),
        .C3 (C[3]),
        .C4 (C[4]),
        .C5 (C[5]),
        .C6 (C[6]),
        .C7 (C[7]),
        .C8 (C[8]),
        .C9 (C[9]),
        .C10 (C[10]),
        .C11 (C[11]),
        .C12 (C[12]),
        .C13 (C[13]),
        .C14 (C[14]),
        .C15 (C[15]),
        .C16 (C[16]),
        .C17 (C[17]),
        .C18 (C[18]),
        .C19 (C[19]),
        
        .clr (clr),
        
        .Q0 (Q[0]),
        .Q1 (Q[1]),
        .Q2 (Q[2]),
        .Q3 (Q[3]),
        .Q4 (Q[4]),
        .Q5 (Q[5]),
        .Q6 (Q[6]),
        .Q7 (Q[7]),
        .Q8 (Q[8]),
        .Q9 (Q[9]),
        .Q10 (Q[10]),
        .Q11 (Q[11]),
        .Q12 (Q[12]),
        .Q13 (Q[13]),
        .Q14 (Q[14]),
        .Q15 (Q[15]),
        .Q16 (Q[16]),
        .Q17 (Q[17]),
        .Q18 (Q[18]),
        .Q19 (Q[19])
    );

endmodule
