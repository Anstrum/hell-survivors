local player = {}


    player.controller = require("project/game/player/player-controller")
    player.sprite = require("project/game/player/player-sprite")
    player.ui = require("project/game/player/player-ui")

function player.load()
    player.controller.load()
    player.sprite.load()
end

function player.update(dt)
    player.controller.update(dt)
end

function player.draw()
    player.sprite.draw()
end


return player