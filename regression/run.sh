#!/bin/bash

set -ex
test -d $1
test -f scripts/$2.ys

rm -rf $1/work_$2
mkdir $1/work_$2
cd $1/work_$2


# cases where 'syntax error' or other errors are expected
if [ "$1" = "issue_00089" ] ||\
   [ "$1" = "issue_00093" ] ||\
   [ "$1" = "issue_00095" ] ||\
   [ "$1" = "issue_00096" ] ||\
   [ "$1" = "issue_00196" ] ||\
   [ "$1" = "issue_00362" ]; then

	expected_string="syntax error"
    #Change checked string for check other errors
	if [ "$1" = "issue_00196" ]; then
		expected_string="Found posedge/negedge event"
	elif [ "$1" = "issue_00362" ]; then
		expected_string="is connected to constants:"
	fi

	if yosys -ql yosys.log ../../scripts/$2.ys; then
		echo fail > ${1}_${2}.status
	else
		if grep "$expected_string" yosys.log; then
			echo pass > ${1}_${2}.status
		else
			echo fail > ${1}_${2}.status
		fi
	fi

# cases with simulation checks
else

	iverilog_adds=""
	#Additional sources for iverilog simulation
	if [ "$1" = "issue_00084" ]; then
		iverilog_adds="../../../../../techlibs/xilinx/brams_bb.v"
	elif [ "$1" = "issue_00160" ] ||\
		 [ "$1" = "issue_00182" ] ||\
		 [ "$1" = "issue_00183" ]; then
		iverilog_adds="../../../../../techlibs/ice40/cells_sim.v"
	fi

	yosys -ql yosys.log ../../scripts/$2.ys
	iverilog -o testbench  ../testbench.v synth.v ../../common.v ../../../../../techlibs/common/simcells.v $iverilog_adds
	if ! vvp -N testbench > testbench.log 2>&1; then
		grep 'ERROR' testbench.log
		echo fail > ${1}_${2}.status
	elif grep 'ERROR' testbench.log || ! grep 'OKAY' testbench.log; then
		echo fail > ${1}_${2}.status
	else
		echo pass > ${1}_${2}.status
	fi

fi


touch .stamp
