require 'screen'

main_menu = class(screen)

function main_menu:update()
end

function main_menu:draw()
	love.graphics.draw(background_image, 0, 0)
	love.graphics.draw(logo_image, 305, 147)
	
	love.graphics.setFont(berlin_sans_roman)
	
	
	love.graphics.setColor(133, 163, 174)
	love.graphics.printf("Single Player\nMultiplayer\nOptions\nCredits\nQuit", 0, 200, 850, "center")
	
	love.graphics.setColor(249, 251, 252)
	love.graphics.printf("Single Player\nMultiplayer\nOptions\nCredits\nQuit", 0, 199, 849, "center")
	
	love.graphics.setColor(255, 255, 255)
end