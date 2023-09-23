local controller = {}



function controller.load()
    data.player.controller.speed = 400
    data.player.controller.x = 0
    data.player.controller.y = 0
end

function controller.update(dt)
    -- now we calculate the rotation of the cursor in function of the mouse position --
    local dx = mouse.x - screen.width / 2  -- différence en x entre la souris et le centre de l'écran
    local dy = mouse.y - screen.height / 2  -- différence en y entre la souris et le centre de l'écran

    data.player.controller.angle = math.atan2(dy, dx) + math.pi / 2



    -- Now we update the player position --
    if love.keyboard.isDown("z") then
        data.player.controller.y = data.player.controller.y - data.player.controller.speed * data.player.controller.speedMultiplicator * dt
    end
    if love.keyboard.isDown("s") then
        data.player.controller.y = data.player.controller.y + data.player.controller.speed * data.player.controller.speedMultiplicator * dt
    end
    if love.keyboard.isDown("q") then
        data.player.controller.x = data.player.controller.x - data.player.controller.speed * data.player.controller.speedMultiplicator * dt
    end
    if love.keyboard.isDown("d") then
        data.player.controller.x = data.player.controller.x + data.player.controller.speed * data.player.controller.speedMultiplicator * dt
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
end

--[[
        setting multiplicator allow to slow down or speed up the player
        multiplicator = 1 is the normal speed
        calling controller.setMultiplicator() will set the multiplicator to 1
]]
function controller.setMultiplicator(multiplicator)
    data.player.data.player.controller.speedMultiplicator = multiplicator or 1
end

return controller