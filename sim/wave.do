onerror {resume}
quietly virtual signal -install /testbench/dut/core/ifu/bpred/bpred { /testbench/dut/core/ifu/bpred/bpred/PostSpillInstrRawF[11:7]} rd
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/reset_ext
add wave -noupdate /testbench/memfilename
add wave -noupdate /testbench/dut/core/SATP_REGW
add wave -noupdate /testbench/dut/core/InstrValidM
add wave -noupdate /testbench/FunctionName/FunctionName/FunctionAddr
add wave -noupdate /testbench/FunctionName/FunctionName/ProgramAddrIndex
add wave -noupdate /testbench/FunctionName/FunctionName/FunctionName
add wave -noupdate /testbench/FunctionName/FunctionName/ProgramAddrMapLineCount
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/hzu/RetM
add wave -noupdate -expand -group HDU -group hazards -color Pink /testbench/dut/core/hzu/TrapM
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/hzu/LoadStallD
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/ifu/IFUStallF
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/hzu/LSUStallM
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/MDUStallD
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/hzu/DivBusyE
add wave -noupdate -expand -group HDU -group hazards /testbench/dut/core/hzu/FDivBusyE
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/InstrMisalignedFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/InstrAccessFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/IllegalInstrFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/BreakpointFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/LoadMisalignedFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/StoreAmoMisalignedFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/LoadAccessFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/StoreAmoAccessFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/EcallFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/InstrPageFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/LoadPageFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/StoreAmoPageFaultM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/InterruptM
add wave -noupdate -expand -group HDU -group traps /testbench/dut/core/priv/priv/trap/HPTWInstrAccessFaultM
add wave -noupdate -expand -group HDU -group Flush -color Yellow /testbench/dut/core/FlushD
add wave -noupdate -expand -group HDU -group Flush -color Yellow /testbench/dut/core/FlushE
add wave -noupdate -expand -group HDU -group Flush -color Yellow /testbench/dut/core/FlushM
add wave -noupdate -expand -group HDU -group Flush -color Yellow /testbench/dut/core/FlushW
add wave -noupdate -expand -group HDU -group Stall -color Orange /testbench/dut/core/StallF
add wave -noupdate -expand -group HDU -group Stall -color Orange /testbench/dut/core/StallD
add wave -noupdate -expand -group HDU -group Stall -color Orange /testbench/dut/core/StallE
add wave -noupdate -expand -group HDU -group Stall -color Orange /testbench/dut/core/StallM
add wave -noupdate -expand -group HDU -group Stall -color Orange /testbench/dut/core/StallW
add wave -noupdate -group {instruction pipeline} /testbench/InstrFName
add wave -noupdate -group {instruction pipeline} /testbench/dut/core/ifu/PostSpillInstrRawF
add wave -noupdate -group {instruction pipeline} /testbench/dut/core/ifu/InstrD
add wave -noupdate -group {instruction pipeline} /testbench/dut/core/ifu/InstrE
add wave -noupdate -group {instruction pipeline} /testbench/dut/core/ifu/InstrM
add wave -noupdate -group PCS /testbench/dut/core/ifu/PCNextF
add wave -noupdate -group PCS /testbench/dut/core/ifu/PCF
add wave -noupdate -group PCS /testbench/dut/core/ifu/PCD
add wave -noupdate -group PCS /testbench/dut/core/PCE
add wave -noupdate -group PCS /testbench/dut/core/PCM
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ifu/PCD
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ifu/InstrD
add wave -noupdate -group {Decode Stage} /testbench/InstrDName
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ieu/c/InstrValidD
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ieu/c/RegWriteD
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ieu/dp/RdD
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ieu/dp/Rs1D
add wave -noupdate -group {Decode Stage} /testbench/dut/core/ieu/dp/Rs2D
add wave -noupdate -group {Execution Stage} /testbench/dut/core/ifu/PCE
add wave -noupdate -group {Execution Stage} /testbench/dut/core/ifu/InstrE
add wave -noupdate -group {Execution Stage} /testbench/InstrEName
add wave -noupdate -group {Execution Stage} /testbench/dut/core/ieu/c/InstrValidE
add wave -noupdate -expand -group {Memory Stage} /testbench/FunctionName/FunctionName/FunctionName
add wave -noupdate -expand -group {Memory Stage} /testbench/dut/core/InstrValidM
add wave -noupdate -expand -group {Memory Stage} /testbench/dut/core/PCM
add wave -noupdate -expand -group {Memory Stage} /testbench/dut/core/InstrM
add wave -noupdate -expand -group {Memory Stage} /testbench/InstrMName
add wave -noupdate -expand -group {Memory Stage} /testbench/dut/core/lsu/IEUAdrM
add wave -noupdate -group {WriteBack stage} /testbench/InstrW
add wave -noupdate -group {WriteBack stage} /testbench/InstrWName
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/csrm/MCAUSE_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MCOUNTEREN_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MCOUNTINHIBIT_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MEDELEG_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MEPC_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MIDELEG_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MIE_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MIP_REGW
add wave -noupdate -group CSRs {/testbench/dut/core/priv/priv/csr/MSTATUS_REGW[21]}
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MSTATUS_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/MTVEC_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/PMPADDR_ARRAY_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/PMPCFG_ARRAY_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/SATP_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/SCOUNTEREN_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/SEPC_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/SSTATUS_REGW
add wave -noupdate -group CSRs /testbench/dut/core/priv/priv/csr/STVEC_REGW
add wave -noupdate -group CSRs -group {user mode} /testbench/dut/core/priv/priv/csr/csru/csru/FRM_REGW
add wave -noupdate -group CSRs -group {user mode} /testbench/dut/core/priv/priv/csr/csru/csru/FFLAGS_REGW
add wave -noupdate -group CSRs -group {user mode} /testbench/dut/core/priv/priv/csr/csru/csru/STATUS_FS
add wave -noupdate -group Bpred -expand -group {branch update selection inputs} -divider {class check}
add wave -noupdate -group Bpred -expand -group prediction /testbench/dut/core/ifu/bpred/bpred/RASPCF
add wave -noupdate -group Bpred -expand -group prediction -expand -group ex /testbench/dut/core/ifu/bpred/bpred/PCSrcE
add wave -noupdate -group {PCNext Generation} /testbench/dut/core/ifu/PCNextF
add wave -noupdate -group {PCNext Generation} /testbench/dut/core/ifu/bpred/bpred/NextValidPCE
add wave -noupdate -group {PCNext Generation} /testbench/dut/core/ifu/PCF
add wave -noupdate -group {PCNext Generation} /testbench/dut/core/ifu/PCPlus2or4F
add wave -noupdate -group RegFile -expand /testbench/dut/core/ieu/dp/regf/rf
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/a1
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/a2
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/a3
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/rd1
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/rd2
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/we3
add wave -noupdate -group RegFile /testbench/dut/core/ieu/dp/regf/wd3
add wave -noupdate -group RegFile -group {write regfile mux} /testbench/dut/core/ieu/dp/ReadDataW
add wave -noupdate -group RegFile -group {write regfile mux} /testbench/dut/core/ieu/dp/CSRReadValW
add wave -noupdate -group RegFile -group {write regfile mux} /testbench/dut/core/ieu/dp/ResultSrcW
add wave -noupdate -group RegFile -group {write regfile mux} /testbench/dut/core/ieu/dp/ResultW
add wave -noupdate -group alu /testbench/dut/core/ieu/dp/alu/A
add wave -noupdate -group alu /testbench/dut/core/ieu/dp/alu/B
add wave -noupdate -group alu /testbench/dut/core/ieu/dp/alu/ALUResult
add wave -noupdate -group alu /testbench/dut/core/ieu/dp/alu/BALUControl
add wave -noupdate -group alu -divider internals
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/Rs1D
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/Rs2D
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/Rs1E
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/Rs2E
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RdE
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RdM
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RdW
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/MemReadE
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RegWriteM
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RegWriteW
add wave -noupdate -group Forward -color Thistle /testbench/dut/core/ieu/fw/ForwardAE
add wave -noupdate -group Forward -color Thistle /testbench/dut/core/ieu/fw/ForwardBE
add wave -noupdate -group Forward -color Thistle /testbench/dut/core/ieu/fw/LoadStallD
add wave -noupdate -group Forward /testbench/dut/core/ieu/dp/IFResultM
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/ForwardAE
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/Rs1E
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RdM
add wave -noupdate -group Forward /testbench/dut/core/ieu/fw/RdW
add wave -noupdate -group {alu execution stage} /testbench/dut/core/ieu/dp/ALUResultE
add wave -noupdate -group {alu execution stage} /testbench/dut/core/ieu/dp/SrcAE
add wave -noupdate -group {alu execution stage} /testbench/dut/core/ieu/dp/SrcBE
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/IFUReq
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/LSUReq
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/IFUSave
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/IFURestore
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/IFUDisable
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/LSUDisable
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/IFUSelect
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/LSUSelect
add wave -noupdate -group AHB -expand -group multicontroller /testbench/dut/core/ebu/ebu/ebufsmarb/CurrState
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HTRANS
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HBURST
add wave -noupdate -group AHB -group IFU /testbench/dut/core/ebu/ebu/IFUHTRANS
add wave -noupdate -group AHB -group IFU /testbench/dut/core/ebu/ebu/IFUHADDR
add wave -noupdate -group AHB -group IFU /testbench/dut/core/ebu/ebu/IFUHBURST
add wave -noupdate -group AHB -group IFU /testbench/dut/core/ebu/ebu/IFUHREADY
add wave -noupdate -group AHB -group IFU /testbench/dut/core/HRDATA
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUReq
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHTRANS
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHSIZE
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHBURST
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHADDR
add wave -noupdate -group AHB -group LSU /testbench/dut/core/HRDATA
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHWRITE
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHWSTRB
add wave -noupdate -group AHB -group LSU /testbench/dut/core/ebu/ebu/LSUHWDATA
add wave -noupdate -group AHB -group LSU -color Pink /testbench/dut/core/lsu/LSUHREADY
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HCLK
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HRESETn
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HREADY
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HRESP
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HADDR
add wave -noupdate -group AHB /testbench/dut/core/HRDATA
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HWDATA
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HWRITE
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HSIZE
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HBURST
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HPROT
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HTRANS
add wave -noupdate -group AHB /testbench/dut/core/ebu/ebu/HMASTLOCK
add wave -noupdate -group lsu /testbench/dut/core/lsu/SelHPTW
add wave -noupdate -group lsu /testbench/dut/core/lsu/LSUStallM
add wave -noupdate -group lsu /testbench/dut/core/lsu/ReadDataWordMuxM
add wave -noupdate -group lsu /testbench/dut/core/lsu/ReadDataM
add wave -noupdate -group lsu -radix hexadecimal /testbench/dut/core/lsu/WriteDataM
add wave -noupdate -group lsu /testbench/dut/core/lsu/FWriteDataM
add wave -noupdate -group lsu /testbench/dut/core/lsu/bus/dcache/dcache/CacheStall
add wave -noupdate -group lsu /testbench/dut/core/lsu/IgnoreRequestTLB
add wave -noupdate -group lsu /testbench/dut/core/lsu/SelHPTW
add wave -noupdate -group lsu -group bus /testbench/dut/core/ebu/ebu/HCLK
add wave -noupdate -group lsu -group bus -color Gold /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/AHBBuscachefsm/CurrState
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/AHBBuscachefsm/HREADY
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/BusStall
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/HTRANS
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/FetchBuffer
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/HRDATA
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/LSUHWDATA
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/BusStall
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/CacheBusRW
add wave -noupdate -group lsu -group bus /testbench/dut/core/lsu/bus/dcache/ahbcacheinterface/CacheBusAck
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/CacheRW
add wave -noupdate -group lsu -group dcache -color Gold /testbench/dut/core/lsu/bus/dcache/dcache/cachefsm/CurrState
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/HitWay
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/SetValid
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/SetDirty
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/ClearDirty
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/SelAdr
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/IEUAdrE
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/IEUAdrM
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/CacheSet
add wave -noupdate -group lsu -group dcache {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/ClearDirtyWay}
add wave -noupdate -group lsu -group dcache {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/Dirty}
add wave -noupdate -group lsu -group dcache -group {replacement policy} /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/HitWay
add wave -noupdate -group lsu -group dcache -group {replacement policy} /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/LRUWriteEn
add wave -noupdate -group lsu -group dcache -group {replacement policy} /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/CacheSet
add wave -noupdate -group lsu -group dcache -group {replacement policy} -color {Orange Red} {/testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/LRUMemory[0]}
add wave -noupdate -group lsu -group dcache -group {replacement policy} /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/CurrLRU
add wave -noupdate -group lsu -group dcache -group {replacement policy} /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/NextLRU
add wave -noupdate -group lsu -group dcache -group {replacement policy} /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/VictimWay
add wave -noupdate -group lsu -group dcache -group {replacement policy} -expand -group DETAILS -expand /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/Intermediate
add wave -noupdate -group lsu -group dcache -group {replacement policy} -expand -group DETAILS /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/LRUUpdate
add wave -noupdate -group lsu -group dcache -group {replacement policy} -expand -group DETAILS /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/WayExpanded
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/LineDirty
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/FlushWay
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/NextFlushAdr
add wave -noupdate -group lsu -group dcache -group flush -radix hexadecimal /testbench/dut/core/lsu/bus/dcache/dcache/FlushAdr
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/cachefsm/FlushWayFlag
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/FlushWayCntEn
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/cachefsm/FlushAdrCntEn
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/FlushAdrFlag
add wave -noupdate -group lsu -group dcache -group flush /testbench/dut/core/lsu/bus/dcache/dcache/cachefsm/SelFlush
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/VictimWay
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/SelAdr
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/PAdr
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/CacheSet
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/NextLRU
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/CurrLRU
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/LRUWriteEn
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/ReadDataLine
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/WordOffsetAddr
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/HitWay
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/ValidWay
add wave -noupdate -group lsu -group dcache -group Victim {/testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/LRUMemory[0]}
add wave -noupdate -group lsu -group dcache -group Victim /testbench/dut/core/lsu/bus/dcache/dcache/vict/cacheLRU/LRUMemory
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} /testbench/dut/core/lsu/bus/dcache/dcache/ClearDirty
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/SelectedWriteWordEn}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/SetValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/SetDirtyWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -label TAG {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/CacheTagMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/ValidBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/DirtyBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word0 -expand {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[0]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[1]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[2]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[2]/wordram/CacheDataMem/RAM[62]}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[3]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way0 -group Way0Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/SelectedWriteWordEn}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/SetValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/SetDirtyWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -label TAG {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/CacheTagMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/ValidBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/DirtyBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[0]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[1]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[2]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word2 -expand {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[3]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way1 -group Way1Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/SelectedWriteWordEn}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/SetValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/SetDirtyWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -label TAG {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/CacheTagMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/ValidBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/DirtyBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[0]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[1]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[2]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[3]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way2 -group Way2Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/SelectedWriteWordEn}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/SetValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/SetDirtyWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -label TAG {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/CacheTagMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/ValidBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/DirtyBits}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[0]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[1]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[2]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word2 -expand {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[3]/wordram/CacheDataMem/we}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -expand -group way3 -group Way3Word3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM writes} -group valid/dirty /testbench/dut/core/lsu/bus/dcache/dcache/ClearDirty
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} /testbench/dut/core/lsu/bus/dcache/dcache/CacheSet
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/HitWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/ValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/Dirty}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way0 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[0]/ReadTag}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/HitWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/ValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/Dirty}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -expand -group way1 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[1]/ReadTag}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/HitWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/ValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/Dirty}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way2 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[2]/ReadTag}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/HitWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/ValidWay}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/Dirty}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} -group way3 {/testbench/dut/core/lsu/bus/dcache/dcache/CacheWays[3]/ReadTag}
add wave -noupdate -group lsu -group dcache -group {Cache SRAM read} /testbench/dut/core/lsu/bus/dcache/dcache/HitWay
add wave -noupdate -group lsu -group dcache -group {CPU side} /testbench/dut/core/lsu/bus/dcache/dcache/NextSet
add wave -noupdate -group lsu -group dcache -group {Memory Side} /testbench/dut/core/lsu/bus/dcache/dcache/CacheBusAdr
add wave -noupdate -group lsu -group dcache -group {Memory Side} /testbench/dut/core/lsu/bus/dcache/dcache/CacheBusAck
add wave -noupdate -group lsu -group dcache -group {Memory Side} /testbench/dut/core/lsu/bus/dcache/dcache/ReadDataWord
add wave -noupdate -group lsu -group dcache /testbench/dut/core/lsu/bus/dcache/dcache/FlushWay
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/VAdr
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/tlbcontrol/EffectivePrivilegeMode
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/PTE
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/HitPageType
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/tlbcontrol/Translate
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/tlbcontrol/DisableTranslation
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/TLBMiss
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/TLBHit
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/PhysicalAddress
add wave -noupdate -group lsu -group dtlb -expand -group faults /testbench/dut/core/lsu/dmmu/dmmu/TLBPageFault
add wave -noupdate -group lsu -group dtlb -expand -group faults /testbench/dut/core/lsu/dmmu/dmmu/LoadAccessFaultM
add wave -noupdate -group lsu -group dtlb -expand -group faults /testbench/dut/core/lsu/dmmu/dmmu/StoreAmoAccessFaultM
add wave -noupdate -group lsu -group dtlb /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/TLBPAdr
add wave -noupdate -group lsu -group dtlb -expand -group write /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/PTE
add wave -noupdate -group lsu -group dtlb -expand -group write /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/PageTypeWriteVal
add wave -noupdate -group lsu -group dtlb -expand -group write /testbench/dut/core/lsu/dmmu/dmmu/tlb/tlb/TLBWrite
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/pmachecker/PhysicalAddress
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/pmachecker/SelRegions
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/Cacheable
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/Idempotent
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/pmachecker/PMAAccessFault
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/PMAInstrAccessFaultF
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/PMALoadAccessFaultM
add wave -noupdate -group lsu -group pma /testbench/dut/core/lsu/dmmu/dmmu/PMAStoreAmoAccessFaultM
add wave -noupdate -group lsu -group pmp /testbench/dut/core/lsu/dmmu/dmmu/PMPInstrAccessFaultF
add wave -noupdate -group lsu -group pmp /testbench/dut/core/lsu/dmmu/dmmu/PMPLoadAccessFaultM
add wave -noupdate -group lsu -group pmp /testbench/dut/core/lsu/dmmu/dmmu/PMPStoreAmoAccessFaultM
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/SelHPTW
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/HPTWStall
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/DTLBWalk
add wave -noupdate -group lsu -expand -group ptwalker -color Gold /testbench/dut/core/lsu/hptw/hptw/WalkerState
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/HPTWAdr
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/PTE
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/NextPageType
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/PageType
add wave -noupdate -group lsu -expand -group ptwalker /testbench/dut/core/lsu/hptw/hptw/ValidNonLeafPTE
add wave -noupdate -group lsu -expand -group ptwalker -expand -group types /testbench/dut/core/lsu/ITLBMissF
add wave -noupdate -group lsu -expand -group ptwalker -expand -group types /testbench/dut/core/lsu/DTLBMissM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group types /testbench/dut/core/lsu/hptw/hptw/ITLBWriteF
add wave -noupdate -group lsu -expand -group ptwalker -expand -group types /testbench/dut/core/lsu/hptw/hptw/DTLBWriteM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/LSUAccessFaultM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/DCacheStallM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/HPTWInstrAccessFaultF
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/LSULoadAccessFaultM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/LSUStoreAmoAccessFaultM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/LoadAccessFaultM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/StoreAmoAccessFaultM
add wave -noupdate -group lsu -expand -group ptwalker -expand -group faults /testbench/dut/core/lsu/hptw/hptw/HPTWInstrAccessFault
add wave -noupdate -group plic /testbench/dut/uncore/uncore/plic/plic/UARTIntr
add wave -noupdate -group plic /testbench/dut/uncore/uncore/plic/plic/GPIOIntr
add wave -noupdate -group plic /testbench/dut/uncore/uncore/plic/plic/MExtInt
add wave -noupdate -group plic /testbench/dut/uncore/uncore/plic/plic/SExtInt
add wave -noupdate -group plic /testbench/dut/uncore/uncore/plic/plic/Dout
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/intClaim
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/intEn
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/intInProgress
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/intPending
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/intPriority
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/intThreshold
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/nextIntPending
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/requests
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/irqMatrix
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/priorities_with_irqs
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/max_priority_with_irqs
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/irqs_at_max_priority
add wave -noupdate -group plic -expand -group internals /testbench/dut/uncore/uncore/plic/plic/threshMask
add wave -noupdate -group CLINT /testbench/dut/uncore/uncore/clint/clint/MTIME
add wave -noupdate -group CLINT /testbench/dut/uncore/uncore/clint/clint/MTIMECMP
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PSEL
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PADDR
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PWDATA
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PSTRB
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PWRITE
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PENABLE
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PRDATA
add wave -noupdate -group CLINT -expand -group {clint bus} /testbench/dut/uncore/uncore/clint/clint/PREADY
add wave -noupdate -group uart -expand -group Registers /testbench/dut/uncore/uncore/uart/uart/u/LSR
add wave -noupdate -group uart -expand -group Registers /testbench/dut/uncore/uncore/uart/uart/u/MCR
add wave -noupdate -group uart -expand -group Registers /testbench/dut/uncore/uncore/uart/uart/u/MSR
add wave -noupdate -group uart -expand -group Registers /testbench/dut/uncore/uncore/uart/uart/u/RBR
add wave -noupdate -group uart -expand -group Registers /testbench/dut/uncore/uncore/uart/uart/u/TXHR
add wave -noupdate -group uart -expand -group Registers /testbench/dut/uncore/uncore/uart/uart/u/LCR
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/intrID
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/INTR
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxstate
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/txstate
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/txbitssent
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/txbitsexpected
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxbitsreceived
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxbitsexpected
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxdata
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxoverrunerr
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxdataready
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxdataavailintr
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/RXBR
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/squashRXerrIP
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/rxshiftreg
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/SOUTbit
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/SINsync
add wave -noupdate -group uart /testbench/dut/uncore/uncore/uart/uart/u/txsr
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/SIN
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/SOUT
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/RTSb
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/DTRb
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/OUT1b
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/OUT2b
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/DSRb
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/DCDb
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/CTSb
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/TXRDYb
add wave -noupdate -group uart -expand -group {Off-Chip Interface} /testbench/dut/uncore/uncore/uart/uart/RXRDYb
add wave -noupdate -group {debug trace} -expand -group mem -color Yellow /testbench/dut/core/FlushW
add wave -noupdate -group {debug trace} -expand -group mem /testbench/dut/core/PCM
add wave -noupdate -group {debug trace} -expand -group mem -color Brown /testbench/dut/core/hzu/TrapM
add wave -noupdate -expand -group ifu /testbench/dut/core/ifu/InstrRawF
add wave -noupdate -expand -group ifu /testbench/dut/core/ifu/PostSpillInstrRawF
add wave -noupdate -expand -group ifu /testbench/dut/core/ifu/IFUStallF
add wave -noupdate -expand -group ifu -group Spill /testbench/dut/core/ifu/Spill/spill/CurrState
add wave -noupdate -expand -group ifu -group Spill -expand -group takespill /testbench/dut/core/ifu/Spill/spill/SpillF
add wave -noupdate -expand -group ifu -group Spill -expand -group takespill /testbench/dut/core/ifu/Spill/spill/IFUCacheBusStallF
add wave -noupdate -expand -group ifu -group Spill -expand -group takespill /testbench/dut/core/ifu/Spill/spill/ITLBMissF
add wave -noupdate -expand -group ifu -group Spill -expand -group takespill /testbench/dut/core/ifu/Spill/spill/TakeSpillF
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HSIZE
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HBURST
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HTRANS
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HWRITE
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HADDR
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/AHBBuscachefsm/Flush
add wave -noupdate -expand -group ifu -group bus -color Gold /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/AHBBuscachefsm/CurrState
add wave -noupdate -expand -group ifu -group bus /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HRDATA
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/Stall
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/FlushStage
add wave -noupdate -expand -group ifu -expand -group icache -color Gold /testbench/dut/core/ifu/bus/icache/icache/cachefsm/CurrState
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/ITLBMissF
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/SelAdr
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/PCNextF
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/PCPF
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/cachefsm/AnyMiss
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/CacheRW
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/Stall
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/CacheAccess
add wave -noupdate -expand -group ifu -expand -group icache -expand -group {fsm out and control} /testbench/dut/core/ifu/bus/icache/icache/HitWay
add wave -noupdate -expand -group ifu -expand -group icache -expand -group {fsm out and control} /testbench/dut/core/ifu/ICacheStallF
add wave -noupdate -expand -group ifu -expand -group icache -expand -group memory /testbench/dut/core/ifu/bus/icache/icache/CacheBusAdr
add wave -noupdate -expand -group ifu -expand -group icache -expand -group memory /testbench/dut/core/ifu/bus/icache/icache/cachefsm/CacheBusAck
add wave -noupdate -expand -group ifu -expand -group icache /testbench/dut/core/ifu/bus/icache/icache/VictimWay
add wave -noupdate -expand -group ifu -expand -group icache -group way3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/SelectedWriteWordEn}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[0]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[1]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[2]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[3]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way3 -group way3word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[3]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/SelectedWriteWordEn}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[0]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[1]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[2]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[3]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way2 -group way2word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[2]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/SelectedWriteWordEn}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[0]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[1]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[2]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[3]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way1 -group way1word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[1]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/SelectedWriteWordEn}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[0]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word0 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[0]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[1]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word1 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[1]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[2]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word2 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[2]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[3]/wordram/CacheDataMem/dout}
add wave -noupdate -expand -group ifu -expand -group icache -group way0 -group way0word3 {/testbench/dut/core/ifu/bus/icache/icache/CacheWays[0]/word[3]/wordram/CacheDataMem/RAM}
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/immu/immu/TLBWrite
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/ITLBMissF
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/immu/immu/VAdr
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/immu/immu/PhysicalAddress
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/Matches
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/immu/immu/InstrPageFaultF
add wave -noupdate -expand -group ifu -group itlb /testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/TLBFlush
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/Valid}
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/PageType}
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/Key}
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/Key0}
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/Key1}
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/Query0}
add wave -noupdate -expand -group ifu -group itlb -expand -group key21 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[21]/Query1}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/Valid}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/PageTypeWriteVal}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/PageType}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/Key}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/Key0}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/Key1}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/Query0}
add wave -noupdate -expand -group ifu -group itlb -expand -group key19 {/testbench/dut/core/ifu/immu/immu/tlb/tlb/tlbcam/camlines[19]/Query1}
add wave -noupdate -expand -group {Performance Counters} -label MCYCLE -radix hexadecimal {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[0]}
add wave -noupdate -expand -group {Performance Counters} -label MINSTRET -radix hexadecimal {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[2]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label Branch -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[3]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label {BP Dir Wrong} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[7]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label {Jump (Not Return)} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[4]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label Return -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[5]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label {BP Wrong} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[6]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label {BTA Wrong} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[8]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label {RAS Wrong} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[9]}
add wave -noupdate -expand -group {Performance Counters} -group BP -label {BP CLASS WRONG} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[10]}
add wave -noupdate -expand -group {Performance Counters} -expand -group ICACHE -label {I Cache Access} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[16]}
add wave -noupdate -expand -group {Performance Counters} -expand -group ICACHE -label {I Cache Miss} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[17]}
add wave -noupdate -expand -group {Performance Counters} -expand -group ICACHE -label {I Cache Miss Cycles} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[18]}
add wave -noupdate -expand -group {Performance Counters} -group DCACHE -label {Load Stall} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[11]}
add wave -noupdate -expand -group {Performance Counters} -group DCACHE -label {Store Stall} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[12]}
add wave -noupdate -expand -group {Performance Counters} -group DCACHE -label {DCACHE MISS} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[14]}
add wave -noupdate -expand -group {Performance Counters} -group DCACHE -label {DCACHE ACCESS} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[13]}
add wave -noupdate -expand -group {Performance Counters} -group DCACHE -label {D Cache Miss Cycles} -radix unsigned {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[15]}
add wave -noupdate -expand -group {Performance Counters} -group Privileged -label {CSR Write} {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[19]}
add wave -noupdate -expand -group {Performance Counters} -group Privileged -label Fence.I {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[20]}
add wave -noupdate -expand -group {Performance Counters} -group Privileged -label sfence.VMA {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[21]}
add wave -noupdate -expand -group {Performance Counters} -group Privileged -label Interrupt {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[22]}
add wave -noupdate -expand -group {Performance Counters} -group Privileged -label Exception {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[23]}
add wave -noupdate -expand -group {Performance Counters} -label {FDiv or IDiv Cycles} {/testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW[24]}
add wave -noupdate -expand -group {Performance Counters} /testbench/dut/core/priv/priv/csr/counters/counters/HPMCOUNTER_REGW
add wave -noupdate -group {ifu } -color Gold /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/AHBBuscachefsm/CurrState
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/AHBBuscachefsm/HREADY
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/FetchBuffer
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/CaptureEn
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HADDR
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HSIZE
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/HTRANS
add wave -noupdate -group {ifu } /testbench/dut/core/ifu/bus/icache/ahbcacheinterface/AHBBuscachefsm/CacheBusAck
add wave -noupdate -group itlb /testbench/dut/core/ifu/immu/immu/tlb/tlb/VPN
add wave -noupdate -group itlb /testbench/dut/core/ifu/immu/immu/tlb/tlb/TLBWrite
add wave -noupdate -group itlb /testbench/dut/core/ifu/immu/immu/PTE
add wave -noupdate -group itlb /testbench/dut/core/ifu/immu/immu/VAdr
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/FRD1E
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/FRD2E
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/FRD3E
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/ForwardedSrcAE
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/ForwardedSrcBE
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/Funct3E
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/W64E
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/unpack/X
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/unpack/Y
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/unpack/Z
add wave -noupdate -group FPU /testbench/dut/core/fpu/fpu/fregfile/rf
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HADDR
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HTRANS
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HREADY
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HSELRegions
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HSELNoneD
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HSELPLICD
add wave -noupdate -group uncore /testbench/dut/uncore/uncore/HRDATA
add wave -noupdate /testbench/dut/core/ifu/bpred/bpred/rd
add wave -noupdate -group {branch direction} -expand -group {branch outcome} /testbench/dut/core/ifu/bpred/bpred/Predictor/DirPredictor/PCSrcE
add wave -noupdate -group {branch direction} -expand -group conditions /testbench/dut/core/ifu/bpred/bpred/Predictor/DirPredictor/FlushM
add wave -noupdate -group {branch direction} -expand -group conditions /testbench/dut/core/ifu/bpred/bpred/Predictor/DirPredictor/FlushE
add wave -noupdate -group {branch direction} /testbench/dut/core/ifu/bpred/bpred/Predictor/DirPredictor/FlushD
add wave -noupdate -group {branch direction} /testbench/dut/core/ifu/bpred/bpred/Predictor/DirPredictor/StallM
add wave -noupdate -group {branch direction} /testbench/dut/core/ifu/bpred/bpred/Predictor/DirPredictor/FlushM
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/GPIOIN
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/GPIOOUT
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/GPIOEN
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/GPIOIntr
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PSEL
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PADDR
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PWRITE
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PRDATA
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PREADY
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PWDATA
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PSTRB
add wave -noupdate -group GPIO /testbench/dut/uncore/uncore/gpio/gpio/PENABLE
add wave -noupdate /testbench/dut/core/priv/priv/privmode/PrivilegeModeW
add wave -noupdate /testbench/dut/core/priv/priv/STATUS_MIE
add wave -noupdate -group wfi /testbench/dut/core/priv/priv/pmd/STATUS_TW
add wave -noupdate -group wfi /testbench/dut/core/priv/priv/pmd/PrivilegeModeW
add wave -noupdate -group wfi /testbench/dut/core/priv/priv/pmd/wfi/WFICount
add wave -noupdate -group wfi /testbench/dut/core/priv/priv/pmd/WFITimeoutM
add wave -noupdate /testbench/loggers/clk
add wave -noupdate /testbench/dut/core/ifu/bus/icache/icache/LRUWriteEn
add wave -noupdate /testbench/dut/core/ifu/bus/icache/icache/FlushStage
add wave -noupdate /testbench/dut/core/ifu/bus/icache/icache/Stall
add wave -noupdate /testbench/loggers/ICacheLogger/Enable
add wave -noupdate /testbench/dut/core/ifu/bus/icache/icache/cachefsm/CurrState
add wave -noupdate /testbench/dut/core/ifu/bus/icache/icache/vict/cacheLRU/CacheEn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {746867 ns} 1} {{Cursor 4} {698066 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 250
configure wave -valuecolwidth 194
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {697650 ns} {698666 ns}
