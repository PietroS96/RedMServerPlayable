local display = false
local t = {}

RegisterCommand("tvyt", function(source, args)
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_WRITE_NOTEBOOK'), -1, true, false, false, false)
    if args[1] == "open" then -- these args are pretty useless ngl
        SetGui(true)
    elseif args[1] == "close" then 
        SetGui(false)
    else 
        SetGui(not display)
    end
end)



RegisterNetEvent('lto_notepad:open')
AddEventHandler('lto_notepad:open', function()
ExecuteCommand('tvyt')
end)

RegisterNetEvent('lto_notepad:close')
AddEventHandler('lto_notepad:close', function()
ClearPedTasksImmediately(PlayerPedId(), true, true)
end)

RegisterNUICallback('exit', function(data)
    updateNotes(t)
    SetGui(false)
	TriggerEvent("lto_notepad:close")
end)

RegisterNUICallback('error', function(data)
    updateNotes(t)
    SetGui(false)
end)

RegisterNUICallback('save', function(data)
    SetGui(false)
    table.insert(t, data.main)
    updateNotes(t)
	TriggerEvent("lto_notepad:close")
end)

RegisterNUICallback('clear', function(data)
    SetGui(false)
    t = {}
    updateNotes(t)
	TriggerEvent("lto_notepad:close")
end)





--Citizen.CreateThread(function()
--    while display do
--        Citizen.Wait(0)
--        DisableControlAction(0, 1, display)
--        DisableControlAction(0, 2, display)
--        DisableControlAction(0, 142, display)
--        DisableControlAction(0, 18, display)
--        DisableControlAction(0, 322, display)
--        DisableControlAction(0, 106, display)
--    end
--end)

--function dump(o)
--    if type(o) == 'table' then
--       local s = '{ '
--       for k,v in pairs(o) do
--          if type(k) ~= 'number' then k = '"'..k..'"' end
--          s = s .. '['..k..'] = ' .. dump(v) .. ','
--       end
--       return s .. '} '
--    else
--       return tostring(o)
--    end
--end

function SetGui(enable)
    SetNuiFocus(enable, enable)
    display = enable

    SendNUIMessage({
        type = "ui",
        enable = enable,
        data = t
    })
end

function table.length(tbl)
    local cnt = 0
    for _ in pairs(tbl) do cnt = cnt + 1 end
    return cnt
end

function updateNotes(tbl)
    SendNUIMessage({
        type = "ui",
        data = json.encode(tbl)
    })
end