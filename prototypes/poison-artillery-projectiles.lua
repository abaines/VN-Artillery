-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.name = "poison-capsule-artillery-projectile-1"

--log("action:\n" .. sb( artillery_projectile.action ))
artillery_projectile.action = data.raw["projectile"]["poison-capsule"].action

local final_action = artillery_projectile.final_action

--log("final_action:\n" .. sb( final_action ))

log("artillery-projectile:\n" .. sb( artillery_projectile ))
data:extend{artillery_projectile}

---------------------------------------------------------------------------------------------------

log("capsule:\n" .. sb( data.raw["capsule"]["poison-capsule"] ))

log("projectile:\n" .. sb( data.raw["projectile"]["poison-capsule"] ))

log("smoke-with-trigger:\n" .. sb( data.raw["smoke-with-trigger"]["poison-cloud"] ))

---------------------------------------------------------------------------------------------------

