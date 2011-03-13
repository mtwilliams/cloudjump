require 'class'

screen = class()

function screen:new(manager)
	self.manager = manager
end

function screen:update()
end

function screen:draw()
end

function screen:pop()
	self.manager:pop()
end