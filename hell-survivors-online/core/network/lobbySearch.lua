local lobbySearch = {}

	lobbySearch.inLobby = false
	lobbySearch.playerCount = 0

function lobbySearch.startSearch(udp, token)
	local body = [[{"requestType":"findGame","token":"]]..token..[["}]]
	udp:send(body)
end

function getSearchAnswer()
	local answer = udp:receive()
	
end

return lobbySearch