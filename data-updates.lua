require("recipe-updates")
-- require("tin-matter")
-- require("omni")
require("map-gen-preset-updates")
-- require("strange-matter")
-- require("compatibility/248k")
require("compatibility/bob")

require("prototypes/assembler-updates")

local util = require("data-util")

local pg_amt = util.get_ingredient_amount("plastic-bar", "petroleum-gas")
util.replace_ingredient("plastic-bar", "petroleum-gas", "vinyl-chloride", pg_amt*2/3)


require("modules")

-- Must be last
util.create_list()
