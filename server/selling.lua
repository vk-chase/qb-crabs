local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mudbugz:server:SellReturnies', function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * itemPrice)
    if tonumber(itemAmount) == 1 and Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPrice)
            TriggerClientEvent('mudbugz:client:openMenu',src)
        else
            Player.Functions.AddMoney('cash', totalPrice)
            TriggerClientEvent('mudbugz:client:openMenu',src)
        end
        TriggerClientEvent("rtx_notify:Notify", source, "Pawn", Lang:t('success.sold', { value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPrice }), 5000, "info")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    elseif Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPrice)
            Wait(200)
            TriggerClientEvent('mudbugz:client:openMenu',src)
        else
            Player.Functions.AddMoney('cash', totalPrice)
            Wait(200)
            TriggerClientEvent('mudbugz:client:openMenu',src)
        end
        TriggerClientEvent("rtx_notify:Notify", source, "Pawn", Lang:t('success.sold', { value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPrice }), 5000, "info")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    else
        TriggerClientEvent("rtx_notify:Notify", source, "Pawn", Lang:t('error.no_items'), 5000, "info")
    end
    TriggerClientEvent('mudbugz:client:openMenu', src)
end)

QBCore.Functions.CreateCallback('mudbugz:server:getInv', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local inventory = Player.PlayerData.items
    return cb(inventory)
end)
