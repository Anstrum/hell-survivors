local ui = {}

function ui.load()
    data.player.uiFont = love.graphics.newFont("project/assets/fonts/cheese-burger.otf", 15)
    data.player.dodgeTxt = love.graphics.newText(data.player.uiFont, "Dodge bar")
end


function ui.update(dt)
end


function ui.draw()
    local txtWidth = data.player.dodgeTxt:getWidth()
    local txtHeight = data.player.dodgeTxt:getHeight()
    love.graphics.draw(data.player.dodgeTxt, 5 + txtWidth - txtWidth / 2, 5)

    colors.set(colors.white, 0.3)
    love.graphics.rectangle("fill", 5, 7 + txtHeight, txtWidth * 2, txtHeight)

    if data.player.dodgeAmount > data.player.dodgeMaxAmount / 3 * 2 then
        colors.set(colors.green, 0.5)
    end
    if data.player.dodgeAmount < data.player.dodgeMaxAmount / 3 * 2 then
        colors.set(colors.orange, 0.5)
    end
    if data.player.dodgeAmount < data.player.dodgeMaxAmount / 3 then
        colors.set(colors.red, 0.5)
    end

    love.graphics.rectangle("fill", 5, 7 + txtHeight, txtWidth * 2 * data.player.dodgeAmount / data.player.dodgeMaxAmount, txtHeight)

    
    colors.set(colors.black, 0.7)
    love.graphics.rectangle("line", 5, 7 + txtHeight, txtWidth * 2, txtHeight)
end


function ui.unload()
end


return ui