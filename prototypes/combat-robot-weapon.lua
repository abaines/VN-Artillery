-- Kizrak

-- prototypes\combat-robot-weapon.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

-- projectile/artillery-projectile
-- damage/robot
-- actions & triggers

-- thing that flies through air and does damage
local artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])

artillery_projectile.name = "la-combat-robot-projectile-1"

data:extend{artillery_projectile}
log(artillery_projectile)

