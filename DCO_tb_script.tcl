transcript on
vlib work

vlog -sv ./DCO.sv
vlog -sv ./DCO_tb.sv

vsim -t 1fs -voptargs="+acc" DCO_tb

add wave /DCO_tb/reset_i
add wave /DCO_tb/signal_o
add wave /DCO_tb/freqCode_i
add wave /DCO_tb/dcoInstance/internalClock
add wave /DCO_tb/dcoInstance/counter

configure wave -timelineunits ps
run -all
wave zoom full
