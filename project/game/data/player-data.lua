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


    -- dodge--
data.isDodging = nil
data.dodgeAmount = nil
data.dodgeMaxAmount = nil
-- recharge is delayed by 1s when the player is dodging --
data.dodgeRechargeTimer = nil -- the remaining time to begin the recharge --
data.dodgeRechargeCD = nil -- the recharge CD --
data.dodgeRechargeMultiplicator = nil

    -- player-sprite --
data.canvas = nil
data.angle = nil

    -- player attack --

data.isCharging = nil
data.attackCharge = nil
data.attackMaxCharge = nil
data.attackChargeMultiplicator = nil

data.charge = {}
    data.charge[1] = {}
    data.charge[1].speedReduction = nil
    data.charge[1].chargeFactor = nil
    data.charge[1].radius = nil
    data.charge[1].speed = nil
    data.charge[1].damage = nil

    data.charge[2] = {}
    data.charge[2].speedReduction = nil
    data.charge[2].chargeFactor = nil
    data.charge[2].radius = nil
    data.charge[2].speed = nil
    data.charge[2].damage = nil

    data.charge[3] = {}
    data.charge[3].speedReduction = nil
    data.charge[3].chargeFactor = nil
    data.charge[3].radius = nil
    data.charge[3].speed = nil
    data.charge[3].damage = nil

    -- player ui --
return data