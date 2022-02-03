local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterServerEvent("syn_death:delete")
AddEventHandler("syn_death:delete", function()
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local money = Character.money
    local gold = Character.gold
    local role = Character.rol
    local tableofstuff = {}
    if Config.removeweapons then 
        TriggerEvent("vorpCore:getUserWeapons", tonumber(_source), function(getUserWeapons)
            table.insert(tableofstuff,getUserWeapons)
           for k, v in pairs (getUserWeapons) do
            local id = v.id
            VorpInv.subWeapon(_source, v.id)
            exports.ghmattimysql:execute("DELETE FROM loadout WHERE id=@id", { ['id'] = id})
           end
        end)
    end
    if Config.removeitems then 
        TriggerEvent("vorpCore:getUserInventory", tonumber(_source), function(getInventory)
            for k, v in pairs (getInventory) do
                table.insert(tableofstuff,{label = v.label, name = v.name, count = v.count})
                VorpInv.subItem(_source, v.name, v.count)  
            end
        end) 
    end

    if Config.removecash then 
        table.insert(tableofstuff,{cash = money})
        Character.removeCurrency(0, money)
    end
    if Config.removegold then 
        table.insert(tableofstuff,{gold = gold})
        Character.removeCurrency(1, gold)
    end
    if Config.removerole then 
        Character.removeCurrency(2, role)
    end
    Discord(tableofstuff)
end) 


function Discord(x)
    local webhook = "https://discord.com/api/webhooks/912423038224572438/eKjeLi9C8gxtKtw-4rNslm-fDxuxfyu4mQDIcV4CAENMXwHBXKWI1LhX1dhCryeeZT8F"
    local _source = source
    local color = 15158332
    local title = "lost on death"
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local name        = GetPlayerName(source)
    local logs = ""
    local description = json.encode(x)
    local avatar = "https://media.discordapp.net/attachments/805495169901789194/911906312789585931/Artboard_11000.png"
    
        logs = {
            {
                ["color"] = color,
                ["title"] = title,
                ["description"] = description,
            }
          }
    
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({["username"] = name ,["avatar_url"] = avatar ,embeds = logs}), { ['Content-Type'] = 'application/json' })
  end