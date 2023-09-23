local bounds = {}

function bounds.load(radius, decreaseSpeed)
    data.map.bounds.radius = radius or 1000
    data.map.bounds.decreaseSpeed = decreaseSpeed or radius / 10 or 100
end

function bounds.update(dt)
    data.map.bounds.radius = data.map.bounds.radius - data.map.bounds.decreaseSpeed * dt
    if data.map.bounds.radius < 0 then
        data.map.bounds.radius = 0
        data.map.bounds.displayBounds = false
    end
end

function bounds.draw()
    if data.map.bounds.displayBounds then
        colors.set(colors.red, 0.9)
        love.graphics.circle("line", screen.width / 2 - data.player.controller.x, screen.height / 2 - data.player.controller.y, data.map.bounds.radius - 2)
        love.graphics.circle("line", screen.width / 2 - data.player.controller.x, screen.height / 2 - data.player.controller.y, data.map.bounds.radius - 1)
        love.graphics.circle("line", screen.width / 2 - data.player.controller.x, screen.height / 2 - data.player.controller.y, data.map.bounds.radius)
        love.graphics.circle("line", screen.width / 2 - data.player.controller.x, screen.height / 2 - data.player.controller.y, data.map.bounds.radius + 1)
        love.graphics.circle("line", screen.width / 2 - data.player.controller.x, screen.height / 2 - data.player.controller.y, data.map.bounds.radius + 2)
    end
end

function bounds.unload()
    data.map.bounds.radius = nil
    data.map.bounds.decreaseSpeed = nil
    data.map.bounds.displayBounds = true
end

return bounds