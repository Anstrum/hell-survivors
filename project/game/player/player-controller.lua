local controller = {}

controller.x = nil
controller.y = nil
controller.speed = nil

function controller.load()
    controller.speed = 400
    controller.x = 0
    controller.y = 0
end

function controller.update(dt)
    if love.keyboard.isDown("z") then
        controller.y = controller.y - controller.speed * dt
    end
    if love.keyboard.isDown("s") then
        controller.y = controller.y + controller.speed * dt
    end
    if love.keyboard.isDown("q") then
        controller.x = controller.x - controller.speed * dt
    end
    if love.keyboard.isDown("d") then
        controller.x = controller.x + controller.speed * dt
    end
end

function controller.unload()
    controller.x = nil
    controller.y = nil
end

return controller