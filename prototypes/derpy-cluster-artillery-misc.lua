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

clusterResearch.icon = "__lightArtillery__/graphics/cluster-ammo.png"

clusterResearch.unit.count = 5
clusterResearch.unit.time = 5

--log(sb( clusterResearch ))
data:extend{clusterResearch}

---------------------------------------------------------------------------------------------------

-- the recicpe to craft the item
local derpyArtilleryShellRecipe = table.deepcopy(data.raw.recipe["artillery-shell"])

derpyArtilleryShellRecipe.name = "derpy-cluster-artillery-ammo"
derpyArtilleryShellRecipe.result = "derpy-cluster-artillery-ammo"
derpyArtilleryShellRecipe.ingredients = {
	{"derpy-artillery-ammo", 1},
	{"slowdown-capsule", 1},
	{"cluster-grenade", 1},
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

data:extend{derpyArtilleryAmmo}

---------------------------------------------------------------------------------------------------

