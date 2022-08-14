-- Deadlock stacking recipes

local util = require("data-util");

if deadlock then
  deadlock.add_stack("salt", nil, "deadlock-stacking-2", 64)
  deadlock.add_stack("pcb-substrate", nil, "deadlock-stacking-2", 128)
  deadlock.add_stack("pcb", nil, "deadlock-stacking-2", 128)
  if data.raw.item["ferric-chloride"] then
    deadlock.add_stack("ferric-chloride", nil, "deadlock-stacking-2", 128)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("salt", "deadlock-crating-2")
  deadlock_crating.add_crate("pcb-substrate", "deadlock-crating-2")
  deadlock_crating.add_crate("pcb", "deadlock-crating-2")
  if data.raw.item["ferric-chloride"] then
    deadlock_crating.add_crate("ferric-chloride", "deadlock-crating-2")
  end
end

