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


CreateThread(function()
	Blipventacamaronesycangrejos = AddBlipForCoord(Config.SellSeafood)
	SetBlipAsShortRange(Blipventacamaronesycangrejos, true)
	SetBlipSprite(Blipventacamaronesycangrejos, 266)
	SetBlipColour(Blipventacamaronesycangrejos, 47)
	SetBlipScale(Blipventacamaronesycangrejos, 0.7)
	AddTextComponentString(Config.SellBlip)
	EndTextCommandSetBlipName(Blipventacamaronesycangrejos)
end)
local blipPickup = AddBlipForCoord(Config.PickupBlip.x,Config.PickupBlip.y,Config.PickupBlip.z)
			SetBlipSprite (blipPickup, 266)
			SetBlipDisplay(blipPickup, 4)
			SetBlipScale  (blipPickup, 0.7)
			SetBlipColour (blipPickup, 47)
			SetBlipAsShortRange(blipPickup, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.CrabHarvestingBlip)
			EndTextCommandSetBlipName(blipPickup)

local blipProcess = AddBlipForCoord(Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z)
			SetBlipSprite (blipProcess, 266)
			SetBlipDisplay(blipProcess, 4)
			SetBlipScale  (blipProcess, 0.7)
			SetBlipColour (blipProcess, 47)
			SetBlipAsShortRange(blipProcess, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.nombreproceBlip)
			EndTextCommandSetBlipName(blipProcess)
local process = true
local blipcamarones = AddBlipForCoord(Config.ShrimpProcessSpot.x, Config.ShrimpProcessSpot.y, Config.ShrimpProcessSpot.z)
			SetBlipSprite (blipcamarones, 266)
			SetBlipDisplay(blipcamarones, 4)
			SetBlipScale  (blipcamarones, 0.7)
			SetBlipColour (blipcamarones, 47)
			SetBlipAsShortRange(blipcamarones, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.BlipShrimpProcess)
			EndTextCommandSetBlipName(blipcamarones)
local camarones = true


CreateThread(function()
    while true do
        Wait(0)
			for k in pairs(locations) do
				if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(PlayerPedId())) < 50 then
					DrawMarker(2, locations[k].x, locations[k].y, locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)
					if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(PlayerPedId()), false) < 2 then
				ShowHelpNotification('Press ~INPUT_PICKUP~ to catch crabs/shrimp')
				if IsControlJustReleased(0, Keys['E']) then
						Animacion()
						Wait(digtimer)
						TriggerEvent('mudbug:server:pickupnew', k)
				end
					end
				end
			end
			if GetDistanceBetweenCoords(Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z, GetEntityCoords(PlayerPedId())) < 150 then
					DrawMarker(2, Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)

					if GetDistanceBetweenCoords(Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z, GetEntityCoords(PlayerPedId()), true) < 2 then
						---Draw3DText( Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z , "~w~Produccion de cangrejos~y~\nPresiona [~b~E~y~] para comenzar el empaquetado",4,0.15,0.1)
						DrawText3Ds(vector3(Config.CrabProcessingSpot.x,Config.CrabProcessingSpot.y,Config.CrabProcessingSpot.z), "Press [E] to pack crabs ", 0.35)

						if IsControlJustReleased(0, Keys['E']) then
							CreateThread(function()
								Process()

							end)
						end
					end

					if GetDistanceBetweenCoords(Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z, GetEntityCoords(PlayerPedId()), true) < 5 and GetDistanceBetweenCoords(Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z, GetEntityCoords(PlayerPedId()), true) > 3 then
						process = false
					end
				end
				if GetDistanceBetweenCoords(Config.ShrimpProcessSpot.x, Config.ShrimpProcessSpot.y, Config.ShrimpProcessSpot.z, GetEntityCoords(PlayerPedId())) < 150 then
					DrawMarker(2, Config.ShrimpProcessSpot.x, Config.ShrimpProcessSpot.y, Config.ShrimpProcessSpot.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 228, 71, 12, 110, 1, 1, 0, 1)

					if GetDistanceBetweenCoords(Config.ShrimpProcessSpot.x, Config.ShrimpProcessSpot.y, Config.ShrimpProcessSpot.z, GetEntityCoords(PlayerPedId()), true) < 2 then
						---Draw3DText( Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z , "~w~Produccion de cangrejos~y~\nPresiona [~b~E~y~] para comenzar el empaquetado",4,0.15,0.1)
						DrawText3Ds(vector3(Config.ShrimpProcessSpot.x,Config.ShrimpProcessSpot.y,Config.ShrimpProcessSpot.z), "Press [E] to pack shrimp ", 0.35)

						if IsControlJustReleased(0, Keys['E']) then
							CreateThread(function()
								Camarones()
							end)
						end
					end

					if GetDistanceBetweenCoords(Config.ShrimpProcessSpot.x, Config.ShrimpProcessSpot.y, Config.ShrimpProcessSpot.z, GetEntityCoords(PlayerPedId()), true) < 5 and GetDistanceBetweenCoords(Config.CrabProcessingSpot.x, Config.CrabProcessingSpot.y, Config.CrabProcessingSpot.z, GetEntityCoords(PlayerPedId()), true) > 3 then
						camarones = false
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



function Process()
	process = true
	local making = true
	while making and process do
		QBCore.Functions.Notify('Starting Production of Crabs', 'success', 4000)
	Wait(5000)

	QBCore.Functions.TriggerCallback('mudbug:server:crabsprocessed', function(output)
			making = output
		end)

	end
end

function Camarones()
	camarones = true
	local makingcamarones = true
		while makingcamarones and camarones do
		QBCore.Functions.Notify('Starting Production of Shrimps', 'success', 4000)
		Wait(5000)

		QBCore.Functions.TriggerCallback('mudbug:server:shrimpprocessed', function(output)
				makingcamarones = output
			end)

		end
	print('Works Beautifulyy!')
end

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
		    if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellingSpot.x, Config.SellingSpot.y, Config.SellingSpot.z, true) < 25 then
				 DrawMarker(29, Config.SellingSpot.x, Config.SellingSpot.y, Config.SellingSpot.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 228, 71, 12, 100, true, false, 2, false, nil, nil, false)
		    if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellingSpot.x, Config.SellingSpot.y, Config.SellingSpot.z, true) < 2 then
			   DrawText3Ds(vector3(Config.SellingSpot.x,Config.SellingSpot.y,Config.SellingSpot.z), "Press [E] to open the shop menu ", 0.35)
		    if IsControlJustReleased(0, Keys['E']) then
			   tiendacyc()
		    end
		end end 
	end
end)

local cute = {
	{
		isMenuHeader = true,
		icon = "fa-solid fa-circle-info",
		header = 'Selling Shop',
	},
	{
		header = 'Sell Boxed Shrimp',
		txt ="Cash Payout of $"..Config.ProcessedShrimpPayout.."<br>Amount Required PerSale: "..Config.ShrimBoxRequired.."",
		icon = "fa-solid fa-user-register",
		params = {
			event = 'mudbug:client:payoutShrimp',
		}
	},
	{
		header = "Sell Crawfish",
		txt ="Cash Payout of $"..Config.CrawFishPayout.."<br>Amount Required PerSale: "..Config.CrawfishRequired.."",
		icon = "fa-solid fa-cash-register",
		params = {
			event = 'mudbug:client:payoutCrab',
		}
	},
}

RegisterNetEvent('mudbug:client:payoutShrimp', function()
	TriggerServerEvent('mudbug:server:paymentsale1')
end)

RegisterNetEvent('mudbug:client:payoutCrab', function()
	TriggerServerEvent('mudbug:server:paymentsale2')
end)


function tiendacyc()
	exports['qb-menu']:openMenu(cute)
end

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
