local QBCore = exports['qb-core']:GetCoreObject()

-- Helper function for notifications
local function NotifyPlayer(source, message, type)
    if Config.NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', source, message, type, 3500)
    elseif Config.NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', source, "SELLING", message, 3500, type)
    elseif Config.NotifyType == 'rtx' then
        TriggerClientEvent("rtx_notify:Notify", source, "SELLING", message, 5000, type)
    end
end

RegisterNetEvent('mudbugz:server:SellReturnies', function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = tonumber(itemAmount) * itemPrice

    if Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        local moneyType = Config.BankMoney and 'bank' or 'cash'
        Player.Functions.AddMoney(moneyType, totalPrice)

        local successMessage = Lang:t('success.sold', {
            value = tonumber(itemAmount),
            value2 = QBCore.Shared.Items[itemName].label,
            value3 = totalPrice
        })
        NotifyPlayer(src, successMessage, 'success')

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    else
        local errorMessage = Lang:t('error.no_items')
        NotifyPlayer(src, errorMessage, 'error')
    end

    TriggerClientEvent('mudbugz:client:openMenu', src)
end)

QBCore.Functions.CreateCallback('mudbugz:server:getInv', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    cb(Player.PlayerData.items)
end)
