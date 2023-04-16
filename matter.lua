-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");

  util.k2matter({
    k2matter = {
      item_name = "salt",
      matter_value = 2,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by_technology = "salt-matter-processing",
    },
    icon = {icon = "__bzchlorine__/graphics/icons/salt.png", icon_size = 128, scale = 1}
  })
end
