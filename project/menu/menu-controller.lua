local controller = {}

function controller.load()
    -- nothing here --
end

function controller.unload()
    -- nothing here --
end

function controller.update(dt)
    -- nothing here --
end

function controller.keypressed(key)
    if key == "escape" then
        logger.addLog("quit asked from menu", false)
        love.event.qcontrollert()
    end
    if key == "space" or key == "return" then
        gameManager.startGame()
    end
end

function controller.mousepressed(x, y, click)
    -- nothing here --
end

function controller.draw()
    -- nothing here --
end

return controller