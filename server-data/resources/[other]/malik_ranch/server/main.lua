local VorpCore = {}
local percentualem2 = nil
local latte2 = nil
local percentualep2 = nil
local lana2 = nil
local menuattivita2 = nil
local percentualeg2 = nil
local uova2 = nil
local percentualepig2 = nil
local salamelle2 = nil

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterServerEvent("vorp_housing:MoveToHouse")
RegisterServerEvent("vorp_housing:TakeFromHouse")
RegisterServerEvent("house:reloadHouseInventory")


RegisterServerEvent("malik_contadino:depositasoldi")
AddEventHandler("malik_contadino:depositasoldi", function(denaro, denaroattuale)

	print('Deposita')
	local _src = source
	local User = VorpCore.getUser(_src)
	local Character = User.getUsedCharacter
	local soldi = Character.money
	local soldi2 = soldi
	local soldi3 = denaroattuale+denaro

	if soldi2 >= denaro then
		
		exports.ghmattimysql:execute("UPDATE societa SET soldi = @soldi3 WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa, ["@soldi3"] = soldi3})
		Character.setMoney(soldi-denaro)

	else

		TriggerClientEvent("vorp:TipBottom", _src, "Non hai abbastanza soldi!", 2000)

	end

end)

RegisterServerEvent("malik_contadino:ritirasoldi")
AddEventHandler("malik_contadino:ritirasoldi", function(denaro, denaroattuale)
	print("Ritira")
	local _src = source
	local User = VorpCore.getUser(_src)
	local Character = User.getUsedCharacter
	local soldi = Character.money
	local soldi2 = soldi
	local soldi3 = denaroattuale-denaro
	if denaro <= denaroattuale then
	Character.setMoney(soldi2+denaro)
	exports.ghmattimysql:execute("UPDATE societa SET soldi = @soldi3 WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa, ["@soldi3"] = soldi3})
	--TriggerClientEvent("malik_contadino:aprimenu", _src)
	else end
end)

Citizen.CreateThread(function()  -- QUESTO THREAD GESTISCE LE PERCENTUALI 

	while true do
		Wait(120000)
		if menuattivita ~= nil then
		if percentualem2 >= 3 then
			latte2 = latte2+1
			percentualem2 = percentualem2-3
		elseif percentualem2 < 3 and latte2 <= 1 then
			latte2 = 0
			percentualem2 = 0
		elseif percentualem2 < 3 and latte2 > 0 then
			latte2 = latte2-2
			percentualem2 = 0
		elseif latte2 == 100 then
			percentualem2 = percentualem2-3
		end

		if percentualep2 >= 3 then
			lana2 = latte2+1
			percentualep2 = percentualep2-3
		elseif percentualep2 < 3 and lana2 <= 1 then
			lana2 = 0
			percentualep2 = 0
		elseif percentualep2 < 3 and lana2 > 0 then
			lana2 = lana2-2
			percentualep2 = 0
		elseif lana2 == 100 then
			percentualep2 = percentualep2-3
		end

		if percentualeg2 >= 3 then
			uova2 = uova2+1
			percentualeg2 = percentualeg2-3
		elseif percentualeg2 < 3 and uova2 <= 1 then
			uova2 = 0
			percentualeg2 = 0
		elseif percentualeg2 < 3 and uova2 > 0 then
			uova2 = uova2-2
			percentualeg2 = 0
		elseif uova2 == 100 then
			percentualeg2 = percentualeg2-3
		end

		if percentualepig2 >= 3 then
			salamelle2 = salamelle2+1
			percentualepig2 = percentualepig2-3
		elseif percentualepig2 < 3 and salamelle2 <= 1 then
			salamelle2 = 0
			percentualepig2 = 0
		elseif percentualepig2 < 3 and salamelle2 > 0 then
			salamelle2 = salamelle2-2
			percentualepig2 = 0
		elseif salamelle2 == 100 then
			percentualepig2 = percentualepig2-3
		end

		exports.ghmattimysql:execute("UPDATE societa SET percentualem = @percentualem, latte = @latte WHERE nomesocieta = @nomesocieta", {["@percentualem"] = percentualem2, ["@latte"] = latte2, ["@nomesocieta"] = Config.Societa})
		if Config.MostraLogs == true then
		print("^1Miller Management - MalikTM Ranch")
		print("^3Current Percentage:^1 "..percentualem2)
		print("^3Milk Liters: ^1"..latte2)
		print("^3-----------------------------------------")
		end
		exports.ghmattimysql:execute("UPDATE societa SET percentualep = @percentualep, lana = @lana WHERE nomesocieta = @nomesocieta", {["@percentualep"] = percentualep2, ["@lana"] = lana2, ["@nomesocieta"] = Config.Societa})
		if Config.MostraLogs == true then
		print("^1Sheep Management - MalikTM Ranch")
		print("^3Current Percentage: ^1"..percentualep2)
		print("^3Wool Kg: ^1"..lana2)
		print("^3-----------------------------------------")
		end
		exports.ghmattimysql:execute("UPDATE societa SET percentualeg = @percentualeg, uova = @uova WHERE nomesocieta = @nomesocieta", {["@percentualeg"] = percentualeg2, ["@uova"] = uova2, ["@nomesocieta"] = Config.Societa})
		if Config.MostraLogs == true then
		print("^1Hens Management - MalikTM Ranch")
		print("^3Current Percentage: ^1"..percentualeg2)
		print("^3Eggs: ^1"..uova2)
		print("^3-----------------------------------------")
		end
		exports.ghmattimysql:execute("UPDATE societa SET percentualepig = @percentualepig, salamelle = @salamelle WHERE nomesocieta = @nomesocieta", {["@percentualepig"] = percentualepig2, ["@salamelle"] = salamelle2, ["@nomesocieta"] = Config.Societa})
		if Config.MostraLogs == true then
		print("^1Pigs Management - MalikTM Ranch")
		print("^3Current Percentage: ^1"..percentualepig2)
		print("^3Salamella Kg: ^1"..salamelle2)
		print("^3-----------------------------------------")
		end
	end
	end
end)

RegisterServerEvent("malik_contadino:checklavoro")  -- FA UN CHECK DEL LAVORO E PRENDE TUTTE LE INFO DAL DATABASE
AddEventHandler("malik_contadino:checklavoro", function(menuattivita2)

	local _source = source
    local User = VorpCore.getUser(_source)
    local Character = User.getUsedCharacter
	local lavoro = Character.job -- Take his job
	local lavoro2 = lavoro
	local grado = Character.jobGrade -- Take his grade
	local grado2 = grado
	menuattivita = menuattivita2

        exports.ghmattimysql:execute("SELECT * FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
		
            if result[1] ~= nil then
				local soldi = result[1].soldi
				local soldi2 = soldi
				local percentualem = result[1].percentualem
				percentualem2 = percentualem
				local latte = result[1].latte
				latte2 = latte
				local percentualep = result[1].percentualep
				percentualep2 = percentualep
				local lana = result[1].lana
				lana2 = lana
				local percentualeg = result[1].percentualeg
				percentualeg2 = percentualeg
				local uova = result[1].uova
				uova2 = uova
				local percentualepig = result[1].percentualepig
				percentualepig2 = percentualepig
				local salamelle = result[1].salamelle
				salamelle2 = salamelle

				if menuattivita == 1 then
					if lavoro2 == "ranch" then
					TriggerClientEvent("malik_contadino:aprimucche", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					elseif lavoro2 == "ranchboss" then
					TriggerClientEvent("malik_contadino:aprimucche", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					end
				elseif menuattivita == 2 then
					if lavoro2 == "ranch" then
					TriggerClientEvent("malik_contadino:apripecore", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					elseif lavoro2 == "ranchboss" then
					TriggerClientEvent("malik_contadino:apripecore", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					end
				elseif menuattivita == 3 then
					if lavoro2 == "ranch" then
					TriggerClientEvent("malik_contadino:aprigalline", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					elseif lavoro2 == "ranchboss" then
					TriggerClientEvent("malik_contadino:aprigalline", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					end
				elseif menuattivita == 4 then
					if lavoro2 == "ranch" then
					TriggerClientEvent("malik_contadino:aprimaiali", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					elseif lavoro2 == "ranchboss" then
					TriggerClientEvent("malik_contadino:aprimaiali", _source)
					TriggerClientEvent("malik_contadino:prendimugnaio", _source, latte2, percentualem2,percentualep2, lana2, percentualeg2, uova2, percentualepig2, salamelle2)
					end
				end
				if menuattivita == nil then
					print("Tutto Nil")
				TriggerClientEvent("malik_contadino:prendiserver", _source, lavoro2, grado2, soldi2, latte2, percentualem2, percentualeg2, uova2)
				end
			end
		end)

end)

RegisterServerEvent("malik_contadino:percentualem")
AddEventHandler("malik_contadino:percentualem", function(qt)
	local _source = source

	exports.ghmattimysql:execute("SELECT percentualem FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
		if result[1] ~= nil then
			local percentualem = result[1].percentualem
			local nuovapercentualem = percentualem + qt
			if nuovapercentualem > 100 then
				nuovapercentualem = 100 
			end
			print("Database Aggiornato (?)")
			exports.ghmattimysql:execute("UPDATE societa SET percentualem = @percentualem WHERE nomesocieta = @nomesocieta", {["@percentualem"] = nuovapercentualem, ["@nomesocieta"] = Config.Societa})
		end
		TriggerClientEvent("vorp:TipBottom", _source, "You obtained +3% of workforce.!", 2000)
	end)
end)

RegisterServerEvent("malik_contadino:percentualep")
AddEventHandler("malik_contadino:percentualep", function(qt)
	local _source = source

	exports.ghmattimysql:execute("SELECT percentualep FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
		if result[1] ~= nil then
			local percentualep = result[1].percentualep
			local nuovapercentualep = percentualep + qt
			if nuovapercentualep > 100 then
				nuovapercentualep = 100 
			end
			print("Database Aggiornato (?)")
			exports.ghmattimysql:execute("UPDATE societa SET percentualep = @percentualep WHERE nomesocieta = @nomesocieta", {["@percentualep"] = nuovapercentualep, ["@nomesocieta"] = Config.Societa})
		end
		TriggerClientEvent("vorp:TipBottom", _source, "You obtained +3% of workforce.!", 2000)
	end)
end)

RegisterServerEvent("malik_contadino:nutrigalline")
AddEventHandler("malik_contadino:nutrigalline", function(qt)

	local _source = source
	local nuovaqt = qt*2
	local checkitem = VorpInv.getItemCount(_source, Config.SemeGalline)
	if checkitem >= qt then
	exports.ghmattimysql:execute("SELECT percentualeg FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
		if result[1] ~= nil then
			local percentualeg = result[1].percentualeg
			local nuovaqt2 = percentualeg
			local nuovaqt3 = nuovaqt+nuovaqt2
			if nuovaqt3 >= 100 then
				nuovaqt3 = 100
			end
			exports.ghmattimysql:execute("UPDATE societa SET percentualeg = @nuovaqt3 WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa, ["@nuovaqt3"] = nuovaqt3})
		end
		VorpInv.subItem(_source, Config.SemeGalline, qt)
	end)
	else
		TriggerClientEvent("vorp:TipBottom", _source, "You don't have enough seeds!", 2000)
	end

end)


RegisterServerEvent("malik_contadino:nutrimaiali")
AddEventHandler("malik_contadino:nutrimaiali", function(qt)

	local _source = source
	local nuovaqt = qt*2
	local checkitem = VorpInv.getItemCount(_source, Config.SemeMaiali)
	if checkitem >= qt then
	exports.ghmattimysql:execute("SELECT percentualepig FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
		if result[1] ~= nil then
			local percentualepig = result[1].percentualepig
			local nuovaqt2 = percentualepig
			local nuovaqt3 = nuovaqt+nuovaqt2
			if nuovaqt3 >= 100 then
				nuovaqt3 = 100
			end
			exports.ghmattimysql:execute("UPDATE societa SET percentualepig = @nuovaqt3 WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa, ["@nuovaqt3"] = nuovaqt3})
		end
		VorpInv.subItem(_source, Config.SemeMaiali, qt)
	end)
	else
		TriggerClientEvent("vorp:TipBottom", _source, "You don't have enough seeds!", 2000)
	end

end)


RegisterServerEvent("malik_contadino:ritiralatte")
AddEventHandler("malik_contadino:ritiralatte", function(qt)
	local _source = source

	exports.ghmattimysql:execute("SELECT latte FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
	if result[1] ~= nil then
		local lattee = result[1].latte
		local latte3 = lattee-qt
		if latte3 <= 0 then
			latte3 = 0
		end
		percentualem2 = percentualem2-10
		if percentualem2 <= 0 then percentualem2 = 0 end
		if qt <= lattee then
		exports.ghmattimysql:execute("UPDATE societa SET latte = @latte3, percentualem = @percentualem2 WHERE nomesocieta = @nomesocieta", {["@latte3"] = latte3, ["@percentualem2"] = percentualem2, ["@nomesocieta"] = Config.Societa})
		VorpInv.addItem(_source, "latte", qt)
		TriggerClientEvent("vorp:TipBottom", _source, "You take "..qt.." liters of milk", 2000)
		else
			TriggerClientEvent("vorp:TipBottom", _source, "No milk enough", 2000)
		end
	end
end)
end)

RegisterServerEvent("malik_contadino:ritiralana")
AddEventHandler("malik_contadino:ritiralana", function(qt)
	local _source = source

	exports.ghmattimysql:execute("SELECT lana FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
	if result[1] ~= nil then
		local lanaa = result[1].lana
		local lana3 = lanaa-qt
		if lana3 <= 0 then
			lana3 = 0
		end
		percentualep2 = percentualep2-10
		if percentualep2 <= 0 then percentualep2 = 0 end
		if qt <= lanaa then
		exports.ghmattimysql:execute("UPDATE societa SET lana = @lana3, percentualem = @percentualem2 WHERE nomesocieta = @nomesocieta", {["@lana3"] = lana3, ["@percentualep2"] = percentualep2, ["@nomesocieta"] = Config.Societa})
		VorpInv.addItem(_source, "lana", qt)
		TriggerClientEvent("vorp:TipBottom", _source, "You take "..qt.." KG of Wool", 2000)
		else
			TriggerClientEvent("vorp:TipBottom", _source, "No wool enough", 2000)
		end
	end
end)
end)

RegisterServerEvent("malik_contadino:ritirauova")
AddEventHandler("malik_contadino:ritirauova", function(qt)
	local _source = source

	exports.ghmattimysql:execute("SELECT uova FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
	if result[1] ~= nil then
		local uovaa = result[1].uova
		local uova3 = uovaa-qt
		if uova3 <= 0 then
			uova3 = 0
		end
		percentualeg2 = percentualeg2-10
		if percentualeg2 <= 0 then percentualeg2 = 0 end
		if qt <= uovaa then
		exports.ghmattimysql:execute("UPDATE societa SET uova = @uova3, percentualeg = @percentualeg2 WHERE nomesocieta = @nomesocieta", {["@uova3"] = uova3, ["@percentualeg2"] = percentualeg2, ["@nomesocieta"] = Config.Societa})
		VorpInv.addItem(_source, "uova", qt)
		TriggerClientEvent("vorp:TipBottom", _source, "You take "..qt.." Eggs", 2000)
		else
			TriggerClientEvent("vorp:TipBottom", _source, "No eggs enough", 2000)
		end
	end
end)
end)

RegisterServerEvent("malik_contadino:ritirasalamelle")
AddEventHandler("malik_contadino:ritirasalamelle", function(qt)
	local _source = source

	exports.ghmattimysql:execute("SELECT salamelle FROM societa WHERE nomesocieta = @nomesocieta", {["@nomesocieta"] = Config.Societa}, function(result)
	if result[1] ~= nil then
		local salamellee = result[1].salamelle
		local salamelle3 = salamellee-qt
		if salamelle3 <= 0 then
			salamelle3 = 0
		end
		percentualepig2 = percentualepig2-10
		if percentualepig2 <= 0 then percentualepig2 = 0 end
		if qt <= salamellee then
		exports.ghmattimysql:execute("UPDATE societa SET salamelle = @salamelle3, percentualepig = @percentualepig2 WHERE nomesocieta = @nomesocieta", {["@salamelle3"] = salamelle3, ["@percentualepig2"] = percentualepig2, ["@nomesocieta"] = Config.Societa})
		VorpInv.addItem(_source, "salamelle", qt)
		TriggerClientEvent("vorp:TipBottom", _source, "You take "..qt.." KG of Salamella", 2000)
		else
			TriggerClientEvent("vorp:TipBottom", _source, "No salamella enough!", 2000)
		end
	end
end)
end)

AddEventHandler("vorp_housing:MoveToHouse", function(jsonData)
    local _source = source
	local data = json.decode(jsonData)
	local houseId = data["house"]
	local item = data["item"]
	local itemCount = tonumber(data["number"])
	local itemType = data["type"]
	if itemType ~= "item_standard" then
		TriggerClientEvent("vorp:TipBottom", _source, "You can only deposit items!", 2000)
		return
	end

	
	if item.count < itemCount then
		TriggerClientEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
		return
	end	
	exports["ghmattimysql"]:execute("SELECT items FROM societa WHERE id = @id", { ["@id"] = 1 }, function(result)
        if result[1] ~= nil then
            local items = {}

            local inv = json.decode(result[1]["items"])
			local foundItem = nil
            for k,v in pairs(inv) do 
				if v.name == item.name then
					foundItem = v
				end
			end
			
			if foundItem then
				foundItem.count = foundItem.count + itemCount
			else
				foundItem = {name = item.name, count = itemCount, label = item.label, type = item.type, limit = item.limit }
				table.insert(inv, foundItem)
			end
			items["itemList"] = inv
            items["action"] = "setSecondInventoryItems"
			VorpInv.subItem(_source, item.name, itemCount)
			TriggerClientEvent("vorp_inventory:ReloadHouseInventory", _source, json.encode(items))
			exports["ghmattimysql"]:execute("UPDATE societa SET items = @inv WHERE id = @id",{["@inv"] = json.encode(inv), ["@id"] = 1})			
        end
    end)	
end)

AddEventHandler("vorp_housing:TakeFromHouse", function(jsonData)
    local _source = source
	local data = json.decode(jsonData)
	local houseId = data["house"]
	local item = data["item"]
	local itemCount = tonumber(data["number"])
	local itemType = data["type"]
	if itemType ~= "item_standard" then
		TriggerClientEvent("vorp:TipBottom", _source, "You can only deposit items!", 2000)
		return
	end

	if item.count < itemCount then
		TriggerClientEvent("vorp:TipBottom", _source, "Invalid quantity!", 2000)
		return
	end

	local count = VorpInv.getItemCount(_source, item.name)
	
	if (count + itemCount) > item.limit then
		TriggerClientEvent("vorp:TipBottom", _source, "You reached the limit for this item!", 2000)
		return
	end
	
	TriggerEvent("vorpCore:canCarryItems", tonumber(_source), itemCount, function(canCarry)
		if canCarry then
			exports["ghmattimysql"]:execute("SELECT items FROM societa WHERE id = @id", { ["@id"] = 1 }, function(result)
				if result[1] ~= nil then
					local items = {}

					local inv = json.decode(result[1]["items"])
					local foundItem, foundIndex = nil, nil
					for k,v in pairs(inv) do 
						if v.name == item.name then
							foundItem = v
						end
					end
				--	TriggerClientEvent("vorp:TipBottom", _source, "Okkk!", 2000)
					if foundItem then
						foundItem.count = foundItem.count - itemCount
						--[[ if foundItem.count == 0 then
							table.remove(inv, foundIndex)
						end --]]
						items["itemList"] = inv
						items["action"] = "setSecondInventoryItems"
						VorpInv.addItem(_source, item.name, itemCount)
						TriggerClientEvent("vorp_inventory:ReloadHouseInventory", _source, json.encode(items))
						exports["ghmattimysql"]:execute("UPDATE societa SET items = @inv WHERE id = @id",{["@inv"] = json.encode(inv), ["@id"] = 1})
					else
						print("Errore script casa, item preso ma non presente nel database?")
					end		
				end
			end)
		else
			TriggerClientEvent("vorp:TipBottom", _source, "Non puoi trasportare altri oggetti!", 2000)
		end
	end)
end)

AddEventHandler("house:reloadHouseInventory", function(houseId)
    local _source = source
	exports["ghmattimysql"]:execute("SELECT items FROM societa WHERE id = @id", { ["@id"] = 1 }, function(result)
		if result[1] ~= nil then
            local items = {}
            local inv = json.decode(result[1]["items"])
            if not inv then
                items["itemList"] = {}
                items["action"] = "setSecondInventoryItems"
				TriggerClientEvent("vorp_inventory:ReloadHouseInventory", _source, json.encode(items))
			else 
                items["itemList"] = inv
                items["action"] = "setSecondInventoryItems"
                TriggerClientEvent("vorp_inventory:ReloadHouseInventory", _source, json.encode(items));
            end
        end
    end)
end)

RegisterNetEvent("SendCoords")
AddEventHandler("SendCoords", function(coords,heading)
	print("^3[#] Coords: ^1" ..coords.. " ^3[#] Heading = ^1" ..heading)
end)