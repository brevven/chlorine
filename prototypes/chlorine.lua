local util = require("data-util");

if not mods.Krastorio2 then
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
})
end

if util.me.more() then
data:extend({
  {
    type = "item",
    name = "ferric-chloride",
    icon = "__bzchlorine__/graphics/icons/ferric-chloride.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "b[chlorine-fe]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "fluid",
    name = "vinyl-chloride",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.90, g=0.90, b=0.75},
    flow_color = {r=0.90, g=1.00, b=0.75},
    icon = "__bzchlorine__/graphics/icons/vinyl-chloride.png",
    icon_size = 128,
    order = "a[fluid]-f[chlorine-v]",
  },
})
end

if not mods.Krastorio2 then
data:extend({
  {
    type = "recipe",
    name = "chlorine",
    results = {{type="fluid", name="chlorine", amount=10}},
    ingredients = {{"salt", 2}},
    enabled = false,
    category = "chemistry",
    subgroup = "fluid-recipes",
    energy_required = 0.5,
  },
  {
    type = "recipe",
    name = "hydrogen-chloride-pure",
    results = {{type="fluid", name="hydrogen-chloride", amount=20}},
    ingredients = {
      {type="fluid", name="water", amount=10},
      {type="fluid", name="chlorine", amount=10},
    },
    enabled = false,
    category = "chemistry",
    subgroup = "fluid-recipes",
    energy_required = 10,
  },
})
else
  util.replace_ingredient("kr-water-electrolysis", "sand", "salt", 2)
end
data:extend({
  {
    type = "recipe",
    name = "hydrogen-chloride-salt",
    results = {{type="fluid", name="hydrogen-chloride", amount=10}},
    ingredients = {
      {"salt", 1},
      {type="fluid", name="water", amount=5},
      {type="fluid", name="sulfuric-acid", amount=5},
    },
    enabled = false,
    category = "chemistry",
    subgroup = "fluid-recipes",
    energy_required = 1,
  },
})

if util.me.more() then
data:extend({
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
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "ferric-chloride-hcl",
    results = {{"ferric-chloride", 4}},
    icons = {
        {icon = "__bzchlorine__/graphics/icons/ferric-chloride.png", icon_size=64, scale=1},
        {icon = "__bzchlorine__/graphics/icons/hcl.png", icon_size=128, scale=0.25, shift={8,-8}},
    },
    ingredients = {
      {"iron-ore", 1},
      {type="fluid", name="hydrogen-chloride", amount=120},
    },
    enabled = false,
    category = "chemistry",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "vinyl-chloride",
    results = {{type="fluid", name="vinyl-chloride", amount=20}},
    ingredients = {
      {type="fluid", name="chlorine", amount=10},
      {type="fluid", name="petroleum-gas", amount=20},
    },
    enabled = false,
    category = "chemistry",
    subgroup = "fluid-recipes",
    energy_required = 3,
  },
})
end
util.add_unlock("plastics", "vinyl-chloride")

if not mods.Krastorio2 then
data:extend({
  {
    type="technology",
    name="chlorine-processing",
    icons = {
      {icon = "__bzchlorine__/graphics/technology/salt-tech.png", icon_size = 256, tint={a=.75,r=1,b=1,g=1} },
    },
    effects = {
      { type = "unlock-recipe", recipe = "chlorine" },
      { type = "unlock-recipe", recipe = "hydrogen-chloride-salt" },
      { type = "unlock-recipe", recipe = "hydrogen-chloride-pure" },
    },
    unit = {
      count = 70, time = 30,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    },
    prerequisites = {"fluid-handling"},
  },
})
util.add_unlock("chlorine-processing", "ferric-chloride")
util.add_unlock("chlorine-processing", "ferric-chloride-hcl")
util.add_unlock("fluid-handling", "chemical-plant")
util.remove_recipe_effect("oil-processing", "chemical-plant")
else
  util.add_unlock("kr-fluids-chemistry", "ferric-chloride")
  util.add_unlock("kr-fluids-chemistry", "ferric-chloride-hcl")
  util.add_unlock("kr-fluids-chemistry", "hydrogen-chloride-salt")
end

if mods.bzgas then
  data:extend({
    {
      type="recipe",
      name="bakelite-hcl",
      results = {{"bakelite", 3}},
      ingredients = {
        {"phenol", 1},
        {type="fluid", name="formaldehyde", amount=10},
        {type="fluid", name="hydrogen-chloride", amount=5},
      },
      icons = {
        {icon = "__bzgas__/graphics/icons/bakelite.png", icon_size=128},
        {icon = "__bzchlorine__/graphics/icons/hcl.png", icon_size=128, scale=0.125, shift={-8,-8}},
      },
      enabled = false,
      category = "chemistry",
      energy_required = 3,
    }
  })
  if mods.Krastorio2 then
    util.add_unlock("advanced-chemistry", "bakelite-hcl")
  else
    util.add_unlock("chlorine-processing", "bakelite-hcl")
  end
end

