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