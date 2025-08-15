PDK ?= ihp-sg13g2
PDK_ROOT ?= ~/.ciel

TILES = S_term_single N_term_single LUT4AB N_IO4 S_IO4 IHP_SRAM E_TT_IF E_TT_IF2 W_TT_IF W_TT_IF2 NE_term SE_term NW_term SW_term
TILE_DIR = tiles

TILE_PATHS := $(addprefix $(TILE_DIR)/,$(TILES))
TILE_PATHS_VIEWS := $(addsuffix -view,$(TILE_PATHS))

$(info $(TILE_PATHS))
$(info $(TILE_PATHS_VIEWS))

# A rule for all tiles
$(TILE_PATHS):
	librelane --pdk ${PDK} common.yaml $@/config.yaml
.PHONY: $(TILE_PATHS)

$(TILE_PATHS_VIEWS):
	librelane --pdk ${PDK} common.yaml $(subst -view,,$@)/config.yaml --last-run --flow OpenInOpenROAD
.PHONY: $(TILE_PATHS_VIEWS)

boundary-tiles: $(TILE_DIR)/W_IO $(TILE_DIR)/N_IO $(TILE_DIR)/S_CPU_IF $(TILE_DIR)/S_CPU_IRQ $(TILE_DIR)/S_WARMBOOT
.PHONY: termination-tiles

termination-tiles: $(TILE_DIR)/S_term_single $(TILE_DIR)/N_term_single $(TILE_DIR)/S_term_single2 $(TILE_DIR)/N_term_single2 $(TILE_DIR)/S_term_DSP $(TILE_DIR)/N_term_DSP
.PHONY: termination-tiles

all-tiles: $(TILE_PATHS)
.PHONY: all-tiles
