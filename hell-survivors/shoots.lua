local shoot = {}

shoot.list = {}

shoot.radius = player.radius * 0.35
shoot.speed = player.speed * 1.3

function shoot.addShoot(x, y, angle, friendly)

	local newShoot = {}
	newShoot.friendly = true
	newShoot.x = x
	newShoot.y = y
	newShoot.angle = angle

	if friendly then
		newShoot.color = {1, 0, 0, 1}
	else
		newShoot.color = {0, 1, 0, 1}
	end

	table.insert(shoot.list, newShoot)
end

function shoot.update(dt)
	if #shoot.list then
		for i = 1, #shoot.list do
			local myShoot = shoot.list[i]
			myShoot.x = myShoot.x + shoot.speed * math.cos(math.rad(myShoot.angle)) * dt
			myShoot.y = myShoot.y + shoot.speed * math.sin(math.rad(myShoot.angle)) * dt
		end
	end
end

function shoot.draw()
	love.graphics.setColor(1, 1, 1, 1)
	if #shoot.list < 1 then
		return 
	end
	for i = 1, #shoot.list do
		local myShoot = shoot.list[i]
		if myShoot.friendly then
		love.graphics.setColor(0, 1, 0, 1)
		else
			love.graphics.setColor(1, 0, 0, 1)
		end
		love.graphics.circle("fill", myShoot.x + map.relativeX, myShoot.y + map.relativeY, shoot.radius)
	end
	love.graphics.setColor(1, 1, 1, 1)
end


return shoot