local cursor = {}

cursor.canvas = nil 
cursor.subtractionColor = {}
cursor.angle = nil
function cursor.load()
    cursor.canvas = love.graphics.newCanvas(70, 70)
    cursor.subtractionColor = {1, 1, 0, 1}
    cursor.angle = 0
end

function cursor.update(dt, playerX, playerY)
    -- now we calculate the rotation of the cursor in function of the mouse position --
    local dx = mouse.x - playerX  -- différence en x entre la souris et le centre de l'écran
    local dy = mouse.y - playerY  -- différence en y entre la souris et le centre de l'écran

    cursor.angle = math.atan2(dy, dx) + math.pi / 2
end

function cursor.draw(playerX, playerY)
    cursor.drawCanva()
    colors.set(colors.white)
    love.graphics.draw(cursor.canvas, playerX, playerY, cursor.angle, 1, 1, cursor.canvas:getWidth() / 2, cursor.canvas:getHeight() / 2)
end 


--[[    Ici nous dessinerons le curseur sur un canvas 
        puis nous utiliserons une opération de mélange pour "soustraire" le cercle intérieur 
        afin de créer un effet de "croissant de lune"
]]
function cursor.drawCanva()
    love.graphics.setCanvas(cursor.canvas) -- création du canvas --
    love.graphics.clear() -- on le vide au préalable --

    -- Dessiner la "pleine lune" sur le canvas à la couleur du curseur voulu --
    love.graphics.setColor(colors.cursor)
    love.graphics.circle("fill", 35, 35, 25)
    
    love.graphics.polygon("fill", 35, 5, 45, 15, 25, 15)

    -- on utilise une opération de mélange pour "soustraire" le cercle intérieur --
    love.graphics.setBlendMode("subtract")

    -- on calcule la couleur a enlever pour obtenir celle du fond de la map --
    local subtractColor = {colors.cursor[1] - colors.mapBackground[1], colors.cursor[2] - colors.mapBackground[2], colors.cursor[3] - colors.mapBackground[3], 1}
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