VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem("notepad", function(data)
	TriggerClientEvent('lto_notepad:open', data.source)
end)

-- RegisterServerEvent("syn_pinboard:set_link")
-- AddEventHandler("syn_pinboard:set_link", function(title,poster_link,city)
--     local _source = source
--     if poster_link ~= nil then 
--         local Character = VorpCore.getUser(source).getUsedCharacter
--         local charidentifier = Character.charIdentifier
--         Discord(Config.webhook,title,poster_link, 3447003,city)
--         local parameters = { ['title'] = title,  ['poster_link'] = poster_link, ['city'] = city, ['charidentifier'] = charidentifier}
--         exports.ghmattimysql:execute("INSERT INTO posters ( `title`, `poster_link`, `city`, `charidentifier`) VALUES ( @title, @poster_link, @city, @charidentifier)", parameters)
--     end
-- end)