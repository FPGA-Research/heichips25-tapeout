from contextlib import redirect_stdout

FABRIC_NAME = "classic_fabric_heichips25"
FABRIC_HEIGHT = 11
FABRIC_WIDTH = 6
FABRIC_NUM_IO_NORTH = 16
FABRIC_NUM_IO_SOUTH = 16
BELS_PER_IO_TILE = ['A', 'B', 'C', 'D']
NUM_SRAM = 1
SRAM_WIDTH = 32

# coord: (module, instance)
tt_projects = {
    # left side
    #'X0Y1'
    'X0Y2': ('heichips25_snitch_wrapper',   'heichips25_example_large_0'),
    'X0Y3': ('heichips25_CORDIC',           'heichips25_example_small_0'),
    'X0Y4': ('heichips25_tiny_wrapper2',    'heichips25_example_small_1'),
    'X0Y5': ('heichips25_top_sorter',       'heichips25_example_small_2'),
    'X0Y6': ('heichips25_systolicArrayTop', 'heichips25_example_small_3'),
    'X0Y7': ('heichips25_pudding',          'heichips25_example_small_4'),
    #'X0Y8'
    'X0Y9': ('heichips25_fazyrv_exotiny',   'heichips25_example_large_1'),

    # right side
    # SRAM Top
    # SRAM Bot
    'X5Y1': ('heichips25_internal',         'heichips25_example_small_5'),
    'X5Y2': ('heichips25_ethernet',         'heichips25_example_small_6'),
    'X5Y3': ('heichips25_SDR',              'heichips25_example_small_7'),
    'X5Y4': ('heichips25_ICELab',           'heichips25_example_small_8'),
    #'X5Y5'
    #'X5Y6' - SRAM
    'X5Y7': ('heichips25_bagel',            'heichips25_example_small_9'),
    'X5Y8': ('heichips25_tiny_wrapper',     'heichips25_example_small_10'),
    'X5Y9': ('heichips25_usb_cdc',          'heichips25_example_small_11'),
}

with open('fabric_wrapper.sv', 'w') as f:
    with redirect_stdout(f):

        print("""`default_nettype none

module fabric_wrapper #(
    parameter FrameBitsPerRow = 32,
    parameter MaxFramesPerCol = 20,
    
    parameter NumColumns = 6,
    parameter NumRows = 11,
    
    parameter FABRIC_NUM_IO_NORTH = 16,
    parameter FABRIC_NUM_IO_SOUTH = 16
)(\n""")

        print(f'    // Configuration')
        print("""    input  logic [(FrameBitsPerRow*NumRows)-1:0]    FrameData_i,""")
        print("""    input  logic [(MaxFramesPerCol*NumColumns)-1:0] FrameStrobe_i,\n""")

        print(f'    // Fabric is configured')
        print("""    input                                configured_i,""")
        print("""    input                                sys_reset_i,\n""")

        # I/Os
        print(f'    // I/Os North')
        print("""    input  [FABRIC_NUM_IO_NORTH-1:0]      io_north_in_i,
    output [FABRIC_NUM_IO_NORTH-1:0]      io_north_out_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      io_north_oe_o,\n""")

        print(f'    // I/Os South')
        print("""    input  [FABRIC_NUM_IO_SOUTH-1:0]      io_south_in_i,
    output [FABRIC_NUM_IO_SOUTH-1:0]      io_south_out_o,
    output [FABRIC_NUM_IO_SOUTH-1:0]      io_south_oe_o,\n""")

        print("""    // User I/O
    output usb_dn_en_o,
    input  usb_dn_rx_i,
    output usb_dn_tx_o,
    output usb_dp_en_o,
    input  usb_dp_rx_i,
    output usb_dp_tx_o,
    output usb_dp_up_o,
    
    output tmds_b,
    output tmds_g,
    output tmds_r,
    output tmds_clk,
    
    inout icelab_analog_pin0,
    inout icelab_analog_pin1,
    inout icelab_analog_pin2,
    inout icelab_analog_pin3,
    
    inout internal_analog_pin0,
    inout internal_analog_pin1,
    inout internal_analog_pin2,
    
    inout pudding_i_in,
    inout pudding_i_out,
    
    output ethernet_dp,
    output ethernet_dn
);\n""")

        for i, coords in enumerate(tt_projects.keys()):
            print(f'    // TT_PROJECT {i} ({coords})')
            print(f'    logic [7:0] tt_project_{i}_ui_in;')
            print(f'    logic [7:0] tt_project_{i}_uo_out;')
            print(f'    logic [7:0] tt_project_{i}_uio_in;')
            print(f'    logic [7:0] tt_project_{i}_uio_out;')
            print(f'    logic [7:0] tt_project_{i}_uio_oe;')
            print(f'    logic  tt_project_{i}_ena;')
            print(f'    logic  tt_project_{i}_clk;')
            print(f'    logic  tt_project_{i}_rst_n;\n')

        # SRAM
        for i in range(NUM_SRAM):
            print(f'    // SRAM {i}')
            print(f"""    logic [{SRAM_WIDTH-1}:0] fabric_sram{i}_dout_i;
    logic [9 :0] fabric_sram{i}_addr_o;
    logic [{SRAM_WIDTH-1}:0] fabric_sram{i}_bm_o;
    logic [{SRAM_WIDTH-1}:0] fabric_sram{i}_din_o;
    logic        fabric_sram{i}_wen_o;
    logic        fabric_sram{i}_men_o;
    logic        fabric_sram{i}_ren_o;
    logic        fabric_sram{i}_clk_o;
    logic        fabric_sram{i}_tie_high_o;
    logic        fabric_sram{i}_tie_low_o;\n""")


        print(f"""    {FABRIC_NAME}
    //#(
    //    .MaxFramesPerCol(MaxFramesPerCol),
    //    .FrameBitsPerRow(FrameBitsPerRow)
    //)
    {FABRIC_NAME}
    (""")

        print(f"""        .FrameData      (FrameData_i),""")
        print(f"""        .FrameStrobe    (FrameStrobe_i),\n""")

        # I/Os
        print(f"""        // North I/Os""")
        num_bels = len(BELS_PER_IO_TILE)
        IO_NORTH_OFFSET = 1
        for i in range(IO_NORTH_OFFSET,(FABRIC_NUM_IO_NORTH//num_bels)+1):
            for j, bel in enumerate(BELS_PER_IO_TILE):
                print(f"""        .Tile_X{i}Y0_{bel}_OUT_top(io_north_in_i[{(i-IO_NORTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y0_{bel}_IN_top(io_north_out_o[{(i-IO_NORTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y0_{bel}_EN_top(io_north_oe_o[{(i-IO_NORTH_OFFSET)*num_bels+j}]),\n""")

        # I/Os
        print(f"""        // South I/Os""")
        num_bels = len(BELS_PER_IO_TILE)
        IO_SOUTH_OFFSET = 1
        for i in range(IO_SOUTH_OFFSET,(FABRIC_NUM_IO_SOUTH//num_bels)+1):
            for j, bel in enumerate(BELS_PER_IO_TILE):
                print(f"""        .Tile_X{i}Y{FABRIC_HEIGHT-1}_{bel}_OUT_top(io_south_in_i[{(i-IO_SOUTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y{FABRIC_HEIGHT-1}_{bel}_IN_top(io_south_out_o[{(i-IO_SOUTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y{FABRIC_HEIGHT-1}_{bel}_EN_top(io_south_oe_o[{(i-IO_SOUTH_OFFSET)*num_bels+j}]),\n""")

        # SYS_RESET
        print(f"""        // SYS_RESET""")
        print(f"""        .Tile_X0Y10_SYS_RESET_RESET_top(sys_reset_i),\n""")

        # TT_PROJECT
        for i, coords in enumerate(tt_projects.keys()):
            print(f'        // TT_PROJECT {i} ({coords})')
            
            for j in range(8):
                print(f'        .Tile_{coords}_UI_IN_TT_PROJECT{j}(tt_project_{i}_ui_in[{j}]),')
            for j in range(8):
                print(f'        .Tile_{coords}_UO_OUT_TT_PROJECT{j}(tt_project_{i}_uo_out[{j}]),')
            for j in range(8):
                print(f'        .Tile_{coords}_UIO_IN_TT_PROJECT{j}(tt_project_{i}_uio_in[{j}]),')
            for j in range(8):
                print(f'        .Tile_{coords}_UIO_OUT_TT_PROJECT{j}(tt_project_{i}_uio_out[{j}]),')
            for j in range(8):
                print(f'        .Tile_{coords}_UIO_OE_TT_PROJECT{j}(tt_project_{i}_uio_oe[{j}]),')

            print(f'        .Tile_{coords}_ENA_TT_PROJECT(tt_project_{i}_ena),')
            print(f'        .Tile_{coords}_CLK_TT_PROJECT(tt_project_{i}_clk),')
            print(f'        .Tile_{coords}_RST_N_TT_PROJECT(tt_project_{i}_rst_n),')
            print('')

        # SRAM
        sram_coords = 'X5'
        sram_offset = 6
        for i in range(NUM_SRAM):
            print(f'        // SRAM {i}')
            for j in range(SRAM_WIDTH):
                print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_DOUT_SRAM{j}(fabric_sram{i}_dout_i[{j}]),')
            for j in range(10):
                print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_ADDR_SRAM{j}(fabric_sram{i}_addr_o[{j}]),')
            for j in range(SRAM_WIDTH):
                print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_BM_SRAM{j}(fabric_sram{i}_bm_o[{j}]),')
            for j in range(SRAM_WIDTH):
                print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_DIN_SRAM{j}(fabric_sram{i}_din_o[{j}]),')
            print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_WEN_SRAM(fabric_sram{i}_wen_o),')
            print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_MEN_SRAM(fabric_sram{i}_men_o),')
            print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_REN_SRAM(fabric_sram{i}_ren_o),')
            print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_CLK_SRAM(fabric_sram{i}_clk_o),')
            print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_TIE_HIGH_SRAM(fabric_sram{i}_tie_high_o),')
            print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_TIE_LOW_SRAM(fabric_sram{i}_tie_low_o),')
            if (i==NUM_SRAM-1):
                print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_CONFIGURED_top(configured_i)')
            else:
                print(f'        .Tile_{sram_coords}Y{sram_offset+i*2}_CONFIGURED_top(configured_i),')
        print("    );\n")

        for i, (coord, mod_inst) in enumerate(tt_projects.items()):

            if not mod_inst:
                print(f"""    assign tt_project_{i}_uo_out  = '0;
        assign tt_project_{i}_uio_out = '0;
        assign tt_project_{i}_uio_oe  = '0;\n""")
            else:
                module, instance = mod_inst

                print(f"""    {module} {instance} (
        .clk        (tt_project_{i}_clk),
        .rst_n      (tt_project_{i}_rst_n),
        .ena        (tt_project_{i}_ena),
        .ui_in      (tt_project_{i}_ui_in),
        .uio_in     (tt_project_{i}_uio_in),
        .uo_out     (tt_project_{i}_uo_out),
        .uio_out    (tt_project_{i}_uio_out),
        .uio_oe     (tt_project_{i}_uio_oe)""", end="")
                if module == "heichips25_ethernet":
                    print(f""",\n        .ethernet_dp  (ethernet_dp),
        .ethernet_dn  (ethernet_dn)""")
                elif module == "heichips25_usb_cdc":
                    print(f""",\n        .usb_dn_en_o    (usb_dn_en_o),
        .usb_dn_rx_i    (usb_dn_rx_i),
        .usb_dn_tx_o    (usb_dn_tx_o),
        .usb_dp_en_o    (usb_dp_en_o),
        .usb_dp_rx_i    (usb_dp_rx_i),
        .usb_dp_tx_o    (usb_dp_tx_o),
        .usb_dp_up_o    (usb_dp_up_o)""")
                elif module == "heichips25_ICELab":
                    print(f""",\n        // DLL
        .analog_pin0  (icelab_analog_pin0),
        .analog_pin1  (icelab_analog_pin1),
        .analog_pin2  (icelab_analog_pin2),
        .analog_pin3  (icelab_analog_pin3)""")
                elif module == "heichips25_bagel":
                    print(f""",\n        .tmds_b     (tmds_b),
        .tmds_g     (tmds_g),
        .tmds_r     (tmds_r),
        .tmds_clk   (tmds_clk)""")
                elif module == "heichips25_internal":
                    print(f""",\n        // DLL
        .analog_pin0  (internal_analog_pin0),
        .analog_pin1  (internal_analog_pin1),
        .analog_pin2  (internal_analog_pin2)""")
                elif module == "heichips25_pudding":
                    print(f""",\n        .i_in  (pudding_i_in),
        .i_out (pudding_i_out)""")
                else:
                    print(f"")
                print(f"""    );\n""")


        for i in range(NUM_SRAM):

            print(f"""    // SRAM {i} instances

    logic [31:0] fabric_sram0_dout_sram0_0;
    logic [31:0] fabric_sram0_dout_sram0_1;

    logic select_sram0;
    logic select_sram0_d;
    
    assign select_sram0 = fabric_sram0_addr_o[9];

    always_ff @(posedge fabric_sram0_clk_o) begin
        select_sram0_d <= select_sram0; // Highest bit selects the SRAM
    end

    always_comb begin
        if (select_sram0_d) begin
            fabric_sram0_dout_i = fabric_sram0_dout_sram0_1;
        end else begin
            fabric_sram0_dout_i = fabric_sram0_dout_sram0_0;
        end
    end

    RM_IHPSG13_1P_512x32_c2_bm_bist sram{i}_0 (
        .A_CLK      (fabric_sram{i}_clk_o),
        .A_MEN      (fabric_sram{i}_men_o && select_sram{i} == 1'b0),
        .A_WEN      (fabric_sram{i}_wen_o),
        .A_REN      (fabric_sram{i}_ren_o),
        .A_ADDR     (fabric_sram{i}_addr_o[8:0]),
        .A_DIN      (fabric_sram{i}_din_o),
        .A_DLY      (fabric_sram{i}_tie_high_o),
        .A_DOUT     (fabric_sram{i}_dout_sram{i}_0),
        .A_BM       (fabric_sram{i}_bm_o),

        .A_BIST_EN      (fabric_sram{i}_tie_low_o),
        .A_BIST_CLK     (fabric_sram{i}_tie_low_o),
        .A_BIST_MEN     (fabric_sram{i}_tie_low_o),
        .A_BIST_WEN     (fabric_sram{i}_tie_low_o),
        .A_BIST_REN     (fabric_sram{i}_tie_low_o),
        .A_BIST_ADDR    ({{9{{fabric_sram{i}_tie_low_o}}}}),
        .A_BIST_DIN     ({{32{{fabric_sram{i}_tie_low_o}}}}),
        .A_BIST_BM      ({{32{{fabric_sram{i}_tie_low_o}}}})
    );

    RM_IHPSG13_1P_512x32_c2_bm_bist sram{i}_1 (
        .A_CLK      (fabric_sram{i}_clk_o),
        .A_MEN      (fabric_sram{i}_men_o && select_sram{i} == 1'b1),
        .A_WEN      (fabric_sram{i}_wen_o),
        .A_REN      (fabric_sram{i}_ren_o),
        .A_ADDR     (fabric_sram{i}_addr_o[8:0]),
        .A_DIN      (fabric_sram{i}_din_o),
        .A_DLY      (fabric_sram{i}_tie_high_o),
        .A_DOUT     (fabric_sram{i}_dout_sram{i}_1),
        .A_BM       (fabric_sram{i}_bm_o),

        .A_BIST_EN      (fabric_sram{i}_tie_low_o),
        .A_BIST_CLK     (fabric_sram{i}_tie_low_o),
        .A_BIST_MEN     (fabric_sram{i}_tie_low_o),
        .A_BIST_WEN     (fabric_sram{i}_tie_low_o),
        .A_BIST_REN     (fabric_sram{i}_tie_low_o),
        .A_BIST_ADDR    ({{9{{fabric_sram{i}_tie_low_o}}}}),
        .A_BIST_DIN     ({{32{{fabric_sram{i}_tie_low_o}}}}),
        .A_BIST_BM      ({{32{{fabric_sram{i}_tie_low_o}}}})
    );""")

        print("\nendmodule")
