///////////////////////////////////////////
// adrdecs.sv
//
// Written: David_Harris@hmc.edu 22 June 2021
// Modified: 
//
// Purpose: All the address decoders for peripherals
// 
// Documentation: RISC-V System on Chip Design Chapter 8
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

  // verilator lint_off UNOPTFLAT 

module openhw_adrdecs import cvw::*;  #(parameter cvw_t P) (
  input  logic [P.PA_BITS-1:0] PhysicalAddress,
  input  logic                 AccessRW, AccessRX, AccessRWX,
  input  logic [1:0]           Size,
  output logic [10:0]          SelRegions
);

  localparam logic [3:0]       SUPPORTED_SIZE = (P.LLEN == 32 ? 4'b0111 : 4'b1111);
 // Determine which region of physical memory (if any) is being accessed
  openhw_adrdec #(P.PA_BITS) dtimdec(PhysicalAddress, P.DTIM_BASE[P.PA_BITS-1:0], P.DTIM_RANGE[P.PA_BITS-1:0], P.DTIM_SUPPORTED, AccessRW, Size, SUPPORTED_SIZE, SelRegions[10]);  
  openhw_adrdec #(P.PA_BITS) iromdec(PhysicalAddress, P.IROM_BASE[P.PA_BITS-1:0], P.IROM_RANGE[P.PA_BITS-1:0], P.IROM_SUPPORTED, AccessRX, Size, SUPPORTED_SIZE, SelRegions[9]);  
  openhw_adrdec #(P.PA_BITS) ddr4dec(PhysicalAddress, P.EXT_MEM_BASE[P.PA_BITS-1:0], P.EXT_MEM_RANGE[P.PA_BITS-1:0], P.EXT_MEM_SUPPORTED, AccessRWX, Size, SUPPORTED_SIZE, SelRegions[8]);  
  openhw_adrdec #(P.PA_BITS) bootromdec(PhysicalAddress, P.BOOTROM_BASE[P.PA_BITS-1:0], P.BOOTROM_RANGE[P.PA_BITS-1:0], P.BOOTROM_SUPPORTED, AccessRX, Size, SUPPORTED_SIZE, SelRegions[7]);
  openhw_adrdec #(P.PA_BITS) uncoreramdec(PhysicalAddress, P.UNCORE_RAM_BASE[P.PA_BITS-1:0], P.UNCORE_RAM_RANGE[P.PA_BITS-1:0], P.UNCORE_RAM_SUPPORTED, AccessRWX, Size, SUPPORTED_SIZE, SelRegions[6]);
  openhw_adrdec #(P.PA_BITS) clintdec(PhysicalAddress, P.CLINT_BASE[P.PA_BITS-1:0], P.CLINT_RANGE[P.PA_BITS-1:0], P.CLINT_SUPPORTED, AccessRW, Size, SUPPORTED_SIZE, SelRegions[5]);
  openhw_adrdec #(P.PA_BITS) gpiodec(PhysicalAddress, P.GPIO_BASE[P.PA_BITS-1:0], P.GPIO_RANGE[P.PA_BITS-1:0], P.GPIO_SUPPORTED, AccessRW, Size, 4'b0100, SelRegions[4]);
  openhw_adrdec #(P.PA_BITS) uartdec(PhysicalAddress, P.UART_BASE[P.PA_BITS-1:0], P.UART_RANGE[P.PA_BITS-1:0], P.UART_SUPPORTED, AccessRW, Size, 4'b0001, SelRegions[3]);
  openhw_adrdec #(P.PA_BITS) plicdec(PhysicalAddress, P.PLIC_BASE[P.PA_BITS-1:0], P.PLIC_RANGE[P.PA_BITS-1:0], P.PLIC_SUPPORTED, AccessRW, Size, 4'b0100, SelRegions[2]);
  openhw_adrdec #(P.PA_BITS) sdcdec(PhysicalAddress, P.SDC_BASE[P.PA_BITS-1:0], P.SDC_RANGE[P.PA_BITS-1:0], P.SDC_SUPPORTED, AccessRW, Size, SUPPORTED_SIZE, SelRegions[1]);

  assign SelRegions[0] = ~|(SelRegions[10:1]); // none of the regions are selected
endmodule

  // verilator lint_on UNOPTFLAT 
