#!/usr/bin/env python3

#
# LibreLane build script to generate HeiChips 2025 template
#
# Copyright (c) 2025 Leo Moser <leo.moser@pm.me>
# Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
# SPDX-License-Identifier: Apache-2.0
#

import glob
import os
import shutil
import sys

from typing import List, Type

from librelane.flows.sequential import SequentialFlow
from librelane.steps import (
    Step,
	Yosys,
	OpenROAD,
	Odb
)

class BlockTemplateFlow(SequentialFlow):

	Steps: List[Type[Step]] = [
		Yosys.Synthesis,
		OpenROAD.Floorplan,
        Odb.CustomIOPlacement,
	]


def generate_template(width, height, name, pins="pins.cfg", src="src/heichips25_template.v"):
	# Get PDK_ROOT and PDK
	PDK_ROOT = os.getenv('PDK_ROOT', os.path.expanduser('~/.ciel'))
	PDK = os.getenv('PDK', 'ihp-sg13g2')

	# Create and run custom flow
	flow_cfg = {
		# Main design properties
		"DESIGN_NAME"    : "heichips25_template",

		# Sources
		"VERILOG_FILES"  : [
			src,
		],

		# Floorplanning
		"DIE_AREA"           :  [0, 0, width, height],
		"FP_SIZING"          : "absolute",
		#"BOTTOM_MARGIN_MULT" : 1,
		#"TOP_MARGIN_MULT"    : 1,
		#"LEFT_MARGIN_MULT"   : 6,
		#"RIGHT_MARGIN_MULT"  : 6,
		
		"IO_PIN_ORDER_CFG": pins,

		# Synthesis
		"SYNTH_ELABORATE_ONLY" : True,
	}

	flow = BlockTemplateFlow(
		flow_cfg,
		design_dir = ".",
		pdk_root   = PDK_ROOT,
		pdk        = PDK,
	)

	flow.start()

	# Collect and rename the build product
	m = list(sorted(glob.glob(os.path.join('runs', '*', 'final', 'def', 'heichips25_template.def'))))[-1]

	shutil.copyfile(m, f"def/{name}")


if __name__ == '__main__':

	# Create destination directory
	if not os.path.exists("def"):
		os.mkdir("def")

	generate_template(width=500, height=200, name="heichips25_template_small.def")
	generate_template(width=500, height=415, name="heichips25_template_large.def")
	
	# Additional templates
	generate_template(width=500, height=200, name="heichips25_template_small_hdmi.def", pins="pins_hdmi.cfg", src="src/heichips25_template_hdmi.v")
	generate_template(width=500, height=200, name="heichips25_template_small_usb.def", pins="pins_usb.cfg", src="src/heichips25_template_usb.v")
	generate_template(width=500, height=200, name="heichips25_template_small_cryo.def", pins="pins_cryo.cfg", src="src/heichips25_template_cryo.v")
