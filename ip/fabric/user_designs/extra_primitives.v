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

(* blackbox *)
module IHP_SRAM_1024x32 (
    input  ADDR0,
    input  ADDR1,
    input  ADDR2,
    input  ADDR3,
    input  ADDR4,
    input  ADDR5,
    input  ADDR6,
    input  ADDR7,
    input  ADDR8,
    input  ADDR9,

    input  BM0,
    input  BM1,
    input  BM2,
    input  BM3,
    input  BM4,
    input  BM5,
    input  BM6,
    input  BM7,
    input  BM8,
    input  BM9,
    input  BM10,
    input  BM11,
    input  BM12,
    input  BM13,
    input  BM14,
    input  BM15,
    input  BM16,
    input  BM17,
    input  BM18,
    input  BM19,
    input  BM20,
    input  BM21,
    input  BM22,
    input  BM23,
    input  BM24,
    input  BM25,
    input  BM26,
    input  BM27,
    input  BM28,
    input  BM29,
    input  BM30,
    input  BM31,

    input  DIN0,
    input  DIN1,
    input  DIN2,
    input  DIN3,
    input  DIN4,
    input  DIN5,
    input  DIN6,
    input  DIN7,
    input  DIN8,
    input  DIN9,
    input  DIN10,
    input  DIN11,
    input  DIN12,
    input  DIN13,
    input  DIN14,
    input  DIN15,
    input  DIN16,
    input  DIN17,
    input  DIN18,
    input  DIN19,
    input  DIN20,
    input  DIN21,
    input  DIN22,
    input  DIN23,
    input  DIN24,
    input  DIN25,
    input  DIN26,
    input  DIN27,
    input  DIN28,
    input  DIN29,
    input  DIN30,
    input  DIN31,

    input  WEN,
    input  MEN,
    input  REN,

    output DOUT0,
    output DOUT1,
    output DOUT2,
    output DOUT3,
    output DOUT4,
    output DOUT5,
    output DOUT6,
    output DOUT7,
    output DOUT8,
    output DOUT9,
    output DOUT10,
    output DOUT11,
    output DOUT12,
    output DOUT13,
    output DOUT14,
    output DOUT15,
    output DOUT16,
    output DOUT17,
    output DOUT18,
    output DOUT19,
    output DOUT20,
    output DOUT21,
    output DOUT22,
    output DOUT23,
    output DOUT24,
    output DOUT25,
    output DOUT26,
    output DOUT27,
    output DOUT28,
    output DOUT29,
    output DOUT30,
    output DOUT31
);

endmodule


(* blackbox, keep *)
module CPU_IF (
    input  I0,
    input  I1,
    input  I2,
    input  I3,
    input  I4,
    input  I5,
    input  I6,
    input  I7,
    input  I8,
    input  I9,
    input  I10,
    input  I11,
    input  I12,
    input  I13,
    input  I14,
    input  I15,

    output O0,
    output O1,
    output O2,
    output O3,
    output O4,
    output O5,
    output O6,
    output O7,
    output O8,
    output O9,
    output O10,
    output O11,
    output O12,
    output O13,
    output O14,
    output O15
);

endmodule

(* blackbox, keep *)
module WARMBOOT (
    input  SLOT0,
    input  SLOT1,
    input  SLOT2,
    input  SLOT3,
    input  BOOT,
    output RESET
);

endmodule

(* blackbox, keep *)
module CPU_IRQ (
    input  IRQ0,
    input  IRQ1,
    input  IRQ2,
    input  IRQ3
);

endmodule

(* blackbox *)
module MULADD #(
    parameter A_reg=0,
    parameter B_reg=0,
    parameter C_reg=0,
    parameter signExtension=0,
    parameter ACC=0,
    parameter ACCout=0
)(
    input A0,
    input A1,
    input A2,
    input A3,
    input A4,
    input A5,
    input A6,
    input A7,
    
    input B0,
    input B1,
    input B2,
    input B3,
    input B4,
    input B5,
    input B6,
    input B7,
    
    input C0,
    input C1,
    input C2,
    input C3,
    input C4,
    input C5,
    input C6,
    input C7,
    input C8,
    input C9,
    input C10,
    input C11,
    input C12,
    input C13,
    input C14,
    input C15,
    input C16,
    input C17,
    input C18,
    input C19,
    
    input clr,
    
    output Q0,
    output Q1,
    output Q2,
    output Q3,
    output Q4,
    output Q5,
    output Q6,
    output Q7,
    output Q8,
    output Q9,
    output Q10,
    output Q11,
    output Q12,
    output Q13,
    output Q14,
    output Q15,
    output Q16,
    output Q17,
    output Q18,
    output Q19
);

endmodule
