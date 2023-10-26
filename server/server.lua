local QBCore = exports['qb-core']:GetCoreObject()
--################## DIGGING ##################
RegisterServerEvent("mudbug:server:getreward", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local chancex = math.random(1,100)
    if chancex < 40 then
			Player.Functions.AddItem("crayfish", math.random(1,8))
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimp"], "add")
	end
    if chancex >= 21 or chancex <= 40 then
		Player.Functions.AddItem("shrimp", math.random(1,2))
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["shrimp"], "add")
	end
	if chancex <= 20 then
		Player.Functions.AddItem("crabs", math.random(1,2))
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["crabs"], "add")
	end
end)
