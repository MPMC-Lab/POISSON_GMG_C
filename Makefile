.PHONY: cpu gpu clean clean_cpu clean_gpu

cpu:
	mkdir -p include lib
	module purge; \
	module load gcc/15.2.0; \
	module load mpi/openmpi-4.1.8; \
	cd src/cpu; \
	mkdir -p obj; \
	$(MAKE) all

gpu:
	mkdir -p include lib
	module purge; \
	module load nvhpc/25.11_; \
	cd src/gpu; \
	mkdir -p obj; \
	$(MAKE) all

clean: clean_cpu clean_gpu

clean_cpu:
	cd src/cpu; make clean

clean_gpu:
	cd src/gpu; make clean