build_all: $(USER_DESIGNS)
	cd all_ones; make
	cd all_zeros; make
	cd counter; make
	cd counter_top; make
	cd passthrough; make
	#cd sram; make
.PHONY: build_all

clean_all: $(USER_DESIGNS)
	cd all_ones; make clean
	cd all_zeros; make clean
	cd counter; make clean
	cd counter_top; make clean
	cd passthrough; make clean
	#cd sram; make clean
.PHONY: clean_all
