local cursor = {}



function cursor.load()
    data.player.canvas = love.graphics.newCanvas(70, 70)
    data.player.angle = 0
end



--[[
        this update function will calculate the rotation of the cursor in function of the mouse position
        it will use atan2 that will return the angle between the x axis and the vector (dx, dy)

        NOTE: I still don't understand this function :')
]]
function cursor.update(dt)
    -- now we calculate the rotation of the cursor in function of the mouse position --
    local dx = mouse.x - screen.width / 2  -- différence en x entre la souris et le centre de l'écran
    local dy = mouse.y - screen.height / 2  -- différence en y entre la souris et le centre de l'écran

    data.player.angle = math.atan2(dy, dx) + math.pi / 2
end



--[[    
        this draw function will draw the cursor on the screen
        it will use a canvas to draw the cursor
]]
function cursor.draw()
    cursor.drawCanva()
    if data.player.isDodging then
        colors.set(colors.white, 0.5)
    else
        colors.set(colors.white, 1)
    end
    love.graphics.draw(data.player.canvas, screen.width / 2, screen.height / 2, data.player.angle, 1, 1, data.player.canvas:getWidth() / 2, data.player.canvas:getHeight() / 2)
end 



function cursor.unload()
    data.player.canvas = nil
end



--[[    
        this function will draw the cursor on a canvas
        it will use a canvas to draw the cursor
        then it will use a blend mode to "subtract" the inner circle of the cursor
        to obtain the color of the background of the map
]]
function cursor.drawCanva()
    love.graphics.setCanvas(data.player.canvas) -- création du canvas --
    love.graphics.clear() -- on le vide au préalable --

    -- Dessiner la "pleine lune" sur le canvas à la couleur du curseur voulu --
    love.graphics.setColor(colors.cursor)
    love.graphics.circle("fill", 35, 35, 25)
    
    -- this polygon will be used to draw the spike on the crescent moon -- 
    love.graphics.polygon("fill", 35, 5, 45, 15, 25, 15)

    -- on utilise une opération de mélange pour "soustraire" le cercle intérieur --
    love.graphics.setBlendMode("subtract")

    -- on calcule la couleur a enlever pour obtenir celle du fond de la map --
    local subtractColor = {colors.cursor[1] - colors.player[1], colors.cursor[2] - colors.player[2], colors.cursor[3] - colors.player[3], 1}
    if subtractColor[1] < 0 then subtractColor[1] = - subtractColor[1] end
    if subtractColor[2] < 0 then subtractColor[2] = - subtractColor[2] end
    if subtractColor[3] < 0 then subtractColor[3] = - subtractColor[3] end
    love.graphics.setColor(subtractColor)

    -- on dessine le cercle qui vient "soustraire" le cercle intérieur --
    love.graphics.circle("fill", 35, 60, 40)

    -- on remet le mode de mélange à normal --
    love.graphics.setBlendMode("alpha")
    colors.set(colors.white)

    -- Retour à l'écran normal --
    love.graphics.setCanvas()
end




return cursor