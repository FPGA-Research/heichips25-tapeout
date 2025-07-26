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

module TT_PROJECT #(parameter NoConfigBits = 0)(
	// ConfigBits has to be adjusted manually (we don't use an arithmetic parser for the value)
	
	// User design
    input  wire [7:0] UI_IN,
    output wire [7:0] UO_OUT,
    input  wire [7:0] UIO_IN,
    output wire [7:0] UIO_OUT,
    output wire [7:0] UIO_OE,
    input  wire       ENA,
    input  wire       RST_N,

    // TT_PROJECT
    (* FABulous, EXTERNAL *) output wire [7:0] UI_IN_TT_PROJECT,
    (* FABulous, EXTERNAL *) input  wire [7:0] UO_OUT_TT_PROJECT,
    (* FABulous, EXTERNAL *) output wire [7:0] UIO_IN_TT_PROJECT,
    (* FABulous, EXTERNAL *) input  wire [7:0] UIO_OUT_TT_PROJECT,
    (* FABulous, EXTERNAL *) input  wire [7:0] UIO_OE_TT_PROJECT,
    (* FABulous, EXTERNAL *) output wire       ENA_TT_PROJECT,
    (* FABulous, EXTERNAL *) output wire       CLK_TT_PROJECT,
    (* FABulous, EXTERNAL *) output wire       RST_N_TT_PROJECT,
    
    // External and shared clock
    (* FABulous, EXTERNAL, SHARED_PORT *) input UserCLK,
    
    	(* FABulous, GLOBAL *) input [NoConfigBits-1:0] ConfigBits
);
    assign CLK_TT_PROJECT = UserCLK;
    
    assign UI_IN_TT_PROJECT     = UI_IN;
    assign UIO_IN_TT_PROJECT    = UIO_IN;
    assign ENA_TT_PROJECT       = ENA;
    assign RST_N_TT_PROJECT     = RST_N;
    
    assign UO_OUT   = UO_OUT_TT_PROJECT;
    assign UIO_OUT  = UIO_OUT_TT_PROJECT;
    assign UIO_OE   = UIO_OE_TT_PROJECT;

endmodule
