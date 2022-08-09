-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tin-ore"] = {name= "tin-ore"}
  se_delivery_cannon_recipes["tin-plate"] = {name= "tin-plate"}
  data:extend({
  {
    type = "recipe",
    icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale = 0.25},
    },
    name = "landfill-tin-ore",
    category = "hard-recycling",
    order = "z-b-tin",
    subgroup = "terrain",
    result = "landfill",
    ingredients = {{"tin-ore", 50}},
  }
  })

if string.sub(mods["space-exploration"], 1, 3) == "0.6" then
  data:extend({
  {
    type = "item-subgroup",
    name = "tin",
    group = "resources",
    order = "a-h-z-a",
  }
  })
  util.set_item_subgroup("tin-plate", "tin")
  data:extend({
  {
    type = "item",
    name = "tin-ingot",
    icons = {{icon = "__bztin__/graphics/icons/tin-ingot.png", icon_size = 128}},
    order = "b-b",
    stack_size = 50,
    subgroup = "tin",
  },
  {
    type = "fluid",
    name = "molten-tin",
    default_temperature = 232,
    max_temperature = 232,
    base_color = {r=191, g=219, b=233},
    flow_color = {r=191, g=219, b=233},
    icons = {{icon = "__bztin__/graphics/icons/molten-tin.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-tin",
    subgroup = "tin",
    results = {
      {type = "fluid", name = "molten-tin", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 45,
    ingredients = {
      {name = mods.Krastorio2 and "enriched-tin" or "tin-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "tin-ingot",
    category = "casting",
    results = {{"tin-ingot", 1}},
    energy_required = 18.75,
    ingredients = {
      {type = "fluid", name = "molten-tin", amount = 250},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "tin-ingot-to-plate",

    icons = {
      {icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
      {icon = "__bztin__/graphics/icons/tin-ingot.png", icon_size = 128, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {name = "tin-plate", amount = 10},
    },
    energy_required = 3.75,
    ingredients = {
      {name = "tin-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-tin"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tin-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tin-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-tin"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tin-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tin-ingot-to-plate"})
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-tin", "tin")
    data.raw.recipe["enriched-tin-plate"].order= "d[tin-plate]"
    se_delivery_cannon_recipes["enriched-tin"] = {name= "enriched-tin"}
  end
else
  data.raw.item["tin-plate"].subgroup = "plates"
  if mods["Krastorio2"] then

    data:extend({
    {
      type = "recipe",
      name = "enriched-tin-smelting-vulcanite",
      category = "smelting",
      order = "d[tin-plate]",
      energy_required = 18,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "enriched-tin", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "tin-plate", amount = 12},
      },
      icons =
      {
        { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "enriched-tin-smelting-vulcanite"})
    data.raw.recipe["enriched-tin-plate"].order= "d[tin-plate]"
    se_delivery_cannon_recipes["enriched-tin"] = {name= "enriched-tin"}
  else
    data:extend({
    {
      type = "recipe",
      name = "tin-smelting-vulcanite",
      category = "smelting",
      order = "d[tin-plate]",
      energy_required = 18,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "tin-ore", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "tin-plate", amount = 12},
      },
      icons =
      {
        { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "tin-smelting-vulcanite"})
  end
end
end
