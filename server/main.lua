ESX.RegisterServerCallback('kk-playerlist:requestData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
		local Players = ESX.GetExtendedPlayers()
    	local characters = {
			[1] = {
				me = true, 
				source = xPlayer.source, 
				ping = GetPlayerPing(xPlayer.source), 
				name = xPlayer.name
			}
		}

		for i = 1, #Players, 1 do
			if Players[i].source ~= xPlayer.source then
				characters[#characters + 1] = {
					source = Players[i].source,
					ping = GetPlayerPing(Players[i].source),
					name = Players[i].name
				}
			end
		end

		cb(characters)
    else
        cb({})
    end
end)