FABRIC_HEIGHT = 10
FABRIC_NUM_IO_NORTH = 16
FABRIC_NUM_IO_SOUTH = 16
BELS_PER_IO_TILE = ['A', 'B', 'C', 'D']
NUM_SRAM = 1
SRAM_WIDTH = 32

# coord: (module, instance)
tt_projects = {
    # left side
    'X0Y2': ('heichips25_example_large', 'heichips25_example_large_0'),
    'X0Y3': ('heichips25_CORDIC', 'heichips25_example_small_0'),
    'X0Y4': ('heichips25_sap3', 'heichips25_example_small_1'),
    'X0Y5': ('heichips25_top_sorter', 'heichips25_example_small_2'),
    'X0Y6': ('heichips25_example_small', 'heichips25_example_small_3'),
    'X0Y7': ('heichips25_example_small', 'heichips25_example_small_4'),
    'X0Y8': ('heichips25_example_small', 'heichips25_example_small_5'),

    # right side
    # SRAM Top
    # SRAM Bot
    'X5Y4': ('heichips25_fazyrv_exotiny', 'heichips25_example_large_1'),
    'X5Y5': ('heichips25_example_small', 'heichips25_example_small_6'),
    'X5Y6': ('heichips25_example_small', 'heichips25_example_small_7'),
    'X5Y7': ('heichips25_example_small', 'heichips25_example_small_8'),
    'X5Y8': ('heichips25_example_small', 'heichips25_example_small_9'),
}

print(f'------------------ header ------------------\n')

print(f'    // Fabric is configured')
print("""    input                                configured_i,\n""")

# I/Os
print(f'    // I/Os North')
print("""    input  [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_in_i,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_out_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_oe_o,\n""")

print(f'    // I/Os South')
print("""    input  [FABRIC_NUM_IO_SOUTH-1:0]      fabric_io_south_in_i,
    output [FABRIC_NUM_IO_SOUTH-1:0]      fabric_io_south_out_o,
    output [FABRIC_NUM_IO_SOUTH-1:0]      fabric_io_south_oe_o,\n""")

print(f'------------------ signals ------------------\n')

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


print(f'------------------ body ------------------\n')

# I/Os
print(f"""        // North I/Os""")
num_bels = len(BELS_PER_IO_TILE)
IO_NORTH_OFFSET = 1
for i in range(IO_NORTH_OFFSET,(FABRIC_NUM_IO_NORTH//num_bels)+1):
    for j, bel in enumerate(BELS_PER_IO_TILE):
        print(f"""        .Tile_X{i}Y0_{bel}_O_top(io_north_in_i[{(i-IO_NORTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y0_{bel}_I_top(io_north_out_o[{(i-IO_NORTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y0_{bel}_T_top(io_north_oe_o[{(i-IO_NORTH_OFFSET)*num_bels+j}]),\n""")

# I/Os
print(f"""        // South I/Os""")
num_bels = len(BELS_PER_IO_TILE)
IO_SOUTH_OFFSET = 1
for i in range(IO_SOUTH_OFFSET,(FABRIC_NUM_IO_SOUTH//num_bels)+1):
    for j, bel in enumerate(BELS_PER_IO_TILE):
        print(f"""        .Tile_X{i}Y{FABRIC_HEIGHT-1}_{bel}_O_top(io_south_in_i[{(i-IO_SOUTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y{FABRIC_HEIGHT-1}_{bel}_I_top(io_south_out_o[{(i-IO_SOUTH_OFFSET)*num_bels+j}]),
        .Tile_X{i}Y{FABRIC_HEIGHT-1}_{bel}_T_top(io_south_oe_o[{(i-IO_SOUTH_OFFSET)*num_bels+j}]),\n""")


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
for i in range(NUM_SRAM):
    print(f'        // SRAM {i}')
    for j in range(SRAM_WIDTH):
        print(f'        .Tile_{sram_coords}Y{2+i*2}_DOUT_SRAM{j}(fabric_sram{i}_dout_i[{j}]),')
    for j in range(10):
        print(f'        .Tile_{sram_coords}Y{2+i*2}_ADDR_SRAM{j}(fabric_sram{i}_addr_o[{j}]),')
    for j in range(SRAM_WIDTH):
        print(f'        .Tile_{sram_coords}Y{2+i*2}_BM_SRAM{j}(fabric_sram{i}_bm_o[{j}]),')
    for j in range(SRAM_WIDTH):
        print(f'        .Tile_{sram_coords}Y{2+i*2}_DIN_SRAM{j}(fabric_sram{i}_din_o[{j}]),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_WEN_SRAM(fabric_sram{i}_wen_o),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_MEN_SRAM(fabric_sram{i}_men_o),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_REN_SRAM(fabric_sram{i}_ren_o),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_CLK_SRAM(fabric_sram{i}_clk_o),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_TIE_HIGH_SRAM(fabric_sram{i}_tie_high_o),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_TIE_LOW_SRAM(fabric_sram{i}_tie_low_o),')
    print(f'        .Tile_{sram_coords}Y{2+i*2}_CONFIGURED_top(configured_i),')
    print('')

print(f'------------------ modules ------------------\n')

for i, (coord, mod_inst) in enumerate(tt_projects.items()):

    if not mod_inst:
        print(f"""assign tt_project_{i}_uo_out  = '0;
assign tt_project_{i}_uio_out = '0;
assign tt_project_{i}_uio_oe  = '0;\n""")
    else:
        module, instance = mod_inst

        print(f"""{module} {instance} (
    .clk        (tt_project_{i}_clk),
    .rst_n      (tt_project_{i}_rst_n),
    .ena        (tt_project_{i}_ena),
    .ui_in      (tt_project_{i}_ui_in),
    .uio_in     (tt_project_{i}_uio_in),
    .uo_out     (tt_project_{i}_uo_out),
    .uio_out    (tt_project_{i}_uio_out),
    .uio_oe     (tt_project_{i}_uio_oe)
);\n""")


for i in range(NUM_SRAM):

    print(f"""// SRAM {i} instances

logic [31:0] fabric_sram{i}_dout_sram{i}_0;
logic [31:0] fabric_sram{i}_dout_sram{i}_1;

logic select_sram{i};

always_ff @(posedge fabric_sram{i}_clk_o) begin
    select_sram{i} <= fabric_sram{i}_addr_o[9]; // Highest bit selects the SRAM
end

always_comb begin
    if (select_sram{i}) begin
        fabric_sram{i}_dout_i = fabric_sram{i}_dout_sram{i}_1;
    end else begin
        fabric_sram{i}_dout_i = fabric_sram{i}_dout_sram{i}_0;
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
