-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.action = {}
artillery_projectile.final_action = {}

log("artillery-projectile:\n" .. sb( artillery_projectile ))

---------------------------------------------------------------------------------------------------

log("capsule:\n" .. sb( data.raw["capsule"]["poison-capsule"] ))

log("projectile:\n" .. sb( data.raw["projectile"]["poison-capsule"] ))

log("smoke-with-trigger:\n" .. sb( data.raw["smoke-with-trigger"]["poison-cloud"] ))

---------------------------------------------------------------------------------------------------

