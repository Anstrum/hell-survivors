io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("project/misc/general-functions")
require("project/game-manager")

function love.load()
	screen.init()
	gameManager.init()
	gameManager.load()

	logger.addLog("load complete", true)
end

function love.update(dt)
	sounds.update(dt)
	currentDt = dt
	mouse.update()
	gameManager.update(dt)
	logger.update(dt)
end

function love.quit()
	logger.export()
end

function love.keypressed(key)
	gameManager.keypressed(key)
	logger.keypressed(key)
end

function love.mousepressed(x, y, click)
	gameManager.mousepressed(x, y, click)
end

function love.mousereleased(x, y, click)
	gameManager.mousereleased(x, y, click)
end

function love.draw()
	colors.set(colors.white)
	gameManager.draw()
	logger.draw()
end
