-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.name = "poison-capsule-artillery-projectile-1"

artillery_projectile.action = table.deepcopy( data.raw["projectile"]["poison-capsule"].action )

artillery_projectile.action[1].action_delivery.target_effects[1].entity_name = "poison-cloud-artillery-projectile-2"

local agro_ping_damage_action = {
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
				entity_flags = { "breaths-air" },
				radius = 77,
				type = "area"
			},
			type = "nested-result"
		},
		type = "instant"
	},
	type = "direct"
}

table.insert(artillery_projectile.action,agro_ping_damage_action)

log("artillery-projectile:\n" .. sb( artillery_projectile ))
data:extend{artillery_projectile}

---------------------------------------------------------------------------------------------------

local smoke_with_trigger = {
	name = "poison-cloud-artillery-projectile-2",
	type = "smoke-with-trigger",
	action = {
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
					entity_flags = { "breaths-air" },
					radius = 77,
					type = "area"
				},
				type = "nested-result"
			},
			type = "instant"
		},
		type = "direct"
	},
	action_cooldown = 90,
	affected_by_wind = false,
	animation = {
		animation_speed = 0.25,
		filename = "__base__/graphics/entity/smoke/smoke.png",
		flags = { "smoke" },
		frame_count = 60,
		height = 120,
		width = 152,
		line_length = 5,
		priority = "high",
		shift = {
			-15,
			-15
		},
		scale = 70,
		apply_runtime_tint = true,
		tint = { r = 1.0, g = 0.4, b = 0.0, a = 0.0},
	},
	cyclic = true,
	duration = 90*14, -- ~14 ticks over ~24 seconds
	fade_away_duration = 120,
	flags = { "not-on-map" },
	render_layer = "higher-object-under",
	show_when_smoke_off = true,
	working_sound = {
		fade_in_ticks = 4,
		fade_out_ticks = 20,
		max_sounds_per_type = 3,
		sound = {
			filename = "__base__/sound/fight/poison-cloud.ogg",
			volume = 0.7
		}
	}
}

smoke_with_trigger.created_effect = {
	{
		action_delivery = {
			target_effects = {
				entity_name = "poison-cloud--artillery-visual-dummy-3",
				initial_height = 0,
				show_in_tooltip = false,
				type = "create-smoke"
			},
			type = "instant"
		},
		cluster_count = 12,
		distance = 77,
		type = "cluster"
	},
}

log("smoke-with-trigger:\n" .. sb( smoke_with_trigger ))
data:extend{smoke_with_trigger}

---------------------------------------------------------------------------------------------------

local visual_dummy = {
	name = "poison-cloud--artillery-visual-dummy-3",
	type = "smoke-with-trigger",
	affected_by_wind = false,
	animation = {
		animation_speed = 0.25,
		filename = "__base__/graphics/entity/smoke/smoke.png",
		flags = { "smoke" },
		frame_count = 60,
		height = 120, width = 152,
		line_length = 5,
		priority = "high",
		scale = 1,
		shift = {
			-0.53125,
			-0.4375
		},
	},
	color = { r = 0.9, g = 0.5, b = 0, },
	cyclic = true,
	duration = 1260,
	fade_away_duration = 180,
	flags = { "not-on-map" },
	render_layer = "higher-object-above",
	show_when_smoke_off = true,
}

log("poison-cloud-visual-dummy:\n" .. sb( visual_dummy ))
data:extend{visual_dummy}

---------------------------------------------------------------------------------------------------

