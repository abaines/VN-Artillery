-- Kizrak

-- prototypes\derpy-cluster-artillery-ammo.lua

---------------------------------------------------------------------------------------------------

-- item the player carries
local derpyArtilleryAmmo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

derpyArtilleryAmmo.name = "derpy-cluster-artillery-ammo"
derpyArtilleryAmmo.ammo_type.action.action_delivery.projectile="derpy-cluster-artillery-projectile"
derpyArtilleryAmmo.stack_size = 20

data:extend{derpyArtilleryAmmo}

---------------------------------------------------------------------------------------------------

-- the recicpe to craft the item
local derpyArtilleryShellRecipe = table.deepcopy(data.raw.recipe["artillery-shell"])

derpyArtilleryShellRecipe.name = "derpy-cluster-artillery-ammo"
derpyArtilleryShellRecipe.result = "derpy-cluster-artillery-ammo"
derpyArtilleryShellRecipe.ingredients = {
	{"steel-plate", 1},
	{"water-barrel", 1},
	{"coal", 5},
}
derpyArtilleryShellRecipe.category = "advanced-crafting"
derpyArtilleryShellRecipe.energy_required = 20

data:extend{derpyArtilleryShellRecipe}

---------------------------------------------------------------------------------------------------
local derpyClusterArtilleryProjectile = 
{
    type = "projectile",
    name = "cluster-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "grenade-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
          }
        }
      },
      {
        type = "cluster",
        cluster_count = 17,
        distance = 10,
        distance_deviation = 15,
        action_delivery =
        {
          type = "projectile",
          projectile = "artillery-grenade",
          direction_deviation = 0.6,
          starting_speed = 0.25,
          starting_speed_deviation = 0.3
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/cluster-grenade/cluster-grenade.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    }
}
data:extend{derpyClusterArtilleryProjectile}
---------------------------------------------------------------------------------------------------
local derpyClusterArtilleryGrenade = 
{
    type = "projectile",
    name = "artillery-grenade",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "grenade-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1,
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 2.25 -- large radius for demostrative purposes
            }
          }
        }
      },
      {
        type = "area",
        radius = 6.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = 5, type = "explosion"}
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
      filename = "__base__/graphics/entity/grenade/grenade.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    }
}
data:extend{derpyClusterArtilleryGrenade}
---------------------------------------------------------------------------------------------------

-- thing that flies through air and does damage
local derpyArtilleryProjectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

derpyArtilleryProjectile.name = "derpy-cluster-artillery-projectile"

derpyArtilleryProjectile.action = {
	{
        type = "cluster",
        cluster_count = 17,
        distance = 10,
        distance_deviation = 15,
        action_delivery =
        {
            type = "projectile",
            projectile = "cluster-projectile", -- not grenade
            direction_deviation = 0.6,
            starting_speed = 0.25,
            starting_speed_deviation = 0.3,
			target_effects = {
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
			--	{ scale = 0.25, type = "show-explosion-on-chart" }
			}
		}
    }
}

data:extend{derpyArtilleryProjectile}

---------------------------------------------------------------------------------------------------

