QBCore = exports['qb-core']:GetCoreObject()
local locations = {}
local digtimer = math.random(10000,20000)
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local spawned = false


CreateThread( function()
	Wait(10000)
	while true do
	Wait(1000)
		if GetDistanceBetweenCoords(Config.PickupBlip.x,Config.PickupBlip.y,Config.PickupBlip.z, GetEntityCoords(PlayerPedId())) <= 200 then
			if spawned == false then
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')
				TriggerEvent('mudbug:server:pickupspotspawns')

			end
			spawned = true
		else
			if spawned then
				locations = {}
			end
			spawned = false

		end
	end
end)

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




CreateThread(function()
    while true do
        Wait(0)
		for k in pairs(locations) do
					if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(PlayerPedId())) < 80 then
						DrawMarker(2, locations[k].x, locations[k].y, locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)
						if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(PlayerPedId()), false) < 1.0 then
					ShowHelpNotification('Press ~INPUT_PICKUP~ to catch crabs/shrimp')
					if IsControlJustReleased(0, Keys['E']) then
							Animacion()
							Wait(digtimer)
							TriggerEvent('mudbug:server:pickupnew', k)
					end
				end
			end
		end
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	if inDist then
	   SetTextColour(0, 190, 0, 220)
	else
		SetTextColour(220, 0, 0, 220)
	end
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
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

function Animacion()
	local HasItem1 = QBCore.Functions.HasItem('shovel')
	if not HasItem1 then
        QBCore.Functions.Notify("Missing Shovel...", "error")
        return
    else
		PropBucket()
	end
end



--function Process()
RegisterNetEvent('mudbug:server:ProcessCrab101', function()
	PropBucket() 
	Wait(1200)
	TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
	QBCore.Functions.Progressbar('search', 'Processing Crabs...', digtimer, false, true, { -- Name | Label | Time | useWhileDead | canCancel
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		QBCore.Functions.TriggerCallback('mudbug:server:crabsprocessed2', function(output)
			making = output
		end)
	end, function()
	QBCore.Functions.Notify('Canceled', 'error', 7500)
	end)
end)

--function Camarones()
RegisterNetEvent('mudbug:server:ProcessShrimp101', function()
	PropBucket() 
	Wait(1200)
	TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
	QBCore.Functions.Progressbar('search', 'Processing Shrimp...', digtimer, false, true, { -- Name | Label | Time | useWhileDead | canCancel
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		QBCore.Functions.TriggerCallback('mudbug:server:shrimpprocessed2', function(output)
			makingcamarones = output
		end)
	end, function()
	QBCore.Functions.Notify('Canceled', 'error', 7500)
	end)
end)

RegisterNetEvent('mudbug:server:pickupspotspawns', function()
	local set = false
	Wait(10)
	local rnX = Config.PickupBlip.x + math.random(-35, 35)
	local rnY = Config.PickupBlip.y + math.random(-35, 35)
	local u, Z = GetGroundZFor_3dCoord(rnX ,rnY ,300.0,0)
	table.insert(locations,{x=rnX, y=rnY, z=Z + 0.3});
end)

RegisterNetEvent('mudbug:server:pickupnew', function(id)
	local set = false
	Wait(10)
	local rnX = Config.PickupBlip.x + math.random(-35, 35)
	local rnY = Config.PickupBlip.y + math.random(-35, 35)
	local u, Z = GetGroundZFor_3dCoord(rnX ,rnY ,300.0,0)
	locations[id].x = rnX
	locations[id].y = rnY
	locations[id].z = Z + 0.3
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

DrawText3Ds = function(coords, text, scale)
    local x,y,z = coords.x, coords.y, coords.z
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 280
    DrawRect(_x, _y + 0.0115, 0.032 + factor, 0.033, 41, 11, 41, 100)
end

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		Wait(1)
		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellingSpot.x, Config.SellingSpot.y, Config.SellingSpot.z, true) < 5 then
			 DrawMarker(29, Config.SellingSpot.x, Config.SellingSpot.y, Config.SellingSpot.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 228, 71, 12, 100, true, false, 2, false, nil, nil, false)
		end
	end
end)

RegisterNetEvent('mudbug:client:payoutShrimp', function()
	TriggerServerEvent('mudbug:server:paymentsale1')
end)

RegisterNetEvent('mudbug:client:payoutCrab', function()
	TriggerServerEvent('mudbug:server:paymentsale2')
end)

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end


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

