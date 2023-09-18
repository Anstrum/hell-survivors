local ui = {}

function ui.load()
    -- nothing here --
end

function ui.unload()
    -- nothing here --
end

function ui.update(dt)
    -- nothing here --
end

function ui.keypressed(key)
    if key == "escape" then
        logger.addLog("quit asked from menu", false)
        love.event.quit()
    end
    if key == "space" or key == "return" then
        gameManager.startGame()
    end
end

function ui.mousepressed(x, y, click)
    -- nothing here --
end

function ui.draw()
    -- nothing here --
end

return ui