local menu = {}


	menu.title = nil
	menu.statusFont = love.graphics.newFont(20)
	menu.statusTextFont = love.graphics.newFont(15)

	menu.titleScale = 1
	menu.titleScaleMin = 0.95
	menu.titleScaleMax = 1.05
	menu.titleScaleGrow = false

	function menu.load()
		menu.title = love.graphics.newText(font.getFont("title").font, "Hell Survivors")
	end

	function menu.update(dt)
		if menu.titleScaleGrow then
			menu.titleScale = menu.titleScale + 0.1 * dt
		else
			menu.titleScale = menu.titleScale - 0.1 * dt
		end
		if menu.titleScale > menu.titleScaleMax or menu.titleScale < menu.titleScaleMin then
			menu.titleScaleGrow = not menu.titleScaleGrow
		end
	end


	function menu.keyPressed(key)
		if key == "space" then
			if not client.connected then
				client.connect()
			else
				client.searchLobby()
			end
		end
	end


	function menu.draw()

		-------------------
		-- drawing title --
		-------------------

		love.graphics.setColor(colors.menu.title)
		love.graphics.draw(menu.title, screen.width / 2 - menu.title:getWidth() * menu.titleScale / 2, 50 - menu.title:getHeight() * menu.titleScale / 2, 0, menu.titleScale, menu.titleScale)
		


		-------------------------------
		-- drawing connection status --
		-------------------------------

		love.graphics.setColor(colors.white)
		local statusText = love.graphics.newText(menu.statusFont, "Statut: ")
		local statusSpace = 5
		local statusStatus = nil
		if client.connected then
			statusStatus = love.graphics.newText(menu.statusFont, "Connected")
		else
			statusStatus = love.graphics.newText(menu.statusFont, "Disconnected")
		end

		love.graphics.draw(statusText, screen.width / 2 - (statusText:getWidth() + statusStatus:getWidth() + statusSpace) / 2, screen.height / 4 - 40)
		if client.connected then
			love.graphics.setColor(colors.green)
		else
			love.graphics.setColor(colors.red)
		end
		love.graphics.draw(statusStatus, screen.width / 2 - ( statusText:getWidth() + statusStatus:getWidth() + statusSpace) / 2 + statusText:getWidth(), screen.height / 4 - 40)



		---------------------------------
		-- drawing connection tutorial --
		---------------------------------
		if not client.connected then
			local txt1 = love.graphics.newText(menu.statusTextFont, "Pour te connecter, appuie sur espace avec le token dans le presse papier.")
			local txt2 = love.graphics.newText(menu.statusTextFont, "Si tu n'as pas de compte, il te suffit d'aller sur le site de Hell Survivors.")
			local txt3 = love.graphics.newText(menu.statusTextFont, "Une fois connecté, le token sera automatiquement envoyé dans ton presse papier.")


			love.graphics.setColor(colors.menu.title)
			love.graphics.rectangle("fill", screen.width / 2 - txt3:getWidth() / 2 - 20, screen.height / 3 - 20, txt3:getWidth() + 40, txt3:getHeight() + 80, 10)
			love.graphics.setColor(colors.menu.border)
			love.graphics.rectangle("line", screen.width / 2 - txt3:getWidth() / 2 - 20, screen.height / 3 - 20, txt3:getWidth() + 40, txt3:getHeight() + 80, 10)
			love.graphics.rectangle("line", screen.width / 2 - txt3:getWidth() / 2 - 21, screen.height / 3 - 21, txt3:getWidth() + 42, txt3:getHeight() + 82, 10)


			love.graphics.setColor(colors.white)
			love.graphics.draw(txt1, screen.width / 2 - txt1:getWidth() / 2, screen.height / 3)
			love.graphics.draw(txt2, screen.width / 2 - txt2:getWidth() / 2, screen.height / 3 + 20)
			love.graphics.draw(txt3, screen.width / 2 - txt3:getWidth() / 2, screen.height / 3 + 40)
		else

			


			local txt1 = love.graphics.newText(menu.statusTextFont, "Maintenant que vous êtes connecté, vous pouvez trouver une partie.")
			local txt2 = love.graphics.newText(menu.statusTextFont, "Appuyez sur espace quand vous serez prêt à rejoindre un serveur.")
			local txt3 = love.graphics.newText(menu.statusTextFont, "Voici une explication rapide sur le principe du jeu:")
			local txt4 = love.graphics.newText(menu.statusTextFont, "Hell Survivors est un jeu dans lequel vous devrez survivre.")
			local txt5 = love.graphics.newText(menu.statusTextFont, "Vous incarnerez une boule qui peut se déplacer avec z, q, s et d.")
			local txt6 = love.graphics.newText(menu.statusTextFont, "Vous pouvez tirer sur les autres joueurs avec le clic gauche de la souris.")
			local txt7 = love.graphics.newText(menu.statusTextFont, "La carte rétrécit très très vite donc vous devez survivre et être le dernier joueur en vie.")
			local txt8 = love.graphics.newText(menu.statusTextFont, "Un battle royale en sois.")
			local txt9 = love.graphics.newText(menu.statusTextFont, "Bon courage ! Vous en aurez besoins !")


			love.graphics.setColor(colors.menu.title)
			love.graphics.rectangle("fill", screen.width / 2 - txt7:getWidth() / 2 - 20, screen.height / 3 - 20, txt7:getWidth() + 40, txt3:getHeight() + 220, 10)

			love.graphics.setColor(colors.menu.border)
			love.graphics.rectangle("line", screen.width / 2 - txt7:getWidth() / 2 - 20, screen.height / 3 - 20, txt7:getWidth() + 40, txt3:getHeight() + 220, 10)
			love.graphics.rectangle("line", screen.width / 2 - txt7:getWidth() / 2 - 21, screen.height / 3 - 21, txt7:getWidth() + 42, txt3:getHeight() + 222, 10)


			love.graphics.setColor(colors.white)

			love.graphics.draw(txt1, screen.width / 2 - txt1:getWidth() / 2, screen.height / 3)
			love.graphics.draw(txt2, screen.width / 2 - txt2:getWidth() / 2, screen.height / 3 + 20)
			love.graphics.draw(txt3, screen.width / 2 - txt3:getWidth() / 2, screen.height / 3 + 40)
			love.graphics.draw(txt4, screen.width / 2 - txt4:getWidth() / 2, screen.height / 3 + 60)
			love.graphics.draw(txt5, screen.width / 2 - txt5:getWidth() / 2, screen.height / 3 + 80)
			love.graphics.draw(txt6, screen.width / 2 - txt6:getWidth() / 2, screen.height / 3 + 100)
			love.graphics.draw(txt7, screen.width / 2 - txt7:getWidth() / 2, screen.height / 3 + 120)
			love.graphics.draw(txt8, screen.width / 2 - txt8:getWidth() / 2, screen.height / 3 + 150)
			love.graphics.draw(txt9, screen.width / 2 - txt9:getWidth() / 2, screen.height / 3 + 180)
		end

	end



return menu