local canvas = love.graphics.newCanvas(70, 70)

function love.draw()
    love.graphics.setColor(1, 1, 1, 1)
    -- Préparation du canvas
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- Dessiner la "pleine lune" sur le canvas
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.circle("fill", 35, 35, 25)
    
    local tip_x, tip_y = 25 + 25 * math.cos(math.pi / 4), 25 - 25 * math.sin(math.pi / 4)
    love.graphics.polygon("fill", 35, 5, 45, 15, 25, 15)

    -- Utiliser une opération de mélange pour "soustraire" le cercle intérieur
    love.graphics.setBlendMode("subtract")
    love.graphics.setColor(1, 1, 0, 1)  -- blanc
    love.graphics.circle("fill", 35, 60, 40)
    love.graphics.setBlendMode("alpha")
    -- Retour à l'écran normal
    love.graphics.setCanvas()

    
    love.graphics.setColor(0, 0, 1, 1)
    love.graphics.rectangle("fill", 0, 0, 800, 600)
    
    love.graphics.setColor(0.3, 0.8, 1, 1)
    
    -- Dessiner le canvas sur l'écran
    love.graphics.draw(canvas, 375, 275)
end