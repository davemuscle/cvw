///////////////////////////////////////////
// loggers.sv
//
// Written: Ross Thompson ross1728@gmail.com
// Modified: 14 June 2023
// 
// Purpose: Log branch instructions, log instruction fetches,
//          log I$ misses, log data memory accesses, log D$ misses, and
//          log other related operations
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

module loggers import cvw::*; #(parameter cvw_t P,
                                parameter TEST,
                                parameter PrintHPMCounters,
                                parameter I_CACHE_ADDR_LOGGER,
                                parameter D_CACHE_ADDR_LOGGER,
                                parameter BPRED_LOGGER) (
  input logic  clk,
  input logic  reset,
  input logic  DCacheFlushStart,
  input logic  DCacheFlushDone,                                                         
//  input logic BeginSample,
//  input logic StartSample,
//  input logic EndSample,
  input string memfilename
  );
  
  // performance counter logging 
  logic        BeginSample;
  logic StartSample, EndSample;
  if(PrintHPMCounters & P.ZICNTR_SUPPORTED) begin : HPMCSample
    integer           HPMCindex;
    logic             StartSampleFirst;
    logic             StartSampleDelayed, BeginDelayed;
    logic             EndSampleFirst, EndSampleDelayed;
    logic [P.XLEN-1:0] InitialHPMCOUNTERH[P.COUNTERS-1:0];

    string  HPMCnames[] = '{"Mcycle",
                            "------",
                            "InstRet",
                            "Br Count",
                            "Jump Not Return",
                            "Return",
                            "BP Wrong",
                            "BP Dir Wrong",
                            "BP Target Wrong",
                            "RAS Wrong",
                            "Instr Class Wrong",
                            "Load Stall",
                            "Store Stall",
                            "D Cache Access",
                            "D Cache Miss",
                            "D Cache Cycles",
                            "I Cache Access",
                            "I Cache Miss",
                            "I Cache Cycles",
                            "CSR Write",
                            "FenceI",
                            "SFenceVMA",
                            "Interrupt",
                            "Exception",
                            "Divide Cycles"
                          };

    if(TEST == "embench") begin
      // embench runs warmup then runs start_trigger
      // embench end with stop_trigger.
      assign StartSampleFirst = FunctionName.FunctionName.FunctionName == "start_trigger";
      flopr #(1) StartSampleReg(clk, reset, StartSampleFirst, StartSampleDelayed);
      assign StartSample = StartSampleFirst & ~ StartSampleDelayed;

      assign EndSampleFirst = FunctionName.FunctionName.FunctionName == "stop_trigger";
      flopr #(1) EndSampleReg(clk, reset, EndSampleFirst, EndSampleDelayed);
      assign EndSample = EndSampleFirst & ~ EndSampleDelayed;

    end else if(TEST == "coremark") begin
      // embench runs warmup then runs start_trigger
	    // embench end with stop_trigger.
      assign StartSampleFirst = FunctionName.FunctionName.FunctionName == "start_time";
      flopr #(1) StartSampleReg(clk, reset, StartSampleFirst, StartSampleDelayed);
      assign StartSample = StartSampleFirst & ~ StartSampleDelayed;

      assign EndSampleFirst = FunctionName.FunctionName.FunctionName == "stop_time";
      flopr #(1) EndSampleReg(clk, reset, EndSampleFirst, EndSampleDelayed);
      assign EndSample = EndSampleFirst & ~ EndSampleDelayed;

    end else begin
      // default start condiction is reset
      // default end condiction is end of test (DCacheFlushDone)
      assign StartSampleFirst = reset;
      flopr #(1) StartSampleReg(clk, reset, StartSampleFirst, StartSampleDelayed);
      assign StartSample = StartSampleFirst & ~ StartSampleDelayed;
      assign EndSample = DCacheFlushStart & ~DCacheFlushDone;

      flop #(1) BeginReg(clk, StartSampleFirst, BeginDelayed);
      assign BeginSample = StartSampleFirst & ~BeginDelayed;

    end
    always @(negedge clk) begin
      if(StartSample) begin
        for(HPMCindex = 0; HPMCindex < 32; HPMCindex += 1) begin
          InitialHPMCOUNTERH[HPMCindex] <= dut.core.priv.priv.csr.counters.counters.HPMCOUNTER_REGW[HPMCindex];
        end
      end
      if(EndSample) begin
        for(HPMCindex = 0; HPMCindex < HPMCnames.size(); HPMCindex += 1) begin
          // unlikely to have more than 10M in any counter.
          $display("Cnt[%2d] = %7d %s", HPMCindex, dut.core.priv.priv.csr.counters.counters.HPMCOUNTER_REGW[HPMCindex] - InitialHPMCOUNTERH[HPMCindex], HPMCnames[HPMCindex]);
        end
      end
    end
  end

  if (P.ICACHE_SUPPORTED && I_CACHE_ADDR_LOGGER) begin : ICacheLogger
    int    file;
    string LogFile;
    logic  resetD, resetEdge;
    logic  Enable;
    logic  InvalDelayed, InvalEdge;
    
    assign Enable = dut.core.ifu.bus.icache.icache.cachefsm.LRUWriteEn & 
                    dut.core.ifu.immu.immu.pmachecker.Cacheable &
                    ~dut.core.ifu.bus.icache.icache.cachefsm.FlushStage &
                    dut.core.ifu.bus.icache.icache.cachefsm.CacheEn &
                    ~reset;
    flop #(1) ResetDReg(clk, reset, resetD);
    assign resetEdge = ~reset & resetD;

    flop #(1) InvalReg(clk, dut.core.ifu.InvalidateICacheM, InvalDelayed);
    assign InvalEdge = dut.core.ifu.InvalidateICacheM & ~InvalDelayed;

    initial begin
      LogFile = "ICache.log";
      file = $fopen(LogFile, "w");
      $fwrite(file, "BEGIN %s\n", memfilename);
    end
    string AccessTypeString, HitMissString;
    always @(*) begin
      HitMissString = dut.core.ifu.bus.icache.icache.CacheHit ? "H" :
                      dut.core.ifu.bus.icache.icache.vict.cacheLRU.AllValid ? "E" : "M";
    end
    always @(posedge clk) begin
    if(resetEdge) $fwrite(file, "TRAIN\n");
    if(BeginSample) $fwrite(file, "BEGIN %s\n", memfilename);
    if(Enable) begin  // only log i cache reads
      $fwrite(file, "%h R %s\n", dut.core.ifu.PCPF, HitMissString);
    end
    if(InvalEdge) $fwrite(file, "0 I X\n");
    if(EndSample) $fwrite(file, "END %s\n", memfilename);
    end
  end


  if (P.DCACHE_SUPPORTED && D_CACHE_ADDR_LOGGER) begin : DCacheLogger
    int    file;
    string LogFile;
    logic  resetD, resetEdge;
    logic  Enabled;
    string AccessTypeString, HitMissString;

    flop #(1) ResetDReg(clk, reset, resetD);
    assign resetEdge = ~reset & resetD;
    always @(*) begin
      HitMissString = dut.core.lsu.bus.dcache.dcache.CacheHit ? "H" :
                      (!dut.core.lsu.bus.dcache.dcache.vict.cacheLRU.AllValid) ? "M" :
                      dut.core.lsu.bus.dcache.dcache.LineDirty ? "D" : "E";
      AccessTypeString = dut.core.lsu.bus.dcache.FlushDCache ? "F" :
                         dut.core.lsu.bus.dcache.CacheAtomicM[1] ? "A" :
                         dut.core.lsu.bus.dcache.CacheRWM == 2'b10 ? "R" : 
                         dut.core.lsu.bus.dcache.CacheRWM == 2'b01 ? "W" :
                         "NULL";
    end

    assign Enabled = dut.core.lsu.bus.dcache.dcache.cachefsm.LRUWriteEn &
                     ~dut.core.lsu.bus.dcache.dcache.cachefsm.FlushStage &
                     dut.core.lsu.dmmu.dmmu.pmachecker.Cacheable &
                     dut.core.lsu.bus.dcache.dcache.cachefsm.CacheEn &
                     (AccessTypeString != "NULL");

    initial begin
      LogFile = "DCache.log";
      file = $fopen(LogFile, "w");
      $fwrite(file, "BEGIN %s\n", memfilename);
    end
    always @(posedge clk) begin
      if(resetEdge) $fwrite(file, "TRAIN\n");
      if(BeginSample) $fwrite(file, "BEGIN %s\n", memfilename);
      if(Enabled) begin
        $fwrite(file, "%h %s %s\n", dut.core.lsu.PAdrM, AccessTypeString, HitMissString);
      end
      if(dut.core.lsu.bus.dcache.dcache.cachefsm.FlushFlag) $fwrite(file, "0 F X\n");
      if(EndSample) $fwrite(file, "END %s\n", memfilename);
    end
  end

  if (P.BPRED_SUPPORTED) begin : BranchLogger
    if (BPRED_LOGGER) begin
      string direction;
      int    file;
      logic  PCSrcM;
      string LogFile;
      logic  resetD, resetEdge;
      flopenrc #(1) PCSrcMReg(clk, reset, dut.core.FlushM, ~dut.core.StallM, dut.core.ifu.bpred.bpred.Predictor.DirPredictor.PCSrcE, PCSrcM);
      flop #(1) ResetDReg(clk, reset, resetD);
      assign resetEdge = ~reset & resetD;
      initial begin
        LogFile = "branch.log"; // will break some of Ross's research analysis scripts
        //LogFile = $psprintf("branch_%s%0d.log", P.BPRED_TYPE, P.BPRED_SIZE);
        file = $fopen(LogFile, "w");
      end
      always @(posedge clk) begin
        if(resetEdge) $fwrite(file, "TRAIN\n");
        if(StartSample) $fwrite(file, "BEGIN %s\n", memfilename);
        if(dut.core.ifu.InstrClassM[0] & ~dut.core.StallW & ~dut.core.FlushW & dut.core.InstrValidM) begin
          direction = PCSrcM ? "t" : "n";
          $fwrite(file, "%h %s\n", dut.core.PCM, direction);
        end
        if(EndSample) $fwrite(file, "END %s\n", memfilename);
      end
    end
  end

endmodule
