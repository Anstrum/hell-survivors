local player = {}

    player.controller = {}
        player.controller.x = nil
        player.controller.y = nil
        player.controller.speed = nil
        player.controller.speedMultiplicator = 1
        player.controller.angle = nil


    player.sprite = {}
        player.sprite.canvas = nil 
        player.sprite.subtractionColor = {}



function player.unload()
    for k, v in pairs(player) do
        player[k] = nil
    end
end

return player