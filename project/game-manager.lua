gameManager = {}

	local menu = require("project/menu/menu")

	gameManager.gameState = nil


	function gameManager.init()
		gameManager.gameState = "menu"
	end


	function gameManager.load()
		if gameManager.gameState == "menu" then
			menu.load()
		end
		if gameManager.gameState == "characterSelect" then
			characterSelect.load()
		end
	end


	function gameManager.update(dt)
		if gameManager.gameState == "menu" then
			menu.update(dt)
		end
		if gameManager.gameState == "characterSelect" then
			characterSelect.update(dt)
		end
	end


	function gameManager.keypressed(key)
		if gameManager.gameState == "menu" then
			menu.keypressed(key)
		end
	end


	function gameManager.mousepressed(x, y, key)
	end


	function gameManager.draw()
		if gameManager.gameState == "menu" then
			menu.draw()
		end
		if gameManager.gameState == "characterSelect" then
			characterSelect.draw()
		end
	end


	function gameManager.selectCharacter()
		if gameManager.gameState == "menu" then
			menu.unload()
		end
		gameManager.gameState = "characterSelect"
		gameManager.load()
	end
