IVERILOG ?= iverilog
VVP ?= vvp
SOURCES = implic.sv testbenches/implic_tb.sv
TOPMODULE = implic_tb
IVERILOG_FLAGS = -g2012

all: tests

build:
	mkdir -p build
	$(IVERILOG) $(IVERILOG_FLAGS) $(SOURCES) -s $(TOPMODULE) -o build/$(TOPMODULE)
	
tests: build
	$(VVP) build/$(TOPMODULE)

clean:
	$(RM) -R build

.PHONY: tests
.PHONY: clean
.PHONY: build