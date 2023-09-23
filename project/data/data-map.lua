local map = {}

    map.background = {}
        map.background.stars = {}
        map.background.bubbles = {}
        map.background.baseRadius = nil


    map.bounds = {}
        map.bounds.radius = nil
        map.bounds.decreaseSpeed = nil
        map.bounds.displayBounds = true


function map.unload()
    for k, v in pairs(map) do
        map[k] = nil
    end
end

return map