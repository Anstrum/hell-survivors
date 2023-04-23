local lobbySearch = {}

	lobbySearch.matching = false
	lobbySearch.lobbyId = nil
	lobbySearch.playerCount = nil

function lobbySearch.startSearch(udp, token)
	local body = [[{"requestType":"findGame","token":"]]..token..[["}]]
	udp:send(body)
end

function lobbySearch.getSearchAnswer(udp)
	local answer = udp:receive()
	if answer ~= nil then
		answer = json.decode(answer)
		if answer.gameFound then
			if answer.lobbyId == not nil then
				lobbySearch.inLobby = true
				lobbySearch.lobbyId = answer.lobbyId
				lobbySearch.playerCount = answer.playerCount
			end
		end
	end
end

return lobbySearch