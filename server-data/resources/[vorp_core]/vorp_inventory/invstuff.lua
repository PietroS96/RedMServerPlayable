VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("vorpinventory:check_slots")
AddEventHandler("vorpinventory:check_slots", function()
    local _source = tonumber(source)
    local eq = VorpInv.getUserInventory(source)
    local test = eq
    local slot_check = 0
    for i = 1, #test do
        slot_check = slot_check + test[i].count
    end
    local stufftosend = tonumber(slot_check)
    local part2 = 50 -- max carry limit
    TriggerClientEvent("syn:getnuistuff", _source, stufftosend,part2)
end)