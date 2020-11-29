-- Kizrak

-- prototypes\combat-robot-misc.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

-- item/shell/ammo
-- research
-- recipe

-- item the player carries
local ammo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

ammo.name = "la-combat-robot-artillery-shell"
ammo.ammo_type.action.action_delivery.projectile="la-combat-robot-projectile-1"
ammo.stack_size = 10
ammo.icon = "__lightArtillery__/graphics/icons/defender.png"
ammo.icon_mipmaps = 1

data:extend{ammo}
log("ammo:\n"..sb(ammo))

---------------------------------------------------------------------------------------------------

local recipe = {
	enabled = false,
	energy_required = 20,
	ingredients = {
		{"derpy-artillery-ammo",1},
		{"defender-capsule",1},
		{"repair-pack",1},
		{type="fluid", name="water", amount=5},
	},
	category = "advanced-crafting",
	name = "la-combat-robot-artillery-shell-recipe",
	result = "la-combat-robot-artillery-shell",
	type = "recipe"
}

data:extend{recipe}
log("recipe:\n"..sb(recipe))

---------------------------------------------------------------------------------------------------

local technology = {
	effects = {{
		recipe = "la-combat-robot-artillery-shell-recipe",
		type = "unlock-recipe"
	}},
	icon = "__lightArtillery__/graphics/defender-ammo.png",
	icon_size = 128,
	name = "la-combat-robot-artillery-shell-research",
	prerequisites = {
		"defender",
		"derpy-artillery"
	},
	type = "technology",
	unit = {
		count = 5,
		ingredients = {
			{"automation-science-pack",1},
			{"logistic-science-pack",1},
			{"military-science-pack",1},
		},
		time = 5
	}
}

data:extend{technology}
log("technology:\n"..sb(technology))

