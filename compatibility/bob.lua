local util = require("data-util");

if mods.bobelectronics or mods.MDbobelectronics then 

  -- FeCL3 is now anhydrous, so hydrate it for bob
  util.remove_ingredient("ferric-chloride-solution", "iron-ore")
  util.remove_ingredient("ferric-chloride-solution", "hydrogen-chloride")
  util.add_ingredient("ferric-chloride-solution", "ferric-chloride", 5)
  util.add_ingredient("ferric-chloride-solution", "water", 50)

  -- Phenolic board replaced with substrate
  util.replace_ingredient("circuit-board", "phenolic-board", "pcb-substrate")


  -- NOTE ingredients like phenolic board etc will not be used in many mod loadouts. Maybe fix later
end
