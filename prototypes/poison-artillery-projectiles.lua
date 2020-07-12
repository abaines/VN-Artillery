-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.name = "poison-capsule-artillery-projectile-1"

artillery_projectile.action = table.deepcopy( data.raw["projectile"]["poison-capsule"].action )

artillery_projectile.action[1].action_delivery.target_effects[1].entity_name = "poison-cloud-artillery-projectile-2"

log("artillery-projectile:\n" .. sb( artillery_projectile ))
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

for i,o in pairs(smoke_with_trigger.created_effect) do
	o.action_delivery.target_effects.entity_name = "poison-cloud--artillery-visual-dummy-3"
end


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

visual_dummy.animation.scale = .5

visual_dummy.particle_spread = {
	4*3.7800000000000002,
	4*2.2680000000000002
}

log("poison-cloud-visual-dummy:\n" .. sb( visual_dummy ))
data:extend{visual_dummy}

---------------------------------------------------------------------------------------------------

