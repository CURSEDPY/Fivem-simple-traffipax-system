ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}
local isInSpeedZone = false
local currentZone = nil
local speedZoneBlips = {}

-- Function to convert meters per second to kilometers per hour
local function msToKmh(speed)
    return speed * 3.6
end

-- Function to create camera flash effect
local function CreateFlashEffect()
    -- Strong flash effect
    StartScreenEffect("FocusOut", 0, false)
    Wait(100)
    StopScreenEffect("FocusOut")
    
    -- Dazzling white effect
    StartScreenEffect("DeathFailOut", 0, false)
    Wait(200)
    StopScreenEffect("DeathFailOut")
    
    -- After-flash effect
    StartScreenEffect("MP_corona_switch", 3800, false)
    
    -- Camera sound
    PlaySoundFrontend(-1, "Camera_Shoot", "Phone_Soundset_Franklin", 1)
    Wait(300)
    PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
end

-- Function to create blips for speed zones
local function CreateSpeedZoneBlips()
    if Config.EnableBlips then
        for _, zone in ipairs(Config.SpeedZones) do
-- The red circle no longer appears
            local centerBlip = AddBlipForCoord(zone.pos.x, zone.pos.y, zone.pos.z)
            SetBlipSprite(centerBlip, Config.BlipSprite)
            SetBlipColour(centerBlip, zone.blipColor)
            SetBlipScale(centerBlip, 0.6)
            SetBlipAsShortRange(centerBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Trafipax - " .. zone.speedLimit .. " km/h")
            EndTextCommandSetBlipName(centerBlip)

            table.insert(speedZoneBlips, centerBlip)
        end
    end
end

-- Function to check if player is in any speed zone
local function CheckSpeedZone()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local playerCoords = GetEntityCoords(playerPed)
        local speed = msToKmh(GetEntitySpeed(vehicle))

        for _, zone in ipairs(Config.SpeedZones) do
            local distance = #(playerCoords - zone.pos)
            if distance <= zone.radius then
                if speed > zone.speedLimit then
                    local speedDiff = math.floor(speed - zone.speedLimit) -- Mennyivel léptük túl a sebességet
                    CreateFlashEffect()
                    TriggerServerEvent('trafixpax:speedingFine', speed, zone.speedLimit, speedDiff)
                    Wait(Config.NotificationDuration)
                end
                return
            end
        end
    end
end

-- Initialize
CreateThread(function()
    CreateSpeedZoneBlips()
    while true do
        CheckSpeedZone()
        Wait(Config.CheckInterval)
    end
end)

-- Cleanup blips when resource stops
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for _, blip in ipairs(speedZoneBlips) do
            RemoveBlip(blip)
        end
    end
end)
