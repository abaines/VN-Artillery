data:extend({
    {
        type = "double-setting",
        name = "derpy-artillery-range",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 21 * 32
    },
    {
        type = "double-setting",
        name = "derpy-artillery-min_range",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 4 * 32
    },
    {
        type = "double-setting",
        name = "derpy-artillery-cooldown",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 200
    },
    {
        type = "double-setting",
        name = "derpy-artillery-turret-rotation-speed",
        setting_type = "startup",
        minimum_value = 0.0000001,
        default_value = 0.0001,
        maximum_value = 1
    }
})
