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

-- thing that flies through air and does damage
local derpyArtilleryProjectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

derpyArtilleryProjectile.name = "derpy-cluster-artillery-projectile"

derpyArtilleryProjectile.action = {
	{
        type = "cluster",
        cluster_count = 7,
        distance = 10,
        distance_deviation = 15,
        action_delivery =
        {
            type = "projectile",
            projectile = "cluster-grenade", -- grenade
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
