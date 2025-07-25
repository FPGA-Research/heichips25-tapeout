
# stdcell power pins
add_global_connection -net {VDD} -pin_pattern {^VDD$} -power
add_global_connection -net {VDD} -pin_pattern {^VDDPE$}
add_global_connection -net {VDD} -pin_pattern {^VDDCE$}

add_global_connection -net {VSS} -pin_pattern {^VSS$} -ground
add_global_connection -net {VSS} -pin_pattern {^VSSE$}

# padframe core power pins
add_global_connection -net {VDD} -pin_pattern {^vdd$} -power
add_global_connection -net {VSS} -pin_pattern {^vss$} -ground

# padframe io power pins
add_global_connection -net {IOVDD} -pin_pattern {^iovdd$} -power
add_global_connection -net {IOVSS} -pin_pattern {^iovss$} -ground

global_connect

# core voltage domain
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}


# TODO
# core_offset(s)
# voltage_domain(s)
# no pins
# connect_to_pads

# stdcell grid
define_pdn_grid \
    -name stdcell_grid \
    -starts_with POWER \
    -voltage_domains {CORE} \
    -pins "$::env(FP_PDN_VERTICAL_LAYER) $::env(FP_PDN_HORIZONTAL_LAYER)"

add_pdn_ring \
	-grid stdcell_grid \
	-layers "$::env(FP_PDN_VERTICAL_LAYER) $::env(FP_PDN_HORIZONTAL_LAYER)" \
	-widths "$::env(FP_PDN_CORE_RING_VWIDTH) $::env(FP_PDN_CORE_RING_HWIDTH)" \
	-spacings "$::env(FP_PDN_CORE_RING_VSPACING) $::env(FP_PDN_CORE_RING_HSPACING)" \
	-core_offsets "$::env(FP_PDN_CORE_RING_VOFFSET) $::env(FP_PDN_CORE_RING_HOFFSET)" \
	-connect_to_pads

add_pdn_stripe \
	-grid stdcell_grid \
	-layer $::env(FP_PDN_RAIL_LAYER) \
	-width $::env(FP_PDN_RAIL_WIDTH) \
	-followpins \
    -starts_with POWER

add_pdn_stripe \
	-grid stdcell_grid \
	-layer $::env(FP_PDN_VERTICAL_LAYER) \
	-width $::env(FP_PDN_VWIDTH) \
	-pitch $::env(FP_PDN_VPITCH) \
	-offset $::env(FP_PDN_VOFFSET) \
    -spacing $::env(FP_PDN_VSPACING) \
	-starts_with POWER \
	-extend_to_core_ring

add_pdn_stripe \
	-grid stdcell_grid \
	-layer $::env(FP_PDN_HORIZONTAL_LAYER) \
	-width $::env(FP_PDN_HWIDTH) \
	-pitch $::env(FP_PDN_HPITCH) \
	-offset $::env(FP_PDN_HOFFSET) \
    -spacing $::env(FP_PDN_HSPACING) \
	-starts_with POWER \
	-extend_to_core_ring

add_pdn_connect -grid stdcell_grid -layers "$::env(FP_PDN_RAIL_LAYER) $::env(FP_PDN_VERTICAL_LAYER)"
add_pdn_connect -grid stdcell_grid -layers "$::env(FP_PDN_VERTICAL_LAYER) $::env(FP_PDN_HORIZONTAL_LAYER)"

define_pdn_grid \
    -macro \
    -default \
    -name macro \
    -starts_with POWER \
    -halo "$::env(FP_PDN_HORIZONTAL_HALO) $::env(FP_PDN_VERTICAL_HALO)"

add_pdn_connect \
    -grid macro \
    -layers "$::env(FP_PDN_VERTICAL_LAYER) $::env(FP_PDN_HORIZONTAL_LAYER)"
