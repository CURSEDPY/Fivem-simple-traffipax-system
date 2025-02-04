Config = {}

-- Speed zones configuration
Config.SpeedZones = {
    {
        pos = vector3(-186.962631, -890.940674, 29.330444), -- Example location, you can change these
        radius = 50.0, -- Zone radius in meters
        speedLimit = 80.0, -- Speed limit in km/h
        blipColor = 1, -- Red color for blip
        fine = 80 -- Fine amount in dollars
    },
    {
        pos = vector3(296.77, -1204.32, 29.28), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 120.0,
        blipColor = 1,
        fine = 120
    },
    {
        pos = vector3(104.927475, -571.872498, 43.652710), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 80.0,
        blipColor = 1,
        fine = 80
    },
    {
        pos = vector3(-633.613159, -370.167023, 34.806641), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 80.0,
        blipColor = 1,
        fine = 80
    },
    {
        pos = vector3(-771.652771, -1115.485718, 10.711304), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 80.0,
        blipColor = 1,
        fine = 80
    },
    {
        pos = vector3(1466.953857, -1506.778076, 64.833008), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 120.0,
        blipColor = 1,
        fine = 120
    },
    {
        pos = vector3(1498.404419, -1026.118652, 56.997803), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 160.0,
        blipColor = 1,
        fine = 160
    },
    {
        pos = vector3(1493.578003, 823.925293, 76.931152), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 160.0,
        blipColor = 1,
        fine = 160
    },
    {
        pos = vector3(-2241.745117, -343.239563, 13.457886), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 120.0,
        blipColor = 1,
        fine = 120
    },
    {
        pos = vector3(-1589.854980, -144.738464, 55.683472), -- Example location, you can change these
        radius = 40.0,
        speedLimit = 120.0,
        blipColor = 1,
        fine = 120
    }
}

-- General configuration
Config.CheckInterval = 1000 -- How often to check speed (in ms)
Config.NotificationDuration = 5000 -- Megnövelt értesítési idő (8 másodperc)
Config.EnableBlips = true -- Whether to show blips on map
Config.BlipSprite = 42 -- Changed to radar/speed camera blip
