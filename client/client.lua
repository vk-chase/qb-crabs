QBCore = exports['qb-core']:GetCoreObject()

local lastSearchLocation = nil
local cooldownTime = 30000 -- 30 seconds cooldown
local lastSearchTime = 0
local digtimer = math.random(10000, 20000)

local function CreateBlip(coords, sprite, color, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    CreateBlip(Config.DigsiteVector, 396, 47, Config.DigsiteName)
    CreateBlip(Config.SellSeafoodVector, 266, 47, Config.SellBlip)
end)

local function IsLocationValid(newLocation)
    if not lastSearchLocation then return true end
    local distance = #(newLocation - lastSearchLocation)
    return distance >= 2.0 and distance <= 3.0
end

RegisterNetEvent('mudbug:client:startdiggin', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    if not QBCore.Functions.HasItem('shovel') then
        QBCore.Functions.Notify("Missing Shovel...", "error")
        return
    end

    local currentTime = GetGameTimer()
    if currentTime - lastSearchTime < cooldownTime then
        QBCore.Functions.Notify("You need to wait before searching again.", "error")
        return
    end

    if not IsLocationValid(playerCoords) then
        QBCore.Functions.Notify("Try searching a bit further away.", "error")
        return
    end

    lastSearchLocation = playerCoords
    lastSearchTime = currentTime
    PropBucket()
end)

Citizen.CreateThread(function()
    exports['qb-target']:AddCircleZone("mudbugger", vector3(-2328.42, 2764.66, 4.16), 40.0, {
        name = "mudbugger",
        debugPoly = Config.debugPoly,
        minZ = 4 - 3,
        maxZ = 9 + 1,
    }, {
        options = {
            {
                type = "client",
                event = "mudbug:client:startdiggin",
                icon = "fas fa-crosshairs",
                label = "Dig Here",
            },
        },
        distance = 2.0
    })
end)

RegisterNetEvent('mudbug:client:payoutShrimp', function()
    TriggerServerEvent('mudbug:server:paymentsale1')
end)

RegisterNetEvent('mudbug:client:payoutCrab', function()
    TriggerServerEvent('mudbug:server:paymentsale2')
end)

function PropBucket()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local forward = GetEntityForwardVector(ped)
    local x, y, z = table.unpack(pos + forward * 1.0)
    local model = `prop_bucket_02a`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)
    LocalPlayer.state:set("inv_busy", true, true)
    TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
    Wait(500)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    TriggerEvent('mudbug:client:newroute')
    PropBucket2()
    Wait(digtimer + 700)
    TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
    Wait(1000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    DeleteEntity(obj)
    Wait(1000)
end

function PropBucket2()
    Wait(1500)
    TriggerEvent('animations:client:EmoteCommandStart', {"dig"})
    QBCore.Functions.Progressbar('search', 'Checking the Mud...', digtimer, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        if math.random(1, 100) >= 50 then
            TriggerServerEvent('mudbug:server:getreward')
            animationdist1()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        else
            QBCore.Functions.Notify('Couldn\'t Find Anything, Try again or check another spot!', 'error', 7500)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 7500)
    end)
end

function animationdist1()
    local ped = PlayerPedId()
    local animDict = "mini@tennis"
    local animName = "forehand_ts_md_far"
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(100)
    end
    TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 0, 0, 0, 48, 0)
    Wait(2000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    if math.random(1, 100) < 50 then
        TriggerServerEvent('hud:server:RelieveStress', 5)
    end
    RemoveAnimDict(animDict)
end
