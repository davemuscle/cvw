///////////////////////////////////////////
// csr.sv
//
// Written: David_Harris@hmc.edu 9 January 2021
// Modified: 
//          dottolia@hmc.edu 7 April 2021
//
// Purpose: Counter Control and Status Registers
//          See RISC-V Privileged Mode Specification 20190608 
// 
// Documentation: RISC-V System on Chip Design Chapter 5
//
// A component of the CORE-V-WALLY configurable RISC-V project.
// 
// Copyright (C) 2021-23 Harvey Mudd College & Oklahoma State University
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

module openhw_csr import cvw::*;  #(parameter cvw_t P) (
  input  logic                     clk, reset,
  input  logic                     FlushM, FlushW,
  input  logic                     StallE, StallM, StallW,
  input  logic [31:0]              InstrM,                    // current instruction
  input  logic [31:0]              InstrOrigM,                // Original compressed or uncompressed instruction in Memory stage for Illegal Instruction MTVAL
  input  logic [P.XLEN-1:0]        PCM, PC2NextF,             // program counter, next PC going to trap/return logic
  input  logic [P.XLEN-1:0]        SrcAM, IEUAdrM,            // SrcA and memory address from IEU
  input  logic                     CSRReadM, CSRWriteM,       // read or write CSR
  input  logic                     TrapM,                     // openhw_trap is occurring
  input  logic                     mretM, sretM, wfiM,        // return or WFI instruction
  input  logic                     IntPendingM,               // at least one interrupt is pending and could occur if enabled
  input  logic                     InterruptM,                // interrupt is occurring
  input  logic                     ExceptionM,                // interrupt is occurring
  input  logic                     MTimerInt,                 // timer interrupt
  input  logic                     MExtInt, SExtInt,          // external interrupt (from PLIC) 
  input  logic                     MSwInt,                    // software interrupt
  input  logic [63:0]              MTIME_CLINT,               // TIME value from CLINT
  input  logic                     InstrValidM,               // current instruction is valid
  input  logic                     FRegWriteM,                // writes to floating point registers change STATUS.FS
  input  logic [4:0]               SetFflagsM,                // Set floating point flag bits in FCSR
  input  logic [1:0]               NextPrivilegeModeM,        // STATUS bits updated based on next privilege mode
  input  logic [1:0]               PrivilegeModeW,            // current privilege mode
  input  logic [3:0]               CauseM,                    // Trap cause
  input  logic                     SelHPTW,                   // hardware page table walker active, so base endianness on supervisor mode
  // inputs for performance counters
  input  logic                     LoadStallD,
  input  logic                     StoreStallD,
  input  logic                     ICacheStallF,
  input  logic                     DCacheStallM,
  input  logic                     BPDirPredWrongM,
  input  logic                     BTAWrongM,
  input  logic                     RASPredPCWrongM,
  input  logic                     IClassWrongM,
  input  logic                     BPWrongM,                  // branch predictor is wrong
  input  logic [3:0]               InstrClassM,
  input  logic                     DCacheMiss,
  input  logic                     DCacheAccess,
  input  logic                     ICacheMiss,
  input  logic                     ICacheAccess,
  input  logic                     sfencevmaM,
  input  logic                     InvalidateICacheM,
  input  logic                     DivBusyE,                  // integer divide busy
  input  logic                     FDivBusyE,                 // floating point divide busy
  // outputs from CSRs
  output logic [1:0]               STATUS_MPP,
  output logic                     STATUS_SPP, STATUS_TSR, STATUS_TVM,
  output logic [15:0]              MEDELEG_REGW, 
  output logic [P.XLEN-1:0]        SATP_REGW,
  output logic [11:0]              MIP_REGW, MIE_REGW, MIDELEG_REGW,
  output logic                     STATUS_MIE, STATUS_SIE,
  output logic                     STATUS_MXR, STATUS_SUM, STATUS_MPRV, STATUS_TW,
  output logic [1:0]               STATUS_FS,
  output var logic [7:0]           PMPCFG_ARRAY_REGW[P.PMP_ENTRIES-1:0],
  output var logic [P.PA_BITS-3:0] PMPADDR_ARRAY_REGW[P.PMP_ENTRIES-1:0],
  output logic [2:0]               FRM_REGW, 
  output logic [3:0]               ENVCFG_CBE,
  //
  output logic [P.XLEN-1:0]        CSRReadValW,               // value read from CSR
  output logic [P.XLEN-1:0]        UnalignedPCNextF,          // Next PC, accounting for traps and returns
  output logic                     IllegalCSRAccessM,         // Illegal CSR access: CSR doesn't exist or is inaccessible at this privilege level
  output logic                     BigEndianM                 // memory access is big-endian based on privilege mode and STATUS register endian fields
);

  localparam MIP = 12'h344;
  localparam SIP = 12'h144;
  
  logic [P.XLEN-1:0]       CSRMReadValM, CSRSReadValM, CSRUReadValM, CSRCReadValM;
  logic [P.XLEN-1:0]       CSRReadValM;  
  logic [P.XLEN-1:0]       CSRSrcM;
  logic [P.XLEN-1:0]       CSRRWM, CSRRSM, CSRRCM;  
  logic [P.XLEN-1:0]       CSRWriteValM;
  logic [P.XLEN-1:0]       MSTATUS_REGW, SSTATUS_REGW, MSTATUSH_REGW;
  logic [P.XLEN-1:0]       STVEC_REGW, MTVEC_REGW;
  logic [P.XLEN-1:0]       MEPC_REGW, SEPC_REGW;
  logic [31:0]             MCOUNTINHIBIT_REGW, MCOUNTEREN_REGW, SCOUNTEREN_REGW;
  logic                    WriteMSTATUSM, WriteMSTATUSHM, WriteSSTATUSM;
  logic                    CSRMWriteM, CSRSWriteM, CSRUWriteM;
  logic                    UngatedCSRMWriteM;
  logic                    WriteFRMM, WriteFFLAGSM;
  logic [P.XLEN-1:0]       UnalignedNextEPCM, NextEPCM, NextMtvalM;
  logic [4:0]              NextCauseM;
  logic [11:0]             CSRAdrM;
  logic                    IllegalCSRCAccessM, IllegalCSRMAccessM, IllegalCSRSAccessM, IllegalCSRUAccessM;
  logic                    InsufficientCSRPrivilegeM;
  logic                    IllegalCSRMWriteReadonlyM;
  logic [P.XLEN-1:0]       CSRReadVal2M;
  logic [11:0]             MIP_REGW_writeable;
  logic [P.XLEN-1:0]       TVecM, TrapVectorM, NextFaultMtvalM;
  logic                    MTrapM, STrapM;
  logic [P.XLEN-1:0]       EPC;
  logic                    RetM;
  logic                    SelMtvecM;
  logic [P.XLEN-1:0]       TVecAlignedM;
  logic                    InstrValidNotFlushedM;
  logic                    STimerInt;
  logic [63:0]             MENVCFG_REGW;
  logic [P.XLEN-1:0]       SENVCFG_REGW;
  logic                    ENVCFG_STCE; // supervisor timer openhw_counter enable
  logic                    ENVCFG_PBMTE; // page-based memory types enable
  logic                    ENVCFG_FIOM; // fence implies io (presently not used)

  // only valid unflushed instructions can access CSRs
  assign InstrValidNotFlushedM = InstrValidM & ~StallW & ~FlushW;

  ///////////////////////////////////////////
  // MTVAL: gets value from PC, Instruction, or load/store address
  ///////////////////////////////////////////

  always_comb
    if (InterruptM)           NextFaultMtvalM = 0;
    else case (CauseM)
      12, 1, 3:               NextFaultMtvalM = PCM;  // Instruction page/access faults, breakpoint
      2:                      NextFaultMtvalM = {{(P.XLEN-32){1'b0}}, InstrOrigM}; // Illegal instruction fault 
      0, 4, 6, 13, 15, 5, 7:  NextFaultMtvalM = IEUAdrM; // Instruction misaligned, Load/Store Misaligned/page/access faults
      default:                NextFaultMtvalM = 0; // Ecall, interrupts
    endcase

  ///////////////////////////////////////////
  // Trap Vectoring & Returns; vectored traps must be aligned to 64-byte address boundaries
  ///////////////////////////////////////////

  // Select openhw_trap vector from STVEC or MTVEC and word-align
  assign SelMtvecM = (NextPrivilegeModeM == P.M_MODE);
  openhw_mux2 #(P.XLEN) tvecmux(STVEC_REGW, MTVEC_REGW, SelMtvecM, TVecM);
  assign TVecAlignedM = {TVecM[P.XLEN-1:2], 2'b00};

  // Support vectored interrupts
  if(P.VECTORED_INTERRUPTS_SUPPORTED) begin:vec
    logic VectoredM;
    logic [P.XLEN-1:0] TVecPlusCauseM;
    assign VectoredM = InterruptM & (TVecM[1:0] == 2'b01);
    assign TVecPlusCauseM = {TVecAlignedM[P.XLEN-1:6], CauseM, 2'b00}; // 64-byte alignment allows concatenation rather than addition
    openhw_mux2 #(P.XLEN) trapvecmux(TVecAlignedM, TVecPlusCauseM, VectoredM, TrapVectorM);
  end else 
    assign TrapVectorM = TVecAlignedM; // unvectored interrupt handler can be at any word-aligned address. This is called Sstvecd

  // Trap Returns
  // A openhw_trap sets the PC to TrapVector
  // A return sets the PC to MEPC or SEPC
  assign RetM = mretM | sretM;
  openhw_mux2 #(P.XLEN) epcmux(SEPC_REGW, MEPC_REGW, mretM, EPC);
  openhw_mux3 #(P.XLEN) pcmux3(PC2NextF, EPC, TrapVectorM, {TrapM, RetM}, UnalignedPCNextF);

  ///////////////////////////////////////////
  // CSRWriteValM
  ///////////////////////////////////////////

  always_comb begin
    // Choose either rs1 or uimm[4:0] as source
    CSRSrcM = InstrM[14] ? {{(P.XLEN-5){1'b0}}, InstrM[19:15]} : SrcAM;

    // CSR set and clear for MIP/SIP should only touch internal state, not interrupt inputs
    if (CSRAdrM == MIP | CSRAdrM == SIP) CSRReadVal2M = {{(P.XLEN-12){1'b0}}, MIP_REGW_writeable};
    else                                 CSRReadVal2M = CSRReadValM;

    // Compute AND/OR modification
    CSRRWM =   CSRSrcM;
    CSRRSM =   CSRReadVal2M | CSRSrcM;
    CSRRCM =   CSRReadVal2M & ~CSRSrcM;
    case (InstrM[13:12])
      2'b01:   CSRWriteValM = CSRRWM;
      2'b10:   CSRWriteValM = CSRRSM;
      2'b11:   CSRWriteValM = CSRRCM;
      default: CSRWriteValM = CSRReadValM;
    endcase
  end

  ///////////////////////////////////////////
  // CSR Write values
  ///////////////////////////////////////////

  assign CSRAdrM = InstrM[31:20];
  assign UnalignedNextEPCM = TrapM ? ((wfiM & IntPendingM) ? PCM+4 : PCM) : CSRWriteValM;
  assign NextEPCM = P.C_SUPPORTED ? {UnalignedNextEPCM[P.XLEN-1:1], 1'b0} : {UnalignedNextEPCM[P.XLEN-1:2], 2'b00}; // 3.1.15 alignment
  assign NextCauseM = TrapM ? {InterruptM, CauseM}: {CSRWriteValM[P.XLEN-1], CSRWriteValM[3:0]};
  assign NextMtvalM = TrapM ? NextFaultMtvalM : CSRWriteValM;
  assign UngatedCSRMWriteM = CSRWriteM & (PrivilegeModeW == P.M_MODE);
  assign CSRMWriteM = UngatedCSRMWriteM & InstrValidNotFlushedM;
  assign CSRSWriteM = CSRWriteM & (|PrivilegeModeW) & InstrValidNotFlushedM;
  assign CSRUWriteM = CSRWriteM  & InstrValidNotFlushedM;
  assign MTrapM = TrapM & (NextPrivilegeModeM == P.M_MODE);
  assign STrapM = TrapM & (NextPrivilegeModeM == P.S_MODE) & P.S_SUPPORTED;

  ///////////////////////////////////////////
  // CSRs
  ///////////////////////////////////////////

  openhw_csri #(P) csri(.clk, .reset,  
    .CSRMWriteM, .CSRSWriteM, .CSRWriteValM, .CSRAdrM, 
    .MExtInt, .SExtInt, .MTimerInt, .STimerInt, .MSwInt,
    .MIDELEG_REGW, .ENVCFG_STCE, .MIP_REGW, .MIE_REGW, .MIP_REGW_writeable);

  openhw_csrsr #(P) csrsr(.clk, .reset, .StallW, 
    .WriteMSTATUSM, .WriteMSTATUSHM, .WriteSSTATUSM, 
    .TrapM, .FRegWriteM, .NextPrivilegeModeM, .PrivilegeModeW,
    .mretM, .sretM, .WriteFRMM, .WriteFFLAGSM, .CSRWriteValM, .SelHPTW,
    .MSTATUS_REGW, .SSTATUS_REGW, .MSTATUSH_REGW,
    .STATUS_MPP, .STATUS_SPP, .STATUS_TSR, .STATUS_TW,
    .STATUS_MIE, .STATUS_SIE, .STATUS_MXR, .STATUS_SUM, .STATUS_MPRV, .STATUS_TVM,
    .STATUS_FS, .BigEndianM);

  openhw_csrm #(P) csrm(.clk, .reset, 
    .UngatedCSRMWriteM, .CSRMWriteM, .MTrapM, .CSRAdrM,
    .NextEPCM, .NextCauseM, .NextMtvalM, .MSTATUS_REGW, .MSTATUSH_REGW,
    .CSRWriteValM, .CSRMReadValM, .MTVEC_REGW,
    .MEPC_REGW, .MCOUNTEREN_REGW, .MCOUNTINHIBIT_REGW, 
    .MEDELEG_REGW, .MIDELEG_REGW,.PMPCFG_ARRAY_REGW, .PMPADDR_ARRAY_REGW,
    .MIP_REGW, .MIE_REGW, .WriteMSTATUSM, .WriteMSTATUSHM,
    .IllegalCSRMAccessM, .IllegalCSRMWriteReadonlyM,
    .MENVCFG_REGW);


  if (P.S_SUPPORTED) begin:csrs
    logic STCE; 
    assign STCE = P.SSTC_SUPPORTED & (PrivilegeModeW == P.M_MODE | (MCOUNTEREN_REGW[1] & ENVCFG_STCE));
    openhw_csrs #(P) csrs(.clk, .reset,
      .CSRSWriteM, .STrapM, .CSRAdrM,
      .NextEPCM, .NextCauseM, .NextMtvalM, .SSTATUS_REGW, 
      .STATUS_TVM, .MCOUNTEREN_TM(MCOUNTEREN_REGW[1]),
      .CSRWriteValM, .PrivilegeModeW,
      .CSRSReadValM, .STVEC_REGW, .SEPC_REGW,      
      .SCOUNTEREN_REGW,
      .SATP_REGW, .MIP_REGW, .MIE_REGW, .MIDELEG_REGW, .MTIME_CLINT, .STCE,
      .WriteSSTATUSM, .IllegalCSRSAccessM, .STimerInt, .SENVCFG_REGW);
  end else begin
    assign WriteSSTATUSM = 0;
    assign CSRSReadValM = 0;
    assign SEPC_REGW = 0;
    assign STVEC_REGW = 0;
    assign SCOUNTEREN_REGW = 0;
    assign SATP_REGW = 0;
    assign IllegalCSRSAccessM = 1;
  end

  // Floating Point CSRs in User Mode only needed if Floating Point is supported
  if (P.F_SUPPORTED | P.D_SUPPORTED) begin:csru
    openhw_csru #(P) csru(.clk, .reset, .InstrValidNotFlushedM, 
      .CSRUWriteM, .CSRAdrM, .CSRWriteValM, .STATUS_FS, .CSRUReadValM,  
      .SetFflagsM, .FRM_REGW, .WriteFRMM, .WriteFFLAGSM,
      .IllegalCSRUAccessM);
  end else begin
    assign FRM_REGW = 0;
    assign CSRUReadValM = 0;
    assign IllegalCSRUAccessM = 1;
  end
  
  if (P.ZICNTR_SUPPORTED) begin:counters
    openhw_csrc #(P) counters(.clk, .reset, .StallE, .StallM, .FlushM,
      .InstrValidNotFlushedM, .LoadStallD, .StoreStallD, .CSRWriteM, .CSRMWriteM,
      .BPDirPredWrongM, .BTAWrongM, .RASPredPCWrongM, .IClassWrongM, .BPWrongM,
      .InstrClassM, .DCacheMiss, .DCacheAccess, .ICacheMiss, .ICacheAccess, .sfencevmaM,
      .InterruptM, .ExceptionM, .InvalidateICacheM, .ICacheStallF, .DCacheStallM, .DivBusyE, .FDivBusyE,
      .CSRAdrM, .PrivilegeModeW, .CSRWriteValM,
      .MCOUNTINHIBIT_REGW, .MCOUNTEREN_REGW, .SCOUNTEREN_REGW,
      .MTIME_CLINT,  .CSRCReadValM, .IllegalCSRCAccessM);
  end else begin
    assign CSRCReadValM = 0;
    assign IllegalCSRCAccessM = 1; // counters aren't enabled
  end

   // Broadcast appropriate environment configuration based on privilege mode
  assign ENVCFG_STCE =  MENVCFG_REGW[63]; // supervisor timer openhw_counter enable
  assign ENVCFG_PBMTE = MENVCFG_REGW[62]; // page-based memory types enable
  assign ENVCFG_CBE =   (PrivilegeModeW == P.M_MODE) ? 4'b1111 : 
                        (PrivilegeModeW == P.S_MODE | !P.S_SUPPORTED) ? MENVCFG_REGW[7:4] : 
                                                                       (MENVCFG_REGW[7:4] & SENVCFG_REGW[7:4]);
  // FIOM presently doesn't do anything because Wally fences don't do anything
  assign ENVCFG_FIOM =  (PrivilegeModeW == P.M_MODE) ? 1'b1 : 
                        (PrivilegeModeW == P.S_MODE | !P.S_SUPPORTED) ? MENVCFG_REGW[0] : 
                                                                       (MENVCFG_REGW[0] & SENVCFG_REGW[0]);

  // merge CSR Reads
  assign CSRReadValM = CSRUReadValM | CSRSReadValM | CSRMReadValM | CSRCReadValM; 
  openhw_flopenrc #(P.XLEN) CSRValWReg(clk, reset, FlushW, ~StallW, CSRReadValM, CSRReadValW);

  // merge illegal accesses: illegal if none of the CSR addresses is legal or privilege is insufficient
  assign InsufficientCSRPrivilegeM = (CSRAdrM[9:8] == 2'b11 & PrivilegeModeW != P.M_MODE) |
                                     (CSRAdrM[9:8] == 2'b01 & PrivilegeModeW == P.U_MODE);
  assign IllegalCSRAccessM = ((IllegalCSRCAccessM & IllegalCSRMAccessM & 
    IllegalCSRSAccessM & IllegalCSRUAccessM |
    InsufficientCSRPrivilegeM) & CSRReadM) | IllegalCSRMWriteReadonlyM;
endmodule
