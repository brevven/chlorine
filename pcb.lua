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
data:extend({
  {
    type = "recipe",
    name = "pcb-substrate",
    results = {
      {"pcb-substrate", 1},
    },
    ingredients = {
      {type="fluid", name="epoxy", amount=10},
      {"plastic-bar", 3},
    },
    enabled = false,
    category = "chemistry",
    energy_requires = 3,
  },
  {
    type = "recipe",
    name = "pcb",
    results = {
      {"pcb", 1},
    },
    ingredients = {
      {"pcb-substrate", 1},
      {"copper-plate", 1},
      {"ferric-chloride", 1},
    },
    enabled = false,
    category = "chemistry",
    energy_requires = 3,
  },
})

util.add_unlock("advanced-electronics", "pcb-substrate")
util.add_unlock("advanced-electronics", "pcb")

-- These updates should be in data phase
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "silica", 3)
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "bakelite", 1)
util.replace_ingredient("advanced-circuit", "plastic-bar", "pcb", 1)
