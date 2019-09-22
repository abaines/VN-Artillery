-- Kizrak

--data.lua

log("derpy data.lua")

for k,v in pairs(data.raw) do
	log(k)
end

log("derpy data.lua artillery-turret")

for k,v in pairs(data.raw["artillery-turret"]) do
	log(k)
end



local derpyArtilleryAmmo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

derpyArtilleryAmmo.name = "derpy-artillery-ammo"
derpyArtilleryAmmo.ammo_type.action.action_delivery.projectile="derpy-artillery-projectile"

data:extend{derpyArtilleryAmmo}
log(serpent.block(derpyArtilleryAmmo))


local derpyArtilleryShellRecipe = table.deepcopy(data.raw.recipe["artillery-shell"])

derpyArtilleryShellRecipe.name = "derpy-artillery-ammo"
derpyArtilleryShellRecipe.result = "derpy-artillery-ammo"

data:extend{derpyArtilleryShellRecipe}


local derpyArtilleryProjectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

derpyArtilleryProjectile.name = "derpy-artillery-projectile"
--local action = derpyArtilleryProjectile.action.action_delivery.target_effects.action
--[[
local action = derpyArtilleryProjectile.action
action.action_delivery.target_effects = {
	{
		type = "damage",
		damage = {amount = 5 , type = "physical"}
	},
	{
		type = "damage",
		damage = {amount = 5 , type = "explosion"}
	}
}
action.radius = 50
]]--

local target_effects = derpyArtilleryProjectile.action.action_delivery.target_effects

log("for k,v in pairs(target_effects) do")
log(#target_effects)
for k,v in pairs(target_effects) do
	log(k)
	log(serpent.block(v))
end

data:extend{derpyArtilleryProjectile}
--log("serpent.block(derpyArtilleryProjectile.action)")
--log(serpent.block(derpyArtilleryProjectile.action))

--log("serpent.block(derpyArtilleryProjectile.action.action_delivery)")
--log(serpent.block(derpyArtilleryProjectile.action.action_delivery))

--log("serpent.block(derpyArtilleryProjectile.action.action_delivery.target_effects)")
--log(serpent.block(derpyArtilleryProjectile.action.action_delivery.target_effects))

--log("serpent.block(derpyArtilleryProjectile.action.action_delivery.target_effects.action)")
--log(serpent.block(derpyArtilleryProjectile.action.action_delivery.target_effects.action))



local derpyArtilleryGun = table.deepcopy(data.raw["gun"]["artillery-wagon-cannon"])

derpyArtilleryGun.name = "derpy-artillery-gun"
derpyArtilleryGun.flags = {}

local attack_parameters = derpyArtilleryGun.attack_parameters
attack_parameters.cooldown = 200
attack_parameters.min_range = 3 * 32
attack_parameters.range = 14 * 32
attack_parameters.turn_range = 1.0 / 3.0
attack_parameters.ammo_category = "artillery-shell"

data:extend{derpyArtilleryGun}


local derpyArtilleryEntity = table.deepcopy(data.raw["artillery-turret"]["artillery-turret"])

derpyArtilleryEntity.name = "derpy-artillery"
derpyArtilleryEntity.order = "b[turret]-d[artillery-turret]"
derpyArtilleryEntity.minable = {mining_time = 6, result = "derpy-artillery"}
derpyArtilleryEntity.turret_rotation_speed = 0.0001
derpyArtilleryEntity.turn_after_shooting_cooldown = 200
derpyArtilleryEntity.gun = "derpy-artillery-gun"


data:extend{derpyArtilleryEntity}


local derpyArtilleryItem = table.deepcopy(data.raw["item"]["artillery-turret"])

derpyArtilleryItem.name = "derpy-artillery"
derpyArtilleryItem.place_result = "derpy-artillery"
derpyArtilleryItem.stack_size = 1

data:extend{derpyArtilleryItem}


local derpyArtilleryRecipe = table.deepcopy(data.raw.recipe["artillery-turret"])

derpyArtilleryRecipe.name = "derpy-artillery"
derpyArtilleryRecipe.result = "derpy-artillery"

data:extend{derpyArtilleryRecipe}


local military2 = data.raw.technology["military-2"]

local unlock1 = {
	type = "unlock-recipe",
	recipe = "derpy-artillery"
}

local unlock2 = {
	type = "unlock-recipe",
	recipe = "derpy-artillery-ammo"
}

table.insert(military2.effects,unlock1)
table.insert(military2.effects,unlock2)

