

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterServerEvent("syn_trash:cleanout")
AddEventHandler("syn_trash:cleanout", function()
    local items = json.encode({})
    local name = "trash"
    exports["ghmattimysql"]:execute("UPDATE container SET items = @items WHERE name = @name",{["@items"] = items, ["@name"] = name})

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
       TriggerEvent("syn_trash:cleanout")
       Wait(Config.timer)
    end
end)