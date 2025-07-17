build_all: $(USER_DESIGNS)
	cd all_ones; make
	cd all_zeros; make
	cd counter; make
	cd passthrough; make
	cd sram; make
	cd xif; make
	cd peripheral; make
	cd peripheral_sram; make
	cd trigger_slot0; make
	cd trigger_slot1; make
	cd trigger_irq; make
	cd serv; make
	cd fazyrv; make
.PHONY: build_all

clean_all: $(USER_DESIGNS)
	cd all_ones; make clean
	cd all_zeros; make clean
	cd counter; make clean
	cd passthrough; make clean
	cd sram; make clean
	cd xif; make clean
	cd peripheral; make clean
	cd peripheral_sram; make clean
	cd trigger_slot0; make clean
	cd trigger_slot1; make clean
	cd trigger_irq; make clean
	cd serv; make clean
	cd fazyrv; make clean
.PHONY: clean_all
