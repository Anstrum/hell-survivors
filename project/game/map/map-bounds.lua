local bounds = {}

bounds.radius = nil
bounds.decreaseSpeed = nil
bounds.displayBounds = true

function bounds.load(radius, decreaseSpeed)
    bounds.radius = radius or 1000
    bounds.decreaseSpeed = decreaseSpeed or 100
end

function bounds.update(dt)
    bounds.radius = bounds.radius - bounds.decreaseSpeed * dt
    if bounds.radius < 0 then
        bounds.radius = 0
        bounds.displayBounds = false
    end
end

function bounds.draw()
    if bounds.displayBounds then
        colors.set(colors.red, 0.9)
        love.graphics.circle("line", screen.width / 2, screen.height / 2, bounds.radius - 2)
        love.graphics.circle("line", screen.width / 2, screen.height / 2, bounds.radius - 1)
        love.graphics.circle("line", screen.width / 2, screen.height / 2, bounds.radius)
        love.graphics.circle("line", screen.width / 2, screen.height / 2, bounds.radius + 1)
        love.graphics.circle("line", screen.width / 2, screen.height / 2, bounds.radius + 2)
    end
end

function bounds.unload()
    bounds.radius = nil
    bounds.decreaseSpeed = nil
    bounds.displayBounds = true
end

return bounds