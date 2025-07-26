 // NumberOfConfigBits: 298
module E_TT_IF_switch_matrix
    #(
        parameter NoConfigBits=298
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
        input E1END0,
        input E1END1,
        input E1END2,
        input E1END3,
        input E2MID0,
        input E2MID1,
        input E2MID2,
        input E2MID3,
        input E2MID4,
        input E2MID5,
        input E2MID6,
        input E2MID7,
        input E2END0,
        input E2END1,
        input E2END2,
        input E2END3,
        input E2END4,
        input E2END5,
        input E2END6,
        input E2END7,
        input EE4END0,
        input EE4END1,
        input EE4END2,
        input EE4END3,
        input EE4END4,
        input EE4END5,
        input EE4END6,
        input EE4END7,
        input EE4END8,
        input EE4END9,
        input EE4END10,
        input EE4END11,
        input EE4END12,
        input EE4END13,
        input EE4END14,
        input EE4END15,
        input E6END0,
        input E6END1,
        input E6END2,
        input E6END3,
        input E6END4,
        input E6END5,
        input E6END6,
        input E6END7,
        input E6END8,
        input E6END9,
        input E6END10,
        input E6END11,
        input S1END0,
        input S1END1,
        input S1END2,
        input S1END3,
        input S2MID0,
        input S2MID1,
        input S2MID2,
        input S2MID3,
        input S2MID4,
        input S2MID5,
        input S2MID6,
        input S2MID7,
        input S2END0,
        input S2END1,
        input S2END2,
        input S2END3,
        input S2END4,
        input S2END5,
        input S2END6,
        input S2END7,
        input S4END0,
        input S4END1,
        input S4END2,
        input S4END3,
        input UO_OUT0,
        input UO_OUT1,
        input UO_OUT2,
        input UO_OUT3,
        input UO_OUT4,
        input UO_OUT5,
        input UO_OUT6,
        input UO_OUT7,
        input UIO_OUT0,
        input UIO_OUT1,
        input UIO_OUT2,
        input UIO_OUT3,
        input UIO_OUT4,
        input UIO_OUT5,
        input UIO_OUT6,
        input UIO_OUT7,
        input UIO_OE0,
        input UIO_OE1,
        input UIO_OE2,
        input UIO_OE3,
        input UIO_OE4,
        input UIO_OE5,
        input UIO_OE6,
        input UIO_OE7,
        input J_NS4_END0,
        input J_NS4_END1,
        input J_NS4_END2,
        input J_NS4_END3,
        input J_NS4_END4,
        input J_NS4_END5,
        input J_NS4_END6,
        input J_NS4_END7,
        input J_NS4_END8,
        input J_NS4_END9,
        input J_NS4_END10,
        input J_NS4_END11,
        input J_NS4_END12,
        input J_NS4_END13,
        input J_NS4_END14,
        input J_NS4_END15,
        input J_NS2_END0,
        input J_NS2_END1,
        input J_NS2_END2,
        input J_NS2_END3,
        input J_NS2_END4,
        input J_NS2_END5,
        input J_NS2_END6,
        input J_NS2_END7,
        input J_NS1_END0,
        input J_NS1_END1,
        input J_NS1_END2,
        input J_NS1_END3,
        output N1BEG0,
        output N1BEG1,
        output N1BEG2,
        output N1BEG3,
        output N2BEG0,
        output N2BEG1,
        output N2BEG2,
        output N2BEG3,
        output N2BEG4,
        output N2BEG5,
        output N2BEG6,
        output N2BEG7,
        output N2BEGb0,
        output N2BEGb1,
        output N2BEGb2,
        output N2BEGb3,
        output N2BEGb4,
        output N2BEGb5,
        output N2BEGb6,
        output N2BEGb7,
        output N4BEG0,
        output N4BEG1,
        output N4BEG2,
        output N4BEG3,
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
        output W1BEG0,
        output W1BEG1,
        output W1BEG2,
        output W1BEG3,
        output W2BEG0,
        output W2BEG1,
        output W2BEG2,
        output W2BEG3,
        output W2BEG4,
        output W2BEG5,
        output W2BEG6,
        output W2BEG7,
        output W2BEGb0,
        output W2BEGb1,
        output W2BEGb2,
        output W2BEGb3,
        output W2BEGb4,
        output W2BEGb5,
        output W2BEGb6,
        output W2BEGb7,
        output WW4BEG0,
        output WW4BEG1,
        output WW4BEG2,
        output WW4BEG3,
        output WW4BEG4,
        output WW4BEG5,
        output WW4BEG6,
        output WW4BEG7,
        output WW4BEG8,
        output WW4BEG9,
        output WW4BEG10,
        output WW4BEG11,
        output WW4BEG12,
        output WW4BEG13,
        output WW4BEG14,
        output WW4BEG15,
        output W6BEG0,
        output W6BEG1,
        output W6BEG2,
        output W6BEG3,
        output W6BEG4,
        output W6BEG5,
        output W6BEG6,
        output W6BEG7,
        output W6BEG8,
        output W6BEG9,
        output W6BEG10,
        output W6BEG11,
        output UI_IN0,
        output UI_IN1,
        output UI_IN2,
        output UI_IN3,
        output UI_IN4,
        output UI_IN5,
        output UI_IN6,
        output UI_IN7,
        output UIO_IN0,
        output UIO_IN1,
        output UIO_IN2,
        output UIO_IN3,
        output UIO_IN4,
        output UIO_IN5,
        output UIO_IN6,
        output UIO_IN7,
        output ENA,
        output RST_N,
        output J_NS4_BEG0,
        output J_NS4_BEG1,
        output J_NS4_BEG2,
        output J_NS4_BEG3,
        output J_NS4_BEG4,
        output J_NS4_BEG5,
        output J_NS4_BEG6,
        output J_NS4_BEG7,
        output J_NS4_BEG8,
        output J_NS4_BEG9,
        output J_NS4_BEG10,
        output J_NS4_BEG11,
        output J_NS4_BEG12,
        output J_NS4_BEG13,
        output J_NS4_BEG14,
        output J_NS4_BEG15,
        output J_NS2_BEG0,
        output J_NS2_BEG1,
        output J_NS2_BEG2,
        output J_NS2_BEG3,
        output J_NS2_BEG4,
        output J_NS2_BEG5,
        output J_NS2_BEG6,
        output J_NS2_BEG7,
        output J_NS1_BEG0,
        output J_NS1_BEG1,
        output J_NS1_BEG2,
        output J_NS1_BEG3,
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

wire[4-1:0] N1BEG0_input;
wire[4-1:0] N1BEG1_input;
wire[4-1:0] N1BEG2_input;
wire[4-1:0] N1BEG3_input;
wire[4-1:0] N2BEG0_input;
wire[4-1:0] N2BEG1_input;
wire[4-1:0] N2BEG2_input;
wire[4-1:0] N2BEG3_input;
wire[4-1:0] N2BEG4_input;
wire[4-1:0] N2BEG5_input;
wire[4-1:0] N2BEG6_input;
wire[4-1:0] N2BEG7_input;
wire[8-1:0] N4BEG0_input;
wire[8-1:0] N4BEG1_input;
wire[8-1:0] N4BEG2_input;
wire[8-1:0] N4BEG3_input;
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
wire[8-1:0] S4BEG0_input;
wire[8-1:0] S4BEG1_input;
wire[8-1:0] S4BEG2_input;
wire[8-1:0] S4BEG3_input;
wire[8-1:0] W1BEG0_input;
wire[8-1:0] W1BEG1_input;
wire[8-1:0] W1BEG2_input;
wire[8-1:0] W1BEG3_input;
wire[8-1:0] W2BEG0_input;
wire[8-1:0] W2BEG1_input;
wire[8-1:0] W2BEG2_input;
wire[8-1:0] W2BEG3_input;
wire[8-1:0] W2BEG4_input;
wire[8-1:0] W2BEG5_input;
wire[8-1:0] W2BEG6_input;
wire[8-1:0] W2BEG7_input;
wire[8-1:0] W2BEGb0_input;
wire[8-1:0] W2BEGb1_input;
wire[8-1:0] W2BEGb2_input;
wire[8-1:0] W2BEGb3_input;
wire[8-1:0] W2BEGb4_input;
wire[8-1:0] W2BEGb5_input;
wire[8-1:0] W2BEGb6_input;
wire[8-1:0] W2BEGb7_input;
wire[4-1:0] WW4BEG0_input;
wire[4-1:0] WW4BEG1_input;
wire[4-1:0] WW4BEG2_input;
wire[4-1:0] WW4BEG3_input;
wire[4-1:0] WW4BEG4_input;
wire[4-1:0] WW4BEG5_input;
wire[4-1:0] WW4BEG6_input;
wire[4-1:0] WW4BEG7_input;
wire[4-1:0] WW4BEG8_input;
wire[4-1:0] WW4BEG9_input;
wire[4-1:0] WW4BEG10_input;
wire[4-1:0] WW4BEG11_input;
wire[4-1:0] WW4BEG12_input;
wire[4-1:0] WW4BEG13_input;
wire[4-1:0] WW4BEG14_input;
wire[4-1:0] WW4BEG15_input;
wire[4-1:0] W6BEG0_input;
wire[4-1:0] W6BEG1_input;
wire[4-1:0] W6BEG2_input;
wire[4-1:0] W6BEG3_input;
wire[4-1:0] W6BEG4_input;
wire[4-1:0] W6BEG5_input;
wire[4-1:0] W6BEG6_input;
wire[4-1:0] W6BEG7_input;
wire[4-1:0] W6BEG8_input;
wire[4-1:0] W6BEG9_input;
wire[4-1:0] W6BEG10_input;
wire[4-1:0] W6BEG11_input;
wire[8-1:0] UI_IN0_input;
wire[8-1:0] UI_IN1_input;
wire[8-1:0] UI_IN2_input;
wire[8-1:0] UI_IN3_input;
wire[8-1:0] UI_IN4_input;
wire[8-1:0] UI_IN5_input;
wire[8-1:0] UI_IN6_input;
wire[8-1:0] UI_IN7_input;
wire[8-1:0] UIO_IN0_input;
wire[8-1:0] UIO_IN1_input;
wire[8-1:0] UIO_IN2_input;
wire[8-1:0] UIO_IN3_input;
wire[8-1:0] UIO_IN4_input;
wire[8-1:0] UIO_IN5_input;
wire[8-1:0] UIO_IN6_input;
wire[8-1:0] UIO_IN7_input;
wire[4-1:0] ENA_input;
wire[16-1:0] RST_N_input;
wire[4-1:0] J_NS4_BEG0_input;
wire[4-1:0] J_NS4_BEG1_input;
wire[4-1:0] J_NS4_BEG2_input;
wire[4-1:0] J_NS4_BEG3_input;
wire[4-1:0] J_NS4_BEG4_input;
wire[4-1:0] J_NS4_BEG5_input;
wire[4-1:0] J_NS4_BEG6_input;
wire[4-1:0] J_NS4_BEG7_input;
wire[4-1:0] J_NS4_BEG8_input;
wire[4-1:0] J_NS4_BEG9_input;
wire[4-1:0] J_NS4_BEG10_input;
wire[4-1:0] J_NS4_BEG11_input;
wire[4-1:0] J_NS4_BEG12_input;
wire[4-1:0] J_NS4_BEG13_input;
wire[4-1:0] J_NS4_BEG14_input;
wire[4-1:0] J_NS4_BEG15_input;
wire[4-1:0] J_NS2_BEG0_input;
wire[4-1:0] J_NS2_BEG1_input;
wire[4-1:0] J_NS2_BEG2_input;
wire[4-1:0] J_NS2_BEG3_input;
wire[4-1:0] J_NS2_BEG4_input;
wire[4-1:0] J_NS2_BEG5_input;
wire[4-1:0] J_NS2_BEG6_input;
wire[4-1:0] J_NS2_BEG7_input;
wire[4-1:0] J_NS1_BEG0_input;
wire[4-1:0] J_NS1_BEG1_input;
wire[4-1:0] J_NS1_BEG2_input;
wire[4-1:0] J_NS1_BEG3_input;

wire[1:0] DEBUG_select_N1BEG0;
wire[1:0] DEBUG_select_N1BEG1;
wire[1:0] DEBUG_select_N1BEG2;
wire[1:0] DEBUG_select_N1BEG3;
wire[1:0] DEBUG_select_N2BEG0;
wire[1:0] DEBUG_select_N2BEG1;
wire[1:0] DEBUG_select_N2BEG2;
wire[1:0] DEBUG_select_N2BEG3;
wire[1:0] DEBUG_select_N2BEG4;
wire[1:0] DEBUG_select_N2BEG5;
wire[1:0] DEBUG_select_N2BEG6;
wire[1:0] DEBUG_select_N2BEG7;
wire[2:0] DEBUG_select_N4BEG0;
wire[2:0] DEBUG_select_N4BEG1;
wire[2:0] DEBUG_select_N4BEG2;
wire[2:0] DEBUG_select_N4BEG3;
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
wire[2:0] DEBUG_select_S4BEG0;
wire[2:0] DEBUG_select_S4BEG1;
wire[2:0] DEBUG_select_S4BEG2;
wire[2:0] DEBUG_select_S4BEG3;
wire[2:0] DEBUG_select_W1BEG0;
wire[2:0] DEBUG_select_W1BEG1;
wire[2:0] DEBUG_select_W1BEG2;
wire[2:0] DEBUG_select_W1BEG3;
wire[2:0] DEBUG_select_W2BEG0;
wire[2:0] DEBUG_select_W2BEG1;
wire[2:0] DEBUG_select_W2BEG2;
wire[2:0] DEBUG_select_W2BEG3;
wire[2:0] DEBUG_select_W2BEG4;
wire[2:0] DEBUG_select_W2BEG5;
wire[2:0] DEBUG_select_W2BEG6;
wire[2:0] DEBUG_select_W2BEG7;
wire[2:0] DEBUG_select_W2BEGb0;
wire[2:0] DEBUG_select_W2BEGb1;
wire[2:0] DEBUG_select_W2BEGb2;
wire[2:0] DEBUG_select_W2BEGb3;
wire[2:0] DEBUG_select_W2BEGb4;
wire[2:0] DEBUG_select_W2BEGb5;
wire[2:0] DEBUG_select_W2BEGb6;
wire[2:0] DEBUG_select_W2BEGb7;
wire[1:0] DEBUG_select_WW4BEG0;
wire[1:0] DEBUG_select_WW4BEG1;
wire[1:0] DEBUG_select_WW4BEG2;
wire[1:0] DEBUG_select_WW4BEG3;
wire[1:0] DEBUG_select_WW4BEG4;
wire[1:0] DEBUG_select_WW4BEG5;
wire[1:0] DEBUG_select_WW4BEG6;
wire[1:0] DEBUG_select_WW4BEG7;
wire[1:0] DEBUG_select_WW4BEG8;
wire[1:0] DEBUG_select_WW4BEG9;
wire[1:0] DEBUG_select_WW4BEG10;
wire[1:0] DEBUG_select_WW4BEG11;
wire[1:0] DEBUG_select_WW4BEG12;
wire[1:0] DEBUG_select_WW4BEG13;
wire[1:0] DEBUG_select_WW4BEG14;
wire[1:0] DEBUG_select_WW4BEG15;
wire[1:0] DEBUG_select_W6BEG0;
wire[1:0] DEBUG_select_W6BEG1;
wire[1:0] DEBUG_select_W6BEG2;
wire[1:0] DEBUG_select_W6BEG3;
wire[1:0] DEBUG_select_W6BEG4;
wire[1:0] DEBUG_select_W6BEG5;
wire[1:0] DEBUG_select_W6BEG6;
wire[1:0] DEBUG_select_W6BEG7;
wire[1:0] DEBUG_select_W6BEG8;
wire[1:0] DEBUG_select_W6BEG9;
wire[1:0] DEBUG_select_W6BEG10;
wire[1:0] DEBUG_select_W6BEG11;
wire[2:0] DEBUG_select_UI_IN0;
wire[2:0] DEBUG_select_UI_IN1;
wire[2:0] DEBUG_select_UI_IN2;
wire[2:0] DEBUG_select_UI_IN3;
wire[2:0] DEBUG_select_UI_IN4;
wire[2:0] DEBUG_select_UI_IN5;
wire[2:0] DEBUG_select_UI_IN6;
wire[2:0] DEBUG_select_UI_IN7;
wire[2:0] DEBUG_select_UIO_IN0;
wire[2:0] DEBUG_select_UIO_IN1;
wire[2:0] DEBUG_select_UIO_IN2;
wire[2:0] DEBUG_select_UIO_IN3;
wire[2:0] DEBUG_select_UIO_IN4;
wire[2:0] DEBUG_select_UIO_IN5;
wire[2:0] DEBUG_select_UIO_IN6;
wire[2:0] DEBUG_select_UIO_IN7;
wire[1:0] DEBUG_select_ENA;
wire[3:0] DEBUG_select_RST_N;
wire[1:0] DEBUG_select_J_NS4_BEG0;
wire[1:0] DEBUG_select_J_NS4_BEG1;
wire[1:0] DEBUG_select_J_NS4_BEG2;
wire[1:0] DEBUG_select_J_NS4_BEG3;
wire[1:0] DEBUG_select_J_NS4_BEG4;
wire[1:0] DEBUG_select_J_NS4_BEG5;
wire[1:0] DEBUG_select_J_NS4_BEG6;
wire[1:0] DEBUG_select_J_NS4_BEG7;
wire[1:0] DEBUG_select_J_NS4_BEG8;
wire[1:0] DEBUG_select_J_NS4_BEG9;
wire[1:0] DEBUG_select_J_NS4_BEG10;
wire[1:0] DEBUG_select_J_NS4_BEG11;
wire[1:0] DEBUG_select_J_NS4_BEG12;
wire[1:0] DEBUG_select_J_NS4_BEG13;
wire[1:0] DEBUG_select_J_NS4_BEG14;
wire[1:0] DEBUG_select_J_NS4_BEG15;
wire[1:0] DEBUG_select_J_NS2_BEG0;
wire[1:0] DEBUG_select_J_NS2_BEG1;
wire[1:0] DEBUG_select_J_NS2_BEG2;
wire[1:0] DEBUG_select_J_NS2_BEG3;
wire[1:0] DEBUG_select_J_NS2_BEG4;
wire[1:0] DEBUG_select_J_NS2_BEG5;
wire[1:0] DEBUG_select_J_NS2_BEG6;
wire[1:0] DEBUG_select_J_NS2_BEG7;
wire[1:0] DEBUG_select_J_NS1_BEG0;
wire[1:0] DEBUG_select_J_NS1_BEG1;
wire[1:0] DEBUG_select_J_NS1_BEG2;
wire[1:0] DEBUG_select_J_NS1_BEG3;
 //The configuration bits (if any) are just a long shift register
 //This shift register is padded to an even number of flops/latches
 //switch matrix multiplexer N1BEG0 MUX-4
assign N1BEG0_input = {J_NS1_END0,J_NS4_END12,E6END4,E1END0};
cus_mux41_buf inst_cus_mux41_buf_N1BEG0 (
    .A0(N1BEG0_input[0]),
    .A1(N1BEG0_input[1]),
    .A2(N1BEG0_input[2]),
    .A3(N1BEG0_input[3]),
    .S0(ConfigBits[0+0]),
    .S0N(ConfigBits_N[0+0]),
    .S1(ConfigBits[0+1]),
    .S1N(ConfigBits_N[0+1]),
    .X(N1BEG0)
);

 //switch matrix multiplexer N1BEG1 MUX-4
assign N1BEG1_input = {J_NS1_END1,J_NS4_END13,E6END5,E1END1};
cus_mux41_buf inst_cus_mux41_buf_N1BEG1 (
    .A0(N1BEG1_input[0]),
    .A1(N1BEG1_input[1]),
    .A2(N1BEG1_input[2]),
    .A3(N1BEG1_input[3]),
    .S0(ConfigBits[2+0]),
    .S0N(ConfigBits_N[2+0]),
    .S1(ConfigBits[2+1]),
    .S1N(ConfigBits_N[2+1]),
    .X(N1BEG1)
);

 //switch matrix multiplexer N1BEG2 MUX-4
assign N1BEG2_input = {J_NS1_END2,J_NS4_END14,E6END6,E1END2};
cus_mux41_buf inst_cus_mux41_buf_N1BEG2 (
    .A0(N1BEG2_input[0]),
    .A1(N1BEG2_input[1]),
    .A2(N1BEG2_input[2]),
    .A3(N1BEG2_input[3]),
    .S0(ConfigBits[4+0]),
    .S0N(ConfigBits_N[4+0]),
    .S1(ConfigBits[4+1]),
    .S1N(ConfigBits_N[4+1]),
    .X(N1BEG2)
);

 //switch matrix multiplexer N1BEG3 MUX-4
assign N1BEG3_input = {J_NS1_END3,J_NS4_END15,E6END7,E1END3};
cus_mux41_buf inst_cus_mux41_buf_N1BEG3 (
    .A0(N1BEG3_input[0]),
    .A1(N1BEG3_input[1]),
    .A2(N1BEG3_input[2]),
    .A3(N1BEG3_input[3]),
    .S0(ConfigBits[6+0]),
    .S0N(ConfigBits_N[6+0]),
    .S1(ConfigBits[6+1]),
    .S1N(ConfigBits_N[6+1]),
    .X(N1BEG3)
);

 //switch matrix multiplexer N2BEG0 MUX-4
assign N2BEG0_input = {J_NS2_END0,E6END7,E2END7,E2MID7};
cus_mux41_buf inst_cus_mux41_buf_N2BEG0 (
    .A0(N2BEG0_input[0]),
    .A1(N2BEG0_input[1]),
    .A2(N2BEG0_input[2]),
    .A3(N2BEG0_input[3]),
    .S0(ConfigBits[8+0]),
    .S0N(ConfigBits_N[8+0]),
    .S1(ConfigBits[8+1]),
    .S1N(ConfigBits_N[8+1]),
    .X(N2BEG0)
);

 //switch matrix multiplexer N2BEG1 MUX-4
assign N2BEG1_input = {J_NS2_END1,E6END6,E2END6,E2MID6};
cus_mux41_buf inst_cus_mux41_buf_N2BEG1 (
    .A0(N2BEG1_input[0]),
    .A1(N2BEG1_input[1]),
    .A2(N2BEG1_input[2]),
    .A3(N2BEG1_input[3]),
    .S0(ConfigBits[10+0]),
    .S0N(ConfigBits_N[10+0]),
    .S1(ConfigBits[10+1]),
    .S1N(ConfigBits_N[10+1]),
    .X(N2BEG1)
);

 //switch matrix multiplexer N2BEG2 MUX-4
assign N2BEG2_input = {J_NS2_END2,E6END5,E2END5,E2MID5};
cus_mux41_buf inst_cus_mux41_buf_N2BEG2 (
    .A0(N2BEG2_input[0]),
    .A1(N2BEG2_input[1]),
    .A2(N2BEG2_input[2]),
    .A3(N2BEG2_input[3]),
    .S0(ConfigBits[12+0]),
    .S0N(ConfigBits_N[12+0]),
    .S1(ConfigBits[12+1]),
    .S1N(ConfigBits_N[12+1]),
    .X(N2BEG2)
);

 //switch matrix multiplexer N2BEG3 MUX-4
assign N2BEG3_input = {J_NS2_END3,E6END4,E2END4,E2MID4};
cus_mux41_buf inst_cus_mux41_buf_N2BEG3 (
    .A0(N2BEG3_input[0]),
    .A1(N2BEG3_input[1]),
    .A2(N2BEG3_input[2]),
    .A3(N2BEG3_input[3]),
    .S0(ConfigBits[14+0]),
    .S0N(ConfigBits_N[14+0]),
    .S1(ConfigBits[14+1]),
    .S1N(ConfigBits_N[14+1]),
    .X(N2BEG3)
);

 //switch matrix multiplexer N2BEG4 MUX-4
assign N2BEG4_input = {J_NS2_END4,E6END3,E2END3,E2MID3};
cus_mux41_buf inst_cus_mux41_buf_N2BEG4 (
    .A0(N2BEG4_input[0]),
    .A1(N2BEG4_input[1]),
    .A2(N2BEG4_input[2]),
    .A3(N2BEG4_input[3]),
    .S0(ConfigBits[16+0]),
    .S0N(ConfigBits_N[16+0]),
    .S1(ConfigBits[16+1]),
    .S1N(ConfigBits_N[16+1]),
    .X(N2BEG4)
);

 //switch matrix multiplexer N2BEG5 MUX-4
assign N2BEG5_input = {J_NS2_END5,E6END2,E2END2,E2MID2};
cus_mux41_buf inst_cus_mux41_buf_N2BEG5 (
    .A0(N2BEG5_input[0]),
    .A1(N2BEG5_input[1]),
    .A2(N2BEG5_input[2]),
    .A3(N2BEG5_input[3]),
    .S0(ConfigBits[18+0]),
    .S0N(ConfigBits_N[18+0]),
    .S1(ConfigBits[18+1]),
    .S1N(ConfigBits_N[18+1]),
    .X(N2BEG5)
);

 //switch matrix multiplexer N2BEG6 MUX-4
assign N2BEG6_input = {J_NS2_END6,E6END1,E2END1,E2MID1};
cus_mux41_buf inst_cus_mux41_buf_N2BEG6 (
    .A0(N2BEG6_input[0]),
    .A1(N2BEG6_input[1]),
    .A2(N2BEG6_input[2]),
    .A3(N2BEG6_input[3]),
    .S0(ConfigBits[20+0]),
    .S0N(ConfigBits_N[20+0]),
    .S1(ConfigBits[20+1]),
    .S1N(ConfigBits_N[20+1]),
    .X(N2BEG6)
);

 //switch matrix multiplexer N2BEG7 MUX-4
assign N2BEG7_input = {J_NS2_END7,E6END0,E2END0,E2MID0};
cus_mux41_buf inst_cus_mux41_buf_N2BEG7 (
    .A0(N2BEG7_input[0]),
    .A1(N2BEG7_input[1]),
    .A2(N2BEG7_input[2]),
    .A3(N2BEG7_input[3]),
    .S0(ConfigBits[22+0]),
    .S0N(ConfigBits_N[22+0]),
    .S1(ConfigBits[22+1]),
    .S1N(ConfigBits_N[22+1]),
    .X(N2BEG7)
);

 //switch matrix multiplexer N2BEGb0 MUX-1
assign N2BEGb0 = N2MID0;

 //switch matrix multiplexer N2BEGb1 MUX-1
assign N2BEGb1 = N2MID1;

 //switch matrix multiplexer N2BEGb2 MUX-1
assign N2BEGb2 = N2MID2;

 //switch matrix multiplexer N2BEGb3 MUX-1
assign N2BEGb3 = N2MID3;

 //switch matrix multiplexer N2BEGb4 MUX-1
assign N2BEGb4 = N2MID4;

 //switch matrix multiplexer N2BEGb5 MUX-1
assign N2BEGb5 = N2MID5;

 //switch matrix multiplexer N2BEGb6 MUX-1
assign N2BEGb6 = N2MID6;

 //switch matrix multiplexer N2BEGb7 MUX-1
assign N2BEGb7 = N2MID7;

 //switch matrix multiplexer N4BEG0 MUX-8
assign N4BEG0_input = {J_NS2_END0,J_NS4_END12,J_NS4_END8,J_NS4_END4,J_NS4_END0,E6END8,EE4END0,E1END0};
cus_mux81_buf inst_cus_mux81_buf_N4BEG0 (
    .A0(N4BEG0_input[0]),
    .A1(N4BEG0_input[1]),
    .A2(N4BEG0_input[2]),
    .A3(N4BEG0_input[3]),
    .A4(N4BEG0_input[4]),
    .A5(N4BEG0_input[5]),
    .A6(N4BEG0_input[6]),
    .A7(N4BEG0_input[7]),
    .S0(ConfigBits[24+0]),
    .S0N(ConfigBits_N[24+0]),
    .S1(ConfigBits[24+1]),
    .S1N(ConfigBits_N[24+1]),
    .S2(ConfigBits[24+2]),
    .S2N(ConfigBits_N[24+2]),
    .X(N4BEG0)
);

 //switch matrix multiplexer N4BEG1 MUX-8
assign N4BEG1_input = {J_NS2_END1,J_NS4_END13,J_NS4_END9,J_NS4_END5,J_NS4_END1,E6END9,EE4END1,E1END1};
cus_mux81_buf inst_cus_mux81_buf_N4BEG1 (
    .A0(N4BEG1_input[0]),
    .A1(N4BEG1_input[1]),
    .A2(N4BEG1_input[2]),
    .A3(N4BEG1_input[3]),
    .A4(N4BEG1_input[4]),
    .A5(N4BEG1_input[5]),
    .A6(N4BEG1_input[6]),
    .A7(N4BEG1_input[7]),
    .S0(ConfigBits[27+0]),
    .S0N(ConfigBits_N[27+0]),
    .S1(ConfigBits[27+1]),
    .S1N(ConfigBits_N[27+1]),
    .S2(ConfigBits[27+2]),
    .S2N(ConfigBits_N[27+2]),
    .X(N4BEG1)
);

 //switch matrix multiplexer N4BEG2 MUX-8
assign N4BEG2_input = {J_NS2_END2,J_NS4_END14,J_NS4_END10,J_NS4_END6,J_NS4_END2,E6END10,EE4END2,E1END2};
cus_mux81_buf inst_cus_mux81_buf_N4BEG2 (
    .A0(N4BEG2_input[0]),
    .A1(N4BEG2_input[1]),
    .A2(N4BEG2_input[2]),
    .A3(N4BEG2_input[3]),
    .A4(N4BEG2_input[4]),
    .A5(N4BEG2_input[5]),
    .A6(N4BEG2_input[6]),
    .A7(N4BEG2_input[7]),
    .S0(ConfigBits[30+0]),
    .S0N(ConfigBits_N[30+0]),
    .S1(ConfigBits[30+1]),
    .S1N(ConfigBits_N[30+1]),
    .S2(ConfigBits[30+2]),
    .S2N(ConfigBits_N[30+2]),
    .X(N4BEG2)
);

 //switch matrix multiplexer N4BEG3 MUX-8
assign N4BEG3_input = {J_NS2_END3,J_NS4_END15,J_NS4_END11,J_NS4_END7,J_NS4_END3,E6END11,EE4END3,E1END3};
cus_mux81_buf inst_cus_mux81_buf_N4BEG3 (
    .A0(N4BEG3_input[0]),
    .A1(N4BEG3_input[1]),
    .A2(N4BEG3_input[2]),
    .A3(N4BEG3_input[3]),
    .A4(N4BEG3_input[4]),
    .A5(N4BEG3_input[5]),
    .A6(N4BEG3_input[6]),
    .A7(N4BEG3_input[7]),
    .S0(ConfigBits[33+0]),
    .S0N(ConfigBits_N[33+0]),
    .S1(ConfigBits[33+1]),
    .S1N(ConfigBits_N[33+1]),
    .S2(ConfigBits[33+2]),
    .S2N(ConfigBits_N[33+2]),
    .X(N4BEG3)
);

 //switch matrix multiplexer S1BEG0 MUX-4
assign S1BEG0_input = {J_NS1_END0,J_NS4_END12,E6END8,E1END0};
cus_mux41_buf inst_cus_mux41_buf_S1BEG0 (
    .A0(S1BEG0_input[0]),
    .A1(S1BEG0_input[1]),
    .A2(S1BEG0_input[2]),
    .A3(S1BEG0_input[3]),
    .S0(ConfigBits[36+0]),
    .S0N(ConfigBits_N[36+0]),
    .S1(ConfigBits[36+1]),
    .S1N(ConfigBits_N[36+1]),
    .X(S1BEG0)
);

 //switch matrix multiplexer S1BEG1 MUX-4
assign S1BEG1_input = {J_NS1_END1,J_NS4_END13,E6END9,E1END1};
cus_mux41_buf inst_cus_mux41_buf_S1BEG1 (
    .A0(S1BEG1_input[0]),
    .A1(S1BEG1_input[1]),
    .A2(S1BEG1_input[2]),
    .A3(S1BEG1_input[3]),
    .S0(ConfigBits[38+0]),
    .S0N(ConfigBits_N[38+0]),
    .S1(ConfigBits[38+1]),
    .S1N(ConfigBits_N[38+1]),
    .X(S1BEG1)
);

 //switch matrix multiplexer S1BEG2 MUX-4
assign S1BEG2_input = {J_NS1_END2,J_NS4_END14,E6END10,E1END2};
cus_mux41_buf inst_cus_mux41_buf_S1BEG2 (
    .A0(S1BEG2_input[0]),
    .A1(S1BEG2_input[1]),
    .A2(S1BEG2_input[2]),
    .A3(S1BEG2_input[3]),
    .S0(ConfigBits[40+0]),
    .S0N(ConfigBits_N[40+0]),
    .S1(ConfigBits[40+1]),
    .S1N(ConfigBits_N[40+1]),
    .X(S1BEG2)
);

 //switch matrix multiplexer S1BEG3 MUX-4
assign S1BEG3_input = {J_NS1_END3,J_NS4_END15,E6END11,E1END3};
cus_mux41_buf inst_cus_mux41_buf_S1BEG3 (
    .A0(S1BEG3_input[0]),
    .A1(S1BEG3_input[1]),
    .A2(S1BEG3_input[2]),
    .A3(S1BEG3_input[3]),
    .S0(ConfigBits[42+0]),
    .S0N(ConfigBits_N[42+0]),
    .S1(ConfigBits[42+1]),
    .S1N(ConfigBits_N[42+1]),
    .X(S1BEG3)
);

 //switch matrix multiplexer S2BEG0 MUX-4
assign S2BEG0_input = {J_NS2_END0,E6END8,E2END7,E2MID7};
cus_mux41_buf inst_cus_mux41_buf_S2BEG0 (
    .A0(S2BEG0_input[0]),
    .A1(S2BEG0_input[1]),
    .A2(S2BEG0_input[2]),
    .A3(S2BEG0_input[3]),
    .S0(ConfigBits[44+0]),
    .S0N(ConfigBits_N[44+0]),
    .S1(ConfigBits[44+1]),
    .S1N(ConfigBits_N[44+1]),
    .X(S2BEG0)
);

 //switch matrix multiplexer S2BEG1 MUX-4
assign S2BEG1_input = {J_NS2_END1,E6END9,E2END6,E2MID6};
cus_mux41_buf inst_cus_mux41_buf_S2BEG1 (
    .A0(S2BEG1_input[0]),
    .A1(S2BEG1_input[1]),
    .A2(S2BEG1_input[2]),
    .A3(S2BEG1_input[3]),
    .S0(ConfigBits[46+0]),
    .S0N(ConfigBits_N[46+0]),
    .S1(ConfigBits[46+1]),
    .S1N(ConfigBits_N[46+1]),
    .X(S2BEG1)
);

 //switch matrix multiplexer S2BEG2 MUX-4
assign S2BEG2_input = {J_NS2_END2,E6END10,E2END5,E2MID5};
cus_mux41_buf inst_cus_mux41_buf_S2BEG2 (
    .A0(S2BEG2_input[0]),
    .A1(S2BEG2_input[1]),
    .A2(S2BEG2_input[2]),
    .A3(S2BEG2_input[3]),
    .S0(ConfigBits[48+0]),
    .S0N(ConfigBits_N[48+0]),
    .S1(ConfigBits[48+1]),
    .S1N(ConfigBits_N[48+1]),
    .X(S2BEG2)
);

 //switch matrix multiplexer S2BEG3 MUX-4
assign S2BEG3_input = {J_NS2_END3,E6END11,E2END4,E2MID4};
cus_mux41_buf inst_cus_mux41_buf_S2BEG3 (
    .A0(S2BEG3_input[0]),
    .A1(S2BEG3_input[1]),
    .A2(S2BEG3_input[2]),
    .A3(S2BEG3_input[3]),
    .S0(ConfigBits[50+0]),
    .S0N(ConfigBits_N[50+0]),
    .S1(ConfigBits[50+1]),
    .S1N(ConfigBits_N[50+1]),
    .X(S2BEG3)
);

 //switch matrix multiplexer S2BEG4 MUX-4
assign S2BEG4_input = {J_NS2_END4,E2END3,E2MID3,E1END0};
cus_mux41_buf inst_cus_mux41_buf_S2BEG4 (
    .A0(S2BEG4_input[0]),
    .A1(S2BEG4_input[1]),
    .A2(S2BEG4_input[2]),
    .A3(S2BEG4_input[3]),
    .S0(ConfigBits[52+0]),
    .S0N(ConfigBits_N[52+0]),
    .S1(ConfigBits[52+1]),
    .S1N(ConfigBits_N[52+1]),
    .X(S2BEG4)
);

 //switch matrix multiplexer S2BEG5 MUX-4
assign S2BEG5_input = {J_NS2_END5,E2END2,E2MID2,E1END1};
cus_mux41_buf inst_cus_mux41_buf_S2BEG5 (
    .A0(S2BEG5_input[0]),
    .A1(S2BEG5_input[1]),
    .A2(S2BEG5_input[2]),
    .A3(S2BEG5_input[3]),
    .S0(ConfigBits[54+0]),
    .S0N(ConfigBits_N[54+0]),
    .S1(ConfigBits[54+1]),
    .S1N(ConfigBits_N[54+1]),
    .X(S2BEG5)
);

 //switch matrix multiplexer S2BEG6 MUX-4
assign S2BEG6_input = {J_NS2_END6,E2END1,E2MID1,E1END2};
cus_mux41_buf inst_cus_mux41_buf_S2BEG6 (
    .A0(S2BEG6_input[0]),
    .A1(S2BEG6_input[1]),
    .A2(S2BEG6_input[2]),
    .A3(S2BEG6_input[3]),
    .S0(ConfigBits[56+0]),
    .S0N(ConfigBits_N[56+0]),
    .S1(ConfigBits[56+1]),
    .S1N(ConfigBits_N[56+1]),
    .X(S2BEG6)
);

 //switch matrix multiplexer S2BEG7 MUX-4
assign S2BEG7_input = {J_NS2_END7,E2END0,E2MID0,E1END3};
cus_mux41_buf inst_cus_mux41_buf_S2BEG7 (
    .A0(S2BEG7_input[0]),
    .A1(S2BEG7_input[1]),
    .A2(S2BEG7_input[2]),
    .A3(S2BEG7_input[3]),
    .S0(ConfigBits[58+0]),
    .S0N(ConfigBits_N[58+0]),
    .S1(ConfigBits[58+1]),
    .S1N(ConfigBits_N[58+1]),
    .X(S2BEG7)
);

 //switch matrix multiplexer S2BEGb0 MUX-1
assign S2BEGb0 = S2MID0;

 //switch matrix multiplexer S2BEGb1 MUX-1
assign S2BEGb1 = S2MID1;

 //switch matrix multiplexer S2BEGb2 MUX-1
assign S2BEGb2 = S2MID2;

 //switch matrix multiplexer S2BEGb3 MUX-1
assign S2BEGb3 = S2MID3;

 //switch matrix multiplexer S2BEGb4 MUX-1
assign S2BEGb4 = S2MID4;

 //switch matrix multiplexer S2BEGb5 MUX-1
assign S2BEGb5 = S2MID5;

 //switch matrix multiplexer S2BEGb6 MUX-1
assign S2BEGb6 = S2MID6;

 //switch matrix multiplexer S2BEGb7 MUX-1
assign S2BEGb7 = S2MID7;

 //switch matrix multiplexer S4BEG0 MUX-8
assign S4BEG0_input = {J_NS2_END4,J_NS4_END12,J_NS4_END8,J_NS4_END4,J_NS4_END0,E6END4,EE4END12,E1END0};
cus_mux81_buf inst_cus_mux81_buf_S4BEG0 (
    .A0(S4BEG0_input[0]),
    .A1(S4BEG0_input[1]),
    .A2(S4BEG0_input[2]),
    .A3(S4BEG0_input[3]),
    .A4(S4BEG0_input[4]),
    .A5(S4BEG0_input[5]),
    .A6(S4BEG0_input[6]),
    .A7(S4BEG0_input[7]),
    .S0(ConfigBits[60+0]),
    .S0N(ConfigBits_N[60+0]),
    .S1(ConfigBits[60+1]),
    .S1N(ConfigBits_N[60+1]),
    .S2(ConfigBits[60+2]),
    .S2N(ConfigBits_N[60+2]),
    .X(S4BEG0)
);

 //switch matrix multiplexer S4BEG1 MUX-8
assign S4BEG1_input = {J_NS2_END5,J_NS4_END13,J_NS4_END9,J_NS4_END5,J_NS4_END1,E6END5,EE4END13,E1END1};
cus_mux81_buf inst_cus_mux81_buf_S4BEG1 (
    .A0(S4BEG1_input[0]),
    .A1(S4BEG1_input[1]),
    .A2(S4BEG1_input[2]),
    .A3(S4BEG1_input[3]),
    .A4(S4BEG1_input[4]),
    .A5(S4BEG1_input[5]),
    .A6(S4BEG1_input[6]),
    .A7(S4BEG1_input[7]),
    .S0(ConfigBits[63+0]),
    .S0N(ConfigBits_N[63+0]),
    .S1(ConfigBits[63+1]),
    .S1N(ConfigBits_N[63+1]),
    .S2(ConfigBits[63+2]),
    .S2N(ConfigBits_N[63+2]),
    .X(S4BEG1)
);

 //switch matrix multiplexer S4BEG2 MUX-8
assign S4BEG2_input = {J_NS2_END6,J_NS4_END14,J_NS4_END10,J_NS4_END6,J_NS4_END2,E6END6,EE4END14,E1END2};
cus_mux81_buf inst_cus_mux81_buf_S4BEG2 (
    .A0(S4BEG2_input[0]),
    .A1(S4BEG2_input[1]),
    .A2(S4BEG2_input[2]),
    .A3(S4BEG2_input[3]),
    .A4(S4BEG2_input[4]),
    .A5(S4BEG2_input[5]),
    .A6(S4BEG2_input[6]),
    .A7(S4BEG2_input[7]),
    .S0(ConfigBits[66+0]),
    .S0N(ConfigBits_N[66+0]),
    .S1(ConfigBits[66+1]),
    .S1N(ConfigBits_N[66+1]),
    .S2(ConfigBits[66+2]),
    .S2N(ConfigBits_N[66+2]),
    .X(S4BEG2)
);

 //switch matrix multiplexer S4BEG3 MUX-8
assign S4BEG3_input = {J_NS2_END7,J_NS4_END15,J_NS4_END11,J_NS4_END7,J_NS4_END3,E6END7,EE4END15,E1END3};
cus_mux81_buf inst_cus_mux81_buf_S4BEG3 (
    .A0(S4BEG3_input[0]),
    .A1(S4BEG3_input[1]),
    .A2(S4BEG3_input[2]),
    .A3(S4BEG3_input[3]),
    .A4(S4BEG3_input[4]),
    .A5(S4BEG3_input[5]),
    .A6(S4BEG3_input[6]),
    .A7(S4BEG3_input[7]),
    .S0(ConfigBits[69+0]),
    .S0N(ConfigBits_N[69+0]),
    .S1(ConfigBits[69+1]),
    .S1N(ConfigBits_N[69+1]),
    .S2(ConfigBits[69+2]),
    .S2N(ConfigBits_N[69+2]),
    .X(S4BEG3)
);

 //switch matrix multiplexer W1BEG0 MUX-8
assign W1BEG0_input = {UIO_OE7,UIO_OE6,UIO_OE2,UIO_OE0,UO_OUT7,UO_OUT2,S1END0,N1END0};
cus_mux81_buf inst_cus_mux81_buf_W1BEG0 (
    .A0(W1BEG0_input[0]),
    .A1(W1BEG0_input[1]),
    .A2(W1BEG0_input[2]),
    .A3(W1BEG0_input[3]),
    .A4(W1BEG0_input[4]),
    .A5(W1BEG0_input[5]),
    .A6(W1BEG0_input[6]),
    .A7(W1BEG0_input[7]),
    .S0(ConfigBits[72+0]),
    .S0N(ConfigBits_N[72+0]),
    .S1(ConfigBits[72+1]),
    .S1N(ConfigBits_N[72+1]),
    .S2(ConfigBits[72+2]),
    .S2N(ConfigBits_N[72+2]),
    .X(W1BEG0)
);

 //switch matrix multiplexer W1BEG1 MUX-8
assign W1BEG1_input = {UIO_OE6,UIO_OE5,UIO_OE1,UIO_OE0,UO_OUT6,UO_OUT3,S1END1,N1END1};
cus_mux81_buf inst_cus_mux81_buf_W1BEG1 (
    .A0(W1BEG1_input[0]),
    .A1(W1BEG1_input[1]),
    .A2(W1BEG1_input[2]),
    .A3(W1BEG1_input[3]),
    .A4(W1BEG1_input[4]),
    .A5(W1BEG1_input[5]),
    .A6(W1BEG1_input[6]),
    .A7(W1BEG1_input[7]),
    .S0(ConfigBits[75+0]),
    .S0N(ConfigBits_N[75+0]),
    .S1(ConfigBits[75+1]),
    .S1N(ConfigBits_N[75+1]),
    .S2(ConfigBits[75+2]),
    .S2N(ConfigBits_N[75+2]),
    .X(W1BEG1)
);

 //switch matrix multiplexer W1BEG2 MUX-8
assign W1BEG2_input = {UIO_OE5,UIO_OE4,UIO_OE3,UIO_OE2,UO_OUT5,UO_OUT0,S1END2,N1END2};
cus_mux81_buf inst_cus_mux81_buf_W1BEG2 (
    .A0(W1BEG2_input[0]),
    .A1(W1BEG2_input[1]),
    .A2(W1BEG2_input[2]),
    .A3(W1BEG2_input[3]),
    .A4(W1BEG2_input[4]),
    .A5(W1BEG2_input[5]),
    .A6(W1BEG2_input[6]),
    .A7(W1BEG2_input[7]),
    .S0(ConfigBits[78+0]),
    .S0N(ConfigBits_N[78+0]),
    .S1(ConfigBits[78+1]),
    .S1N(ConfigBits_N[78+1]),
    .S2(ConfigBits[78+2]),
    .S2N(ConfigBits_N[78+2]),
    .X(W1BEG2)
);

 //switch matrix multiplexer W1BEG3 MUX-8
assign W1BEG3_input = {UIO_OE7,UIO_OE4,UIO_OE3,UIO_OE1,UO_OUT4,UO_OUT1,S1END3,N1END3};
cus_mux81_buf inst_cus_mux81_buf_W1BEG3 (
    .A0(W1BEG3_input[0]),
    .A1(W1BEG3_input[1]),
    .A2(W1BEG3_input[2]),
    .A3(W1BEG3_input[3]),
    .A4(W1BEG3_input[4]),
    .A5(W1BEG3_input[5]),
    .A6(W1BEG3_input[6]),
    .A7(W1BEG3_input[7]),
    .S0(ConfigBits[81+0]),
    .S0N(ConfigBits_N[81+0]),
    .S1(ConfigBits[81+1]),
    .S1N(ConfigBits_N[81+1]),
    .S2(ConfigBits[81+2]),
    .S2N(ConfigBits_N[81+2]),
    .X(W1BEG3)
);

 //switch matrix multiplexer W2BEG0 MUX-8
assign W2BEG0_input = {J_NS1_END0,J_NS2_END7,J_NS2_END0,J_NS4_END0,UIO_OE7,UIO_OUT0,UO_OUT3,UO_OUT0};
cus_mux81_buf inst_cus_mux81_buf_W2BEG0 (
    .A0(W2BEG0_input[0]),
    .A1(W2BEG0_input[1]),
    .A2(W2BEG0_input[2]),
    .A3(W2BEG0_input[3]),
    .A4(W2BEG0_input[4]),
    .A5(W2BEG0_input[5]),
    .A6(W2BEG0_input[6]),
    .A7(W2BEG0_input[7]),
    .S0(ConfigBits[84+0]),
    .S0N(ConfigBits_N[84+0]),
    .S1(ConfigBits[84+1]),
    .S1N(ConfigBits_N[84+1]),
    .S2(ConfigBits[84+2]),
    .S2N(ConfigBits_N[84+2]),
    .X(W2BEG0)
);

 //switch matrix multiplexer W2BEG1 MUX-8
assign W2BEG1_input = {J_NS1_END1,J_NS2_END6,J_NS2_END1,J_NS4_END1,UIO_OE6,UIO_OUT1,UO_OUT2,UO_OUT1};
cus_mux81_buf inst_cus_mux81_buf_W2BEG1 (
    .A0(W2BEG1_input[0]),
    .A1(W2BEG1_input[1]),
    .A2(W2BEG1_input[2]),
    .A3(W2BEG1_input[3]),
    .A4(W2BEG1_input[4]),
    .A5(W2BEG1_input[5]),
    .A6(W2BEG1_input[6]),
    .A7(W2BEG1_input[7]),
    .S0(ConfigBits[87+0]),
    .S0N(ConfigBits_N[87+0]),
    .S1(ConfigBits[87+1]),
    .S1N(ConfigBits_N[87+1]),
    .S2(ConfigBits[87+2]),
    .S2N(ConfigBits_N[87+2]),
    .X(W2BEG1)
);

 //switch matrix multiplexer W2BEG2 MUX-8
assign W2BEG2_input = {J_NS1_END2,J_NS2_END5,J_NS2_END2,J_NS4_END2,UIO_OE5,UIO_OUT2,UO_OUT2,UO_OUT1};
cus_mux81_buf inst_cus_mux81_buf_W2BEG2 (
    .A0(W2BEG2_input[0]),
    .A1(W2BEG2_input[1]),
    .A2(W2BEG2_input[2]),
    .A3(W2BEG2_input[3]),
    .A4(W2BEG2_input[4]),
    .A5(W2BEG2_input[5]),
    .A6(W2BEG2_input[6]),
    .A7(W2BEG2_input[7]),
    .S0(ConfigBits[90+0]),
    .S0N(ConfigBits_N[90+0]),
    .S1(ConfigBits[90+1]),
    .S1N(ConfigBits_N[90+1]),
    .S2(ConfigBits[90+2]),
    .S2N(ConfigBits_N[90+2]),
    .X(W2BEG2)
);

 //switch matrix multiplexer W2BEG3 MUX-8
assign W2BEG3_input = {J_NS1_END3,J_NS2_END4,J_NS2_END3,J_NS4_END3,UIO_OE4,UIO_OUT3,UO_OUT3,UO_OUT0};
cus_mux81_buf inst_cus_mux81_buf_W2BEG3 (
    .A0(W2BEG3_input[0]),
    .A1(W2BEG3_input[1]),
    .A2(W2BEG3_input[2]),
    .A3(W2BEG3_input[3]),
    .A4(W2BEG3_input[4]),
    .A5(W2BEG3_input[5]),
    .A6(W2BEG3_input[6]),
    .A7(W2BEG3_input[7]),
    .S0(ConfigBits[93+0]),
    .S0N(ConfigBits_N[93+0]),
    .S1(ConfigBits[93+1]),
    .S1N(ConfigBits_N[93+1]),
    .S2(ConfigBits[93+2]),
    .S2N(ConfigBits_N[93+2]),
    .X(W2BEG3)
);

 //switch matrix multiplexer W2BEG4 MUX-8
assign W2BEG4_input = {J_NS1_END3,J_NS2_END4,J_NS2_END3,J_NS4_END4,UIO_OE3,UIO_OUT4,UO_OUT7,UO_OUT4};
cus_mux81_buf inst_cus_mux81_buf_W2BEG4 (
    .A0(W2BEG4_input[0]),
    .A1(W2BEG4_input[1]),
    .A2(W2BEG4_input[2]),
    .A3(W2BEG4_input[3]),
    .A4(W2BEG4_input[4]),
    .A5(W2BEG4_input[5]),
    .A6(W2BEG4_input[6]),
    .A7(W2BEG4_input[7]),
    .S0(ConfigBits[96+0]),
    .S0N(ConfigBits_N[96+0]),
    .S1(ConfigBits[96+1]),
    .S1N(ConfigBits_N[96+1]),
    .S2(ConfigBits[96+2]),
    .S2N(ConfigBits_N[96+2]),
    .X(W2BEG4)
);

 //switch matrix multiplexer W2BEG5 MUX-8
assign W2BEG5_input = {J_NS1_END2,J_NS2_END5,J_NS2_END2,J_NS4_END5,UIO_OE2,UIO_OUT5,UO_OUT6,UO_OUT5};
cus_mux81_buf inst_cus_mux81_buf_W2BEG5 (
    .A0(W2BEG5_input[0]),
    .A1(W2BEG5_input[1]),
    .A2(W2BEG5_input[2]),
    .A3(W2BEG5_input[3]),
    .A4(W2BEG5_input[4]),
    .A5(W2BEG5_input[5]),
    .A6(W2BEG5_input[6]),
    .A7(W2BEG5_input[7]),
    .S0(ConfigBits[99+0]),
    .S0N(ConfigBits_N[99+0]),
    .S1(ConfigBits[99+1]),
    .S1N(ConfigBits_N[99+1]),
    .S2(ConfigBits[99+2]),
    .S2N(ConfigBits_N[99+2]),
    .X(W2BEG5)
);

 //switch matrix multiplexer W2BEG6 MUX-8
assign W2BEG6_input = {J_NS1_END1,J_NS2_END6,J_NS2_END1,J_NS4_END6,UIO_OE1,UIO_OUT6,UO_OUT6,UO_OUT5};
cus_mux81_buf inst_cus_mux81_buf_W2BEG6 (
    .A0(W2BEG6_input[0]),
    .A1(W2BEG6_input[1]),
    .A2(W2BEG6_input[2]),
    .A3(W2BEG6_input[3]),
    .A4(W2BEG6_input[4]),
    .A5(W2BEG6_input[5]),
    .A6(W2BEG6_input[6]),
    .A7(W2BEG6_input[7]),
    .S0(ConfigBits[102+0]),
    .S0N(ConfigBits_N[102+0]),
    .S1(ConfigBits[102+1]),
    .S1N(ConfigBits_N[102+1]),
    .S2(ConfigBits[102+2]),
    .S2N(ConfigBits_N[102+2]),
    .X(W2BEG6)
);

 //switch matrix multiplexer W2BEG7 MUX-8
assign W2BEG7_input = {J_NS1_END0,J_NS2_END7,J_NS2_END0,J_NS4_END7,UIO_OE0,UIO_OUT7,UO_OUT7,UO_OUT4};
cus_mux81_buf inst_cus_mux81_buf_W2BEG7 (
    .A0(W2BEG7_input[0]),
    .A1(W2BEG7_input[1]),
    .A2(W2BEG7_input[2]),
    .A3(W2BEG7_input[3]),
    .A4(W2BEG7_input[4]),
    .A5(W2BEG7_input[5]),
    .A6(W2BEG7_input[6]),
    .A7(W2BEG7_input[7]),
    .S0(ConfigBits[105+0]),
    .S0N(ConfigBits_N[105+0]),
    .S1(ConfigBits[105+1]),
    .S1N(ConfigBits_N[105+1]),
    .S2(ConfigBits[105+2]),
    .S2N(ConfigBits_N[105+2]),
    .X(W2BEG7)
);

 //switch matrix multiplexer W2BEGb0 MUX-8
assign W2BEGb0_input = {J_NS2_END7,J_NS2_END0,J_NS4_END8,UIO_OE0,UIO_OUT7,UIO_OUT3,UIO_OUT0,E2END7};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb0 (
    .A0(W2BEGb0_input[0]),
    .A1(W2BEGb0_input[1]),
    .A2(W2BEGb0_input[2]),
    .A3(W2BEGb0_input[3]),
    .A4(W2BEGb0_input[4]),
    .A5(W2BEGb0_input[5]),
    .A6(W2BEGb0_input[6]),
    .A7(W2BEGb0_input[7]),
    .S0(ConfigBits[108+0]),
    .S0N(ConfigBits_N[108+0]),
    .S1(ConfigBits[108+1]),
    .S1N(ConfigBits_N[108+1]),
    .S2(ConfigBits[108+2]),
    .S2N(ConfigBits_N[108+2]),
    .X(W2BEGb0)
);

 //switch matrix multiplexer W2BEGb1 MUX-8
assign W2BEGb1_input = {J_NS2_END6,J_NS2_END1,J_NS4_END9,UIO_OE1,UIO_OUT6,UIO_OUT2,UIO_OUT1,E2END6};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb1 (
    .A0(W2BEGb1_input[0]),
    .A1(W2BEGb1_input[1]),
    .A2(W2BEGb1_input[2]),
    .A3(W2BEGb1_input[3]),
    .A4(W2BEGb1_input[4]),
    .A5(W2BEGb1_input[5]),
    .A6(W2BEGb1_input[6]),
    .A7(W2BEGb1_input[7]),
    .S0(ConfigBits[111+0]),
    .S0N(ConfigBits_N[111+0]),
    .S1(ConfigBits[111+1]),
    .S1N(ConfigBits_N[111+1]),
    .S2(ConfigBits[111+2]),
    .S2N(ConfigBits_N[111+2]),
    .X(W2BEGb1)
);

 //switch matrix multiplexer W2BEGb2 MUX-8
assign W2BEGb2_input = {J_NS2_END5,J_NS2_END2,J_NS4_END10,UIO_OE2,UIO_OUT5,UIO_OUT2,UIO_OUT1,E2END5};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb2 (
    .A0(W2BEGb2_input[0]),
    .A1(W2BEGb2_input[1]),
    .A2(W2BEGb2_input[2]),
    .A3(W2BEGb2_input[3]),
    .A4(W2BEGb2_input[4]),
    .A5(W2BEGb2_input[5]),
    .A6(W2BEGb2_input[6]),
    .A7(W2BEGb2_input[7]),
    .S0(ConfigBits[114+0]),
    .S0N(ConfigBits_N[114+0]),
    .S1(ConfigBits[114+1]),
    .S1N(ConfigBits_N[114+1]),
    .S2(ConfigBits[114+2]),
    .S2N(ConfigBits_N[114+2]),
    .X(W2BEGb2)
);

 //switch matrix multiplexer W2BEGb3 MUX-8
assign W2BEGb3_input = {J_NS2_END4,J_NS2_END3,J_NS4_END11,UIO_OE3,UIO_OUT4,UIO_OUT3,UIO_OUT0,E2END4};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb3 (
    .A0(W2BEGb3_input[0]),
    .A1(W2BEGb3_input[1]),
    .A2(W2BEGb3_input[2]),
    .A3(W2BEGb3_input[3]),
    .A4(W2BEGb3_input[4]),
    .A5(W2BEGb3_input[5]),
    .A6(W2BEGb3_input[6]),
    .A7(W2BEGb3_input[7]),
    .S0(ConfigBits[117+0]),
    .S0N(ConfigBits_N[117+0]),
    .S1(ConfigBits[117+1]),
    .S1N(ConfigBits_N[117+1]),
    .S2(ConfigBits[117+2]),
    .S2N(ConfigBits_N[117+2]),
    .X(W2BEGb3)
);

 //switch matrix multiplexer W2BEGb4 MUX-8
assign W2BEGb4_input = {J_NS2_END4,J_NS2_END3,J_NS4_END12,UIO_OE4,UIO_OUT7,UIO_OUT4,UIO_OUT3,E2END3};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb4 (
    .A0(W2BEGb4_input[0]),
    .A1(W2BEGb4_input[1]),
    .A2(W2BEGb4_input[2]),
    .A3(W2BEGb4_input[3]),
    .A4(W2BEGb4_input[4]),
    .A5(W2BEGb4_input[5]),
    .A6(W2BEGb4_input[6]),
    .A7(W2BEGb4_input[7]),
    .S0(ConfigBits[120+0]),
    .S0N(ConfigBits_N[120+0]),
    .S1(ConfigBits[120+1]),
    .S1N(ConfigBits_N[120+1]),
    .S2(ConfigBits[120+2]),
    .S2N(ConfigBits_N[120+2]),
    .X(W2BEGb4)
);

 //switch matrix multiplexer W2BEGb5 MUX-8
assign W2BEGb5_input = {J_NS2_END5,J_NS2_END2,J_NS4_END13,UIO_OE5,UIO_OUT6,UIO_OUT5,UIO_OUT2,E2END2};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb5 (
    .A0(W2BEGb5_input[0]),
    .A1(W2BEGb5_input[1]),
    .A2(W2BEGb5_input[2]),
    .A3(W2BEGb5_input[3]),
    .A4(W2BEGb5_input[4]),
    .A5(W2BEGb5_input[5]),
    .A6(W2BEGb5_input[6]),
    .A7(W2BEGb5_input[7]),
    .S0(ConfigBits[123+0]),
    .S0N(ConfigBits_N[123+0]),
    .S1(ConfigBits[123+1]),
    .S1N(ConfigBits_N[123+1]),
    .S2(ConfigBits[123+2]),
    .S2N(ConfigBits_N[123+2]),
    .X(W2BEGb5)
);

 //switch matrix multiplexer W2BEGb6 MUX-8
assign W2BEGb6_input = {J_NS2_END6,J_NS2_END1,J_NS4_END14,UIO_OE6,UIO_OUT6,UIO_OUT5,UIO_OUT1,E2END1};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb6 (
    .A0(W2BEGb6_input[0]),
    .A1(W2BEGb6_input[1]),
    .A2(W2BEGb6_input[2]),
    .A3(W2BEGb6_input[3]),
    .A4(W2BEGb6_input[4]),
    .A5(W2BEGb6_input[5]),
    .A6(W2BEGb6_input[6]),
    .A7(W2BEGb6_input[7]),
    .S0(ConfigBits[126+0]),
    .S0N(ConfigBits_N[126+0]),
    .S1(ConfigBits[126+1]),
    .S1N(ConfigBits_N[126+1]),
    .S2(ConfigBits[126+2]),
    .S2N(ConfigBits_N[126+2]),
    .X(W2BEGb6)
);

 //switch matrix multiplexer W2BEGb7 MUX-8
assign W2BEGb7_input = {J_NS2_END7,J_NS2_END0,J_NS4_END15,UIO_OE7,UIO_OUT7,UIO_OUT4,UIO_OUT0,E2END0};
cus_mux81_buf inst_cus_mux81_buf_W2BEGb7 (
    .A0(W2BEGb7_input[0]),
    .A1(W2BEGb7_input[1]),
    .A2(W2BEGb7_input[2]),
    .A3(W2BEGb7_input[3]),
    .A4(W2BEGb7_input[4]),
    .A5(W2BEGb7_input[5]),
    .A6(W2BEGb7_input[6]),
    .A7(W2BEGb7_input[7]),
    .S0(ConfigBits[129+0]),
    .S0N(ConfigBits_N[129+0]),
    .S1(ConfigBits[129+1]),
    .S1N(ConfigBits_N[129+1]),
    .S2(ConfigBits[129+2]),
    .S2N(ConfigBits_N[129+2]),
    .X(W2BEGb7)
);

 //switch matrix multiplexer WW4BEG0 MUX-4
assign WW4BEG0_input = {J_NS2_END7,J_NS4_END15,UIO_OE4,UO_OUT0};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG0 (
    .A0(WW4BEG0_input[0]),
    .A1(WW4BEG0_input[1]),
    .A2(WW4BEG0_input[2]),
    .A3(WW4BEG0_input[3]),
    .S0(ConfigBits[132+0]),
    .S0N(ConfigBits_N[132+0]),
    .S1(ConfigBits[132+1]),
    .S1N(ConfigBits_N[132+1]),
    .X(WW4BEG0)
);

 //switch matrix multiplexer WW4BEG1 MUX-4
assign WW4BEG1_input = {J_NS2_END6,J_NS4_END14,UIO_OE5,UO_OUT1};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG1 (
    .A0(WW4BEG1_input[0]),
    .A1(WW4BEG1_input[1]),
    .A2(WW4BEG1_input[2]),
    .A3(WW4BEG1_input[3]),
    .S0(ConfigBits[134+0]),
    .S0N(ConfigBits_N[134+0]),
    .S1(ConfigBits[134+1]),
    .S1N(ConfigBits_N[134+1]),
    .X(WW4BEG1)
);

 //switch matrix multiplexer WW4BEG2 MUX-4
assign WW4BEG2_input = {J_NS2_END5,J_NS4_END13,UIO_OE6,UO_OUT2};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG2 (
    .A0(WW4BEG2_input[0]),
    .A1(WW4BEG2_input[1]),
    .A2(WW4BEG2_input[2]),
    .A3(WW4BEG2_input[3]),
    .S0(ConfigBits[136+0]),
    .S0N(ConfigBits_N[136+0]),
    .S1(ConfigBits[136+1]),
    .S1N(ConfigBits_N[136+1]),
    .X(WW4BEG2)
);

 //switch matrix multiplexer WW4BEG3 MUX-4
assign WW4BEG3_input = {J_NS2_END4,J_NS4_END12,UIO_OE7,UO_OUT3};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG3 (
    .A0(WW4BEG3_input[0]),
    .A1(WW4BEG3_input[1]),
    .A2(WW4BEG3_input[2]),
    .A3(WW4BEG3_input[3]),
    .S0(ConfigBits[138+0]),
    .S0N(ConfigBits_N[138+0]),
    .S1(ConfigBits[138+1]),
    .S1N(ConfigBits_N[138+1]),
    .X(WW4BEG3)
);

 //switch matrix multiplexer WW4BEG4 MUX-4
assign WW4BEG4_input = {J_NS2_END3,J_NS4_END11,UIO_OE0,UO_OUT4};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG4 (
    .A0(WW4BEG4_input[0]),
    .A1(WW4BEG4_input[1]),
    .A2(WW4BEG4_input[2]),
    .A3(WW4BEG4_input[3]),
    .S0(ConfigBits[140+0]),
    .S0N(ConfigBits_N[140+0]),
    .S1(ConfigBits[140+1]),
    .S1N(ConfigBits_N[140+1]),
    .X(WW4BEG4)
);

 //switch matrix multiplexer WW4BEG5 MUX-4
assign WW4BEG5_input = {J_NS2_END2,J_NS4_END10,UIO_OE1,UO_OUT5};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG5 (
    .A0(WW4BEG5_input[0]),
    .A1(WW4BEG5_input[1]),
    .A2(WW4BEG5_input[2]),
    .A3(WW4BEG5_input[3]),
    .S0(ConfigBits[142+0]),
    .S0N(ConfigBits_N[142+0]),
    .S1(ConfigBits[142+1]),
    .S1N(ConfigBits_N[142+1]),
    .X(WW4BEG5)
);

 //switch matrix multiplexer WW4BEG6 MUX-4
assign WW4BEG6_input = {J_NS2_END1,J_NS4_END9,UIO_OE2,UO_OUT6};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG6 (
    .A0(WW4BEG6_input[0]),
    .A1(WW4BEG6_input[1]),
    .A2(WW4BEG6_input[2]),
    .A3(WW4BEG6_input[3]),
    .S0(ConfigBits[144+0]),
    .S0N(ConfigBits_N[144+0]),
    .S1(ConfigBits[144+1]),
    .S1N(ConfigBits_N[144+1]),
    .X(WW4BEG6)
);

 //switch matrix multiplexer WW4BEG7 MUX-4
assign WW4BEG7_input = {J_NS2_END0,J_NS4_END8,UIO_OE3,UO_OUT7};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG7 (
    .A0(WW4BEG7_input[0]),
    .A1(WW4BEG7_input[1]),
    .A2(WW4BEG7_input[2]),
    .A3(WW4BEG7_input[3]),
    .S0(ConfigBits[146+0]),
    .S0N(ConfigBits_N[146+0]),
    .S1(ConfigBits[146+1]),
    .S1N(ConfigBits_N[146+1]),
    .X(WW4BEG7)
);

 //switch matrix multiplexer WW4BEG8 MUX-4
assign WW4BEG8_input = {J_NS2_END7,J_NS4_END7,UIO_OUT0,UO_OUT4};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG8 (
    .A0(WW4BEG8_input[0]),
    .A1(WW4BEG8_input[1]),
    .A2(WW4BEG8_input[2]),
    .A3(WW4BEG8_input[3]),
    .S0(ConfigBits[148+0]),
    .S0N(ConfigBits_N[148+0]),
    .S1(ConfigBits[148+1]),
    .S1N(ConfigBits_N[148+1]),
    .X(WW4BEG8)
);

 //switch matrix multiplexer WW4BEG9 MUX-4
assign WW4BEG9_input = {J_NS2_END6,J_NS4_END6,UIO_OUT1,UO_OUT5};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG9 (
    .A0(WW4BEG9_input[0]),
    .A1(WW4BEG9_input[1]),
    .A2(WW4BEG9_input[2]),
    .A3(WW4BEG9_input[3]),
    .S0(ConfigBits[150+0]),
    .S0N(ConfigBits_N[150+0]),
    .S1(ConfigBits[150+1]),
    .S1N(ConfigBits_N[150+1]),
    .X(WW4BEG9)
);

 //switch matrix multiplexer WW4BEG10 MUX-4
assign WW4BEG10_input = {J_NS2_END5,J_NS4_END5,UIO_OUT2,UO_OUT6};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG10 (
    .A0(WW4BEG10_input[0]),
    .A1(WW4BEG10_input[1]),
    .A2(WW4BEG10_input[2]),
    .A3(WW4BEG10_input[3]),
    .S0(ConfigBits[152+0]),
    .S0N(ConfigBits_N[152+0]),
    .S1(ConfigBits[152+1]),
    .S1N(ConfigBits_N[152+1]),
    .X(WW4BEG10)
);

 //switch matrix multiplexer WW4BEG11 MUX-4
assign WW4BEG11_input = {J_NS2_END4,J_NS4_END4,UIO_OUT3,UO_OUT7};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG11 (
    .A0(WW4BEG11_input[0]),
    .A1(WW4BEG11_input[1]),
    .A2(WW4BEG11_input[2]),
    .A3(WW4BEG11_input[3]),
    .S0(ConfigBits[154+0]),
    .S0N(ConfigBits_N[154+0]),
    .S1(ConfigBits[154+1]),
    .S1N(ConfigBits_N[154+1]),
    .X(WW4BEG11)
);

 //switch matrix multiplexer WW4BEG12 MUX-4
assign WW4BEG12_input = {J_NS2_END3,J_NS4_END3,UIO_OUT4,UO_OUT0};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG12 (
    .A0(WW4BEG12_input[0]),
    .A1(WW4BEG12_input[1]),
    .A2(WW4BEG12_input[2]),
    .A3(WW4BEG12_input[3]),
    .S0(ConfigBits[156+0]),
    .S0N(ConfigBits_N[156+0]),
    .S1(ConfigBits[156+1]),
    .S1N(ConfigBits_N[156+1]),
    .X(WW4BEG12)
);

 //switch matrix multiplexer WW4BEG13 MUX-4
assign WW4BEG13_input = {J_NS2_END2,J_NS4_END2,UIO_OUT5,UO_OUT1};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG13 (
    .A0(WW4BEG13_input[0]),
    .A1(WW4BEG13_input[1]),
    .A2(WW4BEG13_input[2]),
    .A3(WW4BEG13_input[3]),
    .S0(ConfigBits[158+0]),
    .S0N(ConfigBits_N[158+0]),
    .S1(ConfigBits[158+1]),
    .S1N(ConfigBits_N[158+1]),
    .X(WW4BEG13)
);

 //switch matrix multiplexer WW4BEG14 MUX-4
assign WW4BEG14_input = {J_NS2_END1,J_NS4_END1,UIO_OUT6,UO_OUT2};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG14 (
    .A0(WW4BEG14_input[0]),
    .A1(WW4BEG14_input[1]),
    .A2(WW4BEG14_input[2]),
    .A3(WW4BEG14_input[3]),
    .S0(ConfigBits[160+0]),
    .S0N(ConfigBits_N[160+0]),
    .S1(ConfigBits[160+1]),
    .S1N(ConfigBits_N[160+1]),
    .X(WW4BEG14)
);

 //switch matrix multiplexer WW4BEG15 MUX-4
assign WW4BEG15_input = {J_NS2_END0,J_NS4_END0,UIO_OUT7,UO_OUT3};
cus_mux41_buf inst_cus_mux41_buf_WW4BEG15 (
    .A0(WW4BEG15_input[0]),
    .A1(WW4BEG15_input[1]),
    .A2(WW4BEG15_input[2]),
    .A3(WW4BEG15_input[3]),
    .S0(ConfigBits[162+0]),
    .S0N(ConfigBits_N[162+0]),
    .S1(ConfigBits[162+1]),
    .S1N(ConfigBits_N[162+1]),
    .X(WW4BEG15)
);

 //switch matrix multiplexer W6BEG0 MUX-4
assign W6BEG0_input = {J_NS4_END15,J_NS4_END11,S4END0,N4END0};
cus_mux41_buf inst_cus_mux41_buf_W6BEG0 (
    .A0(W6BEG0_input[0]),
    .A1(W6BEG0_input[1]),
    .A2(W6BEG0_input[2]),
    .A3(W6BEG0_input[3]),
    .S0(ConfigBits[164+0]),
    .S0N(ConfigBits_N[164+0]),
    .S1(ConfigBits[164+1]),
    .S1N(ConfigBits_N[164+1]),
    .X(W6BEG0)
);

 //switch matrix multiplexer W6BEG1 MUX-4
assign W6BEG1_input = {J_NS4_END14,J_NS4_END10,S4END1,N4END1};
cus_mux41_buf inst_cus_mux41_buf_W6BEG1 (
    .A0(W6BEG1_input[0]),
    .A1(W6BEG1_input[1]),
    .A2(W6BEG1_input[2]),
    .A3(W6BEG1_input[3]),
    .S0(ConfigBits[166+0]),
    .S0N(ConfigBits_N[166+0]),
    .S1(ConfigBits[166+1]),
    .S1N(ConfigBits_N[166+1]),
    .X(W6BEG1)
);

 //switch matrix multiplexer W6BEG2 MUX-4
assign W6BEG2_input = {J_NS4_END13,J_NS4_END9,S4END2,N4END2};
cus_mux41_buf inst_cus_mux41_buf_W6BEG2 (
    .A0(W6BEG2_input[0]),
    .A1(W6BEG2_input[1]),
    .A2(W6BEG2_input[2]),
    .A3(W6BEG2_input[3]),
    .S0(ConfigBits[168+0]),
    .S0N(ConfigBits_N[168+0]),
    .S1(ConfigBits[168+1]),
    .S1N(ConfigBits_N[168+1]),
    .X(W6BEG2)
);

 //switch matrix multiplexer W6BEG3 MUX-4
assign W6BEG3_input = {J_NS4_END12,J_NS4_END8,S4END3,N4END3};
cus_mux41_buf inst_cus_mux41_buf_W6BEG3 (
    .A0(W6BEG3_input[0]),
    .A1(W6BEG3_input[1]),
    .A2(W6BEG3_input[2]),
    .A3(W6BEG3_input[3]),
    .S0(ConfigBits[170+0]),
    .S0N(ConfigBits_N[170+0]),
    .S1(ConfigBits[170+1]),
    .S1N(ConfigBits_N[170+1]),
    .X(W6BEG3)
);

 //switch matrix multiplexer W6BEG4 MUX-4
assign W6BEG4_input = {J_NS2_END0,J_NS4_END11,J_NS4_END7,UIO_OUT4};
cus_mux41_buf inst_cus_mux41_buf_W6BEG4 (
    .A0(W6BEG4_input[0]),
    .A1(W6BEG4_input[1]),
    .A2(W6BEG4_input[2]),
    .A3(W6BEG4_input[3]),
    .S0(ConfigBits[172+0]),
    .S0N(ConfigBits_N[172+0]),
    .S1(ConfigBits[172+1]),
    .S1N(ConfigBits_N[172+1]),
    .X(W6BEG4)
);

 //switch matrix multiplexer W6BEG5 MUX-4
assign W6BEG5_input = {J_NS2_END1,J_NS4_END10,J_NS4_END6,UIO_OUT5};
cus_mux41_buf inst_cus_mux41_buf_W6BEG5 (
    .A0(W6BEG5_input[0]),
    .A1(W6BEG5_input[1]),
    .A2(W6BEG5_input[2]),
    .A3(W6BEG5_input[3]),
    .S0(ConfigBits[174+0]),
    .S0N(ConfigBits_N[174+0]),
    .S1(ConfigBits[174+1]),
    .S1N(ConfigBits_N[174+1]),
    .X(W6BEG5)
);

 //switch matrix multiplexer W6BEG6 MUX-4
assign W6BEG6_input = {J_NS2_END2,J_NS4_END9,J_NS4_END5,UIO_OUT6};
cus_mux41_buf inst_cus_mux41_buf_W6BEG6 (
    .A0(W6BEG6_input[0]),
    .A1(W6BEG6_input[1]),
    .A2(W6BEG6_input[2]),
    .A3(W6BEG6_input[3]),
    .S0(ConfigBits[176+0]),
    .S0N(ConfigBits_N[176+0]),
    .S1(ConfigBits[176+1]),
    .S1N(ConfigBits_N[176+1]),
    .X(W6BEG6)
);

 //switch matrix multiplexer W6BEG7 MUX-4
assign W6BEG7_input = {J_NS2_END3,J_NS4_END8,J_NS4_END4,UIO_OUT7};
cus_mux41_buf inst_cus_mux41_buf_W6BEG7 (
    .A0(W6BEG7_input[0]),
    .A1(W6BEG7_input[1]),
    .A2(W6BEG7_input[2]),
    .A3(W6BEG7_input[3]),
    .S0(ConfigBits[178+0]),
    .S0N(ConfigBits_N[178+0]),
    .S1(ConfigBits[178+1]),
    .S1N(ConfigBits_N[178+1]),
    .X(W6BEG7)
);

 //switch matrix multiplexer W6BEG8 MUX-4
assign W6BEG8_input = {J_NS2_END4,J_NS4_END7,J_NS4_END3,UIO_OUT0};
cus_mux41_buf inst_cus_mux41_buf_W6BEG8 (
    .A0(W6BEG8_input[0]),
    .A1(W6BEG8_input[1]),
    .A2(W6BEG8_input[2]),
    .A3(W6BEG8_input[3]),
    .S0(ConfigBits[180+0]),
    .S0N(ConfigBits_N[180+0]),
    .S1(ConfigBits[180+1]),
    .S1N(ConfigBits_N[180+1]),
    .X(W6BEG8)
);

 //switch matrix multiplexer W6BEG9 MUX-4
assign W6BEG9_input = {J_NS2_END5,J_NS4_END6,J_NS4_END2,UIO_OUT1};
cus_mux41_buf inst_cus_mux41_buf_W6BEG9 (
    .A0(W6BEG9_input[0]),
    .A1(W6BEG9_input[1]),
    .A2(W6BEG9_input[2]),
    .A3(W6BEG9_input[3]),
    .S0(ConfigBits[182+0]),
    .S0N(ConfigBits_N[182+0]),
    .S1(ConfigBits[182+1]),
    .S1N(ConfigBits_N[182+1]),
    .X(W6BEG9)
);

 //switch matrix multiplexer W6BEG10 MUX-4
assign W6BEG10_input = {J_NS2_END6,J_NS4_END5,J_NS4_END1,UIO_OUT2};
cus_mux41_buf inst_cus_mux41_buf_W6BEG10 (
    .A0(W6BEG10_input[0]),
    .A1(W6BEG10_input[1]),
    .A2(W6BEG10_input[2]),
    .A3(W6BEG10_input[3]),
    .S0(ConfigBits[184+0]),
    .S0N(ConfigBits_N[184+0]),
    .S1(ConfigBits[184+1]),
    .S1N(ConfigBits_N[184+1]),
    .X(W6BEG10)
);

 //switch matrix multiplexer W6BEG11 MUX-4
assign W6BEG11_input = {J_NS2_END7,J_NS4_END4,J_NS4_END0,UIO_OUT3};
cus_mux41_buf inst_cus_mux41_buf_W6BEG11 (
    .A0(W6BEG11_input[0]),
    .A1(W6BEG11_input[1]),
    .A2(W6BEG11_input[2]),
    .A3(W6BEG11_input[3]),
    .S0(ConfigBits[186+0]),
    .S0N(ConfigBits_N[186+0]),
    .S1(ConfigBits[186+1]),
    .S1N(ConfigBits_N[186+1]),
    .X(W6BEG11)
);

 //switch matrix multiplexer UI_IN0 MUX-8
assign UI_IN0_input = {GND0,J_NS2_END0,J_NS4_END0,E6END0,EE4END8,EE4END0,E2END0,E2MID0};
cus_mux81_buf inst_cus_mux81_buf_UI_IN0 (
    .A0(UI_IN0_input[0]),
    .A1(UI_IN0_input[1]),
    .A2(UI_IN0_input[2]),
    .A3(UI_IN0_input[3]),
    .A4(UI_IN0_input[4]),
    .A5(UI_IN0_input[5]),
    .A6(UI_IN0_input[6]),
    .A7(UI_IN0_input[7]),
    .S0(ConfigBits[188+0]),
    .S0N(ConfigBits_N[188+0]),
    .S1(ConfigBits[188+1]),
    .S1N(ConfigBits_N[188+1]),
    .S2(ConfigBits[188+2]),
    .S2N(ConfigBits_N[188+2]),
    .X(UI_IN0)
);

 //switch matrix multiplexer UI_IN1 MUX-8
assign UI_IN1_input = {GND0,J_NS2_END1,J_NS4_END1,E6END1,EE4END9,EE4END1,E2END1,E2MID1};
cus_mux81_buf inst_cus_mux81_buf_UI_IN1 (
    .A0(UI_IN1_input[0]),
    .A1(UI_IN1_input[1]),
    .A2(UI_IN1_input[2]),
    .A3(UI_IN1_input[3]),
    .A4(UI_IN1_input[4]),
    .A5(UI_IN1_input[5]),
    .A6(UI_IN1_input[6]),
    .A7(UI_IN1_input[7]),
    .S0(ConfigBits[191+0]),
    .S0N(ConfigBits_N[191+0]),
    .S1(ConfigBits[191+1]),
    .S1N(ConfigBits_N[191+1]),
    .S2(ConfigBits[191+2]),
    .S2N(ConfigBits_N[191+2]),
    .X(UI_IN1)
);

 //switch matrix multiplexer UI_IN2 MUX-8
assign UI_IN2_input = {GND0,J_NS2_END2,J_NS4_END2,E6END2,EE4END10,EE4END2,E2END2,E2MID2};
cus_mux81_buf inst_cus_mux81_buf_UI_IN2 (
    .A0(UI_IN2_input[0]),
    .A1(UI_IN2_input[1]),
    .A2(UI_IN2_input[2]),
    .A3(UI_IN2_input[3]),
    .A4(UI_IN2_input[4]),
    .A5(UI_IN2_input[5]),
    .A6(UI_IN2_input[6]),
    .A7(UI_IN2_input[7]),
    .S0(ConfigBits[194+0]),
    .S0N(ConfigBits_N[194+0]),
    .S1(ConfigBits[194+1]),
    .S1N(ConfigBits_N[194+1]),
    .S2(ConfigBits[194+2]),
    .S2N(ConfigBits_N[194+2]),
    .X(UI_IN2)
);

 //switch matrix multiplexer UI_IN3 MUX-8
assign UI_IN3_input = {GND0,J_NS2_END3,J_NS4_END3,E6END3,EE4END11,EE4END3,E2END3,E2MID3};
cus_mux81_buf inst_cus_mux81_buf_UI_IN3 (
    .A0(UI_IN3_input[0]),
    .A1(UI_IN3_input[1]),
    .A2(UI_IN3_input[2]),
    .A3(UI_IN3_input[3]),
    .A4(UI_IN3_input[4]),
    .A5(UI_IN3_input[5]),
    .A6(UI_IN3_input[6]),
    .A7(UI_IN3_input[7]),
    .S0(ConfigBits[197+0]),
    .S0N(ConfigBits_N[197+0]),
    .S1(ConfigBits[197+1]),
    .S1N(ConfigBits_N[197+1]),
    .S2(ConfigBits[197+2]),
    .S2N(ConfigBits_N[197+2]),
    .X(UI_IN3)
);

 //switch matrix multiplexer UI_IN4 MUX-8
assign UI_IN4_input = {GND0,J_NS2_END4,J_NS4_END4,E6END4,EE4END12,EE4END4,E2END4,E2MID4};
cus_mux81_buf inst_cus_mux81_buf_UI_IN4 (
    .A0(UI_IN4_input[0]),
    .A1(UI_IN4_input[1]),
    .A2(UI_IN4_input[2]),
    .A3(UI_IN4_input[3]),
    .A4(UI_IN4_input[4]),
    .A5(UI_IN4_input[5]),
    .A6(UI_IN4_input[6]),
    .A7(UI_IN4_input[7]),
    .S0(ConfigBits[200+0]),
    .S0N(ConfigBits_N[200+0]),
    .S1(ConfigBits[200+1]),
    .S1N(ConfigBits_N[200+1]),
    .S2(ConfigBits[200+2]),
    .S2N(ConfigBits_N[200+2]),
    .X(UI_IN4)
);

 //switch matrix multiplexer UI_IN5 MUX-8
assign UI_IN5_input = {GND0,J_NS2_END5,J_NS4_END5,E6END5,EE4END13,EE4END5,E2END5,E2MID5};
cus_mux81_buf inst_cus_mux81_buf_UI_IN5 (
    .A0(UI_IN5_input[0]),
    .A1(UI_IN5_input[1]),
    .A2(UI_IN5_input[2]),
    .A3(UI_IN5_input[3]),
    .A4(UI_IN5_input[4]),
    .A5(UI_IN5_input[5]),
    .A6(UI_IN5_input[6]),
    .A7(UI_IN5_input[7]),
    .S0(ConfigBits[203+0]),
    .S0N(ConfigBits_N[203+0]),
    .S1(ConfigBits[203+1]),
    .S1N(ConfigBits_N[203+1]),
    .S2(ConfigBits[203+2]),
    .S2N(ConfigBits_N[203+2]),
    .X(UI_IN5)
);

 //switch matrix multiplexer UI_IN6 MUX-8
assign UI_IN6_input = {GND0,J_NS2_END6,J_NS4_END6,E6END6,EE4END14,EE4END6,E2END6,E2MID6};
cus_mux81_buf inst_cus_mux81_buf_UI_IN6 (
    .A0(UI_IN6_input[0]),
    .A1(UI_IN6_input[1]),
    .A2(UI_IN6_input[2]),
    .A3(UI_IN6_input[3]),
    .A4(UI_IN6_input[4]),
    .A5(UI_IN6_input[5]),
    .A6(UI_IN6_input[6]),
    .A7(UI_IN6_input[7]),
    .S0(ConfigBits[206+0]),
    .S0N(ConfigBits_N[206+0]),
    .S1(ConfigBits[206+1]),
    .S1N(ConfigBits_N[206+1]),
    .S2(ConfigBits[206+2]),
    .S2N(ConfigBits_N[206+2]),
    .X(UI_IN6)
);

 //switch matrix multiplexer UI_IN7 MUX-8
assign UI_IN7_input = {GND0,J_NS2_END7,J_NS4_END7,E6END7,EE4END15,EE4END7,E2END7,E2MID7};
cus_mux81_buf inst_cus_mux81_buf_UI_IN7 (
    .A0(UI_IN7_input[0]),
    .A1(UI_IN7_input[1]),
    .A2(UI_IN7_input[2]),
    .A3(UI_IN7_input[3]),
    .A4(UI_IN7_input[4]),
    .A5(UI_IN7_input[5]),
    .A6(UI_IN7_input[6]),
    .A7(UI_IN7_input[7]),
    .S0(ConfigBits[209+0]),
    .S0N(ConfigBits_N[209+0]),
    .S1(ConfigBits[209+1]),
    .S1N(ConfigBits_N[209+1]),
    .S2(ConfigBits[209+2]),
    .S2N(ConfigBits_N[209+2]),
    .X(UI_IN7)
);

 //switch matrix multiplexer UIO_IN0 MUX-8
assign UIO_IN0_input = {GND0,J_NS2_END0,J_NS4_END8,E6END8,EE4END8,EE4END0,E2END0,E2MID0};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN0 (
    .A0(UIO_IN0_input[0]),
    .A1(UIO_IN0_input[1]),
    .A2(UIO_IN0_input[2]),
    .A3(UIO_IN0_input[3]),
    .A4(UIO_IN0_input[4]),
    .A5(UIO_IN0_input[5]),
    .A6(UIO_IN0_input[6]),
    .A7(UIO_IN0_input[7]),
    .S0(ConfigBits[212+0]),
    .S0N(ConfigBits_N[212+0]),
    .S1(ConfigBits[212+1]),
    .S1N(ConfigBits_N[212+1]),
    .S2(ConfigBits[212+2]),
    .S2N(ConfigBits_N[212+2]),
    .X(UIO_IN0)
);

 //switch matrix multiplexer UIO_IN1 MUX-8
assign UIO_IN1_input = {GND0,J_NS2_END1,J_NS4_END9,E6END9,EE4END9,EE4END1,E2END1,E2MID1};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN1 (
    .A0(UIO_IN1_input[0]),
    .A1(UIO_IN1_input[1]),
    .A2(UIO_IN1_input[2]),
    .A3(UIO_IN1_input[3]),
    .A4(UIO_IN1_input[4]),
    .A5(UIO_IN1_input[5]),
    .A6(UIO_IN1_input[6]),
    .A7(UIO_IN1_input[7]),
    .S0(ConfigBits[215+0]),
    .S0N(ConfigBits_N[215+0]),
    .S1(ConfigBits[215+1]),
    .S1N(ConfigBits_N[215+1]),
    .S2(ConfigBits[215+2]),
    .S2N(ConfigBits_N[215+2]),
    .X(UIO_IN1)
);

 //switch matrix multiplexer UIO_IN2 MUX-8
assign UIO_IN2_input = {GND0,J_NS2_END2,J_NS4_END10,E6END10,EE4END10,EE4END2,E2END2,E2MID2};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN2 (
    .A0(UIO_IN2_input[0]),
    .A1(UIO_IN2_input[1]),
    .A2(UIO_IN2_input[2]),
    .A3(UIO_IN2_input[3]),
    .A4(UIO_IN2_input[4]),
    .A5(UIO_IN2_input[5]),
    .A6(UIO_IN2_input[6]),
    .A7(UIO_IN2_input[7]),
    .S0(ConfigBits[218+0]),
    .S0N(ConfigBits_N[218+0]),
    .S1(ConfigBits[218+1]),
    .S1N(ConfigBits_N[218+1]),
    .S2(ConfigBits[218+2]),
    .S2N(ConfigBits_N[218+2]),
    .X(UIO_IN2)
);

 //switch matrix multiplexer UIO_IN3 MUX-8
assign UIO_IN3_input = {GND0,J_NS2_END3,J_NS4_END11,E6END11,EE4END11,EE4END3,E2END3,E2MID3};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN3 (
    .A0(UIO_IN3_input[0]),
    .A1(UIO_IN3_input[1]),
    .A2(UIO_IN3_input[2]),
    .A3(UIO_IN3_input[3]),
    .A4(UIO_IN3_input[4]),
    .A5(UIO_IN3_input[5]),
    .A6(UIO_IN3_input[6]),
    .A7(UIO_IN3_input[7]),
    .S0(ConfigBits[221+0]),
    .S0N(ConfigBits_N[221+0]),
    .S1(ConfigBits[221+1]),
    .S1N(ConfigBits_N[221+1]),
    .S2(ConfigBits[221+2]),
    .S2N(ConfigBits_N[221+2]),
    .X(UIO_IN3)
);

 //switch matrix multiplexer UIO_IN4 MUX-8
assign UIO_IN4_input = {GND0,J_NS2_END4,J_NS4_END12,EE4END12,EE4END4,E2END4,E2MID4,E1END0};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN4 (
    .A0(UIO_IN4_input[0]),
    .A1(UIO_IN4_input[1]),
    .A2(UIO_IN4_input[2]),
    .A3(UIO_IN4_input[3]),
    .A4(UIO_IN4_input[4]),
    .A5(UIO_IN4_input[5]),
    .A6(UIO_IN4_input[6]),
    .A7(UIO_IN4_input[7]),
    .S0(ConfigBits[224+0]),
    .S0N(ConfigBits_N[224+0]),
    .S1(ConfigBits[224+1]),
    .S1N(ConfigBits_N[224+1]),
    .S2(ConfigBits[224+2]),
    .S2N(ConfigBits_N[224+2]),
    .X(UIO_IN4)
);

 //switch matrix multiplexer UIO_IN5 MUX-8
assign UIO_IN5_input = {GND0,J_NS2_END5,J_NS4_END13,EE4END13,EE4END5,E2END5,E2MID5,E1END1};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN5 (
    .A0(UIO_IN5_input[0]),
    .A1(UIO_IN5_input[1]),
    .A2(UIO_IN5_input[2]),
    .A3(UIO_IN5_input[3]),
    .A4(UIO_IN5_input[4]),
    .A5(UIO_IN5_input[5]),
    .A6(UIO_IN5_input[6]),
    .A7(UIO_IN5_input[7]),
    .S0(ConfigBits[227+0]),
    .S0N(ConfigBits_N[227+0]),
    .S1(ConfigBits[227+1]),
    .S1N(ConfigBits_N[227+1]),
    .S2(ConfigBits[227+2]),
    .S2N(ConfigBits_N[227+2]),
    .X(UIO_IN5)
);

 //switch matrix multiplexer UIO_IN6 MUX-8
assign UIO_IN6_input = {GND0,J_NS2_END6,J_NS4_END14,EE4END14,EE4END6,E2END6,E2MID6,E1END2};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN6 (
    .A0(UIO_IN6_input[0]),
    .A1(UIO_IN6_input[1]),
    .A2(UIO_IN6_input[2]),
    .A3(UIO_IN6_input[3]),
    .A4(UIO_IN6_input[4]),
    .A5(UIO_IN6_input[5]),
    .A6(UIO_IN6_input[6]),
    .A7(UIO_IN6_input[7]),
    .S0(ConfigBits[230+0]),
    .S0N(ConfigBits_N[230+0]),
    .S1(ConfigBits[230+1]),
    .S1N(ConfigBits_N[230+1]),
    .S2(ConfigBits[230+2]),
    .S2N(ConfigBits_N[230+2]),
    .X(UIO_IN6)
);

 //switch matrix multiplexer UIO_IN7 MUX-8
assign UIO_IN7_input = {GND0,J_NS2_END7,J_NS4_END15,EE4END15,EE4END7,E2END7,E2MID7,E1END3};
cus_mux81_buf inst_cus_mux81_buf_UIO_IN7 (
    .A0(UIO_IN7_input[0]),
    .A1(UIO_IN7_input[1]),
    .A2(UIO_IN7_input[2]),
    .A3(UIO_IN7_input[3]),
    .A4(UIO_IN7_input[4]),
    .A5(UIO_IN7_input[5]),
    .A6(UIO_IN7_input[6]),
    .A7(UIO_IN7_input[7]),
    .S0(ConfigBits[233+0]),
    .S0N(ConfigBits_N[233+0]),
    .S1(ConfigBits[233+1]),
    .S1N(ConfigBits_N[233+1]),
    .S2(ConfigBits[233+2]),
    .S2N(ConfigBits_N[233+2]),
    .X(UIO_IN7)
);

 //switch matrix multiplexer ENA MUX-4
assign ENA_input = {VCC0,GND0,E2MID6,N2MID6};
cus_mux41_buf inst_cus_mux41_buf_ENA (
    .A0(ENA_input[0]),
    .A1(ENA_input[1]),
    .A2(ENA_input[2]),
    .A3(ENA_input[3]),
    .S0(ConfigBits[236+0]),
    .S0N(ConfigBits_N[236+0]),
    .S1(ConfigBits[236+1]),
    .S1N(ConfigBits_N[236+1]),
    .X(ENA)
);

 //switch matrix multiplexer RST_N MUX-16
assign RST_N_input = {VCC0,GND0,S2END3,S2END2,S2MID0,E2END5,E2END4,E2END3,E2END2,E2END1,E2MID6,E2MID3,E2MID0,N2END3,N2END2,N2MID6};
cus_mux161_buf inst_cus_mux161_buf_RST_N (
    .A0(RST_N_input[0]),
    .A1(RST_N_input[1]),
    .A2(RST_N_input[2]),
    .A3(RST_N_input[3]),
    .A4(RST_N_input[4]),
    .A5(RST_N_input[5]),
    .A6(RST_N_input[6]),
    .A7(RST_N_input[7]),
    .A8(RST_N_input[8]),
    .A9(RST_N_input[9]),
    .A10(RST_N_input[10]),
    .A11(RST_N_input[11]),
    .A12(RST_N_input[12]),
    .A13(RST_N_input[13]),
    .A14(RST_N_input[14]),
    .A15(RST_N_input[15]),
    .S0(ConfigBits[238+0]),
    .S0N(ConfigBits_N[238+0]),
    .S1(ConfigBits[238+1]),
    .S1N(ConfigBits_N[238+1]),
    .S2(ConfigBits[238+2]),
    .S2N(ConfigBits_N[238+2]),
    .S3(ConfigBits[238+3]),
    .S3N(ConfigBits_N[238+3]),
    .X(RST_N)
);

 //switch matrix multiplexer J_NS4_BEG0 MUX-4
assign J_NS4_BEG0_input = {S4END0,S1END0,N4END0,N1END0};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG0 (
    .A0(J_NS4_BEG0_input[0]),
    .A1(J_NS4_BEG0_input[1]),
    .A2(J_NS4_BEG0_input[2]),
    .A3(J_NS4_BEG0_input[3]),
    .S0(ConfigBits[242+0]),
    .S0N(ConfigBits_N[242+0]),
    .S1(ConfigBits[242+1]),
    .S1N(ConfigBits_N[242+1]),
    .X(J_NS4_BEG0)
);

 //switch matrix multiplexer J_NS4_BEG1 MUX-4
assign J_NS4_BEG1_input = {S4END1,S1END1,N4END1,N1END1};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG1 (
    .A0(J_NS4_BEG1_input[0]),
    .A1(J_NS4_BEG1_input[1]),
    .A2(J_NS4_BEG1_input[2]),
    .A3(J_NS4_BEG1_input[3]),
    .S0(ConfigBits[244+0]),
    .S0N(ConfigBits_N[244+0]),
    .S1(ConfigBits[244+1]),
    .S1N(ConfigBits_N[244+1]),
    .X(J_NS4_BEG1)
);

 //switch matrix multiplexer J_NS4_BEG2 MUX-4
assign J_NS4_BEG2_input = {S4END2,S1END2,N4END2,N1END2};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG2 (
    .A0(J_NS4_BEG2_input[0]),
    .A1(J_NS4_BEG2_input[1]),
    .A2(J_NS4_BEG2_input[2]),
    .A3(J_NS4_BEG2_input[3]),
    .S0(ConfigBits[246+0]),
    .S0N(ConfigBits_N[246+0]),
    .S1(ConfigBits[246+1]),
    .S1N(ConfigBits_N[246+1]),
    .X(J_NS4_BEG2)
);

 //switch matrix multiplexer J_NS4_BEG3 MUX-4
assign J_NS4_BEG3_input = {S4END3,S1END3,N4END3,N1END3};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG3 (
    .A0(J_NS4_BEG3_input[0]),
    .A1(J_NS4_BEG3_input[1]),
    .A2(J_NS4_BEG3_input[2]),
    .A3(J_NS4_BEG3_input[3]),
    .S0(ConfigBits[248+0]),
    .S0N(ConfigBits_N[248+0]),
    .S1(ConfigBits[248+1]),
    .S1N(ConfigBits_N[248+1]),
    .X(J_NS4_BEG3)
);

 //switch matrix multiplexer J_NS4_BEG4 MUX-4
assign J_NS4_BEG4_input = {S4END0,S1END0,N4END0,N1END0};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG4 (
    .A0(J_NS4_BEG4_input[0]),
    .A1(J_NS4_BEG4_input[1]),
    .A2(J_NS4_BEG4_input[2]),
    .A3(J_NS4_BEG4_input[3]),
    .S0(ConfigBits[250+0]),
    .S0N(ConfigBits_N[250+0]),
    .S1(ConfigBits[250+1]),
    .S1N(ConfigBits_N[250+1]),
    .X(J_NS4_BEG4)
);

 //switch matrix multiplexer J_NS4_BEG5 MUX-4
assign J_NS4_BEG5_input = {S4END1,S1END1,N4END1,N1END1};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG5 (
    .A0(J_NS4_BEG5_input[0]),
    .A1(J_NS4_BEG5_input[1]),
    .A2(J_NS4_BEG5_input[2]),
    .A3(J_NS4_BEG5_input[3]),
    .S0(ConfigBits[252+0]),
    .S0N(ConfigBits_N[252+0]),
    .S1(ConfigBits[252+1]),
    .S1N(ConfigBits_N[252+1]),
    .X(J_NS4_BEG5)
);

 //switch matrix multiplexer J_NS4_BEG6 MUX-4
assign J_NS4_BEG6_input = {S4END2,S1END2,N4END2,N1END2};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG6 (
    .A0(J_NS4_BEG6_input[0]),
    .A1(J_NS4_BEG6_input[1]),
    .A2(J_NS4_BEG6_input[2]),
    .A3(J_NS4_BEG6_input[3]),
    .S0(ConfigBits[254+0]),
    .S0N(ConfigBits_N[254+0]),
    .S1(ConfigBits[254+1]),
    .S1N(ConfigBits_N[254+1]),
    .X(J_NS4_BEG6)
);

 //switch matrix multiplexer J_NS4_BEG7 MUX-4
assign J_NS4_BEG7_input = {S4END3,S1END3,N4END3,N1END3};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG7 (
    .A0(J_NS4_BEG7_input[0]),
    .A1(J_NS4_BEG7_input[1]),
    .A2(J_NS4_BEG7_input[2]),
    .A3(J_NS4_BEG7_input[3]),
    .S0(ConfigBits[256+0]),
    .S0N(ConfigBits_N[256+0]),
    .S1(ConfigBits[256+1]),
    .S1N(ConfigBits_N[256+1]),
    .X(J_NS4_BEG7)
);

 //switch matrix multiplexer J_NS4_BEG8 MUX-4
assign J_NS4_BEG8_input = {S4END0,S1END0,N4END0,N1END0};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG8 (
    .A0(J_NS4_BEG8_input[0]),
    .A1(J_NS4_BEG8_input[1]),
    .A2(J_NS4_BEG8_input[2]),
    .A3(J_NS4_BEG8_input[3]),
    .S0(ConfigBits[258+0]),
    .S0N(ConfigBits_N[258+0]),
    .S1(ConfigBits[258+1]),
    .S1N(ConfigBits_N[258+1]),
    .X(J_NS4_BEG8)
);

 //switch matrix multiplexer J_NS4_BEG9 MUX-4
assign J_NS4_BEG9_input = {S4END1,S1END1,N4END1,N1END1};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG9 (
    .A0(J_NS4_BEG9_input[0]),
    .A1(J_NS4_BEG9_input[1]),
    .A2(J_NS4_BEG9_input[2]),
    .A3(J_NS4_BEG9_input[3]),
    .S0(ConfigBits[260+0]),
    .S0N(ConfigBits_N[260+0]),
    .S1(ConfigBits[260+1]),
    .S1N(ConfigBits_N[260+1]),
    .X(J_NS4_BEG9)
);

 //switch matrix multiplexer J_NS4_BEG10 MUX-4
assign J_NS4_BEG10_input = {S4END2,S1END2,N4END2,N1END2};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG10 (
    .A0(J_NS4_BEG10_input[0]),
    .A1(J_NS4_BEG10_input[1]),
    .A2(J_NS4_BEG10_input[2]),
    .A3(J_NS4_BEG10_input[3]),
    .S0(ConfigBits[262+0]),
    .S0N(ConfigBits_N[262+0]),
    .S1(ConfigBits[262+1]),
    .S1N(ConfigBits_N[262+1]),
    .X(J_NS4_BEG10)
);

 //switch matrix multiplexer J_NS4_BEG11 MUX-4
assign J_NS4_BEG11_input = {S4END3,S1END3,N4END3,N1END3};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG11 (
    .A0(J_NS4_BEG11_input[0]),
    .A1(J_NS4_BEG11_input[1]),
    .A2(J_NS4_BEG11_input[2]),
    .A3(J_NS4_BEG11_input[3]),
    .S0(ConfigBits[264+0]),
    .S0N(ConfigBits_N[264+0]),
    .S1(ConfigBits[264+1]),
    .S1N(ConfigBits_N[264+1]),
    .X(J_NS4_BEG11)
);

 //switch matrix multiplexer J_NS4_BEG12 MUX-4
assign J_NS4_BEG12_input = {S4END0,S1END0,N4END0,N1END0};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG12 (
    .A0(J_NS4_BEG12_input[0]),
    .A1(J_NS4_BEG12_input[1]),
    .A2(J_NS4_BEG12_input[2]),
    .A3(J_NS4_BEG12_input[3]),
    .S0(ConfigBits[266+0]),
    .S0N(ConfigBits_N[266+0]),
    .S1(ConfigBits[266+1]),
    .S1N(ConfigBits_N[266+1]),
    .X(J_NS4_BEG12)
);

 //switch matrix multiplexer J_NS4_BEG13 MUX-4
assign J_NS4_BEG13_input = {S4END1,S1END1,N4END1,N1END1};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG13 (
    .A0(J_NS4_BEG13_input[0]),
    .A1(J_NS4_BEG13_input[1]),
    .A2(J_NS4_BEG13_input[2]),
    .A3(J_NS4_BEG13_input[3]),
    .S0(ConfigBits[268+0]),
    .S0N(ConfigBits_N[268+0]),
    .S1(ConfigBits[268+1]),
    .S1N(ConfigBits_N[268+1]),
    .X(J_NS4_BEG13)
);

 //switch matrix multiplexer J_NS4_BEG14 MUX-4
assign J_NS4_BEG14_input = {S4END2,S1END2,N4END2,N1END2};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG14 (
    .A0(J_NS4_BEG14_input[0]),
    .A1(J_NS4_BEG14_input[1]),
    .A2(J_NS4_BEG14_input[2]),
    .A3(J_NS4_BEG14_input[3]),
    .S0(ConfigBits[270+0]),
    .S0N(ConfigBits_N[270+0]),
    .S1(ConfigBits[270+1]),
    .S1N(ConfigBits_N[270+1]),
    .X(J_NS4_BEG14)
);

 //switch matrix multiplexer J_NS4_BEG15 MUX-4
assign J_NS4_BEG15_input = {S4END3,S1END3,N4END3,N1END3};
cus_mux41_buf inst_cus_mux41_buf_J_NS4_BEG15 (
    .A0(J_NS4_BEG15_input[0]),
    .A1(J_NS4_BEG15_input[1]),
    .A2(J_NS4_BEG15_input[2]),
    .A3(J_NS4_BEG15_input[3]),
    .S0(ConfigBits[272+0]),
    .S0N(ConfigBits_N[272+0]),
    .S1(ConfigBits[272+1]),
    .S1N(ConfigBits_N[272+1]),
    .X(J_NS4_BEG15)
);

 //switch matrix multiplexer J_NS2_BEG0 MUX-4
assign J_NS2_BEG0_input = {S2END0,S2MID0,N2END0,N2MID0};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG0 (
    .A0(J_NS2_BEG0_input[0]),
    .A1(J_NS2_BEG0_input[1]),
    .A2(J_NS2_BEG0_input[2]),
    .A3(J_NS2_BEG0_input[3]),
    .S0(ConfigBits[274+0]),
    .S0N(ConfigBits_N[274+0]),
    .S1(ConfigBits[274+1]),
    .S1N(ConfigBits_N[274+1]),
    .X(J_NS2_BEG0)
);

 //switch matrix multiplexer J_NS2_BEG1 MUX-4
assign J_NS2_BEG1_input = {S2END1,S2MID1,N2END1,N2MID1};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG1 (
    .A0(J_NS2_BEG1_input[0]),
    .A1(J_NS2_BEG1_input[1]),
    .A2(J_NS2_BEG1_input[2]),
    .A3(J_NS2_BEG1_input[3]),
    .S0(ConfigBits[276+0]),
    .S0N(ConfigBits_N[276+0]),
    .S1(ConfigBits[276+1]),
    .S1N(ConfigBits_N[276+1]),
    .X(J_NS2_BEG1)
);

 //switch matrix multiplexer J_NS2_BEG2 MUX-4
assign J_NS2_BEG2_input = {S2END2,S2MID2,N2END2,N2MID2};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG2 (
    .A0(J_NS2_BEG2_input[0]),
    .A1(J_NS2_BEG2_input[1]),
    .A2(J_NS2_BEG2_input[2]),
    .A3(J_NS2_BEG2_input[3]),
    .S0(ConfigBits[278+0]),
    .S0N(ConfigBits_N[278+0]),
    .S1(ConfigBits[278+1]),
    .S1N(ConfigBits_N[278+1]),
    .X(J_NS2_BEG2)
);

 //switch matrix multiplexer J_NS2_BEG3 MUX-4
assign J_NS2_BEG3_input = {S2END3,S2MID3,N2END3,N2MID3};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG3 (
    .A0(J_NS2_BEG3_input[0]),
    .A1(J_NS2_BEG3_input[1]),
    .A2(J_NS2_BEG3_input[2]),
    .A3(J_NS2_BEG3_input[3]),
    .S0(ConfigBits[280+0]),
    .S0N(ConfigBits_N[280+0]),
    .S1(ConfigBits[280+1]),
    .S1N(ConfigBits_N[280+1]),
    .X(J_NS2_BEG3)
);

 //switch matrix multiplexer J_NS2_BEG4 MUX-4
assign J_NS2_BEG4_input = {S2END4,S2MID4,N2END4,N2MID4};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG4 (
    .A0(J_NS2_BEG4_input[0]),
    .A1(J_NS2_BEG4_input[1]),
    .A2(J_NS2_BEG4_input[2]),
    .A3(J_NS2_BEG4_input[3]),
    .S0(ConfigBits[282+0]),
    .S0N(ConfigBits_N[282+0]),
    .S1(ConfigBits[282+1]),
    .S1N(ConfigBits_N[282+1]),
    .X(J_NS2_BEG4)
);

 //switch matrix multiplexer J_NS2_BEG5 MUX-4
assign J_NS2_BEG5_input = {S2END5,S2MID5,N2END5,N2MID5};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG5 (
    .A0(J_NS2_BEG5_input[0]),
    .A1(J_NS2_BEG5_input[1]),
    .A2(J_NS2_BEG5_input[2]),
    .A3(J_NS2_BEG5_input[3]),
    .S0(ConfigBits[284+0]),
    .S0N(ConfigBits_N[284+0]),
    .S1(ConfigBits[284+1]),
    .S1N(ConfigBits_N[284+1]),
    .X(J_NS2_BEG5)
);

 //switch matrix multiplexer J_NS2_BEG6 MUX-4
assign J_NS2_BEG6_input = {S2END6,S2MID6,N2END6,N2MID6};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG6 (
    .A0(J_NS2_BEG6_input[0]),
    .A1(J_NS2_BEG6_input[1]),
    .A2(J_NS2_BEG6_input[2]),
    .A3(J_NS2_BEG6_input[3]),
    .S0(ConfigBits[286+0]),
    .S0N(ConfigBits_N[286+0]),
    .S1(ConfigBits[286+1]),
    .S1N(ConfigBits_N[286+1]),
    .X(J_NS2_BEG6)
);

 //switch matrix multiplexer J_NS2_BEG7 MUX-4
assign J_NS2_BEG7_input = {S2END7,S2MID7,N2END7,N2MID7};
cus_mux41_buf inst_cus_mux41_buf_J_NS2_BEG7 (
    .A0(J_NS2_BEG7_input[0]),
    .A1(J_NS2_BEG7_input[1]),
    .A2(J_NS2_BEG7_input[2]),
    .A3(J_NS2_BEG7_input[3]),
    .S0(ConfigBits[288+0]),
    .S0N(ConfigBits_N[288+0]),
    .S1(ConfigBits[288+1]),
    .S1N(ConfigBits_N[288+1]),
    .X(J_NS2_BEG7)
);

 //switch matrix multiplexer J_NS1_BEG0 MUX-4
assign J_NS1_BEG0_input = {GND0,S1END0,E6END0,N1END0};
cus_mux41_buf inst_cus_mux41_buf_J_NS1_BEG0 (
    .A0(J_NS1_BEG0_input[0]),
    .A1(J_NS1_BEG0_input[1]),
    .A2(J_NS1_BEG0_input[2]),
    .A3(J_NS1_BEG0_input[3]),
    .S0(ConfigBits[290+0]),
    .S0N(ConfigBits_N[290+0]),
    .S1(ConfigBits[290+1]),
    .S1N(ConfigBits_N[290+1]),
    .X(J_NS1_BEG0)
);

 //switch matrix multiplexer J_NS1_BEG1 MUX-4
assign J_NS1_BEG1_input = {GND0,S1END1,E6END1,N1END1};
cus_mux41_buf inst_cus_mux41_buf_J_NS1_BEG1 (
    .A0(J_NS1_BEG1_input[0]),
    .A1(J_NS1_BEG1_input[1]),
    .A2(J_NS1_BEG1_input[2]),
    .A3(J_NS1_BEG1_input[3]),
    .S0(ConfigBits[292+0]),
    .S0N(ConfigBits_N[292+0]),
    .S1(ConfigBits[292+1]),
    .S1N(ConfigBits_N[292+1]),
    .X(J_NS1_BEG1)
);

 //switch matrix multiplexer J_NS1_BEG2 MUX-4
assign J_NS1_BEG2_input = {GND0,S1END2,E6END2,N1END2};
cus_mux41_buf inst_cus_mux41_buf_J_NS1_BEG2 (
    .A0(J_NS1_BEG2_input[0]),
    .A1(J_NS1_BEG2_input[1]),
    .A2(J_NS1_BEG2_input[2]),
    .A3(J_NS1_BEG2_input[3]),
    .S0(ConfigBits[294+0]),
    .S0N(ConfigBits_N[294+0]),
    .S1(ConfigBits[294+1]),
    .S1N(ConfigBits_N[294+1]),
    .X(J_NS1_BEG2)
);

 //switch matrix multiplexer J_NS1_BEG3 MUX-4
assign J_NS1_BEG3_input = {GND0,S1END3,E6END3,N1END3};
cus_mux41_buf inst_cus_mux41_buf_J_NS1_BEG3 (
    .A0(J_NS1_BEG3_input[0]),
    .A1(J_NS1_BEG3_input[1]),
    .A2(J_NS1_BEG3_input[2]),
    .A3(J_NS1_BEG3_input[3]),
    .S0(ConfigBits[296+0]),
    .S0N(ConfigBits_N[296+0]),
    .S1(ConfigBits[296+1]),
    .S1N(ConfigBits_N[296+1]),
    .X(J_NS1_BEG3)
);


assign DEBUG_select_N1BEG0          = ConfigBits[1:0];
assign DEBUG_select_N1BEG1          = ConfigBits[3:2];
assign DEBUG_select_N1BEG2          = ConfigBits[5:4];
assign DEBUG_select_N1BEG3          = ConfigBits[7:6];
assign DEBUG_select_N2BEG0          = ConfigBits[9:8];
assign DEBUG_select_N2BEG1          = ConfigBits[11:10];
assign DEBUG_select_N2BEG2          = ConfigBits[13:12];
assign DEBUG_select_N2BEG3          = ConfigBits[15:14];
assign DEBUG_select_N2BEG4          = ConfigBits[17:16];
assign DEBUG_select_N2BEG5          = ConfigBits[19:18];
assign DEBUG_select_N2BEG6          = ConfigBits[21:20];
assign DEBUG_select_N2BEG7          = ConfigBits[23:22];
assign DEBUG_select_N4BEG0          = ConfigBits[26:24];
assign DEBUG_select_N4BEG1          = ConfigBits[29:27];
assign DEBUG_select_N4BEG2          = ConfigBits[32:30];
assign DEBUG_select_N4BEG3          = ConfigBits[35:33];
assign DEBUG_select_S1BEG0          = ConfigBits[37:36];
assign DEBUG_select_S1BEG1          = ConfigBits[39:38];
assign DEBUG_select_S1BEG2          = ConfigBits[41:40];
assign DEBUG_select_S1BEG3          = ConfigBits[43:42];
assign DEBUG_select_S2BEG0          = ConfigBits[45:44];
assign DEBUG_select_S2BEG1          = ConfigBits[47:46];
assign DEBUG_select_S2BEG2          = ConfigBits[49:48];
assign DEBUG_select_S2BEG3          = ConfigBits[51:50];
assign DEBUG_select_S2BEG4          = ConfigBits[53:52];
assign DEBUG_select_S2BEG5          = ConfigBits[55:54];
assign DEBUG_select_S2BEG6          = ConfigBits[57:56];
assign DEBUG_select_S2BEG7          = ConfigBits[59:58];
assign DEBUG_select_S4BEG0          = ConfigBits[62:60];
assign DEBUG_select_S4BEG1          = ConfigBits[65:63];
assign DEBUG_select_S4BEG2          = ConfigBits[68:66];
assign DEBUG_select_S4BEG3          = ConfigBits[71:69];
assign DEBUG_select_W1BEG0          = ConfigBits[74:72];
assign DEBUG_select_W1BEG1          = ConfigBits[77:75];
assign DEBUG_select_W1BEG2          = ConfigBits[80:78];
assign DEBUG_select_W1BEG3          = ConfigBits[83:81];
assign DEBUG_select_W2BEG0          = ConfigBits[86:84];
assign DEBUG_select_W2BEG1          = ConfigBits[89:87];
assign DEBUG_select_W2BEG2          = ConfigBits[92:90];
assign DEBUG_select_W2BEG3          = ConfigBits[95:93];
assign DEBUG_select_W2BEG4          = ConfigBits[98:96];
assign DEBUG_select_W2BEG5          = ConfigBits[101:99];
assign DEBUG_select_W2BEG6          = ConfigBits[104:102];
assign DEBUG_select_W2BEG7          = ConfigBits[107:105];
assign DEBUG_select_W2BEGb0         = ConfigBits[110:108];
assign DEBUG_select_W2BEGb1         = ConfigBits[113:111];
assign DEBUG_select_W2BEGb2         = ConfigBits[116:114];
assign DEBUG_select_W2BEGb3         = ConfigBits[119:117];
assign DEBUG_select_W2BEGb4         = ConfigBits[122:120];
assign DEBUG_select_W2BEGb5         = ConfigBits[125:123];
assign DEBUG_select_W2BEGb6         = ConfigBits[128:126];
assign DEBUG_select_W2BEGb7         = ConfigBits[131:129];
assign DEBUG_select_WW4BEG0         = ConfigBits[133:132];
assign DEBUG_select_WW4BEG1         = ConfigBits[135:134];
assign DEBUG_select_WW4BEG2         = ConfigBits[137:136];
assign DEBUG_select_WW4BEG3         = ConfigBits[139:138];
assign DEBUG_select_WW4BEG4         = ConfigBits[141:140];
assign DEBUG_select_WW4BEG5         = ConfigBits[143:142];
assign DEBUG_select_WW4BEG6         = ConfigBits[145:144];
assign DEBUG_select_WW4BEG7         = ConfigBits[147:146];
assign DEBUG_select_WW4BEG8         = ConfigBits[149:148];
assign DEBUG_select_WW4BEG9         = ConfigBits[151:150];
assign DEBUG_select_WW4BEG10        = ConfigBits[153:152];
assign DEBUG_select_WW4BEG11        = ConfigBits[155:154];
assign DEBUG_select_WW4BEG12        = ConfigBits[157:156];
assign DEBUG_select_WW4BEG13        = ConfigBits[159:158];
assign DEBUG_select_WW4BEG14        = ConfigBits[161:160];
assign DEBUG_select_WW4BEG15        = ConfigBits[163:162];
assign DEBUG_select_W6BEG0          = ConfigBits[165:164];
assign DEBUG_select_W6BEG1          = ConfigBits[167:166];
assign DEBUG_select_W6BEG2          = ConfigBits[169:168];
assign DEBUG_select_W6BEG3          = ConfigBits[171:170];
assign DEBUG_select_W6BEG4          = ConfigBits[173:172];
assign DEBUG_select_W6BEG5          = ConfigBits[175:174];
assign DEBUG_select_W6BEG6          = ConfigBits[177:176];
assign DEBUG_select_W6BEG7          = ConfigBits[179:178];
assign DEBUG_select_W6BEG8          = ConfigBits[181:180];
assign DEBUG_select_W6BEG9          = ConfigBits[183:182];
assign DEBUG_select_W6BEG10         = ConfigBits[185:184];
assign DEBUG_select_W6BEG11         = ConfigBits[187:186];
assign DEBUG_select_UI_IN0          = ConfigBits[190:188];
assign DEBUG_select_UI_IN1          = ConfigBits[193:191];
assign DEBUG_select_UI_IN2          = ConfigBits[196:194];
assign DEBUG_select_UI_IN3          = ConfigBits[199:197];
assign DEBUG_select_UI_IN4          = ConfigBits[202:200];
assign DEBUG_select_UI_IN5          = ConfigBits[205:203];
assign DEBUG_select_UI_IN6          = ConfigBits[208:206];
assign DEBUG_select_UI_IN7          = ConfigBits[211:209];
assign DEBUG_select_UIO_IN0         = ConfigBits[214:212];
assign DEBUG_select_UIO_IN1         = ConfigBits[217:215];
assign DEBUG_select_UIO_IN2         = ConfigBits[220:218];
assign DEBUG_select_UIO_IN3         = ConfigBits[223:221];
assign DEBUG_select_UIO_IN4         = ConfigBits[226:224];
assign DEBUG_select_UIO_IN5         = ConfigBits[229:227];
assign DEBUG_select_UIO_IN6         = ConfigBits[232:230];
assign DEBUG_select_UIO_IN7         = ConfigBits[235:233];
assign DEBUG_select_ENA             = ConfigBits[237:236];
assign DEBUG_select_RST_N           = ConfigBits[241:238];
assign DEBUG_select_J_NS4_BEG0      = ConfigBits[243:242];
assign DEBUG_select_J_NS4_BEG1      = ConfigBits[245:244];
assign DEBUG_select_J_NS4_BEG2      = ConfigBits[247:246];
assign DEBUG_select_J_NS4_BEG3      = ConfigBits[249:248];
assign DEBUG_select_J_NS4_BEG4      = ConfigBits[251:250];
assign DEBUG_select_J_NS4_BEG5      = ConfigBits[253:252];
assign DEBUG_select_J_NS4_BEG6      = ConfigBits[255:254];
assign DEBUG_select_J_NS4_BEG7      = ConfigBits[257:256];
assign DEBUG_select_J_NS4_BEG8      = ConfigBits[259:258];
assign DEBUG_select_J_NS4_BEG9      = ConfigBits[261:260];
assign DEBUG_select_J_NS4_BEG10     = ConfigBits[263:262];
assign DEBUG_select_J_NS4_BEG11     = ConfigBits[265:264];
assign DEBUG_select_J_NS4_BEG12     = ConfigBits[267:266];
assign DEBUG_select_J_NS4_BEG13     = ConfigBits[269:268];
assign DEBUG_select_J_NS4_BEG14     = ConfigBits[271:270];
assign DEBUG_select_J_NS4_BEG15     = ConfigBits[273:272];
assign DEBUG_select_J_NS2_BEG0      = ConfigBits[275:274];
assign DEBUG_select_J_NS2_BEG1      = ConfigBits[277:276];
assign DEBUG_select_J_NS2_BEG2      = ConfigBits[279:278];
assign DEBUG_select_J_NS2_BEG3      = ConfigBits[281:280];
assign DEBUG_select_J_NS2_BEG4      = ConfigBits[283:282];
assign DEBUG_select_J_NS2_BEG5      = ConfigBits[285:284];
assign DEBUG_select_J_NS2_BEG6      = ConfigBits[287:286];
assign DEBUG_select_J_NS2_BEG7      = ConfigBits[289:288];
assign DEBUG_select_J_NS1_BEG0      = ConfigBits[291:290];
assign DEBUG_select_J_NS1_BEG1      = ConfigBits[293:292];
assign DEBUG_select_J_NS1_BEG2      = ConfigBits[295:294];
assign DEBUG_select_J_NS1_BEG3      = ConfigBits[297:296];
endmodule