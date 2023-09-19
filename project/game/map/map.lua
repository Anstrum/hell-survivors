local map = {}


map.background = require("project/game/map/map-background")
map.bounds = require("project/game/map/map-bounds")


function map.load(radius, decreaseSpeed)
    map.bounds.load(radius, decreaseSpeed)
    map.background.load(radius)
end

function map.update(dt)
    map.bounds.update(dt)
end

function map.draw()
    map.background.draw(map.bounds.radius)
    map.bounds.draw()
end

function map.unload()
    map.background.unload()
    map.bounds.unload()
end


return map