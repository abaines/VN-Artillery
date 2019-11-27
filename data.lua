-- Kizrak

--data.lua

---------------------------------------------------------------------------------------------------

local derpyArtilleryAmmo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

derpyArtilleryAmmo.name = "derpy-artillery-ammo"
derpyArtilleryAmmo.ammo_type.action.action_delivery.projectile="derpy-artillery-projectile"
derpyArtilleryAmmo.stack_size = 20

data:extend{derpyArtilleryAmmo}

---------------------------------------------------------------------------------------------------

local derpyArtilleryShellRecipe = table.deepcopy(data.raw.recipe["artillery-shell"])

derpyArtilleryShellRecipe.name = "derpy-artillery-ammo"
derpyArtilleryShellRecipe.result = "derpy-artillery-ammo"
derpyArtilleryShellRecipe.ingredients = {
	{"steel-plate", 1},
	{"water-barrel", 1},
	{"coal", 5},
}
derpyArtilleryShellRecipe.energy_required = 20

data:extend{derpyArtilleryShellRecipe}

---------------------------------------------------------------------------------------------------

local derpyArtilleryProjectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

derpyArtilleryProjectile.name = "derpy-artillery-projectile"

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

local derpyArtilleryGun = table.deepcopy(data.raw["gun"]["artillery-wagon-cannon"])

derpyArtilleryGun.name = "derpy-artillery-gun"
derpyArtilleryGun.flags = {}

local attack_parameters = derpyArtilleryGun.attack_parameters
attack_parameters.cooldown = 200
attack_parameters.min_range = 4 * 32 -- 1 * 32
attack_parameters.range = 21 * 32 -- 7 * 32
attack_parameters.turn_range = 1.0 / 3.0
attack_parameters.ammo_category = "artillery-shell"

data:extend{derpyArtilleryGun}

---------------------------------------------------------------------------------------------------

local derpyArtilleryEntity = table.deepcopy(data.raw["artillery-turret"]["artillery-turret"])

derpyArtilleryEntity.name = "derpy-artillery"
derpyArtilleryEntity.order = "b[turret]-d[artillery-turret]"
derpyArtilleryEntity.minable = {mining_time = 6, result = "derpy-artillery"}
derpyArtilleryEntity.turret_rotation_speed = 0.0001
derpyArtilleryEntity.turn_after_shooting_cooldown = 200
derpyArtilleryEntity.gun = "derpy-artillery-gun"
derpyArtilleryEntity.ammo_stack_limit = 30
derpyArtilleryEntity.automated_ammo_count = 10
derpyArtilleryEntity.max_health = 500

data:extend{derpyArtilleryEntity}

---------------------------------------------------------------------------------------------------

local derpyArtilleryItem = table.deepcopy(data.raw["item"]["artillery-turret"])

derpyArtilleryItem.name = "derpy-artillery"
derpyArtilleryItem.place_result = "derpy-artillery"
derpyArtilleryItem.stack_size = 1

data:extend{derpyArtilleryItem}

---------------------------------------------------------------------------------------------------

local derpyArtilleryRecipe = table.deepcopy(data.raw.recipe["artillery-turret"])

derpyArtilleryRecipe.name = "derpy-artillery"
derpyArtilleryRecipe.result = "derpy-artillery"
derpyArtilleryRecipe.ingredients = {
	{"steel-plate", 60},
	{"stone-brick", 60},
	{"iron-gear-wheel", 40},
	{"electronic-circuit", 60},
	--{"water-barrel", 12},
	{type="fluid", name="water", amount=600}
}
derpyArtilleryRecipe.category = "crafting-with-fluid"

data:extend{derpyArtilleryRecipe}

---------------------------------------------------------------------------------------------------

local lightArtilleryResearch = table.deepcopy(data.raw.technology["military-2"])
lightArtilleryResearch.name = "derpy-artillery"
lightArtilleryResearch.icon = "__base__/graphics/technology/artillery.png"
lightArtilleryResearch.unit.count = 5

lightArtilleryResearch.effects = {}

local unlock1 = {
	type = "unlock-recipe",
	recipe = "derpy-artillery"
}

local unlock2 = {
	type = "unlock-recipe",
	recipe = "derpy-artillery-ammo"
}

table.insert(lightArtilleryResearch.effects,unlock1)
table.insert(lightArtilleryResearch.effects,unlock2)

table.insert(lightArtilleryResearch.prerequisites,"fluid-handling")

data:extend{lightArtilleryResearch}


---------------------------------------------------------------------------------------------------

local artilleryResearch = data.raw.technology["artillery"]

table.insert(artilleryResearch.prerequisites,"derpy-artillery")
table.insert(artilleryResearch.prerequisites,"military-3")
table.insert(artilleryResearch.prerequisites,"utility-science-pack")
table.insert(artilleryResearch.prerequisites,"explosives")
table.insert(artilleryResearch.prerequisites, "automobilism")



---------------------------------------------------------------------------------------------------
-- Grey Belt --- Grey Belt --- Grey Belt --- Grey Belt --- Grey Belt --- Grey Belt --- Grey Belt --
---------------------------------------------------------------------------------------------------



local grey_belt_item = table.deepcopy(data.raw.item["transport-belt"])
grey_belt_item.name = "crash-transport-belt-item"
grey_belt_item.place_result = "crash-transport-belt-entity"

log(serpent.block( grey_belt_item ))

local grey_belt_entity = table.deepcopy(data.raw["transport-belt"]["transport-belt"])
grey_belt_entity.name = "crash-transport-belt-entity"
grey_belt_entity.speed = 0.03125 / 2

log(serpent.block( grey_belt_entity ))

data:extend{grey_belt_item}
data:extend{grey_belt_entity}

