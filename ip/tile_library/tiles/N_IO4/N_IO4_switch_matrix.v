 // NumberOfConfigBits: 132
module N_IO4_switch_matrix
    #(
        parameter NoConfigBits=132
    )
    (
        input N1END0,
        input N1END1,
        input N1END2,
        input N1END3,
        input N2MID0,
        input N2MID1,
        input N2MID2,
        input N2MID3,
        input N2MID4,
        input N2MID5,
        input N2MID6,
        input N2MID7,
        input N2END0,
        input N2END1,
        input N2END2,
        input N2END3,
        input N2END4,
        input N2END5,
        input N2END6,
        input N2END7,
        input N4END0,
        input N4END1,
        input N4END2,
        input N4END3,
        input N4END4,
        input N4END5,
        input N4END6,
        input N4END7,
        input N4END8,
        input N4END9,
        input N4END10,
        input N4END11,
        input N4END12,
        input N4END13,
        input N4END14,
        input N4END15,
        input NN4END0,
        input NN4END1,
        input NN4END2,
        input NN4END3,
        input NN4END4,
        input NN4END5,
        input NN4END6,
        input NN4END7,
        input NN4END8,
        input NN4END9,
        input NN4END10,
        input NN4END11,
        input NN4END12,
        input NN4END13,
        input NN4END14,
        input NN4END15,
        input Ci0,
        input A_O,
        input A_Q,
        input B_O,
        input B_Q,
        input C_O,
        input C_Q,
        input D_O,
        input D_Q,
        output S1BEG0,
        output S1BEG1,
        output S1BEG2,
        output S1BEG3,
        output S2BEG0,
        output S2BEG1,
        output S2BEG2,
        output S2BEG3,
        output S2BEG4,
        output S2BEG5,
        output S2BEG6,
        output S2BEG7,
        output S2BEGb0,
        output S2BEGb1,
        output S2BEGb2,
        output S2BEGb3,
        output S2BEGb4,
        output S2BEGb5,
        output S2BEGb6,
        output S2BEGb7,
        output S4BEG0,
        output S4BEG1,
        output S4BEG2,
        output S4BEG3,
        output S4BEG4,
        output S4BEG5,
        output S4BEG6,
        output S4BEG7,
        output S4BEG8,
        output S4BEG9,
        output S4BEG10,
        output S4BEG11,
        output S4BEG12,
        output S4BEG13,
        output S4BEG14,
        output S4BEG15,
        output SS4BEG0,
        output SS4BEG1,
        output SS4BEG2,
        output SS4BEG3,
        output SS4BEG4,
        output SS4BEG5,
        output SS4BEG6,
        output SS4BEG7,
        output SS4BEG8,
        output SS4BEG9,
        output SS4BEG10,
        output SS4BEG11,
        output SS4BEG12,
        output SS4BEG13,
        output SS4BEG14,
        output SS4BEG15,
        output A_I,
        output A_T,
        output B_I,
        output B_T,
        output C_I,
        output C_T,
        output D_I,
        output D_T,
 //global
        input [NoConfigBits-1:0] ConfigBits,
        input [NoConfigBits-1:0] ConfigBits_N
);
parameter GND0 = 1'b0;
parameter GND = 1'b0;
parameter VCC0 = 1'b1;
parameter VCC = 1'b1;
parameter VDD0 = 1'b1;
parameter VDD = 1'b1;

wire[4-1:0] S1BEG0_input;
wire[4-1:0] S1BEG1_input;
wire[4-1:0] S1BEG2_input;
wire[4-1:0] S1BEG3_input;
wire[4-1:0] S2BEG0_input;
wire[4-1:0] S2BEG1_input;
wire[4-1:0] S2BEG2_input;
wire[4-1:0] S2BEG3_input;
wire[4-1:0] S2BEG4_input;
wire[4-1:0] S2BEG5_input;
wire[4-1:0] S2BEG6_input;
wire[4-1:0] S2BEG7_input;
wire[4-1:0] S2BEGb0_input;
wire[4-1:0] S2BEGb1_input;
wire[4-1:0] S2BEGb2_input;
wire[4-1:0] S2BEGb3_input;
wire[4-1:0] S2BEGb4_input;
wire[4-1:0] S2BEGb5_input;
wire[4-1:0] S2BEGb6_input;
wire[4-1:0] S2BEGb7_input;
wire[4-1:0] S4BEG0_input;
wire[4-1:0] S4BEG1_input;
wire[4-1:0] S4BEG2_input;
wire[4-1:0] S4BEG3_input;
wire[4-1:0] S4BEG4_input;
wire[4-1:0] S4BEG5_input;
wire[4-1:0] S4BEG6_input;
wire[4-1:0] S4BEG7_input;
wire[4-1:0] S4BEG8_input;
wire[4-1:0] S4BEG9_input;
wire[4-1:0] S4BEG10_input;
wire[4-1:0] S4BEG11_input;
wire[4-1:0] S4BEG12_input;
wire[4-1:0] S4BEG13_input;
wire[4-1:0] S4BEG14_input;
wire[4-1:0] S4BEG15_input;
wire[4-1:0] SS4BEG0_input;
wire[4-1:0] SS4BEG1_input;
wire[4-1:0] SS4BEG2_input;
wire[4-1:0] SS4BEG3_input;
wire[4-1:0] SS4BEG4_input;
wire[4-1:0] SS4BEG5_input;
wire[4-1:0] SS4BEG6_input;
wire[4-1:0] SS4BEG7_input;
wire[4-1:0] SS4BEG8_input;
wire[4-1:0] SS4BEG9_input;
wire[4-1:0] SS4BEG10_input;
wire[4-1:0] SS4BEG11_input;
wire[4-1:0] SS4BEG12_input;
wire[4-1:0] SS4BEG13_input;
wire[4-1:0] SS4BEG14_input;
wire[4-1:0] SS4BEG15_input;
wire[16-1:0] A_I_input;
wire[8-1:0] A_T_input;
wire[16-1:0] B_I_input;
wire[8-1:0] B_T_input;
wire[16-1:0] C_I_input;
wire[8-1:0] C_T_input;
wire[16-1:0] D_I_input;
wire[8-1:0] D_T_input;

wire[1:0] DEBUG_select_S1BEG0;
wire[1:0] DEBUG_select_S1BEG1;
wire[1:0] DEBUG_select_S1BEG2;
wire[1:0] DEBUG_select_S1BEG3;
wire[1:0] DEBUG_select_S2BEG0;
wire[1:0] DEBUG_select_S2BEG1;
wire[1:0] DEBUG_select_S2BEG2;
wire[1:0] DEBUG_select_S2BEG3;
wire[1:0] DEBUG_select_S2BEG4;
wire[1:0] DEBUG_select_S2BEG5;
wire[1:0] DEBUG_select_S2BEG6;
wire[1:0] DEBUG_select_S2BEG7;
wire[1:0] DEBUG_select_S2BEGb0;
wire[1:0] DEBUG_select_S2BEGb1;
wire[1:0] DEBUG_select_S2BEGb2;
wire[1:0] DEBUG_select_S2BEGb3;
wire[1:0] DEBUG_select_S2BEGb4;
wire[1:0] DEBUG_select_S2BEGb5;
wire[1:0] DEBUG_select_S2BEGb6;
wire[1:0] DEBUG_select_S2BEGb7;
wire[1:0] DEBUG_select_S4BEG0;
wire[1:0] DEBUG_select_S4BEG1;
wire[1:0] DEBUG_select_S4BEG2;
wire[1:0] DEBUG_select_S4BEG3;
wire[1:0] DEBUG_select_S4BEG4;
wire[1:0] DEBUG_select_S4BEG5;
wire[1:0] DEBUG_select_S4BEG6;
wire[1:0] DEBUG_select_S4BEG7;
wire[1:0] DEBUG_select_S4BEG8;
wire[1:0] DEBUG_select_S4BEG9;
wire[1:0] DEBUG_select_S4BEG10;
wire[1:0] DEBUG_select_S4BEG11;
wire[1:0] DEBUG_select_S4BEG12;
wire[1:0] DEBUG_select_S4BEG13;
wire[1:0] DEBUG_select_S4BEG14;
wire[1:0] DEBUG_select_S4BEG15;
wire[1:0] DEBUG_select_SS4BEG0;
wire[1:0] DEBUG_select_SS4BEG1;
wire[1:0] DEBUG_select_SS4BEG2;
wire[1:0] DEBUG_select_SS4BEG3;
wire[1:0] DEBUG_select_SS4BEG4;
wire[1:0] DEBUG_select_SS4BEG5;
wire[1:0] DEBUG_select_SS4BEG6;
wire[1:0] DEBUG_select_SS4BEG7;
wire[1:0] DEBUG_select_SS4BEG8;
wire[1:0] DEBUG_select_SS4BEG9;
wire[1:0] DEBUG_select_SS4BEG10;
wire[1:0] DEBUG_select_SS4BEG11;
wire[1:0] DEBUG_select_SS4BEG12;
wire[1:0] DEBUG_select_SS4BEG13;
wire[1:0] DEBUG_select_SS4BEG14;
wire[1:0] DEBUG_select_SS4BEG15;
wire[3:0] DEBUG_select_A_I;
wire[2:0] DEBUG_select_A_T;
wire[3:0] DEBUG_select_B_I;
wire[2:0] DEBUG_select_B_T;
wire[3:0] DEBUG_select_C_I;
wire[2:0] DEBUG_select_C_T;
wire[3:0] DEBUG_select_D_I;
wire[2:0] DEBUG_select_D_T;
 //The configuration bits (if any) are just a long shift register
 //This shift register is padded to an even number of flops/latches
 //switch matrix multiplexer S1BEG0 MUX-4
assign S1BEG0_input = {C_O,A_O,N1END3,N1END2};
cus_mux41_buf inst_cus_mux41_buf_S1BEG0 (
    .A0(S1BEG0_input[0]),
    .A1(S1BEG0_input[1]),
    .A2(S1BEG0_input[2]),
    .A3(S1BEG0_input[3]),
    .S0(ConfigBits[0+0]),
    .S0N(ConfigBits_N[0+0]),
    .S1(ConfigBits[0+1]),
    .S1N(ConfigBits_N[0+1]),
    .X(S1BEG0)
);

 //switch matrix multiplexer S1BEG1 MUX-4
assign S1BEG1_input = {C_Q,A_Q,N1END2,N1END1};
cus_mux41_buf inst_cus_mux41_buf_S1BEG1 (
    .A0(S1BEG1_input[0]),
    .A1(S1BEG1_input[1]),
    .A2(S1BEG1_input[2]),
    .A3(S1BEG1_input[3]),
    .S0(ConfigBits[2+0]),
    .S0N(ConfigBits_N[2+0]),
    .S1(ConfigBits[2+1]),
    .S1N(ConfigBits_N[2+1]),
    .X(S1BEG1)
);

 //switch matrix multiplexer S1BEG2 MUX-4
assign S1BEG2_input = {D_O,B_O,N1END1,N1END0};
cus_mux41_buf inst_cus_mux41_buf_S1BEG2 (
    .A0(S1BEG2_input[0]),
    .A1(S1BEG2_input[1]),
    .A2(S1BEG2_input[2]),
    .A3(S1BEG2_input[3]),
    .S0(ConfigBits[4+0]),
    .S0N(ConfigBits_N[4+0]),
    .S1(ConfigBits[4+1]),
    .S1N(ConfigBits_N[4+1]),
    .X(S1BEG2)
);

 //switch matrix multiplexer S1BEG3 MUX-4
assign S1BEG3_input = {D_Q,B_Q,N1END3,N1END0};
cus_mux41_buf inst_cus_mux41_buf_S1BEG3 (
    .A0(S1BEG3_input[0]),
    .A1(S1BEG3_input[1]),
    .A2(S1BEG3_input[2]),
    .A3(S1BEG3_input[3]),
    .S0(ConfigBits[6+0]),
    .S0N(ConfigBits_N[6+0]),
    .S1(ConfigBits[6+1]),
    .S1N(ConfigBits_N[6+1]),
    .X(S1BEG3)
);

 //switch matrix multiplexer S2BEG0 MUX-4
assign S2BEG0_input = {NN4END15,NN4END7,N4END7,N2MID7};
cus_mux41_buf inst_cus_mux41_buf_S2BEG0 (
    .A0(S2BEG0_input[0]),
    .A1(S2BEG0_input[1]),
    .A2(S2BEG0_input[2]),
    .A3(S2BEG0_input[3]),
    .S0(ConfigBits[8+0]),
    .S0N(ConfigBits_N[8+0]),
    .S1(ConfigBits[8+1]),
    .S1N(ConfigBits_N[8+1]),
    .X(S2BEG0)
);

 //switch matrix multiplexer S2BEG1 MUX-4
assign S2BEG1_input = {NN4END14,NN4END6,N4END6,N2MID6};
cus_mux41_buf inst_cus_mux41_buf_S2BEG1 (
    .A0(S2BEG1_input[0]),
    .A1(S2BEG1_input[1]),
    .A2(S2BEG1_input[2]),
    .A3(S2BEG1_input[3]),
    .S0(ConfigBits[10+0]),
    .S0N(ConfigBits_N[10+0]),
    .S1(ConfigBits[10+1]),
    .S1N(ConfigBits_N[10+1]),
    .X(S2BEG1)
);

 //switch matrix multiplexer S2BEG2 MUX-4
assign S2BEG2_input = {NN4END13,NN4END5,N4END5,N2MID5};
cus_mux41_buf inst_cus_mux41_buf_S2BEG2 (
    .A0(S2BEG2_input[0]),
    .A1(S2BEG2_input[1]),
    .A2(S2BEG2_input[2]),
    .A3(S2BEG2_input[3]),
    .S0(ConfigBits[12+0]),
    .S0N(ConfigBits_N[12+0]),
    .S1(ConfigBits[12+1]),
    .S1N(ConfigBits_N[12+1]),
    .X(S2BEG2)
);

 //switch matrix multiplexer S2BEG3 MUX-4
assign S2BEG3_input = {NN4END12,NN4END4,N4END4,N2MID4};
cus_mux41_buf inst_cus_mux41_buf_S2BEG3 (
    .A0(S2BEG3_input[0]),
    .A1(S2BEG3_input[1]),
    .A2(S2BEG3_input[2]),
    .A3(S2BEG3_input[3]),
    .S0(ConfigBits[14+0]),
    .S0N(ConfigBits_N[14+0]),
    .S1(ConfigBits[14+1]),
    .S1N(ConfigBits_N[14+1]),
    .X(S2BEG3)
);

 //switch matrix multiplexer S2BEG4 MUX-4
assign S2BEG4_input = {NN4END11,NN4END3,N4END3,N2MID3};
cus_mux41_buf inst_cus_mux41_buf_S2BEG4 (
    .A0(S2BEG4_input[0]),
    .A1(S2BEG4_input[1]),
    .A2(S2BEG4_input[2]),
    .A3(S2BEG4_input[3]),
    .S0(ConfigBits[16+0]),
    .S0N(ConfigBits_N[16+0]),
    .S1(ConfigBits[16+1]),
    .S1N(ConfigBits_N[16+1]),
    .X(S2BEG4)
);

 //switch matrix multiplexer S2BEG5 MUX-4
assign S2BEG5_input = {NN4END10,NN4END2,N4END2,N2MID2};
cus_mux41_buf inst_cus_mux41_buf_S2BEG5 (
    .A0(S2BEG5_input[0]),
    .A1(S2BEG5_input[1]),
    .A2(S2BEG5_input[2]),
    .A3(S2BEG5_input[3]),
    .S0(ConfigBits[18+0]),
    .S0N(ConfigBits_N[18+0]),
    .S1(ConfigBits[18+1]),
    .S1N(ConfigBits_N[18+1]),
    .X(S2BEG5)
);

 //switch matrix multiplexer S2BEG6 MUX-4
assign S2BEG6_input = {NN4END9,NN4END1,N4END1,N2MID1};
cus_mux41_buf inst_cus_mux41_buf_S2BEG6 (
    .A0(S2BEG6_input[0]),
    .A1(S2BEG6_input[1]),
    .A2(S2BEG6_input[2]),
    .A3(S2BEG6_input[3]),
    .S0(ConfigBits[20+0]),
    .S0N(ConfigBits_N[20+0]),
    .S1(ConfigBits[20+1]),
    .S1N(ConfigBits_N[20+1]),
    .X(S2BEG6)
);

 //switch matrix multiplexer S2BEG7 MUX-4
assign S2BEG7_input = {NN4END8,NN4END0,N4END0,N2MID0};
cus_mux41_buf inst_cus_mux41_buf_S2BEG7 (
    .A0(S2BEG7_input[0]),
    .A1(S2BEG7_input[1]),
    .A2(S2BEG7_input[2]),
    .A3(S2BEG7_input[3]),
    .S0(ConfigBits[22+0]),
    .S0N(ConfigBits_N[22+0]),
    .S1(ConfigBits[22+1]),
    .S1N(ConfigBits_N[22+1]),
    .X(S2BEG7)
);

 //switch matrix multiplexer S2BEGb0 MUX-4
assign S2BEGb0_input = {NN4END15,NN4END7,N4END7,N2END7};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb0 (
    .A0(S2BEGb0_input[0]),
    .A1(S2BEGb0_input[1]),
    .A2(S2BEGb0_input[2]),
    .A3(S2BEGb0_input[3]),
    .S0(ConfigBits[24+0]),
    .S0N(ConfigBits_N[24+0]),
    .S1(ConfigBits[24+1]),
    .S1N(ConfigBits_N[24+1]),
    .X(S2BEGb0)
);

 //switch matrix multiplexer S2BEGb1 MUX-4
assign S2BEGb1_input = {NN4END14,NN4END6,N4END6,N2END6};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb1 (
    .A0(S2BEGb1_input[0]),
    .A1(S2BEGb1_input[1]),
    .A2(S2BEGb1_input[2]),
    .A3(S2BEGb1_input[3]),
    .S0(ConfigBits[26+0]),
    .S0N(ConfigBits_N[26+0]),
    .S1(ConfigBits[26+1]),
    .S1N(ConfigBits_N[26+1]),
    .X(S2BEGb1)
);

 //switch matrix multiplexer S2BEGb2 MUX-4
assign S2BEGb2_input = {NN4END13,NN4END5,N4END5,N2END5};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb2 (
    .A0(S2BEGb2_input[0]),
    .A1(S2BEGb2_input[1]),
    .A2(S2BEGb2_input[2]),
    .A3(S2BEGb2_input[3]),
    .S0(ConfigBits[28+0]),
    .S0N(ConfigBits_N[28+0]),
    .S1(ConfigBits[28+1]),
    .S1N(ConfigBits_N[28+1]),
    .X(S2BEGb2)
);

 //switch matrix multiplexer S2BEGb3 MUX-4
assign S2BEGb3_input = {NN4END12,NN4END4,N4END4,N2END4};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb3 (
    .A0(S2BEGb3_input[0]),
    .A1(S2BEGb3_input[1]),
    .A2(S2BEGb3_input[2]),
    .A3(S2BEGb3_input[3]),
    .S0(ConfigBits[30+0]),
    .S0N(ConfigBits_N[30+0]),
    .S1(ConfigBits[30+1]),
    .S1N(ConfigBits_N[30+1]),
    .X(S2BEGb3)
);

 //switch matrix multiplexer S2BEGb4 MUX-4
assign S2BEGb4_input = {NN4END11,NN4END3,N4END3,N2END3};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb4 (
    .A0(S2BEGb4_input[0]),
    .A1(S2BEGb4_input[1]),
    .A2(S2BEGb4_input[2]),
    .A3(S2BEGb4_input[3]),
    .S0(ConfigBits[32+0]),
    .S0N(ConfigBits_N[32+0]),
    .S1(ConfigBits[32+1]),
    .S1N(ConfigBits_N[32+1]),
    .X(S2BEGb4)
);

 //switch matrix multiplexer S2BEGb5 MUX-4
assign S2BEGb5_input = {NN4END10,NN4END2,N4END2,N2END2};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb5 (
    .A0(S2BEGb5_input[0]),
    .A1(S2BEGb5_input[1]),
    .A2(S2BEGb5_input[2]),
    .A3(S2BEGb5_input[3]),
    .S0(ConfigBits[34+0]),
    .S0N(ConfigBits_N[34+0]),
    .S1(ConfigBits[34+1]),
    .S1N(ConfigBits_N[34+1]),
    .X(S2BEGb5)
);

 //switch matrix multiplexer S2BEGb6 MUX-4
assign S2BEGb6_input = {NN4END9,NN4END1,N4END1,N2END1};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb6 (
    .A0(S2BEGb6_input[0]),
    .A1(S2BEGb6_input[1]),
    .A2(S2BEGb6_input[2]),
    .A3(S2BEGb6_input[3]),
    .S0(ConfigBits[36+0]),
    .S0N(ConfigBits_N[36+0]),
    .S1(ConfigBits[36+1]),
    .S1N(ConfigBits_N[36+1]),
    .X(S2BEGb6)
);

 //switch matrix multiplexer S2BEGb7 MUX-4
assign S2BEGb7_input = {NN4END8,NN4END0,N4END0,N2END0};
cus_mux41_buf inst_cus_mux41_buf_S2BEGb7 (
    .A0(S2BEGb7_input[0]),
    .A1(S2BEGb7_input[1]),
    .A2(S2BEGb7_input[2]),
    .A3(S2BEGb7_input[3]),
    .S0(ConfigBits[38+0]),
    .S0N(ConfigBits_N[38+0]),
    .S1(ConfigBits[38+1]),
    .S1N(ConfigBits_N[38+1]),
    .X(S2BEGb7)
);

 //switch matrix multiplexer S4BEG0 MUX-4
assign S4BEG0_input = {C_O,A_O,NN4END15,N4END15};
cus_mux41_buf inst_cus_mux41_buf_S4BEG0 (
    .A0(S4BEG0_input[0]),
    .A1(S4BEG0_input[1]),
    .A2(S4BEG0_input[2]),
    .A3(S4BEG0_input[3]),
    .S0(ConfigBits[40+0]),
    .S0N(ConfigBits_N[40+0]),
    .S1(ConfigBits[40+1]),
    .S1N(ConfigBits_N[40+1]),
    .X(S4BEG0)
);

 //switch matrix multiplexer S4BEG1 MUX-4
assign S4BEG1_input = {D_O,B_O,NN4END14,N4END14};
cus_mux41_buf inst_cus_mux41_buf_S4BEG1 (
    .A0(S4BEG1_input[0]),
    .A1(S4BEG1_input[1]),
    .A2(S4BEG1_input[2]),
    .A3(S4BEG1_input[3]),
    .S0(ConfigBits[42+0]),
    .S0N(ConfigBits_N[42+0]),
    .S1(ConfigBits[42+1]),
    .S1N(ConfigBits_N[42+1]),
    .X(S4BEG1)
);

 //switch matrix multiplexer S4BEG2 MUX-4
assign S4BEG2_input = {C_O,A_O,NN4END11,N4END11};
cus_mux41_buf inst_cus_mux41_buf_S4BEG2 (
    .A0(S4BEG2_input[0]),
    .A1(S4BEG2_input[1]),
    .A2(S4BEG2_input[2]),
    .A3(S4BEG2_input[3]),
    .S0(ConfigBits[44+0]),
    .S0N(ConfigBits_N[44+0]),
    .S1(ConfigBits[44+1]),
    .S1N(ConfigBits_N[44+1]),
    .X(S4BEG2)
);

 //switch matrix multiplexer S4BEG3 MUX-4
assign S4BEG3_input = {D_O,B_O,NN4END10,N4END10};
cus_mux41_buf inst_cus_mux41_buf_S4BEG3 (
    .A0(S4BEG3_input[0]),
    .A1(S4BEG3_input[1]),
    .A2(S4BEG3_input[2]),
    .A3(S4BEG3_input[3]),
    .S0(ConfigBits[46+0]),
    .S0N(ConfigBits_N[46+0]),
    .S1(ConfigBits[46+1]),
    .S1N(ConfigBits_N[46+1]),
    .X(S4BEG3)
);

 //switch matrix multiplexer S4BEG4 MUX-4
assign S4BEG4_input = {C_O,A_O,NN4END7,N4END7};
cus_mux41_buf inst_cus_mux41_buf_S4BEG4 (
    .A0(S4BEG4_input[0]),
    .A1(S4BEG4_input[1]),
    .A2(S4BEG4_input[2]),
    .A3(S4BEG4_input[3]),
    .S0(ConfigBits[48+0]),
    .S0N(ConfigBits_N[48+0]),
    .S1(ConfigBits[48+1]),
    .S1N(ConfigBits_N[48+1]),
    .X(S4BEG4)
);

 //switch matrix multiplexer S4BEG5 MUX-4
assign S4BEG5_input = {D_O,B_O,NN4END6,N4END6};
cus_mux41_buf inst_cus_mux41_buf_S4BEG5 (
    .A0(S4BEG5_input[0]),
    .A1(S4BEG5_input[1]),
    .A2(S4BEG5_input[2]),
    .A3(S4BEG5_input[3]),
    .S0(ConfigBits[50+0]),
    .S0N(ConfigBits_N[50+0]),
    .S1(ConfigBits[50+1]),
    .S1N(ConfigBits_N[50+1]),
    .X(S4BEG5)
);

 //switch matrix multiplexer S4BEG6 MUX-4
assign S4BEG6_input = {C_O,A_O,NN4END3,N4END3};
cus_mux41_buf inst_cus_mux41_buf_S4BEG6 (
    .A0(S4BEG6_input[0]),
    .A1(S4BEG6_input[1]),
    .A2(S4BEG6_input[2]),
    .A3(S4BEG6_input[3]),
    .S0(ConfigBits[52+0]),
    .S0N(ConfigBits_N[52+0]),
    .S1(ConfigBits[52+1]),
    .S1N(ConfigBits_N[52+1]),
    .X(S4BEG6)
);

 //switch matrix multiplexer S4BEG7 MUX-4
assign S4BEG7_input = {D_O,B_O,NN4END2,N4END2};
cus_mux41_buf inst_cus_mux41_buf_S4BEG7 (
    .A0(S4BEG7_input[0]),
    .A1(S4BEG7_input[1]),
    .A2(S4BEG7_input[2]),
    .A3(S4BEG7_input[3]),
    .S0(ConfigBits[54+0]),
    .S0N(ConfigBits_N[54+0]),
    .S1(ConfigBits[54+1]),
    .S1N(ConfigBits_N[54+1]),
    .X(S4BEG7)
);

 //switch matrix multiplexer S4BEG8 MUX-4
assign S4BEG8_input = {C_Q,A_Q,NN4END13,N4END13};
cus_mux41_buf inst_cus_mux41_buf_S4BEG8 (
    .A0(S4BEG8_input[0]),
    .A1(S4BEG8_input[1]),
    .A2(S4BEG8_input[2]),
    .A3(S4BEG8_input[3]),
    .S0(ConfigBits[56+0]),
    .S0N(ConfigBits_N[56+0]),
    .S1(ConfigBits[56+1]),
    .S1N(ConfigBits_N[56+1]),
    .X(S4BEG8)
);

 //switch matrix multiplexer S4BEG9 MUX-4
assign S4BEG9_input = {D_Q,B_Q,NN4END12,N4END12};
cus_mux41_buf inst_cus_mux41_buf_S4BEG9 (
    .A0(S4BEG9_input[0]),
    .A1(S4BEG9_input[1]),
    .A2(S4BEG9_input[2]),
    .A3(S4BEG9_input[3]),
    .S0(ConfigBits[58+0]),
    .S0N(ConfigBits_N[58+0]),
    .S1(ConfigBits[58+1]),
    .S1N(ConfigBits_N[58+1]),
    .X(S4BEG9)
);

 //switch matrix multiplexer S4BEG10 MUX-4
assign S4BEG10_input = {C_Q,A_Q,NN4END9,N4END9};
cus_mux41_buf inst_cus_mux41_buf_S4BEG10 (
    .A0(S4BEG10_input[0]),
    .A1(S4BEG10_input[1]),
    .A2(S4BEG10_input[2]),
    .A3(S4BEG10_input[3]),
    .S0(ConfigBits[60+0]),
    .S0N(ConfigBits_N[60+0]),
    .S1(ConfigBits[60+1]),
    .S1N(ConfigBits_N[60+1]),
    .X(S4BEG10)
);

 //switch matrix multiplexer S4BEG11 MUX-4
assign S4BEG11_input = {D_Q,B_Q,NN4END8,N4END8};
cus_mux41_buf inst_cus_mux41_buf_S4BEG11 (
    .A0(S4BEG11_input[0]),
    .A1(S4BEG11_input[1]),
    .A2(S4BEG11_input[2]),
    .A3(S4BEG11_input[3]),
    .S0(ConfigBits[62+0]),
    .S0N(ConfigBits_N[62+0]),
    .S1(ConfigBits[62+1]),
    .S1N(ConfigBits_N[62+1]),
    .X(S4BEG11)
);

 //switch matrix multiplexer S4BEG12 MUX-4
assign S4BEG12_input = {C_Q,A_Q,NN4END5,N4END5};
cus_mux41_buf inst_cus_mux41_buf_S4BEG12 (
    .A0(S4BEG12_input[0]),
    .A1(S4BEG12_input[1]),
    .A2(S4BEG12_input[2]),
    .A3(S4BEG12_input[3]),
    .S0(ConfigBits[64+0]),
    .S0N(ConfigBits_N[64+0]),
    .S1(ConfigBits[64+1]),
    .S1N(ConfigBits_N[64+1]),
    .X(S4BEG12)
);

 //switch matrix multiplexer S4BEG13 MUX-4
assign S4BEG13_input = {D_Q,B_Q,NN4END4,N4END4};
cus_mux41_buf inst_cus_mux41_buf_S4BEG13 (
    .A0(S4BEG13_input[0]),
    .A1(S4BEG13_input[1]),
    .A2(S4BEG13_input[2]),
    .A3(S4BEG13_input[3]),
    .S0(ConfigBits[66+0]),
    .S0N(ConfigBits_N[66+0]),
    .S1(ConfigBits[66+1]),
    .S1N(ConfigBits_N[66+1]),
    .X(S4BEG13)
);

 //switch matrix multiplexer S4BEG14 MUX-4
assign S4BEG14_input = {C_Q,A_Q,NN4END1,N4END1};
cus_mux41_buf inst_cus_mux41_buf_S4BEG14 (
    .A0(S4BEG14_input[0]),
    .A1(S4BEG14_input[1]),
    .A2(S4BEG14_input[2]),
    .A3(S4BEG14_input[3]),
    .S0(ConfigBits[68+0]),
    .S0N(ConfigBits_N[68+0]),
    .S1(ConfigBits[68+1]),
    .S1N(ConfigBits_N[68+1]),
    .X(S4BEG14)
);

 //switch matrix multiplexer S4BEG15 MUX-4
assign S4BEG15_input = {D_Q,B_Q,NN4END0,N4END0};
cus_mux41_buf inst_cus_mux41_buf_S4BEG15 (
    .A0(S4BEG15_input[0]),
    .A1(S4BEG15_input[1]),
    .A2(S4BEG15_input[2]),
    .A3(S4BEG15_input[3]),
    .S0(ConfigBits[70+0]),
    .S0N(ConfigBits_N[70+0]),
    .S1(ConfigBits[70+1]),
    .S1N(ConfigBits_N[70+1]),
    .X(S4BEG15)
);

 //switch matrix multiplexer SS4BEG0 MUX-4
assign SS4BEG0_input = {A_O,N4END4,N4END2,N4END0};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG0 (
    .A0(SS4BEG0_input[0]),
    .A1(SS4BEG0_input[1]),
    .A2(SS4BEG0_input[2]),
    .A3(SS4BEG0_input[3]),
    .S0(ConfigBits[72+0]),
    .S0N(ConfigBits_N[72+0]),
    .S1(ConfigBits[72+1]),
    .S1N(ConfigBits_N[72+1]),
    .X(SS4BEG0)
);

 //switch matrix multiplexer SS4BEG1 MUX-4
assign SS4BEG1_input = {B_O,N4END10,N4END8,N4END6};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG1 (
    .A0(SS4BEG1_input[0]),
    .A1(SS4BEG1_input[1]),
    .A2(SS4BEG1_input[2]),
    .A3(SS4BEG1_input[3]),
    .S0(ConfigBits[74+0]),
    .S0N(ConfigBits_N[74+0]),
    .S1(ConfigBits[74+1]),
    .S1N(ConfigBits_N[74+1]),
    .X(SS4BEG1)
);

 //switch matrix multiplexer SS4BEG2 MUX-4
assign SS4BEG2_input = {A_Q,N4END1,N2END7,N2END6};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG2 (
    .A0(SS4BEG2_input[0]),
    .A1(SS4BEG2_input[1]),
    .A2(SS4BEG2_input[2]),
    .A3(SS4BEG2_input[3]),
    .S0(ConfigBits[76+0]),
    .S0N(ConfigBits_N[76+0]),
    .S1(ConfigBits[76+1]),
    .S1N(ConfigBits_N[76+1]),
    .X(SS4BEG2)
);

 //switch matrix multiplexer SS4BEG3 MUX-4
assign SS4BEG3_input = {B_Q,N4END11,N4END9,N4END7};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG3 (
    .A0(SS4BEG3_input[0]),
    .A1(SS4BEG3_input[1]),
    .A2(SS4BEG3_input[2]),
    .A3(SS4BEG3_input[3]),
    .S0(ConfigBits[78+0]),
    .S0N(ConfigBits_N[78+0]),
    .S1(ConfigBits[78+1]),
    .S1N(ConfigBits_N[78+1]),
    .X(SS4BEG3)
);

 //switch matrix multiplexer SS4BEG4 MUX-4
assign SS4BEG4_input = {C_Q,N2END4,N2END2,N2END0};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG4 (
    .A0(SS4BEG4_input[0]),
    .A1(SS4BEG4_input[1]),
    .A2(SS4BEG4_input[2]),
    .A3(SS4BEG4_input[3]),
    .S0(ConfigBits[80+0]),
    .S0N(ConfigBits_N[80+0]),
    .S1(ConfigBits[80+1]),
    .S1N(ConfigBits_N[80+1]),
    .X(SS4BEG4)
);

 //switch matrix multiplexer SS4BEG5 MUX-4
assign SS4BEG5_input = {D_Q,N2END5,N2END3,N2END1};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG5 (
    .A0(SS4BEG5_input[0]),
    .A1(SS4BEG5_input[1]),
    .A2(SS4BEG5_input[2]),
    .A3(SS4BEG5_input[3]),
    .S0(ConfigBits[82+0]),
    .S0N(ConfigBits_N[82+0]),
    .S1(ConfigBits[82+1]),
    .S1N(ConfigBits_N[82+1]),
    .X(SS4BEG5)
);

 //switch matrix multiplexer SS4BEG6 MUX-4
assign SS4BEG6_input = {C_O,N2MID6,N2MID4,N2MID2};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG6 (
    .A0(SS4BEG6_input[0]),
    .A1(SS4BEG6_input[1]),
    .A2(SS4BEG6_input[2]),
    .A3(SS4BEG6_input[3]),
    .S0(ConfigBits[84+0]),
    .S0N(ConfigBits_N[84+0]),
    .S1(ConfigBits[84+1]),
    .S1N(ConfigBits_N[84+1]),
    .X(SS4BEG6)
);

 //switch matrix multiplexer SS4BEG7 MUX-4
assign SS4BEG7_input = {D_O,N2MID7,N2MID5,N2MID3};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG7 (
    .A0(SS4BEG7_input[0]),
    .A1(SS4BEG7_input[1]),
    .A2(SS4BEG7_input[2]),
    .A3(SS4BEG7_input[3]),
    .S0(ConfigBits[86+0]),
    .S0N(ConfigBits_N[86+0]),
    .S1(ConfigBits[86+1]),
    .S1N(ConfigBits_N[86+1]),
    .X(SS4BEG7)
);

 //switch matrix multiplexer SS4BEG8 MUX-4
assign SS4BEG8_input = {C_Q,N4END10,N4END8,N4END6};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG8 (
    .A0(SS4BEG8_input[0]),
    .A1(SS4BEG8_input[1]),
    .A2(SS4BEG8_input[2]),
    .A3(SS4BEG8_input[3]),
    .S0(ConfigBits[88+0]),
    .S0N(ConfigBits_N[88+0]),
    .S1(ConfigBits[88+1]),
    .S1N(ConfigBits_N[88+1]),
    .X(SS4BEG8)
);

 //switch matrix multiplexer SS4BEG9 MUX-4
assign SS4BEG9_input = {D_Q,N4END7,N4END5,N4END3};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG9 (
    .A0(SS4BEG9_input[0]),
    .A1(SS4BEG9_input[1]),
    .A2(SS4BEG9_input[2]),
    .A3(SS4BEG9_input[3]),
    .S0(ConfigBits[90+0]),
    .S0N(ConfigBits_N[90+0]),
    .S1(ConfigBits[90+1]),
    .S1N(ConfigBits_N[90+1]),
    .X(SS4BEG9)
);

 //switch matrix multiplexer SS4BEG10 MUX-4
assign SS4BEG10_input = {A_O,N4END4,N4END2,N4END0};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG10 (
    .A0(SS4BEG10_input[0]),
    .A1(SS4BEG10_input[1]),
    .A2(SS4BEG10_input[2]),
    .A3(SS4BEG10_input[3]),
    .S0(ConfigBits[92+0]),
    .S0N(ConfigBits_N[92+0]),
    .S1(ConfigBits[92+1]),
    .S1N(ConfigBits_N[92+1]),
    .X(SS4BEG10)
);

 //switch matrix multiplexer SS4BEG11 MUX-4
assign SS4BEG11_input = {B_O,N4END10,N4END8,N4END6};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG11 (
    .A0(SS4BEG11_input[0]),
    .A1(SS4BEG11_input[1]),
    .A2(SS4BEG11_input[2]),
    .A3(SS4BEG11_input[3]),
    .S0(ConfigBits[94+0]),
    .S0N(ConfigBits_N[94+0]),
    .S1(ConfigBits[94+1]),
    .S1N(ConfigBits_N[94+1]),
    .X(SS4BEG11)
);

 //switch matrix multiplexer SS4BEG12 MUX-4
assign SS4BEG12_input = {A_Q,N4END5,N4END3,N4END1};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG12 (
    .A0(SS4BEG12_input[0]),
    .A1(SS4BEG12_input[1]),
    .A2(SS4BEG12_input[2]),
    .A3(SS4BEG12_input[3]),
    .S0(ConfigBits[96+0]),
    .S0N(ConfigBits_N[96+0]),
    .S1(ConfigBits[96+1]),
    .S1N(ConfigBits_N[96+1]),
    .X(SS4BEG12)
);

 //switch matrix multiplexer SS4BEG13 MUX-4
assign SS4BEG13_input = {B_Q,N4END11,N4END9,N4END7};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG13 (
    .A0(SS4BEG13_input[0]),
    .A1(SS4BEG13_input[1]),
    .A2(SS4BEG13_input[2]),
    .A3(SS4BEG13_input[3]),
    .S0(ConfigBits[98+0]),
    .S0N(ConfigBits_N[98+0]),
    .S1(ConfigBits[98+1]),
    .S1N(ConfigBits_N[98+1]),
    .X(SS4BEG13)
);

 //switch matrix multiplexer SS4BEG14 MUX-4
assign SS4BEG14_input = {C_O,N2MID4,N2MID2,N2MID0};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG14 (
    .A0(SS4BEG14_input[0]),
    .A1(SS4BEG14_input[1]),
    .A2(SS4BEG14_input[2]),
    .A3(SS4BEG14_input[3]),
    .S0(ConfigBits[100+0]),
    .S0N(ConfigBits_N[100+0]),
    .S1(ConfigBits[100+1]),
    .S1N(ConfigBits_N[100+1]),
    .X(SS4BEG14)
);

 //switch matrix multiplexer SS4BEG15 MUX-4
assign SS4BEG15_input = {D_O,N2MID5,N2MID3,N2MID1};
cus_mux41_buf inst_cus_mux41_buf_SS4BEG15 (
    .A0(SS4BEG15_input[0]),
    .A1(SS4BEG15_input[1]),
    .A2(SS4BEG15_input[2]),
    .A3(SS4BEG15_input[3]),
    .S0(ConfigBits[102+0]),
    .S0N(ConfigBits_N[102+0]),
    .S1(ConfigBits[102+1]),
    .S1N(ConfigBits_N[102+1]),
    .X(SS4BEG15)
);

 //switch matrix multiplexer A_I MUX-16
assign A_I_input = {N2END7,N2END6,N2END5,N2END4,N2END3,N2END2,N2END1,N2END0,N2MID7,N2MID6,N2MID5,N2MID4,N2MID3,N2MID2,N2MID1,N2MID0};
cus_mux161_buf inst_cus_mux161_buf_A_I (
    .A0(A_I_input[0]),
    .A1(A_I_input[1]),
    .A2(A_I_input[2]),
    .A3(A_I_input[3]),
    .A4(A_I_input[4]),
    .A5(A_I_input[5]),
    .A6(A_I_input[6]),
    .A7(A_I_input[7]),
    .A8(A_I_input[8]),
    .A9(A_I_input[9]),
    .A10(A_I_input[10]),
    .A11(A_I_input[11]),
    .A12(A_I_input[12]),
    .A13(A_I_input[13]),
    .A14(A_I_input[14]),
    .A15(A_I_input[15]),
    .S0(ConfigBits[104+0]),
    .S0N(ConfigBits_N[104+0]),
    .S1(ConfigBits[104+1]),
    .S1N(ConfigBits_N[104+1]),
    .S2(ConfigBits[104+2]),
    .S2N(ConfigBits_N[104+2]),
    .S3(ConfigBits[104+3]),
    .S3N(ConfigBits_N[104+3]),
    .X(A_I)
);

 //switch matrix multiplexer A_T MUX-8
assign A_T_input = {VCC0,GND0,N2END4,N2END3,N2END2,N2END1,N2END0,N2MID7};
cus_mux81_buf inst_cus_mux81_buf_A_T (
    .A0(A_T_input[0]),
    .A1(A_T_input[1]),
    .A2(A_T_input[2]),
    .A3(A_T_input[3]),
    .A4(A_T_input[4]),
    .A5(A_T_input[5]),
    .A6(A_T_input[6]),
    .A7(A_T_input[7]),
    .S0(ConfigBits[108+0]),
    .S0N(ConfigBits_N[108+0]),
    .S1(ConfigBits[108+1]),
    .S1N(ConfigBits_N[108+1]),
    .S2(ConfigBits[108+2]),
    .S2N(ConfigBits_N[108+2]),
    .X(A_T)
);

 //switch matrix multiplexer B_I MUX-16
assign B_I_input = {N2END7,N2END6,N2END5,N2END4,N2END3,N2END2,N2END1,N2END0,N2MID7,N2MID6,N2MID5,N2MID4,N2MID3,N2MID2,N2MID1,N2MID0};
cus_mux161_buf inst_cus_mux161_buf_B_I (
    .A0(B_I_input[0]),
    .A1(B_I_input[1]),
    .A2(B_I_input[2]),
    .A3(B_I_input[3]),
    .A4(B_I_input[4]),
    .A5(B_I_input[5]),
    .A6(B_I_input[6]),
    .A7(B_I_input[7]),
    .A8(B_I_input[8]),
    .A9(B_I_input[9]),
    .A10(B_I_input[10]),
    .A11(B_I_input[11]),
    .A12(B_I_input[12]),
    .A13(B_I_input[13]),
    .A14(B_I_input[14]),
    .A15(B_I_input[15]),
    .S0(ConfigBits[111+0]),
    .S0N(ConfigBits_N[111+0]),
    .S1(ConfigBits[111+1]),
    .S1N(ConfigBits_N[111+1]),
    .S2(ConfigBits[111+2]),
    .S2N(ConfigBits_N[111+2]),
    .S3(ConfigBits[111+3]),
    .S3N(ConfigBits_N[111+3]),
    .X(B_I)
);

 //switch matrix multiplexer B_T MUX-8
assign B_T_input = {VCC0,GND0,N2END6,N2END5,N2END4,N2END0,N2MID7,N2MID6};
cus_mux81_buf inst_cus_mux81_buf_B_T (
    .A0(B_T_input[0]),
    .A1(B_T_input[1]),
    .A2(B_T_input[2]),
    .A3(B_T_input[3]),
    .A4(B_T_input[4]),
    .A5(B_T_input[5]),
    .A6(B_T_input[6]),
    .A7(B_T_input[7]),
    .S0(ConfigBits[115+0]),
    .S0N(ConfigBits_N[115+0]),
    .S1(ConfigBits[115+1]),
    .S1N(ConfigBits_N[115+1]),
    .S2(ConfigBits[115+2]),
    .S2N(ConfigBits_N[115+2]),
    .X(B_T)
);

 //switch matrix multiplexer C_I MUX-16
assign C_I_input = {N2END7,N2END6,N2END5,N2END4,N2END3,N2END2,N2END1,N2END0,N2MID7,N2MID6,N2MID5,N2MID4,N2MID3,N2MID2,N2MID1,N2MID0};
cus_mux161_buf inst_cus_mux161_buf_C_I (
    .A0(C_I_input[0]),
    .A1(C_I_input[1]),
    .A2(C_I_input[2]),
    .A3(C_I_input[3]),
    .A4(C_I_input[4]),
    .A5(C_I_input[5]),
    .A6(C_I_input[6]),
    .A7(C_I_input[7]),
    .A8(C_I_input[8]),
    .A9(C_I_input[9]),
    .A10(C_I_input[10]),
    .A11(C_I_input[11]),
    .A12(C_I_input[12]),
    .A13(C_I_input[13]),
    .A14(C_I_input[14]),
    .A15(C_I_input[15]),
    .S0(ConfigBits[118+0]),
    .S0N(ConfigBits_N[118+0]),
    .S1(ConfigBits[118+1]),
    .S1N(ConfigBits_N[118+1]),
    .S2(ConfigBits[118+2]),
    .S2N(ConfigBits_N[118+2]),
    .S3(ConfigBits[118+3]),
    .S3N(ConfigBits_N[118+3]),
    .X(C_I)
);

 //switch matrix multiplexer C_T MUX-8
assign C_T_input = {VCC0,GND0,N2END6,N2END5,N2END4,N2END0,N2MID7,N2MID6};
cus_mux81_buf inst_cus_mux81_buf_C_T (
    .A0(C_T_input[0]),
    .A1(C_T_input[1]),
    .A2(C_T_input[2]),
    .A3(C_T_input[3]),
    .A4(C_T_input[4]),
    .A5(C_T_input[5]),
    .A6(C_T_input[6]),
    .A7(C_T_input[7]),
    .S0(ConfigBits[122+0]),
    .S0N(ConfigBits_N[122+0]),
    .S1(ConfigBits[122+1]),
    .S1N(ConfigBits_N[122+1]),
    .S2(ConfigBits[122+2]),
    .S2N(ConfigBits_N[122+2]),
    .X(C_T)
);

 //switch matrix multiplexer D_I MUX-16
assign D_I_input = {N2END7,N2END6,N2END5,N2END4,N2END3,N2END2,N2END1,N2END0,N2MID7,N2MID6,N2MID5,N2MID4,N2MID3,N2MID2,N2MID1,N2MID0};
cus_mux161_buf inst_cus_mux161_buf_D_I (
    .A0(D_I_input[0]),
    .A1(D_I_input[1]),
    .A2(D_I_input[2]),
    .A3(D_I_input[3]),
    .A4(D_I_input[4]),
    .A5(D_I_input[5]),
    .A6(D_I_input[6]),
    .A7(D_I_input[7]),
    .A8(D_I_input[8]),
    .A9(D_I_input[9]),
    .A10(D_I_input[10]),
    .A11(D_I_input[11]),
    .A12(D_I_input[12]),
    .A13(D_I_input[13]),
    .A14(D_I_input[14]),
    .A15(D_I_input[15]),
    .S0(ConfigBits[125+0]),
    .S0N(ConfigBits_N[125+0]),
    .S1(ConfigBits[125+1]),
    .S1N(ConfigBits_N[125+1]),
    .S2(ConfigBits[125+2]),
    .S2N(ConfigBits_N[125+2]),
    .S3(ConfigBits[125+3]),
    .S3N(ConfigBits_N[125+3]),
    .X(D_I)
);

 //switch matrix multiplexer D_T MUX-8
assign D_T_input = {VCC0,GND0,N2END6,N2END5,N2END4,N2END0,N2MID7,N2MID6};
cus_mux81_buf inst_cus_mux81_buf_D_T (
    .A0(D_T_input[0]),
    .A1(D_T_input[1]),
    .A2(D_T_input[2]),
    .A3(D_T_input[3]),
    .A4(D_T_input[4]),
    .A5(D_T_input[5]),
    .A6(D_T_input[6]),
    .A7(D_T_input[7]),
    .S0(ConfigBits[129+0]),
    .S0N(ConfigBits_N[129+0]),
    .S1(ConfigBits[129+1]),
    .S1N(ConfigBits_N[129+1]),
    .S2(ConfigBits[129+2]),
    .S2N(ConfigBits_N[129+2]),
    .X(D_T)
);


assign DEBUG_select_S1BEG0          = ConfigBits[1:0];
assign DEBUG_select_S1BEG1          = ConfigBits[3:2];
assign DEBUG_select_S1BEG2          = ConfigBits[5:4];
assign DEBUG_select_S1BEG3          = ConfigBits[7:6];
assign DEBUG_select_S2BEG0          = ConfigBits[9:8];
assign DEBUG_select_S2BEG1          = ConfigBits[11:10];
assign DEBUG_select_S2BEG2          = ConfigBits[13:12];
assign DEBUG_select_S2BEG3          = ConfigBits[15:14];
assign DEBUG_select_S2BEG4          = ConfigBits[17:16];
assign DEBUG_select_S2BEG5          = ConfigBits[19:18];
assign DEBUG_select_S2BEG6          = ConfigBits[21:20];
assign DEBUG_select_S2BEG7          = ConfigBits[23:22];
assign DEBUG_select_S2BEGb0         = ConfigBits[25:24];
assign DEBUG_select_S2BEGb1         = ConfigBits[27:26];
assign DEBUG_select_S2BEGb2         = ConfigBits[29:28];
assign DEBUG_select_S2BEGb3         = ConfigBits[31:30];
assign DEBUG_select_S2BEGb4         = ConfigBits[33:32];
assign DEBUG_select_S2BEGb5         = ConfigBits[35:34];
assign DEBUG_select_S2BEGb6         = ConfigBits[37:36];
assign DEBUG_select_S2BEGb7         = ConfigBits[39:38];
assign DEBUG_select_S4BEG0          = ConfigBits[41:40];
assign DEBUG_select_S4BEG1          = ConfigBits[43:42];
assign DEBUG_select_S4BEG2          = ConfigBits[45:44];
assign DEBUG_select_S4BEG3          = ConfigBits[47:46];
assign DEBUG_select_S4BEG4          = ConfigBits[49:48];
assign DEBUG_select_S4BEG5          = ConfigBits[51:50];
assign DEBUG_select_S4BEG6          = ConfigBits[53:52];
assign DEBUG_select_S4BEG7          = ConfigBits[55:54];
assign DEBUG_select_S4BEG8          = ConfigBits[57:56];
assign DEBUG_select_S4BEG9          = ConfigBits[59:58];
assign DEBUG_select_S4BEG10         = ConfigBits[61:60];
assign DEBUG_select_S4BEG11         = ConfigBits[63:62];
assign DEBUG_select_S4BEG12         = ConfigBits[65:64];
assign DEBUG_select_S4BEG13         = ConfigBits[67:66];
assign DEBUG_select_S4BEG14         = ConfigBits[69:68];
assign DEBUG_select_S4BEG15         = ConfigBits[71:70];
assign DEBUG_select_SS4BEG0         = ConfigBits[73:72];
assign DEBUG_select_SS4BEG1         = ConfigBits[75:74];
assign DEBUG_select_SS4BEG2         = ConfigBits[77:76];
assign DEBUG_select_SS4BEG3         = ConfigBits[79:78];
assign DEBUG_select_SS4BEG4         = ConfigBits[81:80];
assign DEBUG_select_SS4BEG5         = ConfigBits[83:82];
assign DEBUG_select_SS4BEG6         = ConfigBits[85:84];
assign DEBUG_select_SS4BEG7         = ConfigBits[87:86];
assign DEBUG_select_SS4BEG8         = ConfigBits[89:88];
assign DEBUG_select_SS4BEG9         = ConfigBits[91:90];
assign DEBUG_select_SS4BEG10        = ConfigBits[93:92];
assign DEBUG_select_SS4BEG11        = ConfigBits[95:94];
assign DEBUG_select_SS4BEG12        = ConfigBits[97:96];
assign DEBUG_select_SS4BEG13        = ConfigBits[99:98];
assign DEBUG_select_SS4BEG14        = ConfigBits[101:100];
assign DEBUG_select_SS4BEG15        = ConfigBits[103:102];
assign DEBUG_select_A_I             = ConfigBits[107:104];
assign DEBUG_select_A_T             = ConfigBits[110:108];
assign DEBUG_select_B_I             = ConfigBits[114:111];
assign DEBUG_select_B_T             = ConfigBits[117:115];
assign DEBUG_select_C_I             = ConfigBits[121:118];
assign DEBUG_select_C_T             = ConfigBits[124:122];
assign DEBUG_select_D_I             = ConfigBits[128:125];
assign DEBUG_select_D_T             = ConfigBits[131:129];
endmodule