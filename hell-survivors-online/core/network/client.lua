local client = {}

client.socket = require("socket")
client.address = "192.168.1.22"
client.port = 12345
client.udp = nil 
client.auth = require("core/network/auth")

client.connected = false


function client.load()
	client.udp = client.socket.udp()
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








return client