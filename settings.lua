data:extend({
  {
		type = "string-setting",
		name = "bzchlorine-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
	},
  {
		type = "bool-setting",
		name = "bzchlorine-list",
		setting_type = "startup",
    default_value = false,
	},
  {
    type = "bool-setting",
    name = "bzchlorine-salt",
		setting_type = "startup",
    default_value = true,
  },
  {
		type = "string-setting",
		name = "bzchlorine-more-intermediates",
		setting_type = "startup",
		default_value = "yes",
    allowed_values = {"yes", "no"},
	},
})
