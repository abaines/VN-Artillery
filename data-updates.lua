-- Apply settings
local derpyArtilleryGun = data.raw["gun"]["derpy-artillery-gun"]
derpyArtilleryGun.attack_parameters.min_range = settings.startup["derpy-artillery-min_range"].value
derpyArtilleryGun.attack_parameters.range = settings.startup["derpy-artillery-range"].value
derpyArtilleryGun.attack_parameters.cooldown = settings.startup["derpy-artillery-cooldown"].value

local derpyArtilleryEntity = data.raw["artillery-turret"]["derpy-artillery"]
derpyArtilleryEntity.turret_rotation_speed = settings.startup["derpy-artillery-turret-rotation-speed"].value
