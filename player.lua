require 'vector'

player = class()

function player:new(x, y)
	self.position = vector(x, y)
	self.velocity = vector(0, 0)
	self.frame = 0
	self.direction = 1
end

function player:update()
	self.position.x = self.position.x + self.velocity.x
	self.position.y = self.position.y + self.velocity.y
	
	if self.velocity.y < 0 then
		self.frame = 1
	else
		self.frame = 0
	end
	
	if self.velocity.x < 0 then
		self.direction = -1
	else
		self.direction = 1
	end
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.drawq(cow_sprite, cow_frames[self.frame], self.position.x, self.position.y, 0, self.direction, 1)
end