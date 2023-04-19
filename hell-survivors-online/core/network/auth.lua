local auth = {}

	auth.token = nil




-----------------------------
-- sending token to server --
-----------------------------

function auth.sendToken(udp)
	local token = auth.getLocalToken()
	if not token then
		auth.token = auth.getClipboard()
	end
	if auth.token == nil then
		return
	end
	udp:send(auth.token)
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
	if not file then
		auth.token = nil
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
	answer = udp:receive()
	if answer == "connected" then
		auth.saveToken()
		auth.connected = true
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