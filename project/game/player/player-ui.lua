local ui = {}

function ui.load()
    data.player.uiFont = love.graphics.newFont("project/assets/fonts/cheese-burger.otf", 15)
    data.player.dodgeTxt = love.graphics.newText(data.player.uiFont, "Stamina")

    data.player.attackTxt = love.graphics.newText(data.player.uiFont, "Attack charge")
end


function ui.update(dt)
end


function ui.draw()

    -- drawing the dodge bar --
    --[[
        there is a "stamina" text on the top of the bar
        dodge bar is composed of 2 parts:
            - the background (grey)
            - the bar (green, orange or red)
    ]]


    colors.set(colors.white, 1)
    local stamTxtWidth = data.player.dodgeTxt:getWidth()
    local stamTxtHeight = data.player.dodgeTxt:getHeight()
    love.graphics.draw(data.player.dodgeTxt, 5 + stamTxtWidth * 0.5, 5)

    colors.set(colors.white, 0.3)
    love.graphics.rectangle("fill", 5, 7 + stamTxtHeight, stamTxtWidth * 2, stamTxtHeight)

    if data.player.dodgeAmount > data.player.dodgeMaxAmount / 3 * 2 then
        colors.set(colors.green, 0.5)
    end
    if data.player.dodgeAmount < data.player.dodgeMaxAmount / 3 * 2 then
        colors.set(colors.orange, 0.5)
    end
    if data.player.dodgeAmount < data.player.dodgeMaxAmount / 3 then
        colors.set(colors.red, 0.5)
    end

    love.graphics.rectangle("fill", 5, 7 + stamTxtHeight, stamTxtWidth * 2 * data.player.dodgeAmount / data.player.dodgeMaxAmount, stamTxtHeight)

    
    colors.set(colors.black, 0.7)
    love.graphics.rectangle("line", 5, 7 + stamTxtHeight, stamTxtWidth * 2, stamTxtHeight)


    -- drawing the attack bar --
    --[[
        the bar will only show up when the player will start charging it
        the bar will be separated in 3 section:
            - the first level
            - the second level
            - the third level
        each level will have a different color
        for each level of charge, the shoot will be different:
            - the first level will shoot a small ball with low speed and low damage
            - the second level will shoot a medium ball with medium speed and medium damage
            - the third level will shoot a big ball with high speed and high damage
        also, the attack cool down will be reduced if the player attack with a small charge, because the cool down is reducing the charge lvl to 0. 
        when it reach 0, it will be able to charge again.
        plus: a full charge will reduce the cool down time by 2.
    ]]

    colors.set(colors.white, 1)
    local attTxtWidth = data.player.attackTxt:getWidth()
    local attTxtHeight = data.player.attackTxt:getHeight()
    love.graphics.draw(data.player.attackTxt, screen.width / 2 - attTxtWidth / 2, 5)

    colors.set(colors.white, 0.3)
    love.graphics.rectangle("fill", screen.width / 2 - attTxtWidth * 1.5 / 2, 7 + attTxtHeight, attTxtWidth * 1.5, attTxtHeight)


    colors.set(colors.green, 0.5)
    if data.player.attackCharge >= data.player.attackMaxCharge * data.player.charge[2].chargeFactor then
        colors.set(colors.orange, 0.5)
    end
    if data.player.attackCharge >= data.player.attackMaxCharge * data.player.charge[3].chargeFactor then
        colors.set(colors.red, 0.5)
    end

    love.graphics.rectangle("fill", screen.width / 2 - attTxtWidth * 1.5 / 2, 7 + attTxtHeight, attTxtWidth * 1.5 * data.player.attackCharge / data.player.attackMaxCharge, attTxtHeight)

    colors.set(colors.black, 0.7)
    love.graphics.rectangle("line", screen.width / 2 - attTxtWidth * 1.5 / 2, 7 + attTxtHeight, attTxtWidth * 1.5, attTxtHeight)

end


function ui.unload()
end


return ui