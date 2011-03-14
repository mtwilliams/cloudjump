require 'screen'
require 'platform'
require 'player'

single_player = class(screen)

function single_player:new(manager)
	self.platforms = { }
	self.score = 0

	for i=0,10 do
		local startv = vector(math.random(800, 6000), math.random(200, 400))
		local endv = vector(startv.x + 400, startv.y)
		self.platforms[i] = platform(startv, endv)
	end
	
	-- Put a player on the platform
	self.player = player(425-27, self.platforms[0].a.y)
	self.player.velocity.y = -1
end

function single_player:update()
	if love.keyboard.isDown("left") then
		self.player.velocity.x = self.player.velocity.x - 0.005
	elseif love.keyboard.isDown("right") then
		self.player.velocity.x = self.player.velocity.x + 0.005
	end

	self.player.velocity.x = self.player.velocity.x * 0.99
	self.player.velocity.y = self.player.velocity.y + 0.0025
	
	for i=0,#self.platforms do
		self.platforms[i].a.x = self.platforms[i].a.x - 1
		self.platforms[i].b.x = self.platforms[i].b.x - 1
		
		if self.player.position.x >= self.platforms[i].a.x and self.player.position.x <= self.platforms[i].b.x then
			local distance = (self.player.position.y + 21) - self.platforms[i].a.y
			if distance <= 5 and distance > 0 then
				self.player.velocity.y = -self.player.velocity.y * 0.99
			end
		end
		
		if self.platforms[i].b.x < 0 then
			local startv = vector(math.random(800, 6000), math.random(200, 400))
			local endv = vector(startv.x + 400, startv.y)
			self.platforms[i] = platform(startv, endv)
			
			self.score = self.score + 1
		end
	end
	
	self.player:update()
	
	if self.player.position.y > 850 then
		self:pop()
	end
end

function single_player:draw()
	love.graphics.setLineWidth(2)

	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(background_image, 0, 0)
	
	for i=0,#self.platforms do
		self.platforms[i]:draw()
	end
	
	self.player:draw()
	
	love.graphics.print("Score: " .. self.score, 5, 5)
end

function single_player:keypressed(key, unicode)
end