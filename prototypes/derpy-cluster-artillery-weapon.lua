-- Kizrak

-- prototypes\derpy-cluster-artillery-ammo.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

-- thing that flies through air and does damage
local derpyArtilleryProjectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

derpyArtilleryProjectile.name = "derpy-cluster-artillery-projectile-1"

local target_effects = derpyArtilleryProjectile.final_action.action_delivery.target_effects

-- type = "invoke-tile-trigger",
target_effects[2].repeat_count = 11

table.insert(target_effects,{
	entity_name = "big-artillery-explosion",
	type = "create-entity"
})

derpyArtilleryProjectile.action = {
	{
		type = "cluster",
		cluster_count = 11,
		distance = 10,
		distance_deviation = 15,
		action_delivery =
		{
			type = "projectile",
			projectile = "cluster-projectile-2", -- not grenade
			direction_deviation = 0.6,
			starting_speed = 0.25,
			starting_speed_deviation = 0.3,
		}
	},
	{
		type = "area",
		radius = 2.5,
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "damage",
					damage = {amount = 35, type = "explosion"}
				}
			}
		}
	},
	{
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "destroy-decoratives",
					from_render_layer = "decorative",
					to_render_layer = "object",
					include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
					include_decals = false,
					invoke_decorative_trigger = true,
					decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
					radius = 6 -- large radius for demostrative purposes
				}
			}
		}
	}
}

--log(sb( derpyArtilleryProjectile ))
data:extend{derpyArtilleryProjectile}

---------------------------------------------------------------------------------------------------

local derpyClusterArtilleryProjectile =
	{
		type = "projectile",
		name = "cluster-projectile-2",
		flags = {"not-on-map"},
		acceleration = 0.005,
		action =
		{
			{
				type = "cluster",
				cluster_count = 11,
				distance = 10,
				distance_deviation = 15,
				action_delivery =
				{
					type = "projectile",
					projectile = "cluster-artillery-pellet-3",
					direction_deviation = 0.6,
					starting_speed = 0.25,
					starting_speed_deviation = 0.3,
					max_range = 20,
				}
			},
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "create-entity",
							entity_name = "flying-robot-damaged-explosion"
						},
						{
							type = "create-trivial-smoke",
							smoke_name = "artillery-smoke",
							initial_height = 1,
							max_radius = .1,
							offset_deviation = { { -.1, -.1 }, { .1, .1 } },
							repeat_count = 9,
							speed_from_center = 0.05,
							speed_from_center_deviation = 0.005,
						},
					}
				}
			}
		},
		light = {intensity = 0.5, size = 4},
		animation =
		{
			filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
			width = 64,
			height = 64,
			scale = 0.5
		},
		shadow =
		{
			filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
			width = 64,
			height = 64,
			scale = 0.5
		},
	}

--log(sb( derpyClusterArtilleryProjectile ))
data:extend{derpyClusterArtilleryProjectile}

---------------------------------------------------------------------------------------------------

local derpyClusterArtilleryPellet =
	{
		type = "projectile",
		name = "cluster-artillery-pellet-3",
		direction_only = true,
		flags = {"not-on-map"},
		acceleration = 0.005,
		action =
		{
			{
				type = "area",
				radius = 2.5,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "damage",
							damage = {amount = 6, type = "impact"} -- TODO: slow capsule effect
						},
						{
							type = "create-entity",
							entity_name = "explosion"
						}
					}
				}
			}
		},
		light = {intensity = 0.5, size = 4},
		animation =
		{
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		},
	}

--log(sb( derpyClusterArtilleryPellet ))
data:extend{derpyClusterArtilleryPellet}

---------------------------------------------------------------------------------------------------

