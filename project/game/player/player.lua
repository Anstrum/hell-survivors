local player = {}

    player.x = 0
    player.y = 0

function player.load()
    player.x = screen.width / 2
    player.y = screen.height / 2
    player.cursor.load()
end

function player.update(dt)
    player.cursor.update(dt, player.x, player.y)
end

function player.draw()
    player.cursor.draw(screen.width / 2, screen.height / 2)
end

function player.createCursor()
end


return player