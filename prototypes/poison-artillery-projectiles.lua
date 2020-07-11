-- Kizrak

-- \prototypes\poison-artillery-projectiles.lua

local sb = serpent.block -- luacheck: ignore 211

---------------------------------------------------------------------------------------------------

local artillery_projectile = table.deepcopy( data.raw["artillery-projectile"]["artillery-projectile"] )

artillery_projectile.action = {}
artillery_projectile.final_action = {}

log(sb( artillery_projectile ))

---------------------------------------------------------------------------------------------------

log(sb( data.raw["capsule"]["poison-capsule"] ))

log(sb( data.raw["projectile"]["poison-capsule"] ))

log(sb( data.raw["smoke-with-trigger"]["poison-cloud"] ))

---------------------------------------------------------------------------------------------------

