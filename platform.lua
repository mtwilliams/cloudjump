require 'class'
require 'vector'

platform = class()

function platform:new(a, b)
	self.a = a
	self.b = b
end

function platform:getCollisionOffset(sphere)
end

function platform:draw()
	love.graphics.line(self.a.x, self.a.y, self.b.x, self.b.y)
end