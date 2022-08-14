require("stacking")
require("modules")
-- -- require("tin-recipe-final-5d")
-- require("tin-recipe-final-rrr")

local util = require("data-util");

local pg_amt = util.get_ingredient_amount("plastic-bar", "petroleum-gas")
util.replace_ingredient("plastic-bar", "petroleum-gas", "vinyl-chloride", pg_amt*2/3)


-- Must be last
util.create_list()
