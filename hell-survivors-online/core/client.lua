local client = {}

local json = require("core/dkjson")
	local socket = require("socket")
	local address = "localhost"
	local port = 12345


	client.connected = false
	client.token = nil

function client.getClipboard()
	return love.system.getClipboardText()
end
function client.getLocalToken()
	local file = io.open("user.gconfig")
	if not file then
		return nil
	end
	local token = file:read("*all")
	io.close(file)
	return token
end
function client.tryConnect()
	local udp = socket.udp()
	
	local token = client.getLocalToken()
	if not token then
		token = client.getClipboard()
	end

	udp:settimeout(0)
	udp:setpeername(address, port)
	print("test")
	udp:send("token")


	client.saveToken()
end
function client.saveToken()
	local file = io.open("user.gconfig", "w")
	file:write(tostring(client.token))
	io.close(file)
	debugSystem.addLog(DebugType.INFO, "Token saved locally", true)
end
return client