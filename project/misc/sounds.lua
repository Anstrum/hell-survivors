local sounds = {}

sounds.list = {}
sounds.soundsFolder = "assets/sounds/"

function sounds.update(dt)
    for i, v in pairs(sounds.list) do
        if v.isUpdating then
            if(v.source:getVolume() < v.targetVolume) then
                v.source:setVolume(v.source:getVolume() + v.updateSpeed * dt)
                if v.source:getVolume() > v.targetVolume then
                    v.source:setVolume(v.targetVolume)
                    v.isUpdating = false
                end
            elseif(v.source:getVolume() > v.targetVolume) then
                v.source:setVolume(v.source:getVolume() - (v.updateSpeed * dt))
                if v.source:getVolume() < v.targetVolume then
                    v.source:setVolume(v.targetVolume)
                    v.isUpdating = false
                end
            else
                v.isUpdating = false
            end
        end
    end
end

function sounds.add(fileName, name, volume, type)
    volume = volume or 1
    type = type or "stream"

    local mySound = {}
    mySound.name = name
    mySound.targetVolume = volume
    mySound.isUpdating = false
    mySound.type = type
    mySound.source = love.audio.newSource(sounds.soundsFolder .. fileName, type)
    mySound.source:setVolume(volume)
    sounds.list[name] = mySound

    logger.addLog("sound " .. name .. " added", false)
end

function sounds.play(name, isDuplicateAllowed)
    isDuplicateAllowed = isDuplicateAllowed or false

    if sounds.list[name] ~= nil then
        if isDuplicateAllowed then
            -- sounds.list[name].source:stop()
            sounds.list[name].source:play()
        else
            if sounds.list[name].source:isPlaying() then
                sounds.list[name].source:stop()
                sounds.list[name].source:play()
            else
                sounds.list[name].source:play()
            end
        end
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end

function sounds.stop(name, isProgressive, updateSpeed)
    if sounds.list[name] ~= nil then
        if isProgressive then
            sounds.list[name].targetVolume = 0
            sounds.list[name].updateSpeed = updateSpeed / 2 or 0.5
            sounds.list[name].isUpdating = true
        else
            sounds.list[name].source:stop()
        end
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end

function sounds.setVolume(name, volume, progressively, updateSpeed)
    if sounds.list[name] ~= nil then
        if progressively then
            sounds.list[name].targetVolume = volume
            sounds.list[name].updateSpeed = updateSpeed / 2 or 0.5
            sounds.list[name].isUpdating = true
        else
            sounds.list[name].source:setVolume(volume)
        end
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end

function sounds.getVolume(name)
    if sounds.list[name] ~= nil then
        return sounds.list[name].source:getVolume()
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end

function sounds.setLoop(name, isLoop)
    if sounds.list[name] ~= nil then
        sounds.list[name].source:setLoop(isLoop)
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end

function sounds.getLoop(name)
    if sounds.list[name] ~= nil then
        return sounds.list[name].source:isLooping()
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end

function sounds.delete(name)
    if sounds.list[name] ~= nil then
        sounds.list[name].source:stop()
        sounds.list[name].source:release()
        sounds.list[name] = nil
    else
        logger.addLog("sound " .. name .. " not found", true)
    end
end




return sounds