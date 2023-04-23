io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("core/generalFunctions")
game = require("game/game")
menu = require("menu/menu")

function love.load()
	client.load()
	screen.update()
	font.load()
	menu.load()

	client.connect()
	debugSystem.addLog(DebugType.INFO, "Game initialized. Entering menu..", false)
end

function love.keypressed(key)
	debugSystem.keyPressed(key)

	if currentGameState == GameStates.MENU then
		menu.keyPressed(key)
	end
end

function love.update(dt)
	client.udp:settimeout(0.5)
	if currentGameState == GameStates.MENU then
		menu.update(dt)function game.mousepressed(x, y, click) 
	player.mousepressed(x, y, click)
end
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