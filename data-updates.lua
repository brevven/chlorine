require("recipe-updates")
-- require("tin-matter")
-- require("omni")
require("map-gen-preset-updates")
-- require("strange-matter")
-- require("compatibility/248k")
require("compatibility/bob")

local futil = require("util")
local util = require("data-util")

if util.me.early_assemblers() then
  util.add_crafting_category("assembling-machine", "assembling-machine-1", "crafting-with-fluid")
  data.raw["assembling-machine"]["assembling-machine-1"].fluid_boxes = futil.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes)
  for i, fb in pairs(data.raw["assembling-machine"]["assembling-machine-1"].fluid_boxes) do
    if i ~= "off_when_no_fluid_recipe" and fb.pipe_picture then
      fb.pipe_picture.north.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-N.png"
      fb.pipe_picture.north.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-N.png"
      fb.pipe_picture.south.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-S.png"
      fb.pipe_picture.south.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-S.png"
      fb.pipe_picture.east.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-E.png"
      fb.pipe_picture.east.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-E.png"
      fb.pipe_picture.west.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-W.png"
      fb.pipe_picture.west.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-W.png"
    end
  end
  if data.raw["assembling-machine"]["burner-assembling-machine"] then
    util.add_crafting_category("assembling-machine", "burner-assembling-machine", "crafting-with-fluid")
    data.raw["assembling-machine"]["burner-assembling-machine"].fluid_boxes = futil.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes)
    for i, fb in pairs(data.raw["assembling-machine"]["burner-assembling-machine"].fluid_boxes) do
      if i ~= "off_when_no_fluid_recipe" and fb.pipe_picture then
        fb.pipe_picture.north.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-N.png"
        fb.pipe_picture.north.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-N.png"
        fb.pipe_picture.south.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-S.png"
        fb.pipe_picture.south.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-S.png"
        fb.pipe_picture.east.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-E.png"
        fb.pipe_picture.east.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-E.png"
        fb.pipe_picture.west.filename = "__bzchlorine__/graphics/entity/assembler/assembling-machine-2-pipe-W.png"
        fb.pipe_picture.west.hr_version.filename = "__bzchlorine__/graphics/entity/assembler/hr-assembling-machine-2-pipe-W.png"
      end
    end
  end
end


require("modules")

-- Must be last
util.create_list()
