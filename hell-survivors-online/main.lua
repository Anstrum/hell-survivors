io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("core/generalFunctions")
game = require("game/game")
menu = require("menu/menu")

function love.load()
	screen.update()
	font.load()
	debugSystem.addLog(DebugType.INFO, "Game initialized. Entering menu..", false)
end

function love.keypressed(key)
	debugSystem.keypressed(key)
end

function love.update(dt)
	if currentGameState == GameStates.MENU then
		menu.update(dt)
	end
	if currentGameState == GameStates.GAME then
		game.update(dt)
	end
	mouse.update()
	debugSystem.update(dt)
end

function love.draw()
	if currentGameState == GameStates.MENU then
		menu.draw()
	end
	if currentGameState == GameStates.GAME then
	 	game.draw()
	end
	debugSystem.draw()
end