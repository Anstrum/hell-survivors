local background = {}

background.stars = {}
background.bubbles = {}
background.baseRadius = nil

function background.load(radius, maxAlpha)
    background.baseRadius = radius or 1000
    background.generateDeco(radius)
    colors.maxAlpha = maxAlpha or 0.3
end


function background.draw(radius, playerX, playerY)
    -- displaying the background --
    colors.set(colors.mapBackground)
    love.graphics.circle("fill", screen.width / 2, screen.height / 2, background.baseRadius * 2)

    -- then applying the fog --
    colors.set(colors.fog)
    love.graphics.circle("fill", screen.width / 2, screen.height / 2, background.baseRadius * 2)

    -- then displaying gain the map to remove the fog in the radius --
    colors.set(colors.mapBackground)
    love.graphics.circle("fill", screen.width / 2 - playerX, screen.height / 2 - playerY, radius)

    -- then displaying the deco --
    for i = 1, #background.stars do
        local item = background.stars[i]
        colors.set(item.color)
        love.graphics.circle("fill", item.x - playerX, item.y - playerY, item.radius)
    end
    for i = 1, #background.bubbles do
        local item = background.bubbles[i]
        colors.set(item.color)
        love.graphics.circle("fill", item.x - playerX, item.y - playerY, item.radius)
        colors.set(item.color, 0.5)
        love.graphics.circle("line", item.x - playerX, item.y - playerY, item.radius - 1)
        love.graphics.circle("line", item.x - playerX, item.y - playerY, item.radius)
        love.graphics.circle("line", item.x - playerX, item.y - playerY, item.radius + 1)
    end
end

function background.generateDeco(count)

    math.randomseed(os.time())

    while #background.stars < count / 2 do
        local item = {}
        -- the x and y values can be negative because the map start at x0 y0 and can go to x-radius y-radius --
        item.x = math.random(0, background.baseRadius * 4) - background.baseRadius * 2
        item.y = math.random(0, background.baseRadius * 4) - background.baseRadius * 2
        item.radius = math.random(1, 3)
        item.color = {math.random(0, 255), math.random(0, 255), math.random(0, 255), math.random(40, 150) / 255}
        table.insert(background.stars, item)
    end

    math.randomseed(os.time() * 2)

    while #background.bubbles < count / 10 do
        local item = {}
        -- the x and y values can be negative because the map start at x0 y0 and can go to x-radius y-radius --
        item.x = math.random(0, background.baseRadius * 4) - background.baseRadius * 2
        item.y = math.random(0, background.baseRadius * 4) - background.baseRadius * 2
        item.radius = math.random(100, 400)
        item.color = {math.random(0, 127) / 255, math.random(0, 127) / 255, math.random(127, 255) / 255, math.random(20, 64) / 255}
        table.insert(background.bubbles, item)
    end
end

return background