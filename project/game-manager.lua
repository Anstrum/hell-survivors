gameManager = {}

	local menu = require("project/menu/menu")
	local game = require("project/game/game")

	gameManager.gameState = nil


	function gameManager.init()
		gameManager.gameState = "menu"
	end


	function gameManager.load()
		if gameManager.gameState == "menu" then
			menu.load()
		end
		if gameManager.gameState == "game" then
			game.load()
		end
	end


	function gameManager.update(dt)
		if gameManager.gameState == "menu" then
			menu.update(dt)
		end
		if gameManager.gameState == "game" then
			game.update(dt)
		end
	end


	function gameManager.keypressed(key)
		if gameManager.gameState == "menu" then
			menu.keypressed(key)
		end
		if gameManager.gameState == "game" then
			game.keypressed(key)
		end
	end


	function gameManager.mousepressed(x, y, key)
	end


	function gameManager.draw()
		if gameManager.gameState == "menu" then
			menu.draw()
		end
		if gameManager.gameState == "game" then
			game.draw()
		end
	end


	function gameManager.startGame()
		gameManager.gameState = "game"
		menu.unload()
		gameManager.load()
	end

	function gameManager.goToMenu()
		gameManager.gameState = "menu"
		game.unload()
		gameManager.load()
	end
