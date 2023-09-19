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
    player.sprite.update(dt, player.controller.x, player.controller.y)
end

function player.draw()
    player.sprite.draw(player.controller.x, player.controller.y)
end


return player