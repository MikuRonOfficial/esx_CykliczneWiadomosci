PlayerData= {}

ESX= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
  	PlayerData = ESX.GetPlayerData()
end)

Config = {}
Config.czas = 1800000 --30 minut
Config.wiado = {
    "Przykładowa wiadomość 1.",
    "Przykładowa wiadomość 2.",
    "Przykładowa wiadomość 3.",
    "Przykładowa wiadomość 4.",
    "Przykładowa wiadomość 5."

}
local stary = 0
local index = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.czas)
        index = GetRandomIntInRange(1,  #Config.wiado)
        if index ~= stary then
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 10px; background-color: rgba(153, 255, 68, 0.55); border-radius: 5px;"><font color="FFFFFF"><font color="white">{0}</font></div>',
                args = {Config.wiado[index]}
            })
            stary=index
        end
    end
end)