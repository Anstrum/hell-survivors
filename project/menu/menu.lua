local menu = {}

	menu.deco = require("project/menu/menu-deco")
	menu.ui = require("project/menu/menu-ui")

	function menu.load()
		menu.deco.load()
		menu.ui.load()

		logger.addLog("menu loaded", false)
	end

	function menu.unload()
		menu.deco.unload()
		menu.ui.unload()

		logger.addLog("menu unloaded", true)
	end

	function menu.update(dt)
		menu.deco.update(dt)
		menu.ui.update(dt)
	end

	function menu.keypressed(key)
		menu.ui.keypressed(key)
	end

	function menu.draw()
		menu.deco.draw()
		menu.ui.draw()
	end
	
return menu