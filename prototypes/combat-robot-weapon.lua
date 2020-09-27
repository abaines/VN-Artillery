-- Kizrak

-- prototypes\combat-robot-weapon.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

-- projectile/artillery-projectile
-- damage/robot
-- actions & triggers

-- thing that flies through air and does damage
local artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

artillery_projectile.name = "la-combat-robot-projectile-1"

artillery_projectile.action.action_delivery.target_effects = {
	{
		action = {
			action_delivery = {
				target_effects = {
					{
						damage = {
							amount = 4,
							type = "electric"
						},
						type = "damage"
					},
				},
				type = "instant"
			},
			radius = 8,
			type = "area"
		},
		type = "nested-result"
	},
	{
		initial_height = 0,
		max_radius = 3.5,
		offset_deviation = { { -4, -4 }, { 4, 4 } },
		repeat_count = 240,
		smoke_name = "artillery-smoke",
		speed_from_center = 0.05,
		speed_from_center_deviation = 0.005,
		type = "create-trivial-smoke"
	},
	{
		entity_name = "big-artillery-explosion",
		type = "create-entity"
	},
	{
		type = "create-entity",
		show_in_tooltip = true,
		entity_name = "distractor",
		offset_deviation = {{-4, -4}, {4, 4}},
	},
}

data:extend{artillery_projectile}
log(sb(artillery_projectile))

