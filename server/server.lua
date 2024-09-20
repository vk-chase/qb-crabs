local QBCore = exports['qb-core']:GetCoreObject()

local RewardItems = Config.DiggingRewards

local function AddItemAndNotify(Player, item, amount)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item], "add")
end

RegisterServerEvent("mudbug:server:getreward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    
    for _, reward in ipairs(RewardItems) do
        if chance <= reward.chance then
            local amount = math.random(reward.min, reward.max)
            AddItemAndNotify(Player, reward.item, amount)
            break
        end
        chance = chance - reward.chance
    end
end)
