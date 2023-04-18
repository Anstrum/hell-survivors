local player = {}


player.x = 0
player.hp = 100
player.maxHp = 100
player.speed = 600
player.radius = 30
player.shootCD = 1
player.shootTick = 1
player.shootReady = true
player.inMap = true
player.shootAngle = 0
player.shootList = {}

function player.load()
	math.randomseed(os.time())
	player.x = math.random(0 - map.radius / 100 * 40, map.radius / 100 * 40)
	player.y = math.random(0 - map.radius / 100 * 40, map.radius / 100 * 40)
end

function player.update(dt) 		

	player.inMap = (player.x * player.x + player.y * player.y - map.radius * map.radius) + player.radius <= 0

	---------------------
	-- Player Shoot CD --
	---------------------
	if not player.shootReady then
		player.shootTick = player.shootTick + 2 * dt
		if player.shootTick >= 1 then
			player.shootTick = 1
			player.shootReady = true
		end
	end
	---------------------
	-- Player Movement -- 
	---------------------
	local xMove = love.keyboard.isDown("q") or love.keyboard.isDown("d")
	local yMove = love.keyboard.isDown("z") or love.keyboard.isDown("s")


	if love.keyboard.isDown("z") then
		if xMove then
			player.y = player.y - player.speed * 0.7 * dt
		else
			player.y = player.y - player.speed * dt
		end
	end
	if love.keyboard.isDown("s") then
		if xMove then
			player.y = player.y + player.speed * 0.7 * dt
		else
			player.y = player.y + player.speed * dt
		end
	end
	if love.keyboard.isDown("q") then
		if yMove then
			player.x = player.x - player.speed * 0.7 * dt
		else
			player.x = player.x - player.speed * dt
		end
	end
	if love.keyboard.isDown("d") then
		if yMove then
			player.x = player.x + player.speed * 0.7 * dt
		else
			player.x = player.x + player.speed * dt
		end
	end

	player.shootAngle = player.getShootAngle()

end



function player.draw()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.circle("fill", screen.width / 2, screen.height / 2, player.radius * 0.8)
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.circle("line", screen.width / 2, screen.height / 2, player.radius * 0.8)
	if player.shootReady then
		love.graphics.setColor(0, 1, 0, 1)
	else
		love.graphics.setColor(0, 0, 1, 1)
	end
	love.graphics.circle("fill", screen.width / 2, screen.height / 2, player.radius * 0.76 * player.shootTick)
	player.drawHpBar()
end

function player.mousepressed(x, y, click)
	---------------------
	--  Player  Shoot  -- 
	---------------------
	if click == 1 then
		if player.shootReady then
			shoot.addShoot(player.x, player.y, player.getShootAngle(), true)
			player.shootReady = false
			player.shootTick = 0
		end
	end
end


function player.getShootAngle()
	local xDiff = mouse.x - screen.width / 2
	local yDiff = mouse.y - screen.height / 2

	local angle = math.atan2(xDiff, yDiff)

	angle = math.deg(angle)
	angle = 0 - angle + 90

	return angle
end

function player.takeDamage(amount) 
	player.hp = player.hp - amount
	if player.hp < 0 then
		player.hp = 0
	end
	debugSystem.addLog(DebugType.INFO, "Player took "..amount.." damage", false)
end


function player.drawHpBar()
	-- displaying bar
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.rectangle("fill", screen.width - 155, 5, 150, 20, 10)
	love.graphics.setColor(0, 1, 0, 1)
	love.graphics.rectangle("fill", screen.width - 155, 5, (150 / player.maxHp) * player.hp, 20, 10)
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.rectangle("line", screen.width - 155, 5, 150, 20, 10)

	--displaying text
	local textToDisplay = player.hp.." / "..player.maxHp
	local textWidth = love.graphics.getFont():getWidth(textToDisplay)
	local textHeight = love.graphics.getFont():getHeight(textToDisplay)

	love.graphics.setColor(0, 0, 0, 0.6)
	love.graphics.print(textToDisplay, screen.width - 155 + 150 / 2 - textWidth / 2, 5 + 20 / 2 - textHeight / 2)
end


return player