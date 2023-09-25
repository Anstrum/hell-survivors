local data = {}

--[[
        in these files we store every data we should require between files
        this allow to have an easy access to data from anywhere
]]


    -- player-controller --
data.x = nil
data.y = nil
data.speed = nil
data.speedMultiplicator = nil
data.isDodging = nil
data.dodgeTimer = nil
data.dodgeDuration = nil
data.dodgeCD = nil
data.dodgeCDTimer = nil


    -- player-sprite --
data.canvas = nil
data.angle = nil

return data