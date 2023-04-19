io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("core/generalFunctions")
-- game = require("game/game")
-- menu = require("game/menu")
client = require("core/client")


function love.load()
	screen.update()
	client.tryConnect()
	debugSystem.addLog(DebugType.INFO, "Game initialized. Entering menu..", false)
end

function love.keypressed(key)
	debugSystem.keypressed(key)
end

function love.update(dt)
	mouse.update()
	debugSystem.update(dt)
	client.tryConnect()
end

function love.draw()
	debugSystem.draw()
end