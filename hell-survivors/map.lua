local map = {}

	map.background = require("background")

	map.radius = 10000
	map.reduceSpeed = 150
	map.relativeX = 0
	map.relativeY = 0
	map.deleted = false

function map.load() 
	map.background.generate()
end

function map.update(dt)
	if not map.deleted then
		map.radius = map.radius - map.reduceSpeed * dt
	end
	if map.radius < 0 then
		map.deleted = true
		map.radius = 0
	end
	map.relativeX = 0 - player.x + screen.width / 2
	map.relativeY = 0 - player.y + screen.height / 2
end

function map.draw(playerX, playerY)

	--------------
	-- MAP DRAW --
	--------------
	love.graphics.setColor(1, 0.3, 0.3, 1)
	love.graphics.circle("fill", map.relativeX, map.relativeY, 5000000)
	if not map.deleted then
		love.graphics.setColor(0.6, 0.6, 1, 1)
		love.graphics.circle("fill", map.relativeX, map.relativeY, map.radius)

		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.circle("line", map.relativeX, map.relativeY, map.radius)
		love.graphics.circle("line", map.relativeX, map.relativeY, map.radius + 1)
		love.graphics.circle("line", map.relativeX, map.relativeY, map.radius + 2)
		love.graphics.circle("line", map.relativeX, map.relativeY, map.radius + 3)
		love.graphics.circle("line", map.relativeX, map.relativeY, map.radius + 4)
	end
	map.background.draw(map.relativeX, map.relativeY)

	if player.inMap then
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.print("player in map", 5, 5)
	else
		love.graphics.setColor(1, 0, 0, 1)
		love.graphics.print("player out of map", 5, 5)
	end
end

return map 