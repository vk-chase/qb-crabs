QBCore = exports['qb-core']:GetCoreObject()
local locations = {}
local digtimer = math.random(10000,20000)
local spawned = false

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.DigsiteVector)
    SetBlipSprite(blip, 396)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 47) 
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.DigsiteName)
    EndTextCommandSetBlipName(blip)
end)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.SellSeafoodVector)
    SetBlipSprite(blip, 266)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 47) 
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.SellBlip)
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('mudbug:client:startdiggin', function()
	local HasItem1 = QBCore.Functions.HasItem('shovel')
	if not HasItem1 then
        QBCore.Functions.Notify("Missing Shovel...", "error")
        return
    else
		PropBucket()
	end
end)
Citizen.CreateThread(function() exports['qb-target']:AddCircleZone("mudbugger", vector3(-2328.42, 2764.66, 4.16), 40.0, { name="mudbugger", debugPoly= Config.debugPoly, minZ = 4-3, maxZ = 9+1, }, { options = { { type = "client", event = "mudbug:client:startdiggin", icon = "fas fa-crosshairs", label = "Dig Here", }, },  distance = 2.0 }) end)
RegisterNetEvent('mudbug:client:payoutShrimp', function()
	TriggerServerEvent('mudbug:server:paymentsale1')
end)
RegisterNetEvent('mudbug:client:payoutCrab', function()
	TriggerServerEvent('mudbug:server:paymentsale2')
end)
--##--
function PropBucket()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local forward   = GetEntityForwardVector(ped)
    local x, y, z   = table.unpack(pos + forward * 1.0)
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
		Wait(digtimer+700)
	TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
	Wait(1000)
	TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	DeleteEntity(obj)
	Wait(1000)
end
function PropBucket2()
	Wait(1500)
	TriggerEvent('animations:client:EmoteCommandStart', {"dig"})
	QBCore.Functions.Progressbar('search', 'Checking the Mud...', digtimer, false, true, { -- Name | Label | Time | useWhileDead | canCancel
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		if math.random(1,100) >= 50 then
			TriggerServerEvent('mudbug:server:getreward')
			animationdist1()
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		else
			QBCore.Functions.Notify('Couldnt Find Anything, Try again or check another spot!', 'error', 7500)
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
