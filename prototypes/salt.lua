local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local futil = require("util");
local util = require("data-util");

if util.me.salt() then


local particle = futil.table.deepcopy(data.raw["optimized-particle"]["stone-particle"])
particle.name = "salt-particle"

for i, picture in ipairs(particle.pictures) do
  local tint = {r=1, g=1, b=1, a=0}
  picture.tint = tint
  picture.hr_version.tint = tint
end

data:extend({particle})

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
      mining_particle = "salt-particle",
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
      has_starting_area_placement = util.me.starting_patch(),
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

if not util.me.starting_patch() then
  -- Modify salt autoplace richness: 
  -- After 500 tiles it's standard
  -- After 250 tiles it scales up
  data.raw.resource["salt"].autoplace.richness_expression = 
    richness * noise.if_else_chain(
        noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(500)),
        (noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")) - 275)/475,
        1)

  data.raw.resource["salt"].autoplace.probability_expression = 
    probability * noise.if_else_chain(
        noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(249)),
        0,
        noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(250)),
        0.3,
        1)
end

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
    enabled = not not mods["aai-industry"],
    category = "crafting-with-fluid",
    energy_required = 2,
  },
})
if mods.Krastorio2 then
  data:extend({
    {
      type = "recipe",
      name = "salt-filtration",
      result = "salt",
      ingredients = {{type="fluid", name="water", amount=100}},
      enabled = false,
      category = mods.Krastorio2 and "fluid-filtration",
      energy_required = 0.4,
    },
  })
end
if mods.Krastorio2 then
  util.add_unlock("kr-fluids-chemistry", "salt-filtration")
end
if not mods["aai-industry"] then
  util.add_unlock("automation", "salt")
end
