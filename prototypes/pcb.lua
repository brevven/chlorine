local util = require("data-util");

data:extend({
  {
    type = "item",
    name = "pcb-substrate",
    icon = "__bzchlorine__/graphics/icons/pcb-substrate.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit][pcb-substrate]",
    stack_size = util.get_stack_size(200),
  },
})
if (not mods.bobelectronics and not mods.MDbobelectronics) then
data:extend({
  {
    type = "item",
    name = "pcb",
    icon = "__bzchlorine__/graphics/icons/pcb.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit][pcb]",
    stack_size = util.get_stack_size(200),
  },

})
end

data:extend({
  {
    type = "recipe",
    name = "pcb-substrate",
    results = {
      {"pcb-substrate", 12},
    },
    ingredients = {
      {type="fluid", name="epoxy", amount=30},
      {"plastic-bar", 3},
    },
    enabled = false,
    category = "chemistry",
    energy_required = 6,
  },
})
util.add_unlock("advanced-electronics", "pcb-substrate")
-- These updates should be in data phase
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "silica", 3, {force=true})

if (not mods.bobelectronics and not mods.MDbobelectronics) then
data:extend({
  {
    type = "recipe",
    name = "pcb",
    results = {
      {"pcb", 4},
    },
    ingredients = util.me.more() and {
      {"pcb-substrate", 4},
      {"copper-plate", 1},
      {"ferric-chloride", 2},
      {type="fluid", name="water", amount=20},
    } or {
      {"pcb-substrate", 4},
      {"copper-plate", 1},
      {type="fluid", name="hydrogen-chloride", amount=30}
    },
    enabled = false,
    category = "crafting-with-fluid",
    energy_required = 8,
  },
})
util.add_unlock("advanced-electronics", "pcb")

end
