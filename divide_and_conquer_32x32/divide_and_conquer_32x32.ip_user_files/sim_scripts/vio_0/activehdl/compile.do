vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../divide_and_conquer_32x32.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../divide_and_conquer_32x32.gen/sources_1/ip/vio_0/hdl" \
"../../../../divide_and_conquer_32x32.gen/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

