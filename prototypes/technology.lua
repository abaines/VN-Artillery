-- Kizrak

-- prototypes\technology.lua

---------------------------------------------------------------------------------------------------

-- add a new research that unlocks two recicpes
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

-- modify existing technology to require new technology
local artilleryResearch = data.raw.technology["artillery"]

table.insert(artilleryResearch.prerequisites,"derpy-artillery")
table.insert(artilleryResearch.prerequisites,"military-3")
table.insert(artilleryResearch.prerequisites,"utility-science-pack")
table.insert(artilleryResearch.prerequisites,"explosives")
table.insert(artilleryResearch.prerequisites,"automobilism")

