local auth = {}

	auth.token = nil
	auth.connected = false



-----------------------------
-- sending token to server --
-----------------------------

function auth.sendToken(udp)
	local body = [[{"requestType":"connection","token":"]]..auth.token..[["}]]
	udp:send(body)
end




--------------------------
-- ways to obtain token --
--------------------------

function auth.getToken()
	auth.getLocalToken()
	if auth.token == nil then
		auth.getClipboard()
	end
end
function auth.getLocalToken()
	local file = io.open("user.gconfig")
	if file == nil then
		auth.token = nil
		return
	end
	auth.token = file:read("*all")
	io.close(file)
end
function auth.getClipboard()
	auth.token = love.system.getClipboardText()
end



--------------------------
-- getting token answer --
--------------------------

function auth.getTokenAnswer(udp)
	local answer = udp:receive()
	if answer == "connected" then
		auth.saveToken()
		auth.connected = true
	else
		auth.connected = false
	end
end




-------------------------
-- token saved locally --
-------------------------

function auth.saveToken()
	local file = io.open("user.gconfig", "w")
	file:write(tostring(auth.token))
	io.close(file)
	debugSystem.addLog(DebugType.INFO, "Token saved locally", true)
end
return auth