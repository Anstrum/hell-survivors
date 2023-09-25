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
data.dodgeAmount = nil
data.dodgeMaxAmount = nil

-- dodge recharge--
-- recharge is delayed by 1s when the player is dodging --
data.dodgeRechargeTimer = nil -- the remaining time to begin the recharge --
data.dodgeRechargeCD = nil -- the recharge CD --
data.dodgeRechargeMultiplicator = nil

    -- player-sprite --
data.canvas = nil
data.angle = nil

return data