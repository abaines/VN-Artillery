-- Kizrak

-- prototypes\derpy-cluster-artillery-ammo.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local clusterResearch = table.deepcopy(data.raw.technology["military-4"])

clusterResearch.name = "derpy-cluster-artillery-research"
clusterResearch.prerequisites = {
	"military-4",
	"poison-capsule-artillery-research",
}

clusterResearch.effects = {{
	recipe = "derpy-cluster-artillery-ammo",
	type = "unlock-recipe"
}}

clusterResearch.icon_mipmaps = 1
clusterResearch.icon_size = 128
clusterResearch.icon = "__lightArtillery__/graphics/cluster-ammo.png"

clusterResearch.unit.count = 5
clusterResearch.unit.time = 5

--log(sb( clusterResearch ))
data:extend{clusterResearch}

---------------------------------------------------------------------------------------------------

-- the recicpe to craft the item
local derpyArtilleryShellRecipe = table.deepcopy(data.raw.recipe["artillery-shell"])

derpyArtilleryShellRecipe.name = "derpy-cluster-artillery-ammo"
derpyArtilleryShellRecipe.results = {{type="item",name="derpy-cluster-artillery-ammo",amount=1}}
derpyArtilleryShellRecipe.ingredients = {
	{type = "item",name="derpy-artillery-ammo",amount= 1},
	{type = "item",name="slowdown-capsule",amount= 1},
	{type = "item",name="cluster-grenade", amount=1},
	{type="fluid", name="lubricant", amount=5}
}
derpyArtilleryShellRecipe.category = "advanced-crafting"
derpyArtilleryShellRecipe.energy_required = 20

data:extend{derpyArtilleryShellRecipe}

---------------------------------------------------------------------------------------------------

-- item the player carries
local derpyArtilleryAmmo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

derpyArtilleryAmmo.name = "derpy-cluster-artillery-ammo"
derpyArtilleryAmmo.ammo_type.action.action_delivery.projectile="derpy-cluster-artillery-projectile-1"
derpyArtilleryAmmo.stack_size = 20
derpyArtilleryAmmo.icon = "__lightArtillery__/graphics/icons/cluster-grenade.png"
derpyArtilleryAmmo.icon_mipmaps = 1

data:extend{derpyArtilleryAmmo}

---------------------------------------------------------------------------------------------------

