local util = require("data-util");

data:extend({
  {
    type = "fluid",
    name = "epoxy",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.90, g=0.95, b=0.90},
    flow_color = {r=0.90, g=1.00, b=0.90},
    icon = "__bzchlorine__/graphics/icons/epoxy.png",
    icon_size = 128,
    order = "a[fluid]-f[epoxy]",
  },
})

data:extend({
  {
    type = "recipe",
    name = "epoxy",
    results = {
      {type="fluid", name="epoxy", amount=10},
      {"salt", 1},
    },
    main_product = "epoxy",
    ingredients = {
      {type="fluid", name="chlorine", amount=10},
      {type="fluid", name="petroleum-gas", amount=10},
    },
    enabled = false,
    category = "chemistry",
    energy_required = 3,
  },
})

util.add_unlock("plastics", "epoxy")
util.add_prerequisite("plastics", "chlorine-processing")
