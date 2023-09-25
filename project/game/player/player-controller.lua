local controller = {}

function controller.load()
    data.player.speed = 400
    data.player.x = 0
    data.player.y = 0
    data.player.speedMultiplicator = 1

    data.player.isDodging = false
    data.player.dodgeAmount = 1
    data.player.dodgeMaxAmount = 1
    data.player.dodgeRechargeTimer = 0
    data.player.dodgeRechargeCD = 1
    data.player.dodgeRechargeMultiplicator = 1

    data.player.isCharging = false
    data.player.attackCharge = 0
    data.player.attackMaxCharge = 1
    data.player.attackChargeMultiplicator = 1

    data.player.charge = {}

    data.player.charge[1] = {}
    data.player.charge[1].chargeFactor = 0.125
    data.player.charge[1].speedReduction = 0.8

    data.player.charge[2] = {}
    data.player.charge[2].chargeFactor = 0.25
    data.player.charge[2].speedReduction = 0.6

    data.player.charge[3] = {}
    data.player.charge[3].chargeFactor = 0.75
    data.player.charge[3].speedReduction = 0.3
end

function controller.update(dt)
    -- now we calculate the rotation of the cursor in function of the mouse position --
    local dx = mouse.x - screen.width / 2  -- différence en x entre la souris et le centre de l'écran
    local dy = mouse.y - screen.height / 2  -- différence en y entre la souris et le centre de l'écran

    data.player.angle = math.atan2(dy, dx) + math.pi / 2



    -- Now we update the player position --
    if love.keyboard.isDown("z") or love.keyboard.isDown("up") then
        data.player.y = data.player.y - data.player.speed * data.player.speedMultiplicator * dt
    end
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        data.player.y = data.player.y + data.player.speed * data.player.speedMultiplicator * dt
    end
    if love.keyboard.isDown("q") or love.keyboard.isDown("left") then
        data.player.x = data.player.x - data.player.speed * data.player.speedMultiplicator * dt
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        data.player.x = data.player.x + data.player.speed * data.player.speedMultiplicator * dt
    end


    --[[
        managing the attack system
        adding the charge amount if the attack button is pressed. the attack charge has 3 levels, 
        the first level can be released instantly and will charge a little ball with low speed and very low damage.
        the second level will charge a same size ball with more speed and more damage.
        the third level will charge a bigger ball with more speed and a lot of damage.
    ]]

    -- managing the attack charge --
    if data.player.isCharging then
        if data.player.attackCharge < data.player.attackMaxCharge then
            data.player.attackCharge = data.player.attackCharge + 1 * dt * data.player.attackChargeMultiplicator
            if data.player.attackCharge > data.player.attackMaxCharge then
                data.player.attackCharge = data.player.attackMaxCharge
            end
        end
        if data.player.attackCharge >= data.player.charge[1].chargeFactor * data.player.attackMaxCharge then
            controller.setMultiplicator(data.player.charge[1].speedReduction)
        end
        if data.player.attackCharge >= data.player.charge[2].chargeFactor * data.player.attackMaxCharge then
            controller.setMultiplicator(data.player.charge[2].speedReduction)
        end
        if data.player.attackCharge >= data.player.charge[3].chargeFactor * data.player.attackMaxCharge then
            controller.setMultiplicator(data.player.charge[3].speedReduction)
        end
    else
        controller.setMultiplicator()
        data.player.attackCharge = data.player.attackCharge - 1 * dt * data.player.attackChargeMultiplicator
        if data.player.attackCharge < 0 then
            data.player.attackCharge = 0
        end
    end
    

    --[[
        the dodge is a bit special, if the player is pressing the dodge key with a dodge amount > 0
        then the player will be able to dodge. if the player is dodging, the dodge amount will decrease
        until it reach 0. when the dodge amount reach 0, the player will not be able to dodge anymore until the dodge begin to recharge.
        the dodge amount will recharge when the player is not dodging. it has a delay before starting to recharge.
        the player can dodge again before the bar is full, but the dodge will be shorter.
        the player can choose to dodge for the whole amount or not, just by pressing or releasing one of the dodge key.
    ]]

    -- managing the dodge recharge --
    if data.player.dodgeRechargeTimer > 0 then
        data.player.dodgeRechargeTimer = data.player.dodgeRechargeTimer - dt
        if data.player.dodgeRechargeTimer < 0 then
            data.player.dodgeRechargeTimer = 0
        end
    else
        if data.player.dodgeAmount < data.player.dodgeMaxAmount then
            data.player.dodgeAmount = data.player.dodgeAmount + 1 * dt * data.player.dodgeRechargeMultiplicator
            if data.player.dodgeAmount > data.player.dodgeMaxAmount then
                data.player.dodgeAmount = data.player.dodgeMaxAmount
            end
        end
    end

    -- managing the dodge --
    if love.keyboard.isDown("space") or love.keyboard.isDown("lshift") or love.keyboard.isDown("lctrl") then
        if data.player.dodgeAmount > 0 then
            data.player.isDodging = true
            data.player.dodgeAmount = data.player.dodgeAmount - 1 * dt
            data.player.dodgeRechargeTimer = data.player.dodgeRechargeCD
        else
            data.player.isDodging = false
            data.player.dodgeAmount = 0
        end
    else
        data.player.isDodging = false
    end
end

function controller.mousepressed(x, y, button)
    if button == 1 then
        -- left click is pressed (launch attack) --
        if data.player.attackCharge == 0 then
            data.player.isCharging = true
        end
    end
    if button == 2 then
        if data.player.isCharging then
            data.player.isCharging = false
            data.player.attackCharge = data.player.attackCharge / 2
        end
    end
end

function controller.mousereleased(x, y, button)
    if button == 1 then
        -- left click is released (launch attack) --
        if data.player.isCharging then
            data.player.isCharging = false
            if data.player.attackCharge == data.player.attackMaxCharge then
                data.player.attackCharge = data.player.attackMaxCharge / 2
            end
            -- generate the attack --
        end
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
    data.player.speedMultiplicator = multiplicator or 1
end

return controller