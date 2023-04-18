local background = {}

	background.radius = 12000
	background.cellCount = 2000
	background.minCellSize = 50
	background.maxCellSize = 200

	background.cellList = {}

	function background.generate()
		for i = 1, background.cellCount do
			local myCell = {}
			myCell.color = {math.random() - 0.5, math.random() - 0.3, math.random(), math.random(1, 50) / 100 }
			myCell.radius = math.random(background.minCellSize, background.maxCellSize)
			myCell.x = math.random(0 - background.radius / 2, background.radius / 2)
			myCell.y = math.random(0 - background.radius / 2, background.radius / 2)

			table.insert(background.cellList, myCell)
		end
	end

	function background.draw(relativeX, relativeY) 
		for i = 1, #background.cellList do
			local myCell = background.cellList[i]
			love.graphics.setColor(myCell.color)
			love.graphics.circle("fill", myCell.x + relativeX, myCell.y + relativeY, myCell.radius)
		end
	end



return background