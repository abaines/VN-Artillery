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
		entity_name = "la-defender",
		offset_deviation = {{-4, -4}, {4, 4}},
	},
}

data:extend{artillery_projectile}
--log("artillery_projectile.action:\n"..sb(artillery_projectile.action))

---------------------------------------------------------------------------------------------------

local defender = table.deepcopy(data.raw["combat-robot"]["defender"])

defender.name = "la-defender"
defender.follows_player = false
defender.range_from_player = nil
defender.speed = 0
defender.friction = 1

data:extend{defender}

local defenderL = table.deepcopy(defender)

defenderL.destroy_action.action_delivery.source_effects = nil
defenderL.attack_parameters.sound = nil

defenderL.damaged_trigger_effect = nil
defenderL.dying_trigger_effect = nil
defenderL.collision_box = nil

defenderL.idle = nil
defenderL.in_motion = nil
defenderL.shadow_idle = nil
defenderL.shadow_in_motion = nil
defenderL.water_reflection = nil

--log("defender:\n"..sb(defenderL))

