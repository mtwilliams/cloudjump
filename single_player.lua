require 'screen'
require 'platform'
require 'player'

single_player = class(screen)

function single_player:new(manager)
	self.platforms = { }
	self.end_platform = 10
	
	self.score = 0

	local line_start = vector(math.random(800, 900), math.random(200, 400))
	for i=0,10 do
		local line_end = vector(line_start.x + 100, math.random(200, 400))
		self.platforms[i] = platform(line_start, line_end)

		line_start = line_end:copy()
	end
	
	-- Put a player on the platform
	self.player = player(425-27, 350)
	self.player.velocity.y = -1.35
end

function single_player:closestPointOnSeg(line, circle)
	local seg_v = vector(line.b.x - line.a.x, line.b.y - line.a.y)
	local circle_v = vector(circle.x - line.a.x, circle.y - line.a.y)
	local seg_v_unit = seg_v:normalized()
	local proj = circle_v:dot(seg_v_unit)
	
	-- Handle end points
	if proj <= 0 then
		return line.a:copy()
	elseif proj >= seg_v:mag() then
		return line.b:copy()
	end
	
	local proj_v = vector(seg_v_unit.x * proj, seg_v_unit.y * proj)
	
	return vector(proj_v.x + line.a.x, proj_v.y + line.a.y)
end

function single_player:testCircleLine(line, circle)
	local closest = self:closestPointOnSeg(line, circle)
	local dist_v = vector(circle.x - closest.x, circle.y - closest.y)
	
	if dist_v:mag() > circle.radius then
		return nil
	elseif dist_v:mag() <= 0 then
		-- Circle is exactly on the segment
		return nil
	end
	
	local dist_v_unit = dist_v:normalized()
	return vector(dist_v_unit.x * (circle.radius - dist_v:mag()), dist_v_unit.y * (circle.radius - dist_v:mag()))
end

function single_player:update()
	if love.keyboard.isDown("left") then
		self.player.velocity.x = self.player.velocity.x - 0.005
	elseif love.keyboard.isDown("right") then
		self.player.velocity.x = self.player.velocity.x + 0.005
	end

	self.player.velocity.x = self.player.velocity.x * 0.75
	self.player.velocity.y = self.player.velocity.y + 0.0025
	
	for i=0,#self.platforms do
		self.platforms[i].a.x = self.platforms[i].a.x - 1
		self.platforms[i].b.x = self.platforms[i].b.x - 1
		
		-- Don't check if where not inside the bounds
		if self.player.position.x >= self.platforms[i].a.x and self.player.position.x <= self.platforms[i].b.x then
			local distance = self:testCircleLine(self.platforms[i], {x = self.player.position.x, y = self.player.position.y, radius = 10})
			
			if distance then
				self.player.velocity.y = self.player.velocity.y * 0.75 + distance.y
			end
		end
		
		if self.platforms[i].b.x < 0 then
			local line_start = self.platforms[self.end_platform].b:copy()
			local line_end = vector(line_start.x + 100, math.random(200, 400))

			self.platforms[i] = platform(line_start, line_end)
			
			self.end_platform = i
			self.score = self.score + 1
		end
	end
	
	self.player:update()
	
	if self.player.position.y > 850 then
		self:pop()
	end
end

function single_player:draw()
	love.graphics.setLineWidth(2)

	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(background_image, 0, 0)
	
	for i=0,#self.platforms do
		self.platforms[i]:draw()
	end
	
	self.player:draw()
	
	love.graphics.print("Score: " .. self.score, 5, 5)
end