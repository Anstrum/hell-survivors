mouse = {}
	mouse.x = 0
	mouse.y = 0
	function mouse.update(dt)
		mouse.x = love.mouse.getX()
		mouse.y = love.mouse.getY()
	end

screen = {}
	screen.width = 800
	screen.height = 600
	screen.title = "Hell Survivors"
	function screen.update() 
		love.window.setTitle(screen.title)
		love.window.setMode(screen.width, screen.height)
	end