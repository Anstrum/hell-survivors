local game = {}

game.map = require("project/game/map/map")
game.ui = require("project/game/game-ui")

function game.load()
    game.map.load(1000, 100)
end

function game.update(dt)
    game.map.update(dt)
end

function game.keypressed(key)
end

function game.draw()
    game.map.draw()
end

function game.unload()
    game.map.unload()
end

return game