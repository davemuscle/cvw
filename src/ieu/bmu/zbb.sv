
///////////////////////////////////////////
// zbb.sv
//
// Written: Kevin Kim <kekim@hmc.edu> and Kip Macsai-Goren <kmacsaigoren@hmc.edu>
// Created: 2 February 2023
// Modified: March 6 2023
//
// Purpose: RISC-V ZBB top level unit
//
// Documentation: RISC-V System on Chip Design Chapter 15
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

module openhw_zbb #(parameter WIDTH=32) (
  input  logic [WIDTH-1:0] A, RevA, B,   // Operands
  input  logic             W64,          // Indicates word operation
  input  logic             LT,           // lt flag
  input  logic             LTU,          // ltu flag
  input  logic             BUnsigned,      // max/min (signed) flag
  input  logic [2:0]       ZBBSelect,    // ZBB Result select signal
  output logic [WIDTH-1:0] ZBBResult);   // ZBB result

  logic lt;                              // lt given signed/unsigned
  logic [WIDTH-1:0] CntResult;           // count result
  logic [WIDTH-1:0] MinMaxResult;        // min, max result
  logic [WIDTH-1:0] ByteResult;          // byte results
  logic [WIDTH-1:0] ExtResult;           // sign/zero openhw_extend results

  openhw_mux2 #(1) ltmux(LT, LTU, BUnsigned , lt);
  openhw_cnt #(WIDTH) cnt(.A, .RevA, .B(B[1:0]), .W64, .CntResult);
  openhw_byteop #(WIDTH) bu(.A, .ByteSelect(B[0]), .ByteResult);
  openhw_ext #(WIDTH) ext(.A, .ExtSelect({~B[2], {B[2] & B[0]}}), .ExtResult);

  // ZBBSelect[2] differentiates between min(u) vs max(u) instruction
  openhw_mux2 #(WIDTH) minmaxmux(B, A, ZBBSelect[2]^lt, MinMaxResult);

  // ZBB Result select mux
  openhw_mux4 #(WIDTH) zbbresultmux(CntResult, ExtResult, ByteResult, MinMaxResult, ZBBSelect[1:0], ZBBResult);
endmodule
