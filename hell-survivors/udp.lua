local network = {}
local json = require("dkjson")
	network.socket = require("socket")
	network.address = "localhost"
	network.port = 12345
	network.udp = nil

function network.load()
	network.udp = network.socket.udp()
	network.udp:settimeout(0)
	network.udp:setpeername(network.address, network.port)
end

function network.sendData(data)
	data = json.encode(data)
	network.udp:send(data)
end

function network.update(dt)
	data = network.udp:receive()
	print(data)
end


return network