local MaxFireLimit = Config.MaxFlames
local Fires = {}
local FinalCoords = nil

RegisterServerEvent('FireScript:ReturnCoords')
AddEventHandler('FireScript:ReturnCoords', function(FiresReturn)
    Fires = FiresReturn
    FinalCoords = FiresReturn[1].coords
    TriggerClientEvent('FireScript:StartFireClient', -1, Fires)
end)

RegisterServerEvent('FireScript:StopFire')
AddEventHandler('FireScript:StopFire', function(returncoords)
    local coords
    if returncoords then
        coords = returncoords
    else
        coords = FinalCoords
    end
    TriggerEvent('FireDispatch:Disable')
    TriggerClientEvent('FireScript:StopFireSync', -1, coords)
	Fires = {}
end)


RegisterServerEvent('FireScript:PlayerJoined')
AddEventHandler('FireScript:PlayerJoined', function()
    local _source = source
    if #Fires > 0 then
        for k,v in pairs(Fires) do 
            Wait(700)
            TriggerClientEvent('FireScript:StartFire', _source, v.coords)
        end
    end
end)

RegisterServerEvent('FireScript:SyncFlamesSv')
AddEventHandler('FireScript:SyncFlamesSv', function(coords)
    local x = coords.x
    ---- Secondary checks based on fires on serverside -----
    for k,v in pairs(Fires) do
        if v.coords == coords then
            v = nil
        end
    end
    if #Fires < 3 then
        TriggerEvent('FireScript:StopFire', coords)
    end
    TriggerClientEvent('FireScript:SyncFlames', -1, coords)
end)


RegisterServerEvent("FireScript:StartFire")
AddEventHandler("FireScript:StartFire", function(sender, position, flames, radius)
    TriggerClientEvent('FireScript:GetCoords', sender, position, flames, radius)
end)