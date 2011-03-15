berlin_sans_roman = nil
background_image = nil
logo_image = nil
cow_sprite = nil
cow_frames = {}
cloud_images = {}
http = require("socket.http")

function load_common()
	berlin_sans_roman = love.graphics.newFont("fonts/BerlinSans-Roman.ttf", 16)
	background_image = love.graphics.newImage("graphics/Background.png")
	logo_image = love.graphics.newImage("graphics/Logo.png")
	cow_sprite = love.graphics.newImage("graphics/Cow.png")
	
	cow_frames[0] = love.graphics.newQuad(0, 0, 27, 21, 54, 21)
	cow_frames[1] = love.graphics.newQuad(27, 0, 27, 21, 54, 21)
	
	cloud_images[0] = love.graphics.newImage("graphics/Cloud_1.png")
	cloud_images[1] = love.graphics.newImage("graphics/Cloud_2.png")
end