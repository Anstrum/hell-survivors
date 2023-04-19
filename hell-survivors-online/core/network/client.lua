local client = {}

local json = require("core/dkjson")
local socket = require("socket")
local address = "192.168.1.22"
local port = 12345
local udp = socket.udp()

udp:setpeername(address, port)

	client.connected = false







return client