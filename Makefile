MAKEFILE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

RUN_TAG = $(shell ls librelane/runs/ | tail -n 1)
TOP = heichips25_top

PDK_ROOT ?= $(MAKEFILE_DIR)/IHP-Open-PDK
PDK ?= ihp-sg13g2
#PDK_COMMIT ?= 3b5a704ba6738aa686b08706187830e6284d2a10
PDK_BRANCH ?= heichips25

.DEFAULT_GOAL := help

$(PDK_ROOT)/$(PDK):
	#ciel enable $(PDK_COMMIT) --pdk-root $(PDK_ROOT) --pdk-family $(PDK)
	git clone https://github.com/HeiChips/IHP-Open-PDK.git --recurse-submodules --depth=1 --single-branch -b $(PDK_BRANCH)

# Get the fabric names
FABRICS :=  $(patsubst fabrics/%,%,$(wildcard fabrics/*)) 

FABRICS_OPENROAD := $(addsuffix -openroad,$(FABRICS))
FABRICS_KLAYOUT := $(addsuffix -klayout,$(FABRICS))

all: $(FABRICS)
.PHONY: all

$(FABRICS):
	librelane --pdk ${PDK} fabrics/$@/config.yaml --save-views-to fabrics/$@/macro/${PDK}/
.PHONY: $(FABRICS)

$(FABRICS_OPENROAD):
	librelane --pdk ${PDK} fabrics/$(subst -openroad,,$@)/config.yaml --last-run --flow OpenInOpenROAD
.PHONY: $(FABRICS_OPENROAD)

$(FABRICS_KLAYOUT):
	librelane --pdk ${PDK} fabrics/$(subst -klayout,,$@)/config.yaml --last-run --flow OpenInKLayout
.PHONY: $(FABRICS_KLAYOUT)

copy-fabric:
	# Copy fabric database
	mkdir -p user_designs/fabrics/classic_fabric_heichips25/macro/ihp-sg13g2/
	cp -R fabrics/classic_fabric_heichips25/macro/ihp-sg13g2/fabulous/ user_designs/fabrics/classic_fabric_heichips25/macro/ihp-sg13g2/
	cp fabrics/classic_fabric_heichips25/constraints.pcf user_designs/fabrics/classic_fabric_heichips25/constraints.pcf
.PHONY: copy-fabric

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'
.PHONY: help

clone-pdk: $(PDK_ROOT)/$(PDK) ## Clone the IHP-Open-PDK repository
.PHONY: clone-pdk

all: librelane ## Build the project (runs LibreLane)
.PHONY: all

librelane: $(PDK_ROOT)/$(PDK) ## Run LibreLane
	librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --save-views-to final/
.PHONY: librelane

librelane-nodrc: $(PDK_ROOT)/$(PDK) ## Run LibreLane without DRC checks
	librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --save-views-to final/ --skip KLayout.DRC --skip Magic.DRC --skip KLayout.Antenna --skip KLayout.Density
.PHONY: librelane-nodrc

librelane-onlyfill: $(PDK_ROOT)/$(PDK) ## Run LibreLane onyl for filler generation and density checks
	RUN=$$(ls librelane/runs/ | tail -n 1) && librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --with-initial-state librelane/runs/$$RUN/62-magic-filler/state_in.json --from Magic.Filler --to KLayout.Density
.PHONY: librelane-onlyfill

librelane-magicdrc: $(PDK_ROOT)/$(PDK) ## Run LibreLane with only Magic DRC checks
	librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --save-views-to final/ --skip KLayout.DRC
.PHONY: librelane-magicdrc

librelane-klayoutdrc: $(PDK_ROOT)/$(PDK) ## Run LibreLane with only KLayout DRC checks
	librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --save-views-to final/ --skip Magic.DRC
.PHONY: librelane-nodrc

librelane-openroad: $(PDK_ROOT)/$(PDK) ## Open the last LibreLane run in OpenROAD GUI
	librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInOpenROAD
.PHONY: librelane-openroad

librelane-klayout: $(PDK_ROOT)/$(PDK) ## Open the last LibreLane run in KLayout
	librelane librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInKLayout
.PHONY: librelane-klayout

sim: ## Run RTL simulation with cocotb
	cd tb/heichips25_top; PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 heichips25_top_tb.py test_fpga_all_zeros
	! grep failure tb/heichips25_top/sim_build/results.xml
	cd tb/heichips25_top; PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 heichips25_top_tb.py test_fpga_all_ones
	! grep failure tb/heichips25_top/sim_build/results.xml
	cd tb/heichips25_top; PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 heichips25_top_tb.py test_fpga_counter_top
	! grep failure tb/heichips25_top/sim_build/results.xml
.PHONY: sim

sim-gl: $(PDK_ROOT)/$(PDK) ## Run gate-level simulation with cocotb
	cd tb/heichips25_top; GL=1 PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 heichips25_top_tb.py test_fpga_all_zeros
	! grep failure tb/heichips25_top/sim_build/results.xml
	cd tb/heichips25_top; GL=1 PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 heichips25_top_tb.py test_fpga_all_ones
	! grep failure tb/heichips25_top/sim_build/results.xml
	cd tb/heichips25_top; GL=1 PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 heichips25_top_tb.py test_fpga_counter_top
	! grep failure tb/heichips25_top/sim_build/results.xml
.PHONY: sim-gl

sim-view: ## View simulation waveforms in GTKWave
	gtkwave tb/heichips25_top/sim_build/heichips25_top_tb.fst
.PHONY: sim-view

render-image:
	PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 scripts/lay2img.py final/gds/${TOP}.gds img/${TOP}.png --width 2048 --oversampling 4
	magick img/${TOP}_white.png -resize 25% img/${TOP}_white_small.png
	magick img/${TOP}_black.png -resize 25% img/${TOP}_black_small.png
.PHONY: render-image

precheck:
	PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 ${PDK_ROOT}/${PDK}/libs.tech/klayout/tech/drc/run_drc.py \
	--precheck_drc --mp=$$(nproc) --no_offgrid --density_thr=$$(nproc) \
	--no_angle --disable_extra_rules --no_recommended --path=final/gds/heichips25_top.gds
.PHONY: render-image
