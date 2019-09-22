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



local derpyArtilleryGun = table.deepcopy(data.raw["gun"]["artillery-wagon-cannon"])

derpyArtilleryGun.name = "derpy-artillery-gun"
derpyArtilleryGun.flags = {}

data:extend{derpyArtilleryGun}


local derpyArtilleryEntity = table.deepcopy(data.raw["artillery-turret"]["artillery-turret"])

derpyArtilleryEntity.name = "derpy-artillery"
derpyArtilleryEntity.order = "b[turret]-d[artillery-turret]"
derpyArtilleryEntity.minable = {mining_time = 6, result = "derpy-artillery"}
derpyArtilleryEntity.turret_rotation_speed = 0.0001
derpyArtilleryEntity.turn_after_shooting_cooldown = 60*8

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

local unlock = {
	type = "unlock-recipe",
	recipe = "derpy-artillery"
}

table.insert(military2.effects,unlock)

