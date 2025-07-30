// Copyright 2025 Leo Moser
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module IHP_SRAM_1024x32 #(parameter NoConfigBits = 0)(
	// ConfigBits has to be adjusted manually (we don't use an arithmetic parser for the value)
	
	// User design
    input  [(10 - 1) : 0] ADDR,
    input  [(32 - 1) : 0] DIN,
    input  [(32 - 1) : 0] BM,
    input                 WEN,
    input                 MEN,
    input                 REN,
    	output [(32 - 1) : 0] DOUT,

	// SRAM
    (* FABulous, EXTERNAL *) output [(10 - 1) : 0] ADDR_SRAM,
    (* FABulous, EXTERNAL *) output [(32 - 1) : 0] DIN_SRAM,
    (* FABulous, EXTERNAL *) output [(32 - 1) : 0] BM_SRAM,
    (* FABulous, EXTERNAL *) output                WEN_SRAM,
    (* FABulous, EXTERNAL *) output                MEN_SRAM,
    (* FABulous, EXTERNAL *) output                REN_SRAM,
    (* FABulous, EXTERNAL *) input  [(32 - 1) : 0] DOUT_SRAM,
    
    (* FABulous, EXTERNAL *) output                CLK_SRAM,
    
    (* FABulous, EXTERNAL *) output                TIE_HIGH_SRAM,
    (* FABulous, EXTERNAL *) output                TIE_LOW_SRAM,
    
    (* FABulous, EXTERNAL *) input                 CONFIGURED_top,
    
    // External and shared clock
    (* FABulous, EXTERNAL, SHARED_PORT *) input UserCLK,
    
    	(* FABulous, GLOBAL *) input [NoConfigBits-1:0] ConfigBits
);
    
	assign ADDR_SRAM    = ADDR;
	assign DIN_SRAM     = DIN;
	assign BM_SRAM      = BM;
	assign WEN_SRAM     = WEN;
	// Only enable the SRAM if the fabric is configured
	assign MEN_SRAM     = MEN && CONFIGURED_top;
	assign REN_SRAM     = REN;
	assign DOUT         = DOUT_SRAM;

	assign CLK_SRAM     = UserCLK;
	
	assign TIE_HIGH_SRAM = 1'b1;
	assign TIE_LOW_SRAM  = 1'b0;

endmodule
