///////////////////////////////////////////
// ahbinterface.sv
//
// Written: Ross Thompson ross1728@gmail.com
// Created: August 29, 2022
// Modified: 18 January 2023
//
// Purpose: Translates LSU simple memory requests into AHB transactions (NON_SEQ).
// 
// Documentation: RISC-V System on Chip Design Chapter 6 (Figure 6.21)
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

module openhw_ahbinterface #(
  parameter XLEN,
  parameter LSU = 0                                   // 1: LSU bus width is `XLEN, 0: IFU bus width is 32 bits
)( 
  input  logic                          HCLK, HRESETn,
  // bus interface
  input  logic                          HREADY,       // AHB peripheral ready
  output logic [1:0]                    HTRANS,       // AHB transaction type, 00: IDLE, 10 NON_SEQ, 11 SEQ
  output logic                          HWRITE,       // AHB 0: Read operation 1: Write operation 
  input  logic [XLEN-1:0]               HRDATA,       // AHB read data
  output logic [XLEN-1:0]               HWDATA,       // AHB write data
  output logic [XLEN/8-1:0]             HWSTRB,       // AHB byte mask
  
  // lsu/ifu interface
  input  logic                          Stall,        // Core pipeline is stalled
  input  logic                          Flush,        // Pipeline stage flush. Prevents bus transaction from starting
  input  logic [1:0]                    BusRW,        // Memory operation read/write control: 10: read, 01: write
  input  logic [XLEN/8-1:0]             ByteMask,     // Bytes enables within a word
  input  logic [XLEN-1:0]               WriteData,    // IEU write data for a store
  output logic                          BusStall,     // Bus is busy with an in flight memory operation
  output logic                          BusCommitted, // Bus is busy with an in flight memory operation and it is not safe to take an interrupt
  output logic [(LSU ? XLEN : 32)-1:0]  FetchBuffer   // Register to hold HRDATA after arriving from the bus
);
  
  logic                                 CaptureEn;
  localparam                            LEN = (LSU ? XLEN : 32);   // 32 bits for IFU, XLEN for LSU
  
  openhw_flopen #(LEN) fb(.clk(HCLK), .en(CaptureEn), .d(HRDATA[LEN-1:0]), .q(FetchBuffer));

  if(LSU) begin
    // delay HWDATA by 1 cycle per spec; assumes AHBW = XLEN    
    openhw_flop #(XLEN)   wdreg(HCLK, WriteData, HWDATA); 
    openhw_flop #(XLEN/8) HWSTRBReg(HCLK, ByteMask, HWSTRB);
  end else begin
    assign HWDATA = '0;
    assign HWSTRB = '0;
  end    

  openhw_busfsm busfsm(.HCLK, .HRESETn, .Flush, .BusRW,
    .BusCommitted, .Stall, .BusStall, .CaptureEn, .HREADY,
    .HTRANS, .HWRITE);

endmodule
