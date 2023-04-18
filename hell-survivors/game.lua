local game = {}

map = require("map")
player = require("player")
shoot = require("shoots")

damageCD = 0.5
damageTick = 0.5
damageAmount = 10

function game.load()
	map.load()
	player.load()
end

function game.update(dt)
	player.update(dt)
	shoot.update(dt)
	map.update(dt)

	if not player.inMap then
		if damageTick <= 0 then
			player.takeDamage(damageAmount)
			damageTick = damageCD
		end
	end
	if damageTick <= 0 then
		damageTick = 0
	else
		damageTick = damageTick - 1 * dt
	end
end

function game.draw()
	map.draw(player.x, player.y)
	player.draw()
	shoot.draw()
end

function game.mousepressed(x, y, click) 
	player.mousepressed(x, y, click)
end


return game