current_design heichips25_top
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

# Set a higher limits than in lib
set_max_fanout 8 [current_design]
set_max_capacitance 0.5 [current_design]
set_max_transition 3 [current_design]
set_max_area 0

set_ideal_network [get_pins sg13g2_IOPadIn_fpga_clk/p2c]
create_clock [get_pins sg13g2_IOPadIn_fpga_clk/p2c] -name clk_core -period 20.0 -waveform {0 10.0}
set_clock_uncertainty 0.15 [get_clocks clk_core]
set_clock_transition 0.25 [get_clocks clk_core]

set clock_ports [get_ports { 
	fpga_clk_PAD 
}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clock_ports

set clk_core_inout_30mA_ports [get_ports { 
	fpga_sclk_PAD
	fpga_cs_n_PAD
	fpga_mosi_PAD
	fpga_miso_PAD
	fpga_io_PAD[0]
	fpga_io_PAD[1]
	fpga_io_PAD[2]
	fpga_io_PAD[3]
	fpga_io_PAD[4]
	fpga_io_PAD[5]
	fpga_io_PAD[6]
	fpga_io_PAD[7]
	fpga_io_PAD[8]
	fpga_io_PAD[9]
	fpga_io_PAD[10]
	fpga_io_PAD[11]
	fpga_io_PAD[12]
	fpga_io_PAD[13]
	fpga_io_PAD[14]
	fpga_io_PAD[15]
	fpga_io_PAD[16]
	fpga_io_PAD[17]
	fpga_io_PAD[18]
	fpga_io_PAD[19]
	fpga_io_PAD[20]
	fpga_io_PAD[21]
	fpga_io_PAD[22]
	fpga_io_PAD[23]
	fpga_io_PAD[24]
	fpga_io_PAD[25]
	fpga_io_PAD[26]
	fpga_io_PAD[27]
	fpga_io_PAD[28]
	fpga_io_PAD[29]
	fpga_io_PAD[30]
	fpga_io_PAD[31]
}] 
set_driving_cell -lib_cell sg13g2_IOPadInOut30mA -pin pad $clk_core_inout_30mA_ports
set_input_delay 8 -clock clk_core $clk_core_inout_30mA_ports
set_output_delay 8 -clock clk_core $clk_core_inout_30mA_ports

set clk_core_input_ports [get_ports { 
	fpga_rst_n_PAD 
	fpga_mode_PAD
}] 
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clk_core_input_ports
set_input_delay 8 -clock clk_core $clk_core_input_ports

set clk_core_output_30mA_ports [get_ports { 
    fpga_config_busy_PAD
}] 
set_driving_cell -lib_cell sg13g2_IOPadOut30mA -pin pad $clk_core_output_30mA_ports
set_output_delay 8 -clock clk_core $clk_core_output_30mA_ports

set_load -pin_load 5 [all_inputs]
set_load -pin_load 5 [all_outputs]
