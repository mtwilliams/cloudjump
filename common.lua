berlin_sans_roman = nil
background_image = nil
logo_image = nil

function load_common()
	berlin_sans_roman = love.graphics.newFont("fonts/BerlinSans-Roman.ttf", 16)
	background_image = love.graphics.newImage("graphics/Background.png")
	logo_image = love.graphics.newImage("graphics/Logo.png")
end