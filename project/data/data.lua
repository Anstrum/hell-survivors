data = {}

data.map = require("project/data/data-map")
data.player = require("project/data/data-player")

function data.unload()
    for k, v in pairs(data) do
        data[k].unload()
    end
end