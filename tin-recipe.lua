-- Aluminum smelting

local util = require("data-util");
local futil = require("util");

if (not mods["pyrawores"] and not mods["bobplates"] and not mods["angelssmelting"] ) then
data:extend({
  {
    type = "recipe",
    name = "tin-plate",
    category = "smelting",
    order = "d[tin-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
          { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale=0.125, shift= {-8, -8}},
        } or {
          { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
        }
),
    normal = (mods["Krastorio2"] and
        {
          main_product = "tin-plate",
          enabled = true,
          energy_required = 12,
          ingredients = {{"tin-ore", 10}},
          results = {
            {type="item", name = "tin-plate", amount=5}
          }
        } or
        {
          main_product = "tin-plate",
          enabled = true,
          energy_required = 2.4,
          ingredients = {{"tin-ore", 1}},
          results = {
            {type="item", name = "tin-plate", amount=1}
          }
        }),
    expensive =
    {
      main_product = "tin-plate",
      enabled = true,
      energy_required = 4.8,
      ingredients = {{"tin-ore", 1}},
      results = {
        {type="item", name = "tin-plate", amount=1},
      }
    }
  },
  {
    type = "item",
    name = "tin-plate",
    icon = "__bztin__/graphics/icons/tin-plate.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "b[tin-plate]",
    stack_size = util.get_stack_size(100)
  },
})

local solder_ingredients = {{"tin-plate", 4}, {"copper-plate", 1}}
if mods.bzlead then
  solder_ingredients = {{"tin-plate", 3}, {"lead-plate", 2}}
end
data:extend({
  {
    type = "item",
    name = "solder",
    icon = "__bztin__/graphics/icons/solder.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[solder]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "solder",
    category = "crafting",
    order = "d[solder]",
    enabled = true,
    energy_required = 1,
    ingredients = solder_ingredients, 
    results = {{"solder", 4}},
  }
})

data:extend({
  {
    type = "fluid",
    name = "organotins",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.75, g=0.65, b=0.1},
    flow_color = {r=0.7, g=1, b=0.1},
    icon = "__bztin__/graphics/icons/organotins.png",
    icon_size = 64,
    order = "a[fluid]-f[organotins]"
  },
  {
    type = "recipe",
    name = "organotins",
    category = "chemistry",
    subgroup = "fluid-recipes",
    order = "h[organotins]",
    enabled = false,
    energy_required = 5,
    ingredients = {{"tin-plate", 3}, {type="fluid", name="petroleum-gas", amount=20}},
    results = {{type="fluid", name="organotins", amount=50}},
    crafting_machine_tint = {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, 
      secondary = {r = 1.000, g = 0.975, b = 0.890, a = 1.000}, 
      tertiary = {r = 0.825, g = 0.740, b = 0.810, a = 1.000}, 
      quaternary = {r = 0.950, g = 1.000, b = 0.350, a = 1.000}, 
    }
  },
  {
    type = "technology",
    name = "organotin-chemistry",
    icon = "__bztin__/graphics/technology/organotins.png",
    icon_size = 256,
    effects = {
      { type = "unlock-recipe", recipe = "organotins" },
    },
    unit = {
      count = 50, time = 30,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    },
    prerequisites = {"oil-processing"},
    order = "b-b",
  },
})

util.add_prerequisite("plastics", "organotin-chemistry")

if util.me.use_cable() then
data:extend({
  {
    type = "item",
    name = "tinned-cable",
    icon = "__bztin__/graphics/icons/tinned-cable.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "b[tinned-cable]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "tinned-cable",
    category = "crafting",
    order = "d[tinned-cable]",
    enabled = false,
    energy_required = 1.5,
    ingredients = {{"tin-plate", 1}, {"copper-cable", 8}},
    results = {{"tinned-cable", 8}},
  },
  {
    type = "technology",
    name = "tinned-cable",
    icon = "__bztin__/graphics/icons/tinned-cable.png",
    icon_size = 64, icon_mipmaps = 4,
    effects = {
      { type = "unlock-recipe", recipe = "tinned-cable" },
    },
    unit = {
      count = 50, time = 15,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    },
    prerequisites = {"logistic-science-pack"},
    order = "b-b",
  },
})
util.add_prerequisite("tinned-cable", "copper-processing")
end

if util.me.use_bronze() then
local bronze_i = {}
bronze_i["copper-plate"] = 17
bronze_i["tin-plate"] = 3
if mods.bzaluminum then
  bronze_i["copper-plate"] = bronze_i["copper-plate"] - 1
  bronze_i["aluminum-plate"] = 1
end
 
data:extend({
  {
    type = "item",
    name = "bronze-plate",
    icon = "__bztin__/graphics/icons/bronze-plate.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[bronze-plate]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "bronze-plate",
    category = "advanced-crafting",
    order = "d[bronze-plate]",
    enabled = false,
    energy_required = 60,
    ingredients = {},
    results = {{"bronze-plate", 20}},
  },
})
for item, count in pairs(bronze_i) do
  util.add_ingredient("bronze-plate", item, count)
end
if mods.bzfoundry and data.raw.item["foundry"] then
  util.add_effect("foundry", { type = "unlock-recipe", recipe = "bronze-plate" })
  util.add_prerequisite("fast-inserter", "foundry")
  util.set_to_founding("bronze-plate")
else
  util.add_effect("automation", { type = "unlock-recipe", recipe = "bronze-plate" })
end
end
end
