require 'class'

screen_manager = class()

function screen_manager:new()
	self.screens = {}
end

function screen_manager:update()
	self.screens[#self.screens]:update()
end

function screen_manager:draw()
	self.screens[#self.screens]:draw()
end

function screen_manager:push(screen)
	table.insert(self.screens, screen)
end

function screen_manager:pop()
	table.remove(self.screens, #self.screens)
end

function screen_manager:mousepressed(x, y, button)
	self.screens[#self.screens]:mousepressed(x, y, button)
end

function screen_manager:mousereleased(x, y, button)
	self.screens[#self.screens]:mousereleased(x, y, button)
end

function screen_manager:keypressed(key, unicode)
	self.screens[#self.screens]:keypressed(key, unicode)
end

function screen_manager:keyreleased(key, unicode)
	self.screens[#self.screens]:keyreleased(key, unicode)
end