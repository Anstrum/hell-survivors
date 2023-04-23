local client = {}

client.socket = require("socket")
client.address = "192.168.1.22"
client.port = 12345
client.udp = nil 

client.auth = require("core/network/auth")
client.lobbySearch = require("core/network/lobbySearch")


client.connected = false
client.matching = false
client.LobbyId = nil
client.playerCount = 0


function client.load()
	client.udp = client.socket.udp()
	client.udp:settimeout(1 / 120)
	client.udp:setpeername(client.address, client.port)
end

function client.connect()
	client.auth.getToken()

	if client.auth.token == nil then
		return
	end
	client.auth.sendToken(client.udp)
	client.auth.getTokenAnswer(client.udp)
	client.connected = client.auth.connected
end

function client.searchLobby()
	client.lobbySearch.startSearch(client.udp, client.auth.token)
	client.lobbySearch.getSearchAnswer(client.udp)
	client.inLobby = client.lobbySearch.inLobby
	client.playerCount = client.lobbySearch.playerCount
end

return client