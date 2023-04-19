local network = {}
local json = require("dkjson")
	network.socket = require("socket")
	network.address = "localhost"
	network.port = 12345
	network.udp = nil

function network.load()
	network.udp = network.socket.udp()
end

function network.sendData(data)
	print("data sent: "..data)
	network.udp:sendto(data, network.address, network.port)
end

function network.update(dt)
end


return network