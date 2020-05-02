-- Kizrak

-- prototypes\derpy-artillery-gun.lua

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

