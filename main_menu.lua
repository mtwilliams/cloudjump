require 'screen'

main_menu = class(screen)

function main_menu:new(manager)
	self.selection = 1
	self.max_selection = 5
	self.selections_widths = { }
	
	self.selections_widths[0] = berlin_sans_roman:getWidth("Single Player")
	self.selections_widths[1] = berlin_sans_roman:getWidth("Multiplayer")
	self.selections_widths[2] = berlin_sans_roman:getWidth("Options") + 20
	self.selections_widths[3] = berlin_sans_roman:getWidth("Credits") + 20
	self.selections_widths[4] = berlin_sans_roman:getWidth("Quit") + 27
	
	-- Clouds
	self.clouds = {}
	
	self:AddSomeClouds()
end

function main_menu:AddSomeClouds()
	local offset = #self.clouds
	for i=0,4 do
		self.clouds[offset + i] = { }
		self.clouds[offset + i].cloud = math.random(1, 2)
		self.clouds[offset + i].x = math.random(-2000, 0)
		self.clouds[offset + i].y = math.random(-400, 400)
	end
end

function main_menu:update()
	for i=0,#self.clouds do
		self.clouds[i].x = self.clouds[i].x + 0.5
		if self.clouds[i].x > 850 then
			self.clouds[i].cloud = math.random(1, 2)
			self.clouds[i].x = math.random(-2000, 0)
			self.clouds[i].y = math.random(-400, 400)
		end
	end
end

function main_menu:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(background_image, 0, 0)
	
	-- Draw all the clouds
	for i=0,#self.clouds do
		love.graphics.draw(cloud_images[self.clouds[i].cloud - 1], self.clouds[i].x, self.clouds[i].y)
	end
	
	love.graphics.draw(logo_image, 305, 147)

	love.graphics.setFont(berlin_sans_roman)
	
	love.graphics.setColor(133, 163, 174)
	love.graphics.printf("Single Player\nMultiplayer\nOptions\nCredits\nQuit", 0, 200, 850, "center")
	
	love.graphics.setColor(249, 251, 252)
	love.graphics.printf("Single Player\nMultiplayer\nOptions\nCredits\nQuit", 0, 199, 849, "center")
	
	love.graphics.drawq(cow_sprite, cow_frames[1], 425 - self.selections_widths[self.selection - 1], 200 + (self.selection - 1) * 19)
	
	love.graphics.setColor(255, 255, 255)
end

function main_menu:keypressed(key, unicode)
	if key == "up" then
		self.selection = self.selection - 1
		
		if self.selection < 1 then
			self.selection = self.max_selection
		end
	elseif key == "down" then
		self.selection = self.selection + 1
		
		if self.selection > self.max_selection then
			self.selection = 1
		end
	end
end