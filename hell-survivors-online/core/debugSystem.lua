DebugType = {}
DebugType.INFO = "INFO"
DebugType.WARNING = "WARNING"
DebugType.NETWORK = "NETWORK"
DebugType.ERROR = "ERROR"


local debugSystem = {}

	debugSystem.showDebug = false
	debugSystem.debugList = {}
	debugSystem.displayedDebugList = {}

function debugSystem.keypressed(key)
	if key == "f1" then
		debugSystem.toggle()
	end
	if key == "f3" then
		debugSystem.export()
	end
end

function debugSystem.addLog(header, content, toDisplay)
	local myLog = {}
		myLog.header = header
		myLog.content = content
		myLog.date = os.date("%x").." - "..os.date("%X").." | "
		function myLog.toString() 
			return myLog.date..myLog.header.." | "..myLog.content.."\n"
		end
		myLog.toDisplay = toDisplay

	table.insert(debugSystem.debugList, myLog)
	if toDisplay then
		myLog.displayTime = 0.5
		table.insert(debugSystem.displayedDebugList, myLog)
	end
end
function debugSystem.toggle()
	debugSystem.showDebug = not debugSystem.showDebug
	if debugSystem.showDebug then
		debugSystem.addLog(DebugType.INFO, "Debug enabled", true)
	else
		debugSystem.addLog(DebugType.INFO, "Debug disabled", false)
	end
end
function debugSystem.export()
	local file = io.open("debug.txt", "w+")

	io.output(file)

	for i = #debugSystem.debugList, 1, -1 do
		io.write(debugSystem.debugList[i].toString())
	end

	io.close(file)
end


function debugSystem.update(dt)
	for i = #debugSystem.displayedDebugList, 1, -1 do
		local myLog = debugSystem.displayedDebugList
	end
end
function debugSystem.draw()
	-- if it is not enabled
	if not debugSystem.showDebug then
		return
	end


	-- display each debugList
	for i = 1, #debugSystem.displayedDebugList do

	end
end



return debugSystem