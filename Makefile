RUN_TAG = $(shell ls runs/ -1 | tail -n 1)
TOP = heichips25_top

$(echo $RUN_TAG)

PDK_ROOT ?= /home/leo/Repositories/IHP-Open-PDK
PDK ?= ihp-sg13g2

librelane:
	librelane config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk
.PHONY: librelane

librelane-openroad:
	librelane config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInOpenROAD
.PHONY: librelane-openroad

librelane-klayout:
	librelane config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInOpenROAD
.PHONY: librelane-klayout

copy-final:
	mkdir -p final/pnl/
	mkdir -p final/spice/
	mkdir -p final/nl/
	mkdir -p final/gds/
	mkdir -p final/odb/
	mkdir -p final/def/
	mkdir -p final/spef/nom/

	cp runs/${RUN_TAG}/final/pnl/${TOP}.pnl.v final/pnl/${TOP}.pnl.v
	#cp runs/${RUN_TAG}/final/spice/${TOP}.spice final/spice/${TOP}.spice
	cp runs/${RUN_TAG}/final/nl/${TOP}.nl.v final/nl/${TOP}.nl.v
	cp runs/${RUN_TAG}/final/gds/${TOP}.gds final/gds/${TOP}.gds
	cp runs/${RUN_TAG}/final/odb/${TOP}.odb final/odb/${TOP}.odb
	cp runs/${RUN_TAG}/final/def/${TOP}.def final/def/${TOP}.def
	cp runs/${RUN_TAG}/final/spef/nom/${TOP}.nom.spef final/spef/nom/${TOP}.nom.spef
	
	gzip final/gds/${TOP}.gds
	gzip final/odb/${TOP}.odb
	
.PHONY: copy-final

create-image:
	PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) klayout -z -r scripts/klayout_image.py -rd input_gds=final/gds/${TOP}.gds.gz -rd output_image=img/${TOP}.png
	convert img/${TOP}.png -resize 25% img/${TOP}_small.png
.PHONY: create-image
