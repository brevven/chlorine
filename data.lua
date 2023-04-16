require("prototypes/salt")
require("prototypes/chlorine")
require("prototypes/epoxy")
require("prototypes/pcb")

require("matter")

local util = require("data-util");

if util.se6() then
  se_delivery_cannon_recipes["salt"] = {name="salt"}
end

-- Must be last
util.create_list()
