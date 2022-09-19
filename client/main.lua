local isPaused, cooldown = false, false

RegisterNUICallback('closeList', function(args)
    SendNUIMessage({ action = 'close' }); SetNuiFocus(false, false)
end)

CreateThread(function()
	while true do
		if IsPauseMenuActive() and not isPaused then
			isPaused = true; SendNUIMessage({ action = 'close' })
		elseif not IsPauseMenuActive() and isPaused then
			isPaused = false
		end

        Wait(300)
	end
end)

CreateThread(function()
	while true do
		if IsControlJustReleased(0, 213) and not cooldown then
			ESX.TriggerServerCallback('kk-playerlist:requestData', function(cb) 
				SendNUIMessage({ action = 'open', data = cb })
				SetNuiFocus(true, true); cooldown = true
			end)
		end

        Wait(0)
	end
end)

CreateThread(function()
    while true do
        if cooldown then cooldown = false end

        Wait(2500)
    end
end)