local util = require("data-util");

data:extend({
  {
    type = "item",
    name = "pcb-substrate",
    icon = "__bzchlorine__/graphics/icons/pcb-substrate.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[pcb-s]",
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
})
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "silica", 3)
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "bakelite")
