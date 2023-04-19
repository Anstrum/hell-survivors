debugSystem = require("core/debugSystem")
client = require("core/network/client")
json = require("core/dkjson")

GameStates = {}
	GameStates.MENU = "MENU"
	GameStates.GAME = "GAME"

currentGameState = GameStates.MENU


screen = {}
	screen.width = 800
	screen.height = 600
	screen.title = "Hell Survivors"
	function screen.update()
		love.window.setTitle(screen.title)
		love.window.setMode(screen.width, screen.height)
	end


mouse = {}
	mouse.x = 0
	mouse.y = 0
	mouse.angle = 0
	function mouse.update()
		--getting mouse position--
		mouse.x = love.mouse.getX()
		mouse.y = love.mouse.getY()

		--getting mouse angle--
		local xDiff = mouse.x - screen.width / 2
		local yDiff = mouse.y - screen.height / 2
		mouse.angle = math.atan2(xDiff, yDiff)
		mouse.angle = math.deg(mouse.angle)
		mouse.angle = 0 - mouse.angle + 90
	end


font = {}
	font.list = {}
	function font.load()
		font.addFont("default.otf", "default", 15)
	end
	function font.addFont(file, name, size)
		local myFont = {}
			myFont.font = love.graphics.newFont("ressources/"..file, 15)
			myFont.name = name
			myFont.size = size
		table.insert(font.list, myFont)
	end
	function font.getFont(name)
		for i = 1, #font.list do
			local myFont = font.list[i]
			if myFont.name == name then
				return myFont
			end
		end
		return font.list[1]
	end