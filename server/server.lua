QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("mudbug:server:getreward", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local chancex = math.random(1,100)
    if chancex < 50 then
			Player.Functions.AddItem("crabs", math.random(1,2))
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["crabs"], "add")
    elseif chancex > 51 then
		Player.Functions.AddItem("shrimp", math.random(1,2))
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimp"], "add")
	end
end)

QBCore.Functions.CreateCallback('mudbug:server:crabsprocessed', function (source, cb)
	local src = source
	local Player  = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem('crabs', Config.CrabPerBox) then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["crabs"], "remove")
			Wait(1000)
		Player.Functions.AddItem('crayfish', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["crayfish"], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, "You need "..Config.CrabPerBox.." crabs to process", 'error')
    end
	cb(false)
end)

QBCore.Functions.CreateCallback('mudbug:server:shrimpprocessed', function (source, cb)
	local src = source
	local Player  = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem('shrimp', Config.ShrimpPerBox) then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimp"], "remove")
			Wait(1000)
		Player.Functions.AddItem('shrimpbox', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimpbox"], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, "You need "..Config.ShrimpPerBox.." shrimp to process", 'error')
	end
	cb(true)
end)

RegisterNetEvent('mudbug:server:paymentsale1', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = Config.ProcessedShrimpPayout
	if Player.Functions.RemoveItem('shrimpbox', Config.ShrimBoxRequired) then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimpbox"], "remove")
		Player.Functions.AddMoney('cash', amount)
	else
		TriggerClientEvent('QBCore:Notify', src, "You need "..Config.ShrimBoxRequired.." Shrimp Boxes", 'error')
	end
end)

RegisterNetEvent('mudbug:server:paymentsale2', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = Config.CrawFishPayout
	if Player.Functions.RemoveItem('crayfish', Config.CrawfishRequired) then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimpbox"], "remove")
		Player.Functions.AddMoney(Config.PayType, amount)
	else
		TriggerClientEvent('QBCore:Notify', src, "You will need "..Config.CrawfishRequired.." Crawfish", 'error')
	end
end)
