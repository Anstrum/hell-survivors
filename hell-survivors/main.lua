io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

network = require("udp")

function love.load()
	network.load()
end


function love.update(dt)
	network.sendData("Hey")
end


function love.draw()
end

