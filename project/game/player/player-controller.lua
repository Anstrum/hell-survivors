local controller = {}


function controller.load()
    data.player.speed = 400
    data.player.x = 0
    data.player.y = 0
    data.player.speedMultiplicator = 1
<<<<<<< Updated upstream
=======

    data.player.isDodging = false
    data.player.dodgeTimer = 0
    data.player.dodgeDuration = 0.3
    data.player.dodgeCD = 0
    data.player.dodgeCDTimer = 1
>>>>>>> Stashed changes
end

function controller.update(dt)
    -- now we calculate the rotation of the cursor in function of the mouse position --
    local dx = mouse.x - screen.width / 2  -- différence en x entre la souris et le centre de l'écran
    local dy = mouse.y - screen.height / 2  -- différence en y entre la souris et le centre de l'écran

    data.player.angle = math.atan2(dy, dx) + math.pi / 2



    -- Now we update the player position --
    if love.keyboard.isDown("z") then
        data.player.y = data.player.y - data.player.speed * data.player.speedMultiplicator * dt
    end
    if love.keyboard.isDown("s") then
        data.player.y = data.player.y + data.player.speed * data.player.speedMultiplicator * dt
    end
    if love.keyboard.isDown("q") then
        data.player.x = data.player.x - data.player.speed * data.player.speedMultiplicator * dt
    end
    if love.keyboard.isDown("d") then
        data.player.x = data.player.x + data.player.speed * data.player.speedMultiplicator * dt
<<<<<<< Updated upstream
=======
    end

    if data.player.dodgeCD > 0 then
        data.player.dodgeCD = data.player.dodgeCD - dt
        if data.player.dodgeCD < 0 then
            data.player.dodgeCD = 0
        end
    else
    if love.keyboard.isDown("lshift") or love.keyboard.isDown("space") or love.keyboard.isDown("lctrl") then
        if not data.player.isDodging then
            data.player.isDodging = true
            data.player.dodgeTimer = data.player.dodgeDuration
        end
    else

    end


        data.player.speedMultiplicator = 1
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
    data.player.x = nil
    data.player.y = nil
>>>>>>> Stashed changes
end

--[[
        setting multiplicator allow to slow down or speed up the player
        multiplicator = 1 is the normal speed
        calling controller.setMultiplicator() will set the multiplicator to 1
]]
function controller.setMultiplicator(multiplicator)
<<<<<<< Updated upstream
    data.player.data.player.speedMultiplicator = multiplicator or 1
=======
    data.player.speedMultiplicator = multiplicator or 1
>>>>>>> Stashed changes
end

return controller