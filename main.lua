require 'common'
require 'screen_manager'
require 'main_menu'

local manager = screen_manager()

function love.load()
	load_common()
	
	manager:push(main_menu(manager))
end

function love.update()
	manager:update()
end

function love.draw()
	manager:draw()
end

function love.mousepressed(x, y, button)
	manager:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	manager:mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	manager:keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	manager:keyreleased(key, unicode)
end

function love.focus(f)
	if not f then
	else
	end
end

function love.quit()
end
