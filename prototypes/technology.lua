-- Kizrak

-- prototypes\technology.lua

---------------------------------------------------------------------------------------------------

-- add a new research that unlocks two recicpes
local lightArtilleryResearch = table.deepcopy(data.raw.technology["military-2"])
lightArtilleryResearch.name = "derpy-artillery"
lightArtilleryResearch.icon_mipmaps = 1
lightArtilleryResearch.icon_size = 128
lightArtilleryResearch.icon = "__lightArtillery__/graphics/light-artillery.png"
lightArtilleryResearch.unit.count = 5
lightArtilleryResearch.unit.time = 5

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

lightArtilleryResearch.prerequisites = {
	"fluid-handling",
	"military-2",
}

data:extend{lightArtilleryResearch}

---------------------------------------------------------------------------------------------------

-- modify existing technology to require new technology
local artilleryResearch = data.raw.technology["artillery"]

table.insert(artilleryResearch.prerequisites,"derpy-cluster-artillery-research")

