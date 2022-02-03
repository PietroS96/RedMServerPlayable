--MALIK CREDITS

local soldi = 0 
local grado = nil
local lavoro = nil
local raschiafieno = nil
local blip = nil
local blip2 = nil
local blip3 = nil
local cult = 0
local latte = 0
local gestionemugnaio = 0
local lana = 0 
local gestionepecore = 0 
local gestionemaiali = 0 
local salamelle = 0 

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
       -- print("Malik")
        local _src = source
        local Malik = PlayerPedId()
        local mPos = GetEntityCoords(Malik)
       -- print("Arrivo alla mia posizione: "..mPos.."")
        for k,v in pairs(Config.Posizione) do 
            if Vdist(mPos, v.x, v.y, v.z) < 4.5 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.x, v.y, v.z-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false) -- Fa apparire il blip per terra 
            if Vdist(mPos, v.x, v.y, v.z-0.90) < 1.5 then
            Testo(Config.TestoBlip, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            if IsControlJustReleased(0, Config.TastoApriMenu ) then -- SPAZIO 
                TriggerServerEvent("malik_contadino:checklavoro", nil)
            end
            end
            end
        end
    end
end)

function Testo(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
end

Citizen.CreateThread(function()
    
    WarMenu.CreateMenu('Ranch', Config.Titolo)
    WarMenu.SetSubTitle('Ranch', Config.Sottotitolo)
    local _source = source
    while true do
        Wait(1)
    if WarMenu.IsMenuOpened("Ranch") then
        if WarMenu.Button('Ranch Balance: ~t2~'..soldi..'$') then
        end
        if WarMenu.Button('~e~Warehouse') then
            TriggerServerEvent("house:reloadwarehouseinventory", Config.Societa)
            TriggerEvent("vorp_inventory:OpenHouseInventory", "Magazzino", 1)
            WarMenu.CloseMenu('Ranch')
        end
        if WarMenu.Button('Deposit Money') then
            AddTextEntry("FMMC_MPM_TYP8", "How much would you want to deposit? :")
            DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
            while (UpdateOnscreenKeyboard() == 0) do
                DisableAllControlActions(0);
                --print("100")
                Citizen.Wait(0);
            end
            if (UpdateOnscreenKeyboard() == 1) then
            
                Amount = GetOnscreenKeyboardResult()
                if tonumber(Amount) ~= nil then
                    TriggerServerEvent('malik_contadino:depositasoldi', tonumber(Amount), soldi)
                    WarMenu.CloseMenu('Ranch')
                  
                else
                    local _source = source
                    TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
                    WarMenu.CloseMenu('Ranch')
	            	end
                end
        end
        if lavoro == Config.Boss then 
            if WarMenu.Button('Take Money') then
                AddTextEntry("FMMC_MPM_TYP8", "How much would you want to take? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
                       
	            		TriggerServerEvent('malik_contadino:ritirasoldi', tonumber(Amount), soldi)
	            		WarMenu.CloseMenu('Ranch')
                        else
                        local _source = source
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Ranch')
	            	end
                end
            end
        end
    end
    WarMenu.Display()
end
end)


Citizen.CreateThread(function()
    WarMenu.CreateMenu('Mucche', Config.Titolo)
    WarMenu.SetSubTitle('Mucche', Config.Sottotitolo)
    local _source = source
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('Mucche') then
            if WarMenu.Button('Workforce: ~pa~'..gestionemugnaio..'%') then
            end
            if WarMenu.Button('Milk produced: ~pa~'..latte..' Liters') then
            end
            if WarMenu.Button('Take Milk ~e~(-10%)') then
                AddTextEntry("FMMC_MPM_TYP8", "How much milk you want to take? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
                        
	            		TriggerServerEvent('malik_contadino:ritiralatte', tonumber(Amount))
	            		WarMenu.CloseMenu('Ranch')
                        else
                        local _source = source
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Ranch')
	            	end
                end
            end
            if WarMenu.Button('Scrape the hay ~t6~(+3%)') then
                TriggerEvent('malik_contadino:raschiafieno')
                WarMenu.CloseMenu('Mucche')
            end
          --  if WarMenu.Button('Pulisci il terreno ~t6~(+3%)') then
          --  end
        end
    end
end)

Citizen.CreateThread(function()
    WarMenu.CreateMenu('Pecore', Config.Titolo)
    WarMenu.SetSubTitle('Pecore', Config.Sottotitolo)
    local _source = source
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('Pecore') then
            if WarMenu.Button('Workforce: ~pa~'..gestionepecore..'%') then
            end
            if WarMenu.Button('Wool produced: ~pa~'..lana..' Kg') then
            end
            if WarMenu.Button('Take Wool ~e~(-10%)') then
                AddTextEntry("FMMC_MPM_TYP8", "How much wool you want to take? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
	            		TriggerServerEvent('malik_contadino:ritiralana', tonumber(Amount))
	            		WarMenu.CloseMenu('Pecore')
                        else
                        local _source = source
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Pecore')
	            	end
                end
            end
            if WarMenu.Button('Clean the ground ~t6~(+3%)') then
                TriggerEvent('malik_contadino:pulisciterra')
                WarMenu.CloseMenu('Pecore')
            end
        end
    end
end)

Citizen.CreateThread(function()
    WarMenu.CreateMenu('Galline', Config.Titolo)
    WarMenu.SetSubTitle('Galline', Config.Sottotitolo)
    local _source = source
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('Galline') then
            if WarMenu.Button('Workforce: ~pa~'..gestionegalline..'%') then
            end
            if WarMenu.Button('Eggs produced: ~pa~'..uova..'') then
            end
            if WarMenu.Button('Take Eggs ~e~(-10%)') then
                AddTextEntry("FMMC_MPM_TYP8", "How much eggs you want to take? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
	            		TriggerServerEvent('malik_contadino:ritirauova', tonumber(Amount))
	            		WarMenu.CloseMenu('Galline')
                        else
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Galline')
	            	end
                end
            end
            if WarMenu.Button('Provide Feed ~t6~(+2%/Seed)') then
                AddTextEntry("FMMC_MPM_TYP8", "How much feed you want to deposit? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
	            		TriggerServerEvent('malik_contadino:nutrigalline', tonumber(Amount))
	            		WarMenu.CloseMenu('Galline')
                        else 
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Galline')
	            	end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    WarMenu.CreateMenu('Maiali', Config.Titolo)
    WarMenu.SetSubTitle('Maiali', Config.Sottotitolo)
    local _source = source
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('Maiali') then
            if WarMenu.Button('Workforce: ~pa~'..gestionemaiali..'%') then
            end
            if WarMenu.Button('Salamella available: ~pa~'..salamelle..' Kg') then
            end
            if WarMenu.Button('Take Salamella ~e~(-10%)') then
                AddTextEntry("FMMC_MPM_TYP8", "How much salamella you want to take? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
	            		TriggerServerEvent('malik_contadino:ritirasalamelle', tonumber(Amount))
	            		WarMenu.CloseMenu('Maiali')
                        else
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Maiali')
	            	end
                end
            end
            if WarMenu.Button('Provide Feed ~t6~(+2%/Seed)') then
                AddTextEntry("FMMC_MPM_TYP8", "How much feed you want to deposit? :")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Quantity here", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Citizen.Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    Amount = GetOnscreenKeyboardResult()
                    if tonumber(Amount) ~= nil then
	            		TriggerServerEvent('malik_contadino:nutrimaiali', tonumber(Amount))
	            		WarMenu.CloseMenu('Maiali')
                        else 
	            		TriggerEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
	            		WarMenu.CloseMenu('Maiali')
	            	end
                end
            end
        end
    end
end)

RegisterNetEvent("malik_contadino:raschiafieno")
AddEventHandler("malik_contadino:raschiafieno",function()

        blip = N_0x554d9d53f696d002(1664425300, 1394.778, 300.5598, 88.21317)
        SetBlipSprite(blip, -1489164512, 1)
        SetBlipScale(blip, 0.2)
        SetBlipFlashes(blip, true)
        blip2 = N_0x554d9d53f696d002(1664425300, 1393.662, 289.965, 88.39211) 
        SetBlipSprite(blip2, -1489164512, 1)
        SetBlipScale(blip2, 0.2)
        SetBlipFlashes(blip2, true)
        blip3 = N_0x554d9d53f696d002(1664425300, 1408.729, 302.9797, 88.6188)
        SetBlipSprite(blip3, -1489164512, 1)
        SetBlipScale(blip3, 0.2)
        SetBlipFlashes(blip3, true)

    if cult == 3 then 
        cult = 0
    end

    raschiafieno = true 
end)

Citizen.CreateThread(function() -- AZIONI MUCCHE
    while true do 
    Wait(1)
    local Maliko = PlayerPedId()
    local pCoords = GetEntityCoords(Maliko)
    if raschiafieno ~= nil then
        if cult == 3 then
            TriggerServerEvent("malik_contadino:percentualem", 3)
            raschiafieno = nil
        end
    for k,v in pairs(Config.RaschiaFienoMucche) do
       if Vdist(pCoords, v.x, v.y, v.z) < 2.0 then
      if cult ~= 3 then
       Testo("~t1~Press ~e~[SPACE] ~t1~ to scrape", 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
       if IsControlJustReleased(0,Config.TastoApriMenu) then
       exports['progressBars']:startUI(16000, "Scraping the hay...")
       if Vdist(pCoords, 1394.778, 300.5598, 88.21317) < 3.0 then
       RemoveBlip(blip)
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 15000, true, false, false, false)
       raschiafieno = nil
       Citizen.Wait(23000)
       raschiafieno = true
       elseif Vdist(pCoords, 1393.662, 289.965, 88.39211) < 3.0 then
       RemoveBlip(blip2)
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 15000, true, false, false, false)
       raschiafieno = nil
       Citizen.Wait(23000)
       raschiafieno = true
       elseif Vdist(pCoords, 1408.729, 302.9797, 88.6188) < 3.0 then
       RemoveBlip(blip3)
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 15000, true, false, false, false)
       raschiafieno = nil
       Citizen.Wait(23000)
       raschiafieno = true
       end
        cult = cult+1
       end
       end
       end
    end
end
end
end)


RegisterNetEvent("malik_contadino:pulisciterra")
AddEventHandler("malik_contadino:pulisciterra",function()

        blip = N_0x554d9d53f696d002(1664425300, 1359.187, 333.761, 88.16238)
        SetBlipSprite(blip, -1489164512, 1)
        SetBlipScale(blip, 0.2)
        SetBlipFlashes(blip, true)
        blip2 = N_0x554d9d53f696d002(1664425300, 1370.394, 343.031, 88.05885) 
        SetBlipSprite(blip2, -1489164512, 1)
        SetBlipScale(blip2, 0.2)
        SetBlipFlashes(blip2, true)
        blip3 = N_0x554d9d53f696d002(1664425300, 1358.488, 320.6229, 87.79978)
        SetBlipSprite(blip3, -1489164512, 1)
        SetBlipScale(blip3, 0.2)
        SetBlipFlashes(blip3, true)

    if cult == 3 then 
        cult = 0
    end

    pulisciterra = true 
end)

Citizen.CreateThread(function()  -- AZIONI PECORE
    while true do 
    Wait(1)
    local Maliko = PlayerPedId()
    local pCoords = GetEntityCoords(Maliko)
    if pulisciterra ~= nil then
        if cult == 3 then
            TriggerServerEvent("malik_contadino:percentualep", 3)
            pulisciterra = nil
        end
    for k,v in pairs(Config.PulisciTerrenoPecore) do
       if Vdist(pCoords, v.x, v.y, v.z) < 2.0 then
      if cult ~= 3 then
       Testo("~t2~Press ~e~[SPACE] ~t2~to take care of the ground", 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
       if IsControlJustReleased(0,Config.TastoApriMenu) then
       exports['progressBars']:startUI(16000, "Taking care of the ground...")
       if Vdist(pCoords, 1359.187, 333.761, 88.16238) < 3.0 then
       RemoveBlip(blip)
       ClearPedTasksImmediately(PlayerPedId())
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SCOOP"), 3000, true, false, false, false)
       Wait(3500)
       ClearPedTasks(source)
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SPREAD"), 3000, true, false, false, false)
       Wait(11500)
       ClearPedTasksImmediately(PlayerPedId())
       pulisciterra = nil
       Citizen.Wait(3500)
       pulisciterra = true
       elseif Vdist(pCoords, 1370.394, 343.031, 88.05885) < 3.0 then
       RemoveBlip(blip2)
       ClearPedTasksImmediately(PlayerPedId())
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 15000, true, false, false, false)
        --ClearPedTasksImmediately(PlayerPedId())
       pulisciterra = nil
       Citizen.Wait(16000)
       ClearPedTasksImmediately(PlayerPedId())
       pulisciterra = true
       elseif Vdist(pCoords, 1358.488, 320.6229, 87.79978) < 3.0 then
       RemoveBlip(blip3)
       ClearPedTasksImmediately(PlayerPedId())
       TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FEED_CHICKEN"), 15000, true, false, false, false)
       pulisciterra = nil
       Citizen.Wait(16000)
       ClearPedTasksImmediately(PlayerPedId())
       pulisciterra = true
       end
        cult = cult+1
       end
       end
       end
    end
end
end
end)


RegisterNetEvent("malik_contadino:aprimucche")
AddEventHandler("malik_contadino:aprimucche", function()
    WarMenu.OpenMenu('Mucche')
end)

RegisterNetEvent("malik_contadino:apripecore")
AddEventHandler("malik_contadino:apripecore", function()
    WarMenu.OpenMenu('Pecore')
end)

RegisterNetEvent("malik_contadino:aprigalline")
AddEventHandler("malik_contadino:aprigalline", function()

    WarMenu.OpenMenu('Galline')
end)

RegisterNetEvent("malik_contadino:aprimaiali")
AddEventHandler("malik_contadino:aprimaiali", function()

    WarMenu.OpenMenu('Maiali')

end)


RegisterNetEvent("malik_contadino:prendimugnaio")
AddEventHandler("malik_contadino:prendimugnaio", function(latte2, percentualem2, percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)

    gestionemugnaio = percentualem2
    latte = latte2
    gestionepecore = percentualep2
    lana = lana2
    gestionegalline = percentualeg2
    uova = uova2
    gestionemaiali = percentualepig2
    salamelle = salamelle2

end)

RegisterNetEvent('malik_contadino:prendiserver')
AddEventHandler("malik_contadino:prendiserver", function(lavoro2, grado2, soldi2) -- Riporta le variabili server nel lato client
    local _source = source
    lavoro = lavoro2
    grado = grado2
    soldi = soldi2
    print("Your Work: "..lavoro)
   -- print("Grado: "..grado)
   if lavoro == "ranch" then
    TriggerEvent("malik_contadino:aprimenu", lavoro)
   elseif lavoro == "ranchboss" then
    TriggerEvent("malik_contadino:aprimenu", lavoro)
   end
end)

RegisterNetEvent('malik_contadino:aprimenu')
AddEventHandler("malik_contadino:aprimenu", function(lavoro) -- Apre il menù dopo aver controllato che è per davvero un contadino (Check Job)
    if lavoro == Config.Lavoro or Config.Boss then
    WarMenu.OpenMenu("Ranch")
    else
    TriggerEvent("vorp:NotifyLeft", "ALT!", "You're not a ranch worker!", "menu_textures", "cross", 3000)
    end
end)

local mucche = nil

Citizen.CreateThread(function() --MENUMUCCHE
    while true do 
        Citizen.Wait(0)
       -- print("Malik")
        local _src = source
        local Malik = PlayerPedId()
        local mPos = GetEntityCoords(Malik)
       -- print("Arrivo alla mia posizione: "..mPos.."")
            if Vdist(mPos, Config.StartMissioneMucche) < 4.5 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.StartMissioneMucche-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false) -- Fa apparire il blip per terra 
            if Vdist(mPos, Config.StartMissioneMucche-0.90) < 1.0 then
            Testo(Config.TestoBlipMucche, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            if IsControlJustReleased(0, Config.TastoApriMenu ) then -- SPAZIO 
                TriggerServerEvent("malik_contadino:checklavoro",1)
            end
            end
            end
    end
end)

Citizen.CreateThread(function()  --MENU PECORE
    while true do 
        Citizen.Wait(0)
       -- print("Malik")
        local _src = source
        local Malik = PlayerPedId()
        local mPos = GetEntityCoords(Malik)
       -- print("Arrivo alla mia posizione: "..mPos.."")
            if Vdist(mPos, Config.StartMissionePecore) < 4.5 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.StartMissionePecore-0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false) -- Fa apparire il blip per terra 
            if Vdist(mPos, Config.StartMissionePecore-0.90) < 1.0 then
            Testo(Config.TestoBlipPecore, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            if IsControlJustReleased(0, Config.TastoApriMenu ) then -- SPAZIO 
                TriggerServerEvent("malik_contadino:checklavoro", 2)
            end
            end
            end
    end
end)

Citizen.CreateThread(function()  --MENU GALLINE
    while true do 
        Citizen.Wait(0)
       -- print("Malik")
        local _src = source
        local Malik = PlayerPedId()
        local mPos = GetEntityCoords(Malik)
       -- print("Arrivo alla mia posizione: "..mPos.."")
            if Vdist(mPos, Config.StartMissioneGalline) < 4.5 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.StartMissioneGalline, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false) -- Fa apparire il blip per terra 
            if Vdist(mPos, Config.StartMissioneGalline) < 1.0 then
            Testo(Config.TestoBlipGalline, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            if IsControlJustReleased(0, Config.TastoApriMenu ) then -- SPAZIO 
                TriggerServerEvent("malik_contadino:checklavoro", 3)
            end
            end
            end
    end
end)

Citizen.CreateThread(function()  --MENU MAIALI
    while true do 
        Citizen.Wait(0)
       -- print("Malik")
        local _src = source
        local Malik = PlayerPedId()
        local mPos = GetEntityCoords(Malik)
       -- print("Arrivo alla mia posizione: "..mPos.."")
            if Vdist(mPos, Config.StartMissioneMaiali) < 4.5 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, Config.StartMissioneMaiali, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false) -- Fa apparire il blip per terra 
            if Vdist(mPos, Config.StartMissioneMaiali) < 1.0 then
            Testo(Config.TestoBlipMaiali, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            if IsControlJustReleased(0, Config.TastoApriMenu ) then -- SPAZIO 
                TriggerServerEvent("malik_contadino:checklavoro", 4)
            end
            end
            end
    end
end)

RegisterNetEvent("SpawnMucche")
AddEventHandler("SpawnMucche", function(source)
    Wait(1000)
    for k, v in pairs(Config.PosizioneMucche) do
        local Mucca = GetHashKey("A_C_Cow")
        RequestModel(Mucca)
        if HasModelLoaded(Mucca) then
            mucche = CreatePed(Mucca, v.x, v.y, v.z, 128.7692, 1, 1)
            RequestPedVisibilityTracking(mucche)
            Citizen.InvokeNative(0x283978A15512B2FE, mucche, true )  -- Creazione delle Mucche
            TaskWanderStandard(mucche, true, true)
            Wait(4000)
            print("Mucche create")
        end
    end
end)

Citizen.CreateThread(function()
    CreateObject(GetHashKey("s_bucketmilk02x"), 1407.34, 284.1254, 88.10363, true, true) 
    CreateObject(GetHashKey("p_stool02x"), 1407.34, 284.6254, 87.05363, true, false)
end)



RegisterCommand("test", function()
    
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SCOOP"), 3000, true, false, false, false)

end)

RegisterCommand("salvacoords", function()  
    TriggerEvent('cl_SendCoords')
    print("Spaghetti: Fatto")
    
    end)
    
    RegisterNetEvent('cl_SendCoords')
    AddEventHandler('cl_SendCoords', function()
    
        local ped = PlayerPedId()
        local Coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        TriggerServerEvent("SendCoords", Coords,heading)
    
    end)