-- Kizrak

-- prototypes\combat-robot-misc.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

-- item/shell/ammo
-- research
-- recipe

-- item the player carries
local ammo = table.deepcopy(data.raw["ammo"]["artillery-shell"])

ammo.name = "la-combat-robot-artillery-shell"
ammo.ammo_type.action.action_delivery.projectile="la-combat-robot-projectile-1"
ammo.stack_size = 10

data:extend{ammo}
log(sb(ammo))

