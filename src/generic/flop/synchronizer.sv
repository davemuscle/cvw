///////////////////////////////////////////
// synchronizer.sv
//
// Written: David_Harris@hmc.edu 25 October 2021
// Modified: 
//
// Purpose: Two-stage flip-flop synchronizer
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

module openhw_synchronizer ( 
  input  logic clk,
  input  logic d, 
  output logic q);

  logic mid;

  always_ff @(posedge clk) begin
    mid <= d;
    q <= mid;
  end
endmodule

