--- FIRE SCRIPT BY JAKE K. #2217 ---
------------------------------------


--- VARIABLES ---
-----------------
local MaxFireLimit = Config.MaxFlames
local AlreadySpawned = false
local FlameID = nil
local FireActive = false
local SmokeActive = false
local Fires = {}
local SmokeOnly = {}
local FireArea
local FireRadius

--- Net Events ---
------------------

RegisterNetEvent('FireScript:StartFireClient')
AddEventHandler('FireScript:StartFireClient', function(firetable) 
    StopFireInRange(firetable[1].coords, 100.0)
    Wait(700) 
    for i=1, #firetable, 1 do
        Wait(0)
        print(firetable[i].coords)
        local ground, groundz = GetGroundZFor_3dCoord(firetable[i].coords.x, firetable[i].coords.y, firetable[i].coords.z, 0)
        print(tostring(groundz))
        if ground ~= 0 then -- Double check we are not making fires below ground which may result in fires not being able to be put out
            StartFire(firetable[i].coords)
            FireArea = firetable[i].coords
            if i == #firetable then
                -- prevent increase and decrease of PTFX at same time --
                Wait(#firetable * 1000)
                FireActive = true
            end 
        end
    end
end)

-- Get proper ground coords for a fire and calculate around --
RegisterNetEvent('FireScript:GetCoords')
AddEventHandler('FireScript:GetCoords', function(position, flames, radius)  
    FireRadius = radius
    local FireSetup = {}
    for i=1, flames, 1 do
        local FlamePos = GetAround(position, 0, radius)
        local ground, groundz = GetGroundZFor_3dCoord(FlamePos.x, FlamePos.y, FlamePos.z, 0)
        if groundz > 1.0 then
            table.insert(FireSetup, {
                coords = vec3(FlamePos.x, FlamePos.y, groundz + 0.1),
            })
        end
    end
    TriggerServerEvent('FireScript:ReturnCoords', FireSetup)
end)

-- Kill all flames and cleanup the fire --
RegisterNetEvent('FireScript:StopFireSync')
AddEventHandler('FireScript:StopFireSync', function(position)  
    Citizen.Wait(5000)
    FireDone(position)
    FireActive = false
end)

-- Fire timeout trigger --
RegisterNetEvent('FireScript:FireTimeout')
AddEventHandler('FireScript:FireTimeout', function()  
    FireActive = false
    FireTimeout()
end)

-- Sync flames between clients --
RegisterNetEvent('FireScript:SyncFlames')
AddEventHandler('FireScript:SyncFlames', function(position)  
    if position ~= nil then
        for k,v in pairs (Fires) do
            if #(position - v.coords) < 5.0 then
                table.remove(Fires, k)
                CleanUp(v.handle, v.coords)
            end
        end
    end
end)

-- Set in progress fires to new clients --
RegisterNetEvent("playerSpawned")
AddEventHandler("playerSpawned", function()
    if not AlreadySpawned then
        AlreadySpawned = true
        print('SPAWNING FIRES')
        TriggerServerEvent('FireScript:PlayerJoined')
    end
end)

--- FUNCTIONS ---
-----------------

--- Load ParticleFX Library ---
function LoadPTFX(lib)
    UseParticleFxAsset(lib)
    RequestNamedPtfxAsset(lib)
    while not HasNamedPtfxAssetLoaded(lib) do
        Wait(10)
    end
end

--- Start the main fire ---
function StartFire(FlamePos)
    Citizen.CreateThread(function()
        LoadPTFX('scr_trevor3')
        FlameID = StartScriptFire(FlamePos, 25, true)
        local FlamePTFX = StartParticleFxLoopedAtCoord("scr_trev3_trailer_plume", FlamePos, 0, 0, 0, 0.001, true, true, true, false)
        RemoveNamedPtfxAsset("scr_trevor3")
        SetParticleFxLoopedAlpha(FlamePTFX, 0.85)
        table.insert(Fires, {
            coords = FlamePos,
            handle = FlamePTFX,
            scriptfire = FlameID
        })
        StartUp(FlamePTFX)
    end)
end

--- Start standalone smoke ---
function StartSmoke(SmokePos, radius)
    LoadPTFX('scr_agencyheistb')
    local SmokePTFX = StartParticleFxLoopedAtCoord("scr_env_agency3b_smoke", SmokePos, 0.0, 0.0, 0.0, radius*1.0, true, true, true, false)
    SetParticleFxLoopedAlpha(SmokePTFX, 100.0)
    table.insert(SmokeOnly, {
        coords = SmokePos,
        handle = SmokePTFX,
    })
    SmokeActive = true
end

--- Start smoke fadein/out ---
function StartSmokeTimed(SmokePos, radius, increase, time)
    Citizen.CreateThread(function()
        LoadPTFX('scr_agencyheistb')
        local TimeCalc = (time * 60000) / 4
        local SmokePTFX = StartParticleFxLoopedAtCoord("scr_env_agency3b_smoke", SmokePos, 0.0, 0.0, 0.0, radius*1.0, true, true, true, false)
        if increase == true then
            SetParticleFxLoopedAlpha(SmokePTFX, 0.2)
            Citizen.Wait(TimeCalc)
            SetParticleFxLoopedAlpha(SmokePTFX, 0.5)
            Citizen.Wait(TimeCalc)
            SetParticleFxLoopedAlpha(SmokePTFX, 1.0)
            Citizen.Wait(TimeCalc)
        else
            SetParticleFxLoopedAlpha(SmokePTFX, 1.0)
            Citizen.Wait(TimeCalc)
            SetParticleFxLoopedAlpha(SmokePTFX, 0.5)
            Citizen.Wait(TimeCalc)
            SetParticleFxLoopedAlpha(SmokePTFX, 0.2)
            Citizen.Wait(TimeCalc)
            RemovePTFX(SmokePTFX)
            RemoveParticleFxInRange(coords, 50.0)
        end
    end)
end

--- Get around a vector for spread  (Credits: Albo1125) ---
function GetAround(vec, MinDistance, MaxDistance)
    local Around = Around(vec, NextDouble(MinDistance, MaxDistance))
    return Around
end

--- Get a random float and make sure its in the proper params (Credits: Albo1125) ---
function NextDouble(MinDistance, MaxDistance)
    return GetRandomFloatInRange(0.0, 1.0) * (MaxDistance - MinDistance) + MinDistance
end

--- Get a random direction (Credits: Albo1125) ---
function RandomXY()
    local x = GetRandomFloatInRange(0.0, 1.0) - 0.5
    local y = GetRandomFloatInRange(0.0, 1.0) - 0.5
    local z = 0.0
    return vec3(x,y,z)
end

--- Complete the vector for spread (Credits: Albo1125) ---
function Around(vec, radius)
    local direction = RandomXY() 
    local RetVec = vec + (direction * radius)
    return RetVec
end

--- Clean up a single fire ---
function CleanUp(handle, position)
    CreateThread(function()
        if handle ~= nil then
            local size = 0.65
            while size > 0 do
                Citizen.Wait(50)
                SetParticleFxLoopedScale(handle, size)
                if size > 0.01 then
                    size = size - 0.01
                else
                    RemoveParticleFxInRange(position, 1.0)
                    local FiresInArea = GetNumberOfFiresInRange(position, 100.0)
                    if FiresInArea <= 3 then
                        Wait(100)
                        TriggerServerEvent('FireScript:StopFire', position)
                    end
                    break
                end
            end
        end
    end)
end

--- Startup fire effect ---
function StartUp(handle)
    CreateThread(function()
        if handle ~= nil then
            local size = 0.01
            while size > 0 do
                Citizen.Wait(50)
                SetParticleFxLoopedScale(handle, size)
                if size < 0.65 then
                    size = size + 0.005
                else
                    break
                end
            end
        end
    end)
end

--- Remove a particle effect ---
function RemovePTFX(handle)
    if handle ~= nil and DoesParticleFxLoopedExist(handle) then
        StopParticleFxLooped(handle, true)
        RemoveParticleFx(handle, true)
    end
end

-- Fire timout system --
function FireTimeout()
    for k,v in pairs(Fires) do
        Wait(700)
        CleanUp(v.handle, v.coords)
        RemoveScriptFire(v.scriptfire)
    end
end

-- Final fire cleanup --
function FireDone(coords)
    Citizen.Wait(5000) -- givve it some time before we woosh it all away
    RemoveParticleFxInRange(coords, 20.0) -- Just in case cleanup
    StartSmokeTimed(coords, 2, false, 2)
    --StopFireInRange(coords, FireRadius) -- This is optional, if it works correctly, its not needed
end

--- Management of fires ---
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)
        if FireActive == true then
            for k,v in pairs(Fires) do
                local coords = v.coords -- Store this in case we need it in the statement below
                if GetNumberOfFiresInRange(coords, 0.3) == 0 then
                    TriggerServerEvent('FireScript:SyncFlamesSv', coords)
                    v = nil
                end
                if #Fires <= 3 then
                    TriggerServerEvent('FireScript:StopFire', coords)
                end
            end
        end
    end
end)

