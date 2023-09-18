local deco = {}

    deco.title = nil
    deco.titleFont = nil
    deco.start = nil
    deco.startFont = nil

    deco.startAlpha = nil
    deco.startAlphaSpeed = nil

function deco.load()
    -- title and start text --
    deco.title = screen.title
    deco.titleFont = love.graphics.newFont("project/assets/fonts/cheese-burger.otf", 50)
    deco.title = love.graphics.newText(deco.titleFont, deco.title)

    deco.start = "Press space or return to start"
    deco.startFont = love.graphics.newFont("project/assets/fonts/cheese-burger.otf", 20)
    deco.start = love.graphics.newText(deco.startFont, deco.start)

    -- alpha settings--
    deco.startAlpha = 0
    deco.startAlphaSpeed = 1
    deco.minAlpha = 0.2
    deco.loopDelay = 0
end

function deco.unload()
    deco.titleFont = nil
    deco.startFont = nil
    deco.title = nil
    deco.start = nil

    logger.addLog("menu deco unloaded", false)
end

function deco.update(dt)
    -- alpha animation for the start text --
    -- in this animation, the alpha will decrease until the minAlpha value --
    -- then increase until 1, then decrease again, etc. --
    -- the delay is here to avoid the animation to be too fast --
    -- the animation will restart when the delay is over --

    if deco.loopDelay > 0 then
        deco.loopDelay = deco.loopDelay - dt
        return
    end

    deco.startAlpha = deco.startAlpha + deco.startAlphaSpeed * dt
    if deco.startAlphaSpeed > 0 then
        if deco.startAlpha > 1 then
            deco.startAlpha = 1
            deco.startAlphaSpeed = 0 - deco.startAlphaSpeed
            deco.loopDelay = 0.7
        end
    else
        if deco.startAlpha < deco.minAlpha then
            deco.startAlpha = deco.minAlpha
            deco.startAlphaSpeed = 0 - deco.startAlphaSpeed
        end
    end
end

function deco.draw()
    -- adding some values to simplify the code --
    local titleWidth = deco.title:getWidth()
    local titleHeight = deco.title:getHeight()

    local startWidth = deco.start:getWidth()
    local startHeight = deco.start:getHeight()


    -- displaying a background --
    colors.set(colors.menuBackground)
    love.graphics.rectangle("fill", 0, 0, screen.width, screen.height)

    -- title and start text --
    colors.set(colors.title)
    love.graphics.draw(deco.title, screen.width / 2, 100, 0, 1, 1, titleWidth / 2, titleHeight / 2)

    colors.set(colors.text, deco.startAlpha)
    love.graphics.draw(deco.start, screen.width / 2, screen.height - 2 * startHeight, 0, 1, 1, startWidth / 2, startHeight / 2)
end

return deco