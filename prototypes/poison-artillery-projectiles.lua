-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.name = "poison-capsule-artillery-projectile-1"

artillery_projectile.action = table.deepcopy( data.raw["projectile"]["poison-capsule"].action )

artillery_projectile.action[1].action_delivery.target_effects[1].entity_name = "poison-cloud-artillery-projectile-2"

--log("artillery-projectile:\n" .. sb( artillery_projectile ))
data:extend{artillery_projectile}

---------------------------------------------------------------------------------------------------

local smoke_with_trigger = table.deepcopy( data.raw["smoke-with-trigger"]["poison-cloud"] )

smoke_with_trigger.name = "poison-cloud-artillery-projectile-2"

smoke_with_trigger.color = {
	r = 0.9,
	g = 0.5,
	b = 0.0,
	a = 0.05,
}

for _,created_effect in pairs(smoke_with_trigger.created_effect) do
	created_effect.action_delivery.target_effects.entity_name = "poison-cloud--artillery-visual-dummy-3"
	created_effect.distance = 7*created_effect.distance
	created_effect.distance_deviation = nil
end

smoke_with_trigger.created_effect[1].cluster_count = 4
smoke_with_trigger.created_effect[2]=nil

smoke_with_trigger.created_effect = nil

smoke_with_trigger.action = {
	action_delivery = {
		target_effects = {
			action = {
				action_delivery = {
					target_effects = {
						damage = {
							amount = 1,
							type = "poison"
						},
						type = "damage"
					},
					type = "instant"
				},
				entity_flags = {
					"breaths-air"
				},
				radius = 11*7,
				type = "area"
			},
			type = "nested-result"
		},
		type = "instant"
	},
	type = "direct"
}

smoke_with_trigger.action_cooldown = 90
smoke_with_trigger.particle_count = 1

smoke_with_trigger.wave_speed = nil
smoke_with_trigger.wave_distance = nil

smoke_with_trigger.particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 }

smoke_with_trigger.particle_scale_factor = nil

smoke_with_trigger.particle_distance_scale_factor = nil

smoke_with_trigger.spread_duration_variation = nil

log("smoke-with-trigger:\n" .. sb( smoke_with_trigger ))
data:extend{smoke_with_trigger}

---------------------------------------------------------------------------------------------------

local visual_dummy = table.deepcopy( data.raw["smoke-with-trigger"]["poison-cloud-visual-dummy"] )

visual_dummy.name = "poison-cloud--artillery-visual-dummy-3"

visual_dummy.color = {
	r = 0.9,
	g = 0.5,
	b = 0.0,
	a = 0.05,
}

visual_dummy.animation.scale = 1

visual_dummy.particle_count = 2

visual_dummy.animation.spread_duration_variation = nil
visual_dummy.animation.particle_duration_variation = nil

visual_dummy.particle_spread = {
	7*3.7800000000000002,
	7*2.2680000000000002
}

--log("poison-cloud-visual-dummy:\n" .. sb( visual_dummy ))
--data:extend{visual_dummy}

---------------------------------------------------------------------------------------------------

