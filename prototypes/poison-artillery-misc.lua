-- Kizrak

-- \prototypes\poison-artillery-misc.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local technology = {
	effects = {{
		recipe = "poison-capsule-artillery-shell",
		type = "unlock-recipe"
	}},
	icon = "__lightArtillery__/graphics/poison-ammo.png",
	icon_size = 128,
	name = "poison-capsule-artillery-research",
	prerequisites = {
		"military-3",
		"derpy-artillery"
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

--log(sb( technology ))
data:extend{technology}

---------------------------------------------------------------------------------------------------

local recipe = {
	enabled = false,
	energy_required = 20,
	ingredients = {
		{"derpy-artillery-ammo",1},
		{"poison-capsule",1},
		{type="fluid", name="crude-oil", amount=5},
	},
	category = "advanced-crafting",
	name = "poison-capsule-artillery-shell",
	result = "poison-capsule-artillery-shell",
	type = "recipe"
}

--log(sb( recipe ))
data:extend{recipe}

---------------------------------------------------------------------------------------------------

local ammo = {
	ammo_type = {
		action = {
			action_delivery = {
				direction_deviation = 0,
				projectile = "poison-capsule-artillery-projectile-1",
				range_deviation = 0,
				source_effects = {
					entity_name = "artillery-cannon-muzzle-flash",
					type = "create-explosion"
				},
				starting_speed = 1,
				type = "artillery"
			},
			type = "direct"
		},
		category = "artillery-shell",
		target_type = "position"
	},
	icon = "__base__/graphics/icons/artillery-shell.png",
	icon_mipmaps = 4,
	icon_size = 64,
	name = "poison-capsule-artillery-shell",
	order = "d[explosive-cannon-shell]-d[artillery]",
	stack_size = 20,
	subgroup = "ammo",
	type = "ammo"
}

--log("ammo:\n" .. sb( ammo ))
data:extend{ammo}

---------------------------------------------------------------------------------------------------

