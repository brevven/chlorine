-- Enable prod modules for some recipes
-- Recipes with very specific ratios are deliberately excluded
recipes = {"chlorine", "epoxy", "pcb-substrate", "pcb", "bakelite-hcl"}
if mods["Krastorio2"] then
end

for i, recipe in pairs(recipes) do
  if data.raw.recipe[recipe] then
    for j, module in pairs(data.raw.module) do
      if module.effect then
        for effect_name, effect in pairs(module.effect) do
          if effect_name == "productivity" and effect.bonus > 0 and module.limitation and #module.limitation > 0 then
            table.insert(module.limitation, recipe)
          end
        end
      end
    end
  end
end
