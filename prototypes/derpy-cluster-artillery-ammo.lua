-- Kizrak

-- prototypes\derpy-cluster-artillery-ammo.lua

---------------------------------------------------------------------------------------------------

-- item the player carries
local derpyArtilleryAmmo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

derpyArtilleryAmmo.name = "derpy-cluster-artillery-ammo"
derpyArtilleryAmmo.ammo_type.action.action_delivery.projectile="derpy-artillery-projectile"
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

derpyArtilleryProjectile.action.action_delivery.target_effects = {
	{
		action = {
			action_delivery = {
				target_effects = {
					{
						damage = {
							amount = 8, -- 9 two-shots small biters
							type = "impact"
						},
						type = "damage"
					}
				},
				type = "instant"
			},
			radius = 8,
			type = "area"
		},
		type = "nested-result"
	},
	{
		action = {
			action_delivery = {
				target_effects = {
					{
						damage = {
							amount = 12,
							type = "physical"
						},
						type = "damage"
					},
				},
				type = "instant"
			},
			radius = 3, -- spawners are 5 by 5, so radius 2.5 would never hit anything other than spawner
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
--	{ scale = 0.25, type = "show-explosion-on-chart" }
}

data:extend{derpyArtilleryProjectile}

---------------------------------------------------------------------------------------------------

