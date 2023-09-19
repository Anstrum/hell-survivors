local game = {}

game.map = require("project/game/map/map")
game.ui = require("project/game/game-ui")
game.player = require("project/game/player/player")

function game.load()
    game.map.load(1000, 100)
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
    game.map.draw()
    game.player.draw()
end

function game.unload()
    game.map.unload()
    game.player.unload()
end

return game