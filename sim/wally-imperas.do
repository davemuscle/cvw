# wally.do 
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
#
# Modification by Oklahoma State University & Harvey Mudd College
# Use with Testbench 
# James Stine, 2008; David Harris 2021
# Go Cowboys!!!!!!
#
# Takes 1:10 to run RV64IC tests using gui

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
# suppress spurious warnngs about 
# "Extra checking for conflicts with always_comb done at vopt time"
# because vsim will run vopt

# start and run simulation
# remove +acc flag for faster sim during regressions if there is no need to access internal signals
        # *** modelsim won't take `PA_BITS, but will take other defines for the lengths of DTIM_RANGE and IROM_LEN.  For now just live with the warnings.

vlog +incdir+../config/$1 \
     +incdir+../config/shared \
     +define+USE_IMPERAS_DV \
     +incdir+$env(IMPERAS_HOME)/ImpPublic/include/host \
     +incdir+$env(IMPERAS_HOME)/ImpProprietary/include/host \
     $env(IMPERAS_HOME)/ImpPublic/source/host/rvvi/rvviApiPkg.sv    \
     $env(IMPERAS_HOME)/ImpPublic/source/host/rvvi/rvviTrace.sv      \
     $env(IMPERAS_HOME)/ImpProprietary/source/host/idv/idvPkg.sv   \
     $env(IMPERAS_HOME)/ImpProprietary/source/host/idv/idvApiPkg.sv \
     $env(IMPERAS_HOME)/ImpProprietary/source/host/idv/trace2api.sv  \
     $env(IMPERAS_HOME)/ImpProprietary/source/host/idv/trace2log.sv  \
     $env(IMPERAS_HOME)/ImpProprietary/source/host/idv/trace2cov.sv  \
     ../src/cvw.sv \
     ../testbench/testbench_imperas.sv \
     ../testbench/common/*.sv   \
     ../src/*/*.sv \
     ../src/*/*/*.sv \
     -suppress 2583 \
     -suppress 7063 

vopt +acc work.testbench -G DEBUG=1 -o workopt 
eval vsim workopt +nowarn3829  -fatal 7 \
     -sv_lib $env(IMPERAS_HOME)/lib/Linux64/ImperasLib/imperas.com/verification/riscv/1.0/model \
     +testDir=$env(TESTDIR) $env(OTHERFLAGS)
view wave
#-- display input and output signals as hexidecimal values
add log -recursive /*
do wave.do

run -all

noview ../testbench/testbench_imperas.sv
view wave

#quit -f
