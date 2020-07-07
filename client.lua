ESX = nil

local thirst, drink, hunger = 0, 0, 0
local health = 0
local armor = 0
local stamina = 0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function ()
	Citizen.Wait(1000)
    while true do
		Citizen.Wait(250)
        SendNUIMessage({
			update = true,
			hunger = hunger,
			thirst = thirst,
			drunk = drunk,
			health = GetEntityHealth(GetPlayerPed(-1)) - 100,
			armor = GetPedArmour(GetPlayerPed(-1))
		})
    end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(7)
	end
end)

AddEventHandler("hungerthirst:updateBasics", function(basics)
    hunger, drunk, thirst = basics[1].percent, basics[3].percent, basics[2].percent
end)