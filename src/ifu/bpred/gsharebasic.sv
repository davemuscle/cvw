///////////////////////////////////////////
// gsharebasic.sv
//
// Written: Ross Thompson
// Email: ross1728@gmail.com
// Created: 16 March 2021
// Adapted from ssanghai@hmc.edu (Shreya Sanghai) global history predictor implementation.
// Modified: 20 February 2023 
//
// Purpose: Global History Branch predictor with parameterized global history register
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

module openhw_gsharebasic import cvw::*; #(parameter cvw_t P,
                     parameter XLEN,
                     parameter k = 10,
                     parameter TYPE = 1) (
  input logic             clk,
  input logic             reset,
  input logic             StallF, StallD, StallE, StallM, StallW,
  input logic             FlushD, FlushE, FlushM, FlushW,
  output logic [1:0]      BPDirPredF, 
  output logic            BPDirPredWrongE,
  // update
  input logic [XLEN-1:0] PCNextF, PCM,
  input logic             BranchE, BranchM, PCSrcE
);

  logic [k-1:0]           IndexNextF, IndexM;
  logic [1:0]             BPDirPredD, BPDirPredE;
  logic [1:0]             NewBPDirPredE, NewBPDirPredM;

  logic [k-1:0]           GHRF, GHRD, GHRE, GHRM, GHR;
  logic [k-1:0]           GHRNext;
  logic                   PCSrcM;

  if(TYPE == 1) begin
  assign IndexNextF = GHR ^ {PCNextF[k+1] ^ PCNextF[1], PCNextF[k:2]};
  assign IndexM = GHRM ^ {PCM[k+1] ^ PCM[1], PCM[k:2]};
  end else if(TYPE == 0) begin
  assign IndexNextF = GHRNext;
  assign IndexM = GHRM;
  end
  
  openhw_ram2p1r1wbe #(P, 2**k, 2) PHT(.clk(clk),
    .ce1(~StallF), .ce2(~StallW & ~FlushW),
    .ra1(IndexNextF),
    .rd1(BPDirPredF),
    .wa2(IndexM),
    .wd2(NewBPDirPredM),
    .we2(BranchM),
    .bwe2(1'b1));

  openhw_flopenrc #(2) PredictionRegD(clk, reset,  FlushD, ~StallD, BPDirPredF, BPDirPredD);
  openhw_flopenrc #(2) PredictionRegE(clk, reset,  FlushE, ~StallE, BPDirPredD, BPDirPredE);

  openhw_satCounter2 BPDirUpdateE(.BrDir(PCSrcE), .OldState(BPDirPredE), .NewState(NewBPDirPredE));
  openhw_flopenrc #(2) NewPredictionRegM(clk, reset,  FlushM, ~StallM, NewBPDirPredE, NewBPDirPredM);

  assign BPDirPredWrongE = PCSrcE != BPDirPredE[1] & BranchE;

  assign GHRNext = BranchM ? {PCSrcM, GHR[k-1:1]} : GHR;
  openhw_flopenr #(k) GHRReg(clk, reset, ~StallM & ~FlushM & BranchM, GHRNext, GHR);
  openhw_flopenrc #(1) PCSrcMReg(clk, reset, FlushM, ~StallM, PCSrcE, PCSrcM);
    
  openhw_flopenrc #(k) GHRFReg(clk, reset, FlushD, ~StallF, GHR, GHRF);
  openhw_flopenrc #(k) GHRDReg(clk, reset, FlushD, ~StallD, GHRF, GHRD);
  openhw_flopenrc #(k) GHREReg(clk, reset, FlushE, ~StallE, GHRD, GHRE);
  openhw_flopenrc #(k) GHRMReg(clk, reset, FlushM, ~StallM, GHRE, GHRM);


endmodule
