local steel_ingot = "default:steel_ingot"
local gunpowder = "tnt:gunpowder"
local steelblock = "default:steelblock"
local copper_ingot = "default:copper_ingot"

rifle.simple_register_gun("rifle:rifle", {
    type = "carbine",
    description = "AR-15",
    texture = "rifle.png",
    fire_sound = "shoot",
    bullet_image = "bullet",
    bullethole_image = "bullethole",
    bullet = {
        spread = 0.5,
    },
    automatic = false,
    rounds = 30,
    range = 150,
    damage = 2,
    fire_interval = 0.10,
    liquid_travel_dist = 2,
})

minetest.register_craftitem("rifle:ammo", {
    description = "Ammo",
    inventory_image = "ammo.png",
})

minetest.register_craft({
    output = "rifle:rifle",
    recipe = {
        { steel_ingot, "", "" },
        { "", steelblock, "" },
        { "", "", steel_ingot },
    },
})

minetest.register_craft({
    output = "rifle:ammo",
    recipe = {
        { copper_ingot },
        { gunpowder },
        { steel_ingot },
    },
})
