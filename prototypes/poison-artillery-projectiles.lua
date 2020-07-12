-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.name = "poison-capsule-artillery-projectile-1"

local poison_capsule_action = table.deepcopy( data.raw["projectile"]["poison-capsule"].action )

artillery_projectile.action = poison_capsule_action
artillery_projectile.action[1].action_delivery.target_effects[1].entity_name = "poison-cloud-artillery-projectile-2",

log("artillery-projectile:\n" .. sb( artillery_projectile ))
data:extend{artillery_projectile}

---------------------------------------------------------------------------------------------------

local smoke_with_trigger = table.deepcopy( data.raw["smoke-with-trigger"]["poison-cloud"] )

smoke_with_trigger.name = "poison-cloud-artillery-projectile-2"

smoke_with_trigger.action = {
	action_delivery = {
		target_effects = {
			action = {
				action_delivery = {
					target_effects = {
						damage = {
							amount = 8,
							type = "poison"
						},
						type = "damage"
					},
					type = "instant"
				},
				entity_flags = {
					"breaths-air"
				},
				radius = 11,
				type = "area"
			},
			type = "nested-result"
		},
		type = "instant"
	},
	type = "direct"
}

log("smoke-with-trigger:\n" .. sb( smoke_with_trigger ))
data:extend{smoke_with_trigger}

---------------------------------------------------------------------------------------------------

