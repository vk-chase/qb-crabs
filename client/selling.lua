local QBCore = exports['qb-core']:GetCoreObject()

-- Create return shop locations
CreateThread(function()
    for key, value in pairs(Config.SellReturnLocation) do
        exports['qb-target']:AddBoxZone('ReturnShopx'..key, value.coords, value.length, value.width, {
            name = 'ReturnShopx'..key,
            heading = value.heading,
            minZ = value.minZ,
            maxZ = value.maxZ,
            debugPoly = value.debugPoly,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'mudbugz:client:openMenu',
                    icon = 'fas fa-ring',
                    label = 'Return Shop',
                },
            },
            distance = value.distance
        })
    end
end)

-- Helper function for notifications
local function Notify(message, type)
    if Config.NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, 5000)
    elseif Config.NotifyType == 'okok' then
        exports['okokNotify']:Alert("Mudbuggin", message, 3500, type)
    elseif Config.NotifyType == 'rtx' then
        TriggerEvent("rtx_notify:Notify", "Mudbuggin", message, 5000, type)
    end
end

-- Open main menu
RegisterNetEvent('mudbugz:client:openMenu', function()
    if Config.UseTimes and (GetClockHours() < Config.TimeOpen or GetClockHours() > Config.TimeClosed) then
        Notify(Lang:t('info.return_closed', { value = Config.TimeOpen, value2 = Config.TimeClosed }), "error")
        return
    end

    local returnShop = {
        {
            header = Lang:t('info.title'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('info.sell'),
            txt = Lang:t('info.sell_return'),
            params = {
                event = 'mudbugz:client:openReturn',
                args = {
                    items = Config.ReturnItems
                }
            }
        }
    }
    exports['qb-menu']:openMenu(returnShop)
end)

-- Open return items menu
RegisterNetEvent('mudbugz:client:openReturn', function(data)
    QBCore.Functions.TriggerCallback('mudbugz:server:getInv', function(inventory)
        local returnMenu = {
            {
                header = Lang:t('info.title'),
                isMenuHeader = true,
            }
        }
        for _, v in pairs(inventory) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    returnMenu[#returnMenu + 1] = {
                        header = QBCore.Shared.Items[v.name].label,
                        txt = Lang:t('info.sell_items', { value = data.items[i].price }),
                        params = {
                            event = 'mudbugz:client:returnitems',
                            args = {
                                label = QBCore.Shared.Items[v.name].label,
                                price = data.items[i].price,
                                name = v.name,
                                amount = v.amount
                            }
                        }
                    }
                end
            end
        end
        returnMenu[#returnMenu + 1] = {
            header = Lang:t('info.back'),
            params = {
                event = 'mudbugz:client:openMenu'
            }
        }
        exports['qb-menu']:openMenu(returnMenu)
    end)
end)

-- Handle item return
RegisterNetEvent('mudbugz:client:returnitems', function(item)
    local sellingItem = exports['qb-input']:ShowInput({
        header = Lang:t('info.title'),
        submitText = Lang:t('info.sell'),
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = Lang:t('info.max', { value = item.amount })
            }
        }
    })
    if sellingItem and sellingItem.amount then
        local amount = tonumber(sellingItem.amount)
        if amount and amount > 0 then
            TriggerServerEvent('mudbugz:server:SellReturnies', item.name, amount, item.price)
        else
            Notify(Lang:t('error.negative'), "error")
        end
    end
end)
