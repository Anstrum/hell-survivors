io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("generalFunctions")
game = require("game")
require("debugSystem")

function love.load()
	screen.update()
	game.load()
end


function love.update(dt)
	mouse.update()
	game.update(dt)
end

function love.mousepressed(x, y, click)
	game.mousepressed(x, y, click) 
end

function love.draw()
	game.draw()
end
