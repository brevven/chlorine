local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("data-util");

if util.me.salt() then
data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "salt",
    richness = true,
    order = "b-e"
	},
	{
    type = "noise-layer",
    name = "salt"
	},
	{
    type = "resource",
    icon_size = 128,
    name = "salt",
    icon = "__bzchlorine__/graphics/icons/salt.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.92, g=1.00, b=0.93},
    tree_removal_probability=1,
    tree_removal_max_distance=32*32,
    minable =
    {
      hardness = 1,
      mining_particle = "copper-ore-particle",
      mining_time = 0.5,
      result = "salt"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "salt",
      order = "b-z",
      base_density = 3,
      base_spots_per_km2 = 2,
      regular_rq_factor_multiplier = 2.0,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__bzchlorine__/graphics/entity/ores/salt.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__bzchlorine__/graphics/entity/ores/hr-salt.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
          }
    },
  },
})

local richness = data.raw.resource["salt"].autoplace.richness_expression  
local probability = data.raw.resource["salt"].autoplace.probability_expression  

-- Modify salt autoplace richness: 
-- After 500 tiles it's standard
-- After 300 tiles it scales up
data.raw.resource["salt"].autoplace.richness_expression = 
  richness * noise.if_else_chain(
      noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(500)),
      (noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")) - 275)/475,
      1)

data.raw.resource["salt"].autoplace.probability_expression = 
  probability * noise.if_else_chain(
      noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(299)),
      0,
      noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(300)),
      0.3,
      1)

end
data:extend({
  {
    type = "item",
    name = "salt",
    icon_size = 128,
    icon = "__bzchlorine__/graphics/icons/salt.png",
    pictures = {
      {filename="__bzchlorine__/graphics/icons/salt.png",   size=128, scale=0.125},
      {filename="__bzchlorine__/graphics/icons/salt-1.png", size=128, scale=0.125},
      {filename="__bzchlorine__/graphics/icons/salt-2.png", size=128, scale=0.125},
      {filename="__bzchlorine__/graphics/icons/salt-3.png", size=128, scale=0.125},
      {filename="__bzchlorine__/graphics/icons/salt-4.png", size=128, scale=0.125},
    },
    subgroup = "raw-resource",
    order = "t-c-a",
    stack_size = util.get_stack_size(50)
  },
  {
    type = "recipe",
    name = "salt",
    result = "salt",
    ingredients = {{type="fluid", name="water", amount=100}},
    enabled = false,
    category = mods.Krastorio2 and "fluid-filtration" or "crafting-with-fluid",
    energy_required = mods.Krastorio2 and 1 or 2,
  },
})
if mods.Krastorio2 then
  util.add_unlock("kr-fluids-chemistry", "salt")
else
  util.add_unlock("fluid-handling", "salt")
end
