-- Kizrak

-- \prototypes\poison-artillery-misc.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local technology = {
	effects = {},
	icon = "__lightArtillery__/graphics/poison-ammo.png",
	icon_size = 128,
	name = "poison-capsule-artillery-research",
	prerequisites = {
		"military-3"
	},
	type = "technology",
	unit = {
		count = 5,
		ingredients = {
			{"automation-science-pack",1},
			{"logistic-science-pack",1},
			{"chemical-science-pack",1},
			{"military-science-pack",1}
		},
		time = 5
	}
}

log(sb( technology ))
data:extend{technology}

