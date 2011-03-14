require 'class'

screen = class()

function screen:new(manager)
	self.manager = manager
end

function screen:update()
end

function screen:draw()
end

function screen:mousepressed(x, y, button)
end

function screen:mousereleased(x, y, button)
end

function screen:keypressed(key, unicode)
end

function screen:keyreleased(key, unicode)
end

function screen:pop()
	self.manager:pop()
end