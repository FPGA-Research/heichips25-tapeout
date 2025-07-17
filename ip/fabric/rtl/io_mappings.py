FABRIC_NUM_IO_WEST = 28
FABRIC_NUM_IO_NORTH = 4
NUM_SRAM = 7
SRAM_WIDTH = 32

print(f'------------------ header ------------------\n')

print(f'    // Fabric is configured')
print("""    input                                configured_i,\n""")

# I/Os
print(f'    // I/Os West')
print("""    input  [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_in_i,
    output [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_out_o,
    output [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_oe_o,\n""")

print(f'    // I/O West config')
print("""    output [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit0_o,
    output [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit1_o,
    output [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit2_o,
    output [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit3_o,\n""")

print(f'    // I/Os North')
print("""    input  [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_in_i,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_out_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_oe_o,\n""")

print(f'    // I/O North config')
print("""    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit0_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit1_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit2_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit3_o,\n""")

# WARMBOOT
print(f'    // WARMBOOT')
print("""    output        fabric_warmboot_boot_o,""")
print("""    output  [3:0] fabric_warmboot_slot_o,""")
print("""    input         fabric_warmboot_reset_i,\n""")

# CPU_IRQ
print(f'    // CPU_IRQ')
print("""    output  [3:0] fabric_irq_o,\n""")

# CPU_IF
print(f'    // CPU_IF')
print("""    output  [63:0] fabric_cpu_o,""")
print("""    input   [63:0] fabric_cpu_i,\n""")

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
print(f"""        // West I/Os""")
for i in range(1,(FABRIC_NUM_IO_WEST//2)+1):
    print(f"""        .Tile_X0Y{i}_A_O_top(fabric_io_west_in_i[{FABRIC_NUM_IO_WEST-i*2+1}]),
        .Tile_X0Y{i}_A_I_top(fabric_io_west_out_o[{FABRIC_NUM_IO_WEST-i*2+1}]),
        .Tile_X0Y{i}_A_T_top(fabric_io_west_oe_o[{FABRIC_NUM_IO_WEST-i*2+1}]),\n""")

    print(f"""        .Tile_X0Y{i}_B_O_top(fabric_io_west_in_i[{FABRIC_NUM_IO_WEST-i*2}]),
        .Tile_X0Y{i}_B_I_top(fabric_io_west_out_o[{FABRIC_NUM_IO_WEST-i*2}]),
        .Tile_X0Y{i}_B_T_top(fabric_io_west_oe_o[{FABRIC_NUM_IO_WEST-i*2}]),\n""")

    print(f"""        .Tile_X0Y{i}_A_config_C_bit0(fabric_io_west_config_bit0_o[{FABRIC_NUM_IO_WEST-i*2+1}]),
        .Tile_X0Y{i}_A_config_C_bit1(fabric_io_west_config_bit1_o[{FABRIC_NUM_IO_WEST-i*2+1}]),
        .Tile_X0Y{i}_A_config_C_bit2(fabric_io_west_config_bit2_o[{FABRIC_NUM_IO_WEST-i*2+1}]),
        .Tile_X0Y{i}_A_config_C_bit3(fabric_io_west_config_bit3_o[{FABRIC_NUM_IO_WEST-i*2+1}]),\n""")
        
    print(f"""        .Tile_X0Y{i}_B_config_C_bit0(fabric_io_west_config_bit0_o[{FABRIC_NUM_IO_WEST-i*2}]),
        .Tile_X0Y{i}_B_config_C_bit1(fabric_io_west_config_bit1_o[{FABRIC_NUM_IO_WEST-i*2}]),
        .Tile_X0Y{i}_B_config_C_bit2(fabric_io_west_config_bit2_o[{FABRIC_NUM_IO_WEST-i*2}]),
        .Tile_X0Y{i}_B_config_C_bit3(fabric_io_west_config_bit3_o[{FABRIC_NUM_IO_WEST-i*2}]),\n""")

# I/Os
print(f"""        // North I/Os""")
for i in range(FABRIC_NUM_IO_NORTH//2):
    print(f"""        .Tile_X{i+1}Y0_A_O_top(fabric_io_north_in_i[{i*2+1}]),
        .Tile_X{i+1}Y0_A_I_top(fabric_io_north_out_o[{i*2+1}]),
        .Tile_X{i+1}Y0_A_T_top(fabric_io_north_oe_o[{i*2+1}]),\n""")

    print(f"""        .Tile_X{i+1}Y0_B_O_top(fabric_io_north_in_i[{i*2}]),
        .Tile_X{i+1}Y0_B_I_top(fabric_io_north_out_o[{i*2}]),
        .Tile_X{i+1}Y0_B_T_top(fabric_io_north_oe_o[{i*2}]),\n""")

    print(f"""        .Tile_X{i+1}Y0_A_config_C_bit0(fabric_io_north_config_bit0_o[{i*2+1}]),
        .Tile_X{i+1}Y0_A_config_C_bit1(fabric_io_north_config_bit1_o[{i*2+1}]),
        .Tile_X{i+1}Y0_A_config_C_bit2(fabric_io_north_config_bit2_o[{i*2+1}]),
        .Tile_X{i+1}Y0_A_config_C_bit3(fabric_io_north_config_bit3_o[{i*2+1}]),\n""")
        
    print(f"""        .Tile_X{i+1}Y0_B_config_C_bit0(fabric_io_north_config_bit0_o[{i*2}]),
        .Tile_X{i+1}Y0_B_config_C_bit1(fabric_io_north_config_bit1_o[{i*2}]),
        .Tile_X{i+1}Y0_B_config_C_bit2(fabric_io_north_config_bit2_o[{i*2}]),
        .Tile_X{i+1}Y0_B_config_C_bit3(fabric_io_north_config_bit3_o[{i*2}]),\n""")

# WARMBOOT
warmboot_coords = 'X2Y15'
print('        // WARMBOOT')
print(f"""        .Tile_{warmboot_coords}_RESET_top(fabric_warmboot_reset_i),
        .Tile_{warmboot_coords}_BOOT_top(fabric_warmboot_boot_o),
        .Tile_{warmboot_coords}_SLOT_top0(fabric_warmboot_slot_o[0]),
        .Tile_{warmboot_coords}_SLOT_top1(fabric_warmboot_slot_o[1]),
        .Tile_{warmboot_coords}_SLOT_top2(fabric_warmboot_slot_o[2]),
        .Tile_{warmboot_coords}_SLOT_top3(fabric_warmboot_slot_o[3]),
        .Tile_{warmboot_coords}_CONFIGURED_top(configured_i),\n""")

# IRQ
irq_coords = 'X3Y15'
print('        // IRQ')
print(f"""        .Tile_{irq_coords}_IRQ_top0(fabric_irq_o[0]),
        .Tile_{irq_coords}_IRQ_top1(fabric_irq_o[1]),
        .Tile_{irq_coords}_IRQ_top2(fabric_irq_o[2]),
        .Tile_{irq_coords}_IRQ_top3(fabric_irq_o[3]),
        .Tile_{irq_coords}_CONFIGURED_top(configured_i),\n""")

# CPU_IF
cpu_if_coords = 'Y15'
for index, i in enumerate([5, 6, 8, 9]):
    print(f'        // CPU_IF {index}')
    for j in range(16):
        print(f'        .Tile_X{i}{cpu_if_coords}_I_top{j}(fabric_cpu_o[{16*index+j}]),')
    for j in range(16):
        print(f'        .Tile_X{i}{cpu_if_coords}_O_top{j}(fabric_cpu_i[{16*index+j}]),')
    print('')

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
