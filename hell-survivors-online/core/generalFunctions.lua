debugSystem = require("core/debugSystem")


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