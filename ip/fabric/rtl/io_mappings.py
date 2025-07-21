FABRIC_HEIGHT = 10
FABRIC_NUM_IO_NORTH = 16
FABRIC_NUM_IO_SOUTH = 16
BELS_PER_IO_TILE = ['A', 'B', 'C', 'D']
NUM_SRAM = 0
SRAM_WIDTH = 32

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

# SRAM
sram_coords = 'X10'
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

for i in range(NUM_SRAM):

    print(f"""RM_IHPSG13_1P_1024x16_c2_bm_bist sram{i}_0 (
    .A_CLK      (fabric_sram{i}_clk_o),
    .A_MEN      (fabric_sram{i}_men_o),
    .A_WEN      (fabric_sram{i}_wen_o),
    .A_REN      (fabric_sram{i}_ren_o),
    .A_ADDR     (fabric_sram{i}_addr_o),
    .A_DIN      (fabric_sram{i}_din_o[15:0]),
    .A_DLY      (fabric_sram{i}_tie_high_o),
    .A_DOUT     (fabric_sram{i}_dout_i[15:0]),
    .A_BM       (fabric_sram{i}_bm_o[15:0]),

    .A_BIST_EN      (fabric_sram{i}_tie_low_o),
    .A_BIST_CLK     (fabric_sram{i}_tie_low_o),
    .A_BIST_MEN     (fabric_sram{i}_tie_low_o),
    .A_BIST_WEN     (fabric_sram{i}_tie_low_o),
    .A_BIST_REN     (fabric_sram{i}_tie_low_o),
    .A_BIST_ADDR    ({{10{{fabric_sram{i}_tie_low_o}}}}),
    .A_BIST_DIN     ({{16{{fabric_sram{i}_tie_low_o}}}}),
    .A_BIST_BM      ({{16{{fabric_sram{i}_tie_low_o}}}})
);

RM_IHPSG13_1P_1024x16_c2_bm_bist sram{i}_1 (
    .A_CLK      (fabric_sram{i}_clk_o),
    .A_MEN      (fabric_sram{i}_men_o),
    .A_WEN      (fabric_sram{i}_wen_o),
    .A_REN      (fabric_sram{i}_ren_o),
    .A_ADDR     (fabric_sram{i}_addr_o),
    .A_DIN      (fabric_sram{i}_din_o[31:16]),
    .A_DLY      (fabric_sram{i}_tie_high_o),
    .A_DOUT     (fabric_sram{i}_dout_i[31:16]),
    .A_BM       (fabric_sram{i}_bm_o[31:16]),

    .A_BIST_EN      (fabric_sram{i}_tie_low_o),
    .A_BIST_CLK     (fabric_sram{i}_tie_low_o),
    .A_BIST_MEN     (fabric_sram{i}_tie_low_o),
    .A_BIST_WEN     (fabric_sram{i}_tie_low_o),
    .A_BIST_REN     (fabric_sram{i}_tie_low_o),
    .A_BIST_ADDR    ({{10{{fabric_sram{i}_tie_low_o}}}}),
    .A_BIST_DIN     ({{16{{fabric_sram{i}_tie_low_o}}}}),
    .A_BIST_BM      ({{16{{fabric_sram{i}_tie_low_o}}}})
);""")
