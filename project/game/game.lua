local game = {}

game.map = require("project/game/map/map")
game.player = require("project/game/player/player")

function game.load()
    game.map.load(10000, 200)
    game.player.load()
end

function game.update(dt)
    game.map.update(dt)
    game.player.update(dt)
end

function game.keypressed(key)
end

function game.draw()
    love.graphics.setBlendMode("alpha")
    game.map.draw(game.player.controller.x, game.player.controller.y)
    game.player.draw()
end

function game.unload()
    game.map.unload()
    game.player.unload()
end

return game