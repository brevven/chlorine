local util = require("data-util");

if mods.Krastorio2 then
  local amt = util.get_amount("electronic-components")
  util.add_ingredient("electronic-components", "pcb", amt)
  util.remove_ingredient("electronic-components", "plastic-bar")
  local amt_ac = util.get_amount("advanced-circuit")
  util.set_ingredient("advanced-circuit", "copper-cable", amt_ac)
else
  local amt = util.get_amount("advanced-circuit")
  util.add_ingredient("advanced-circuit", "pcb", amt)
  util.remove_ingredient("advanced-circuit", "plastic-bar")
  util.set_ingredient("advanced-circuit", "copper-cable", amt*2)
end
local amt = util.get_amount("advanced-circuit")
util.set_recipe_time("advanced-circuit", amt*2) -- more steps, so speed up final step

if util.me.more() then
  util.add_ingredient("accumulator", "ferric-chloride", 2)
  util.set_product_amount("accumulator", "accumulator", 2)
  util.set_ingredient("accumulator", "battery", 8)
end


util.replace_some_ingredient("shotgun-shell", "stone", 1, "salt", 1)
util.add_ingredient("pumpjack", "salt", 10)
util.add_ingredient("kr-mineral-water-pumpjack", "salt", 10)
util.add_ingredient("uranium-processing", "salt", 1)
if mods.Krastorio2 or util.is_foundry() then
  util.replace_some_ingredient("steel-plate", "iron-plate", 1, "salt", 1)
end
util.add_ingredient("kr-biomass-growing", "salt", 1)
util.add_ingredient("kr-energy-storage", "ferric-chloride", 10)

-- Space Exploration
util.add_ingredient("aluminum-ingot", "salt", 2) -- bzaluminum
if not mods.Krastorio2 then -- consider this handled in enrichment
  util.add_ingredient("molten-titanium", "chlorine", 20)
  util.add_product("molten-titanium", {type="fluid", name="chlorine", amount=19, catalyst_amount=19})
  util.set_main_product("molten-titanium", "molten-titanium")
end
util.add_ingredient("se-steel-ingot", "salt", 2)
util.add_ingredient("se-iridium-powder", "chlorine", 20)
util.add_product("se-iridium-powder", {type="fluid", name="chlorine", amount=19, catalyst_amount=19})

util.replace_some_ingredient("se-vitamelange-bloom", "sand", 10, "salt", 1)
util.add_ingredient("se-nutrient-gel", "salt", 1)
util.add_ingredient("se-vitalic-epoxy", "epoxy", 16)

util.multiply_recipe("se-space-water", 10)
util.replace_some_ingredient("se-space-water", "water", 10, "salt", 1)
util.add_ingredient("se-bio-sludge-decontamination", "chlorine", 1)
util.add_ingredient("se-bio-electrics-data", "salt", 1)

util.add_ingredient("se-holmium-chloride", "hydrogen-chloride", 2)

util.add_ingredient("shiveros_advanced_uranium_reprocessing", "salt", 1)
