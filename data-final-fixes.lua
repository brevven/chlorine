require("stacking")
require("modules")
-- -- require("tin-recipe-final-5d")
-- require("tin-recipe-final-rrr")

local util = require("data-util");

local pg_amt = util.get_ingredient_amount("plastic-bar", "petroleum-gas")
util.replace_ingredient("plastic-bar", "petroleum-gas", "vinyl-chloride", pg_amt*2/3)

if mods["space-exploration"] then 
  -- core mining balancing
  util.add_to_product("se-core-fragment-omni", "salt", -5)
end

if mods.modmashsplintersubspacelogistics then
  for i, item in pairs({"salt"}) do
    if data.raw.item["super-container-for-"..item] then
      for i, icon in pairs(data.raw.item["super-container-for-"..item].icons) do
        if string.find(icon.icon, item) then
          icon.size = 128
          icon.scale = icon.scale / 2
          icon.icon_scale = icon.icon_scale / 2
        end
      end
    end
    if data.raw.recipe["super-container-for-"..item] then
      for i, icon in pairs(data.raw.recipe["super-container-for-"..item].icons) do
        if string.find(icon.icon, item) then
          icon.size = 128
          icon.scale = icon.scale / 4
          icon.icon_scale = icon.icon_scale / 4
        end
      end
    end
    if data.raw.recipe["empty-super-container-of-"..item] then
      for i, icon in pairs(data.raw.recipe["empty-super-container-of-"..item].icons) do
        if string.find(icon.icon, item) then
          icon.size = 128
          icon.scale = icon.scale / 4
          icon.icon_scale = icon.icon_scale / 4
        end
      end
    end
    if data.raw.recipe["modmash-supermaterial-to-"..item] then
      for i, icon in pairs(data.raw.recipe["modmash-supermaterial-to-"..item].icons) do
        if string.find(icon.icon, item) then
          icon.size = 128
          icon.scale = icon.scale / 4
          icon.icon_scale = icon.icon_scale / 4
        end
      end
    end
    for i, technology in pairs(data.raw.technology) do
      if string.find(technology.name, "containment") or string.find(technology.name, "supermaterial") then
        if technology.icons then
          for j, icon in pairs(technology.icons) do
            if string.find(icon.icon, item) then
              icon.size = 128
              icon.scale = icon.scale / 8
              icon.icon_scale = icon.icon_scale / 8
            end
          end
        end
      end
    end
  end
end



-- Must be last
util.create_list()
