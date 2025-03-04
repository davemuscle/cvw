///////////////////////////////////////////
// riscvassertions.sv
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

module riscvassertions import cvw::*; #(parameter cvw_t P);
  initial begin
    assert (P.PMP_ENTRIES == 0 || P.PMP_ENTRIES==16 || P.PMP_ENTRIES==64) else $error("Illegal number of PMP entries: PMP_ENTRIES must be 0, 16, or 64");
    assert (P.S_SUPPORTED || P.VIRTMEM_SUPPORTED == 0) else $error("Virtual memory requires S mode support");
    assert (P.IDIV_BITSPERCYCLE == 1 || P.IDIV_BITSPERCYCLE==2 || P.IDIV_BITSPERCYCLE==4) else $error("Illegal number of divider bits/cycle: IDIV_BITSPERCYCLE must be 1, 2, or 4");
    assert (P.F_SUPPORTED || ~P.D_SUPPORTED) else $error("Can't support double fp (D) without supporting float (F)");
    assert (P.D_SUPPORTED || ~P.Q_SUPPORTED) else $error("Can't support quad fp (Q) without supporting double (D)");
    assert (P.F_SUPPORTED || ~P.ZFH_SUPPORTED) else $error("Can't support half-precision fp (ZFH) without supporting float (F)");
    assert (P.DCACHE_SUPPORTED || ~P.F_SUPPORTED || P.FLEN <= P.XLEN) else $error("Data cache required to support FLEN > XLEN because AHB bus width is XLEN");
    assert (P.I_SUPPORTED ^ P.E_SUPPORTED) else $error("Exactly one of I and E must be supported");
    assert (P.FLEN<=P.XLEN || P.DCACHE_SUPPORTED || P.DTIM_SUPPORTED) else $error("Wally does not support FLEN > XLEN unleses data cache or DTIM is supported");
    assert (P.DCACHE_WAYSIZEINBYTES <= 4096 || (!P.DCACHE_SUPPORTED) || P.VIRTMEM_SUPPORTED == 0) else $error("DCACHE_WAYSIZEINBYTES cannot exceed 4 KiB when caches and vitual memory is enabled (to prevent aliasing)");
    assert (P.DCACHE_LINELENINBITS >= 128 || (!P.DCACHE_SUPPORTED)) else $error("DCACHE_LINELENINBITS must be at least 128 when caches are enabled");
    assert (P.DCACHE_LINELENINBITS < P.DCACHE_WAYSIZEINBYTES*8) else $error("DCACHE_LINELENINBITS must be smaller than way size");
    assert (P.ICACHE_WAYSIZEINBYTES <= 4096 || (!P.ICACHE_SUPPORTED) || P.VIRTMEM_SUPPORTED == 0) else $error("ICACHE_WAYSIZEINBYTES cannot exceed 4 KiB when caches and vitual memory is enabled (to prevent aliasing)");
    assert (P.ICACHE_LINELENINBITS >= 32 || (!P.ICACHE_SUPPORTED)) else $error("ICACHE_LINELENINBITS must be at least 32 when caches are enabled");
    assert (P.ICACHE_LINELENINBITS < P.ICACHE_WAYSIZEINBYTES*8) else $error("ICACHE_LINELENINBITS must be smaller than way size");
    assert (2**$clog2(P.DCACHE_LINELENINBITS) == P.DCACHE_LINELENINBITS || (!P.DCACHE_SUPPORTED)) else $error("DCACHE_LINELENINBITS must be a power of 2");
    assert (2**$clog2(P.DCACHE_WAYSIZEINBYTES) == P.DCACHE_WAYSIZEINBYTES || (!P.DCACHE_SUPPORTED)) else $error("DCACHE_WAYSIZEINBYTES must be a power of 2");
    assert (2**$clog2(P.ICACHE_LINELENINBITS) == P.ICACHE_LINELENINBITS || (!P.ICACHE_SUPPORTED)) else $error("ICACHE_LINELENINBITS must be a power of 2");
    assert (2**$clog2(P.ICACHE_WAYSIZEINBYTES) == P.ICACHE_WAYSIZEINBYTES || (!P.ICACHE_SUPPORTED)) else $error("ICACHE_WAYSIZEINBYTES must be a power of 2");
    assert (2**$clog2(P.ITLB_ENTRIES) == P.ITLB_ENTRIES || P.VIRTMEM_SUPPORTED==0) else $error("ITLB_ENTRIES must be a power of 2");
    assert (2**$clog2(P.DTLB_ENTRIES) == P.DTLB_ENTRIES || P.VIRTMEM_SUPPORTED==0) else $error("DTLB_ENTRIES must be a power of 2");
    assert (P.UNCORE_RAM_RANGE >= 56'h07FFFFFF) else $warning("Some regression tests will fail if UNCORE_RAM_RANGE is less than 56'h07FFFFFF");
	  assert (P.ZICSR_SUPPORTED == 1 || (P.PMP_ENTRIES == 0 && P.VIRTMEM_SUPPORTED == 0)) else $error("PMP_ENTRIES and VIRTMEM_SUPPORTED must be zero if ZICSR not supported.");
    assert (P.ZICSR_SUPPORTED == 1 || (P.S_SUPPORTED == 0 && P.U_SUPPORTED == 0)) else $error("S and U modes not supported if ZICSR not supported");
    assert (P.U_SUPPORTED || (P.S_SUPPORTED == 0)) else $error ("S mode only supported if U also is supported");
    assert (P.VIRTMEM_SUPPORTED == 0 || (P.DTIM_SUPPORTED == 0 && P.IROM_SUPPORTED == 0)) else $error("Can't simultaneously have virtual memory and DTIM_SUPPORTED/IROM_SUPPORTED because local memories don't translate addresses");
    assert (P.DCACHE_SUPPORTED || P.VIRTMEM_SUPPORTED ==0) else $error("Virtual memory needs dcache");
    assert (P.ICACHE_SUPPORTED || P.VIRTMEM_SUPPORTED ==0) else $error("Virtual memory needs icache");
    assert ((P.DCACHE_SUPPORTED == 0 && P.ICACHE_SUPPORTED == 0) || P.BUS_SUPPORTED) else $error("Dcache and Icache requires DBUS_SUPPORTED.");
    assert (P.DCACHE_LINELENINBITS <= P.XLEN*16 || (!P.DCACHE_SUPPORTED)) else $error("DCACHE_LINELENINBITS must not exceed 16 words because max AHB burst size is 1");
    assert (P.DCACHE_LINELENINBITS % 4 == 0) else $error("DCACHE_LINELENINBITS must hold 4, 8, or 16 words");
    assert (P.DCACHE_SUPPORTED || (P.A_SUPPORTED == 0)) else $error("Atomic extension (A) requires cache on Wally.");
    assert (P.IDIV_ON_FPU == 0 || P.F_SUPPORTED) else $error("IDIV on FPU needs F_SUPPORTED");
    assert (P.SSTC_SUPPORTED == 0 || (P.S_SUPPORTED)) else $error("SSTC requires S_SUPPORTED");
    assert ((P.ZMMUL_SUPPORTED == 0) || (P.M_SUPPORTED ==0)) else $error("At most one of ZMMUL_SUPPORTED and M_SUPPORTED can be enabled");
    assert ((P.ZICNTR_SUPPORTED == 0) || (P.ZICSR_SUPPORTED == 1)) else $error("ZICNTR_SUPPORTED requires ZICSR_SUPPORTED");
    assert ((P.ZIHPM_SUPPORTED == 0) || (P.ZICNTR_SUPPORTED == 1)) else $error("ZIPHM_SUPPORTED requires ZICNTR_SUPPORTED");
    assert ((P.ZICBOM_SUPPORTED == 0) || (P.DCACHE_SUPPORTED == 1)) else $error("ZICBOM required DCACHE_SUPPORTED");
    assert ((P.ZICBOZ_SUPPORTED == 0) || (P.DCACHE_SUPPORTED == 1)) else $error("ZICBOZ required DCACHE_SUPPORTED");
    assert ((P.ZICBOP_SUPPORTED == 0) || (P.DCACHE_SUPPORTED == 1)) else $error("ZICBOP required DCACHE_SUPPORTED");
  end

endmodule


