PDK ?= ihp-sg13g2
PDK_ROOT ?= ~/.ciel

# A rule for all tiles
fabric:
	librelane --pdk ${PDK} config.yaml
.PHONY: fabric

fabric-view:
	librelane --pdk ${PDK} config.yaml --last-run --flow OpenInOpenROAD
.PHONY: fabric-view
