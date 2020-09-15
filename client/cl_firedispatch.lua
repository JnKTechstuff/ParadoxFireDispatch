RegisterNetEvent('FireDispatch:FireAlarm')
AddEventHandler('FireDispatch:FireAlarm', function(pos)
    print('TRIGGERED')
    print(pos)
    local interior = GetInteriorAtCoords(pos)
    print(interior)
    if interior ~= 0 and interior ~= 1344257 then
        print('STARING ALARM AT: ' .. interior)
        TriggerServerEvent('Fire-Alarm:SetPulled', interior)
    end
    Citizen.Wait(5000)
    local FiresInArea = GetNumberOfFiresInRange(pos, 100.0)
    if FiresInArea > 3 then
        TriggerServerEvent('Fire-EMS-Pager:FireActivated', pos)
        TriggerEvent('postals:GetPostalFire', pos, 'Fire Alarm', 'ambulance')
    end
end)
