import os
import pya

layout = pya.Layout()
layout.read(os.path.expanduser("~/.ciel/ihp-sg13g2/libs.ref/sg13g2_sram/gds/RM_IHPSG13_1P_512x32_c2_bm_bist.gds"))
top = layout.top_cell()

# finds source layer
source_layer = layout.layer(235, 4)

# finds (or creates) target layer
target_layer = layout.layer(189, 4)

def change_layer(cell):

    print(cell.name)

    # gets the Shapes object which holds the shapes of a cell/layer
    # for source:
    source_shapes = cell.shapes(source_layer)
    # for target:
    target_shapes = cell.shapes(target_layer)

    # moves shapes
    target_shapes.insert(source_shapes)
    source_shapes.clear()

    # recursive
    for c in cell.each_child_cell():
        change_layer(cell.layout().cell(c))

change_layer(top)

layout.write("RM_IHPSG13_1P_512x32_c2_bm_bist.gds")
