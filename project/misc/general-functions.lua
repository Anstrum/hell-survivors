currentDt = 0

sounds = require("project/misc/sounds")

screen = {}
	screen.width = 800
	screen.height = 800
	screen.title = "Hell Survivors"
	function screen.init()
		love.window.setMode(screen.width, screen.height)
		love.window.setTitle(screen.title)
	end

mouse = {}
	mouse.x = 0
	mouse.y = 0
	function mouse.update()
		mouse.x = love.mouse.getX()
		mouse.y = love.mouse.getY()
	end

camera = {}
	camera.x = 0
	camera.y = 0
	camera.zoom = 1

logger = {}
	logger.logs = {}
	logger.isActive = false
	logger.currentMessage = nil
	logger.messageDuration = 0
	function logger.addLog(content, toPrint)
		local myText
		myText = os.date("%x").." - "..os.date("%X").." | "..content.."\n"
		table.insert(logger.logs, myText)
		if toPrint and logger.isActive then
			logger.currentMessage = content
			logger.messageDuration = 2
		end
	end
	function logger.export()
		os.execute("mkdir debug")
		local file = io.open("debug/debug.txt", "w+")
		io.output(file)

		for i = 1, #logger.logs do
			io.write(logger.logs[i])
		end

		io.close(file)
	end
	function logger.update(dt)
		if logger.currentMessage == nil then return end

		logger.messageDuration = logger.messageDuration - 2 * dt
		if logger.messageDuration < 0 then
			logger.messageDuration = 0
			logger.currentMessage = nil
		end
	end
	function logger.keypressed(key)
		if key == "f2" then
			logger.isActive = not logger.isActive
			logger.addLog("Logs activated: "..tostring(logger.isActive), true)
		end
	end
	function logger.draw()
		if logger.currentMessage ~= nil then
			colors.set(colors.log, logger.messageDuration)
			love.graphics.print(logger.currentMessage, 5, 5)
		end
	end

colors = {}
	function colors.set(color, alpha)
		local adjustedColor = {color[1], color[2], color[3], alpha or color[4] or 1}
		love.graphics.setColor(adjustedColor)
	end
	colors.red = {1, 0, 0, 1}
	colors.green = {0, 1, 0, 1}
	colors.blue = {0, 0, 1, 1}
	colors.white = {1, 1, 1, 1}
	colors.black = {0, 0, 0, 1}
	
	-- main menu --
	colors.log = {0, 1, 0.8}
	colors.title = {0.8, 0.8, 0.8, 1}
	colors.menuBackground = {0.0, 0.0, 0.3, 1}
	colors.text = {0.5, 0.5, 0.5}
	
	-- game --
	colors.mapBackground = {0.1, 0.1, 0.4, 1}
	colors.fog = {1, 1, 1, 0.3}