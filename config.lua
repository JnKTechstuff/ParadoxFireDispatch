Config = {}

-- ## How many total individual flames are allowed ## --
-- ## Default: 100  (WARNING: DO NOT GO ABOVE 200, you will probably crash) ## --
Config.MaxFlames = 100

-- ## Cooldown on fires (how long before another can start). Defined in minutes! ## --
-- ## Default: 5 minutes ## --
Config.Cooldown = 5

-- ## Timeout on fires (how long before the fire puts itself out). Defined in minutes or disable by setting to false! ## --
-- ## Default: 20 minutes ## --
Config.Timeout = 20

-- ## Check for fire job (ExM) ## --
-- ## Default: true ## --
Config.JobCheck = true

-- ## Job to check for fires ## --
-- ## Default: fire ## --
Config.Job = 'fire'

-- ## If job is true, the minimum amount of that job allowed before the script is enabled (Greater than or equal to) ## --
-- ## Default: fire ## --
Config.MinJob = 2

-- ## Enable dynamic fires to spawn on player explosions ## --
-- ## Default: true ## --
Config.EnableTriggers = true

-- ## Enable the admin command to start a fire (requires ace perms). THIS IGNORES ALL COOLDOWNS!! ## --
-- ## Ace perms to use: add_ace group.admin "command.startfire" allow
-- ## Default: true ## --
Config.AdminCommand = true


-- ### Do not touch below this line without reading the instructions ### --
--
-- The triggers are used when a player creates an explosion to dynamically start a fire. This REQUIRES onesync and will NOT work without it.
--
-- ### Trigger Instructions ### --
--  
-- 
-- ## Example ## --
-- {
--     id = <number value>,  ## This is the explosion ID to use, you can find all explosion IDs at the bottom of the config
--
--     chance = <bool>, ## Set this to true to enable the chance feature. 
--
--     chanceodds = <number>, ## Fraction value 1/<number> (IE: 5 = 1/5 or 20%, 4 = 1/4 or 25%)
--
--     explosion = <not used yet>, ## Leave this set to false
--
--     size = math.random(<number>,<number>), ## This is the diameter of your fire, can be used as a random or can be a defined value. The way it is by default is to take a random number between the two set.
--
--     intensity = math.random(<number>,<number>), ## This is the intesity or number of flames spawned on a given fire. The way it is by default is to take a random number between the two set.
--
--     name = '<name>' ## By default its a common name for the explosion type, can be used for customization as in sending a fire type to your players to put out or to be used for logs.
-- },

Config.Triggers = {
    {
        id = 3, 
        chance = true,
        chanceodds = 5, -- 20%
        explosion = false,
        size = math.random(10,20),
        intensity = math.random(10,20),
        name = 'Molotov Cocktail'
    },
    {
        id = 6, 
        chance = true,
        chanceodds = 4, -- 25%
        explosion = false,
        size = math.random(2,3),
        intensity = math.random(7,10),
        name = 'HI OCTANE'
    },
    {
        id = 7, 
        chance = false,
        explosion = false,
        size = math.random(4,6),
        intensity = math.random(20,30),
        name = 'Car Explosion'
    },
    {
        id = 8, 
        chance = false,
        explosion = false,
        size = math.random(10,12),
        intensity = math.random(30,40),
        name = 'Plane Explosion'
    },
    -- {
    --     id = 9, 
    --     chance = false,
    --     explosion = false,
    --     size = math.random(15,20),
    --     intensity = math.random(50,60),
    --     name = 'Petrol Pump'
    -- },
    {
        id = 10, 
        chance = false,
        explosion = false,
        size = math.random(3,5),
        intensity = math.random(10,15),
        name = 'Bike Explosion'
    },
    {
        id = 17, 
        chance = false,
        explosion = false,
        size = math.random(6,8),
        intensity = math.random(25,35),
        name = 'Truck Explosion'
    },
    {
        id = 27, 
        chance = false,
        explosion = false,
        size = math.random(5,10),
        intensity = math.random(10,20),
        name = 'Barrel Fire'
    },
    {
        id = 28, 
        chance = false,
        explosion = false,
        size = math.random(5,10),
        intensity = math.random(10,20),
        name = 'Propaine Explosion'
    },
    -- { --Disabled until I can get entity cords of trailers from server
    --     id = 31, 
    --     chance = false,
    --     explosion = false,
    --     size = math.random(6,8),
    --     intensity = math.random(30,40),
    --     name = 'Fuel Truck Tanker Explosion'
    -- },
    {
        id = 34, 
        chance = false,
        explosion = false,
        size = math.random(6,8),
        intensity = math.random(30,40),
        name = 'Fuel Tank Explosion'
    },
    {
        id = 12, 
        chance = false,
        explosion = false,
        size = math.random(6,8),
        intensity = math.random(30,40),
        name = 'Large Fuel Tank Explosion'
    },
    {
        id = 30, 
        chance = false,
        explosion = false,
        size = math.random(3,4),
        intensity = math.random(10,20),
        name = 'Small Fuel Tank Explosion'
    },
}


-- ### Explosion IDs ### ---
-- Explosion Name  ||  Explosion ID
-- |-
-- |EXP_TAG_GRENADE || 0
-- |-
-- |EXP_TAG_GRENADELAUNCHER || 1
-- |-
-- |EXP_TAG_STICKYBOMB || 2
-- |-
-- |EXP_TAG_MOLOTOV || 3
-- |-
-- |EXP_TAG_ROCKET || 4
-- |-
-- |EXP_TAG_TANKSHELL || 5
-- |-
-- |EXP_TAG_HI_OCTANE || 6
-- |-
-- |EXP_TAG_CAR || 7
-- |-
-- |EXP_TAG_PLANE || 8
-- |-
-- |EXP_TAG_PETROL_PUMP || 9
-- |-
-- |EXP_TAG_BIKE || 10
-- |-
-- |EXP_TAG_DIR_STEAM || 11
-- |-
-- |EXP_TAG_DIR_FLAME || 12
-- |-
-- |EXP_TAG_DIR_WATER_HYDRANT || 13
-- |-
-- |EXP_TAG_DIR_GAS_CANISTER || 14
-- |-
-- |EXP_TAG_BOAT || 15
-- |-
-- |EXP_TAG_SHIP_DESTROY || 16
-- |-
-- |EXP_TAG_TRUCK || 17
-- |-
-- |EXP_TAG_BULLET || 18
-- |-
-- |EXP_TAG_SMOKEGRENADELAUNCHER || 19
-- |-
-- |EXP_TAG_SMOKEGRENADE || 20
-- |-
-- |EXP_TAG_BZGAS || 21
-- |-
-- |EXP_TAG_FLARE || 22
-- |-
-- |EXP_TAG_GAS_CANISTER || 23
-- |-
-- |EXP_TAG_EXTINGUISHER || 24
-- |-
-- |EXP_TAG_PROGRAMMABLEAR || 25
-- |-
-- |EXP_TAG_TRAIN || 26
-- |-
-- |EXP_TAG_BARREL || 27
-- |-
-- |EXP_TAG_PROPANE || 28
-- |-
-- |EXP_TAG_BLIMP || 29
-- |-
-- |EXP_TAG_DIR_FLAME_EXPLODE || 30
-- |-
-- |EXP_TAG_TANKER || 31
-- |-
-- |EXP_TAG_PLANE_ROCKET || 32
-- |-
-- |EXP_TAG_VEHICLE_BULLET || 33
-- |-
-- |EXP_TAG_GAS_TANK || 34
-- |-
-- |EXP_TAG_BIRD_CRAP || 35
-- |-
-- |EXP_TAG_RAILGUN || 36
-- |-
-- |EXP_TAG_BLIMP2 || 37
-- |-
-- |EXP_TAG_FIREWORK || 38
-- |-
-- |EXP_TAG_SNOWBALL || 39
-- |-
-- |EXP_TAG_PROXMINE || 40
-- |-
-- |EXP_TAG_VALKYRIE_CANNON || 41
-- |-
-- |EXP_TAG_AIR_DEFENSE || 42
-- |-
-- |EXP_TAG_PIPEBOMB || 43
-- |-
-- |EXP_TAG_VEHICLEMINE || 44
-- |-
-- |EXP_TAG_EXPLOSIVEAMMO || 45
-- |-
-- |EXP_TAG_APCSHELL || 46
-- |-
-- |EXP_TAG_BOMB_CLUSTER || 47
-- |-
-- |EXP_TAG_BOMB_GAS || 48
-- |-
-- |EXP_TAG_BOMB_INCENDIARY || 49
-- |-
-- |EXP_TAG_BOMB_STANDARD || 50
-- |-
-- |EXP_TAG_TORPEDO || 51
-- |-
-- |EXP_TAG_TORPEDO_UNDERWATER || 52
-- |-
-- |EXP_TAG_BOMBUSHKA_CANNON || 53
-- |-
-- |EXP_TAG_BOMB_CLUSTER_SECONDARY || 54
-- |-
-- |EXP_TAG_HUNTER_BARRAGE || 55
-- |-
-- |EXP_TAG_HUNTER_CANNON || 56
-- |-
-- |EXP_TAG_ROGUE_CANNON || 57
-- |-
-- |EXP_TAG_MINE_UNDERWATER || 58
-- |-
-- |EXP_TAG_ORBITAL_CANNON || 59
-- |-
-- |EXP_TAG_BOMB_STANDARD_WIDE || 60
-- |-
-- |EXP_TAG_EXPLOSIVEAMMO_SHOTGUN || 61
-- |-
-- |EXP_TAG_OPPRESSOR2_CANNON || 62
-- |-
-- |EXP_TAG_MORTAR_KINETIC || 63
-- |-
-- |EXP_TAG_VEHICLEMINE_KINETIC || 64
-- |-
-- |EXP_TAG_VEHICLEMINE_EMP || 65
-- |-
-- |EXP_TAG_VEHICLEMINE_SPIKE || 66
-- |-
-- |EXP_TAG_VEHICLEMINE_SLICK || 67
-- |-
-- |EXP_TAG_VEHICLEMINE_TAR || 68
-- |-
-- |EXP_TAG_SCRIPT_DRONE || 69
-- |-
-- |EXP_TAG_RAYGUN || 70
-- |-
-- |EXP_TAG_BURIEDMINE || 71
-- |-
-- |EXP_TAG_SCRIPT_MISSILE || 72
