local util = require("data-util");

data:extend({
  {
    type = "fluid",
    name = "chlorine",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.60, g=0.90, b=0.50},
    flow_color = {r=0.60, g=1.00, b=0.50},
    icon = "__bzchlorine__/graphics/icons/chlorine.png",
    icon_size = 128,
    order = "a[fluid]-f[chlorine]",
  },
  {
    type = "fluid",
    name = "hydrogen-chloride",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.80, g=0.90, b=0.70},
    flow_color = {r=0.80, g=1.00, b=0.70},
    icon = "__bzchlorine__/graphics/icons/hcl.png",
    icon_size = 128,
    order = "a[fluid]-f[chlorine-h]",
  },
  {
    type = "item",
    name = "ferric-chloride",
    icon = "__bztin__/graphics/icons/solder.png", -- FIX
    icon_size = 128,
    subgroup = "raw-material",
    order = "b[chlorine-fe]",
    stack_size = util.get_stack_size(100),
  },
})

data:extend({
  {
    type = "recipe",
    name = "chlorine",
    results = {{type="fluid", name="chlorine", amount=10}},
    ingredients = {{"salt", 2}},
    enabled = false,
    category = "chemistry",
    energy_requires = 3,
  },
  {
    type = "recipe",
    name = "hydrogen-chloride",
    results = {{type="fluid", name="hydrogen-chloride", amount=10}},
    ingredients = {
      {"salt", 1},
      {type="fluid", name="water", amount=5},
      {type="fluid", name="sulfuric-acid", amount=5},
    },
    enabled = false,
    category = "chemistry",
    energy_requires = 1,
  },
  {
    type = "recipe",
    name = "hydrogen-chloride-pure",
    results = {{type="fluid", name="hydrogen-chloride", amount=10}},
    ingredients = {
      {type="fluid", name="water", amount=10},
      {type="fluid", name="chlorine", amount=10},
    },
    enabled = false,
    category = "chemistry",
    energy_requires = 10,
  },
  {
    type = "recipe",
    name = "ferric-chloride",
    results = {{"ferric-chloride", 2}},
    ingredients = {
      {"iron-plate", 2},
      {type="fluid", name="chlorine", amount=30},
    },
    enabled = false,
    category = "chemistry",
    energy_requires = 3,
  },
})

data:extend({
  {
    type="technology",
    name="salt-processing",
    icon = "__bzchlorine__/graphics/icons/chlorine.png", -- FIX
    icon_size = 128,
    effects = {
      { type = "unlock-recipe", recipe = "chlorine" },
      { type = "unlock-recipe", recipe = "hydrogen-chloride" },
      { type = "unlock-recipe", recipe = "hydrogen-chloride-pure" },
      { type = "unlock-recipe", recipe = "ferric-chloride" },
      { type = "unlock-recipe", recipe = "chemical-plant" },
    },
    unit = {
      count = 70, time = 30,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    },
    prerequisites = {"fluid-handling"},
  },
})
