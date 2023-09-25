local player = {}


    player.controller = require("project/game/player/player-controller")
    player.sprite = require("project/game/player/player-sprite")
    player.ui = require("project/game/player/player-ui")

function player.load()
    player.controller.load()
    player.sprite.load()
    player.ui.load()
end

function player.update(dt)
    player.controller.update(dt)
    player.ui.update(dt)
end

function player.draw()
    player.sprite.draw()
    player.ui.draw()
end

function player.unload()
    player.controller.unload()
    player.sprite.unload()
    player.ui.unload()
end


return player