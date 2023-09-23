local background = {}

function background.load(maxAlpha)
    data.map.background.baseRadius = data.map.bounds.radius or 1000
    background.generateDeco(data.map.bounds.radius)
    colors.maxAlpha = maxAlpha or 0.3
end


function background.draw()
    -- displaying the background --
    colors.set(colors.mapBackground)
    love.graphics.circle("fill", screen.width / 2, screen.height / 2, data.map.background.baseRadius * 2)

    -- then applying the fog --
    colors.set(colors.fog)
    love.graphics.circle("fill", screen.width / 2, screen.height / 2, data.map.background.baseRadius * 2)

    -- then displaying gain the map to remove the fog in the radius --
    colors.set(colors.mapBackground)
    love.graphics.circle("fill", screen.width / 2 - data.player.controller.x, screen.height / 2 - data.player.controller.y, data.map.bounds.radius)

    -- then displaying the deco --
    for i = 1, #data.map.background.stars do
        local item = data.map.background.stars[i]

        if not (item.x - data.player.controller.x * 1.5 > 2 * screen.width or item.y - data.player.controller.y * 1.5 > 2 * screen.height) then
            colors.set(item.color)
            love.graphics.circle("fill", item.x - data.player.controller.x * 1.5, item.y - data.player.controller.y * 1.5, item.radius)
        end
    end
    for i = 1, #data.map.background.bubbles do
        local item = data.map.background.bubbles[i]

        if not (item.x - data.player.controller.x > 2 * screen.width or item.y - data.player.controller.y > 2 * screen.height) then
            colors.set(item.color)
            love.graphics.circle("fill", item.x - data.player.controller.x, item.y - data.player.controller.y, item.radius)
            colors.set(item.color, 0.5)
            love.graphics.circle("line", item.x - data.player.controller.x, item.y - data.player.controller.y, item.radius - 1)
            love.graphics.circle("line", item.x - data.player.controller.x, item.y - data.player.controller.y, item.radius)
            love.graphics.circle("line", item.x - data.player.controller.x, item.y - data.player.controller.y, item.radius + 1)
        end
    end
end

function background.generateDeco(count)

    math.randomseed(os.time())

    while #data.map.background.stars < count *2 do
        local item = {}
        -- the x and y values can be negative because the map start at x0 y0 and can go to x-radius y-radius --
        item.x = math.random(0, data.map.background.baseRadius * 4) - data.map.background.baseRadius * 2
        item.y = math.random(0, data.map.background.baseRadius * 4) - data.map.background.baseRadius * 2
        item.radius = math.random(1, 3)
        item.color = {math.random(0, 255), math.random(0, 255), math.random(0, 255), math.random(40, 150) / 255}
        table.insert(data.map.background.stars, item)
    end

    math.randomseed(os.time() * 2)

    while #data.map.background.bubbles < count / 4 do
        local item = {}
        -- the x and y values can be negative because the map start at x0 y0 and can go to x-radius y-radius --
        item.x = math.random(0, data.map.background.baseRadius * 4) - data.map.background.baseRadius * 2
        item.y = math.random(0, data.map.background.baseRadius * 4) - data.map.background.baseRadius * 2
        item.radius = math.random(100, 400)
        item.color = {math.random(0, 127) / 255, math.random(0, 127) / 255, math.random(127, 255) / 255, math.random(20, 64) / 255}
        table.insert(data.map.background.bubbles, item)
    end
end

return background