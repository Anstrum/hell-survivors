local controller = {}

controller.x = nil
controller.y = nil
controller.speed = nil
controller.speedMultiplicator = 1

function controller.load()
    controller.speed = 400
    controller.x = 0
    controller.y = 0
end

function controller.update(dt)
    if love.keyboard.isDown("z") then
        controller.y = controller.y - controller.speed * controller.speedMultiplicator * dt
    end
    if love.keyboard.isDown("s") then
        controller.y = controller.y + controller.speed * controller.speedMultiplicator * dt
    end
    if love.keyboard.isDown("q") then
        controller.x = controller.x - controller.speed * controller.speedMultiplicator * dt
    end
    if love.keyboard.isDown("d") then
        controller.x = controller.x + controller.speed * controller.speedMultiplicator * dt
    end
end

function controller.mousepressed(x, y, button)
    if button == 1 then
        -- left click is pressed (charge attack) --
    end
    if button == 2 then
        -- right click is pressed (cancel attack) --
    end
end

function controller.mousereleased(x, y, button)
    if button == 1 then
        -- left click is released (launch attack) --
    end

end

function controller.unload()
    controller.x = nil
    controller.y = nil
end

--[[
        setting multiplicator allow to slow down or speed up the player
        multiplicator = 1 is the normal speed
        calling controller.setMultiplicator() will set the multiplicator to 1
]]
function controller.setMultiplicator(multiplicator)
    controller.speedMultiplicator = multiplicator or 1
end

return controller