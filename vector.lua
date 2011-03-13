require 'class'

vector = class()

function vector:new(x, y)
	self.x = x
	self.y = y
end

function vector:rotate(angle)
	-- Convert to radians
	local radians = angle * (3.14159265 / 180)
	
	self.x = (self.x * math.cos(radians)) - (self.y * math.sin(radians))
	self.y = (self.y * math.cos(radians)) - (self.x * math.sin(radians))
end

function vector:mag()
	return math.sqrt(self:dot(self))
end

function vector:normalize()
	local magnitude = self:mag()
	self.x = self.x / magnitude
	self.y = self.y / magnitude
end

function vector:normalized()
	local magnitude = self:mag()
	return vector(self.x / magnitude, self.y / magnitude)
end

function vector:dot(v)
	return self.x * v.x + self.y * v.y
end

function vector:cross(v)
	return self.x * v.y - self.y * v.x
end

function vector:__add(v)
	return vector(self.x + v.x, self.y + v.y)
end

function vector:__sub(v)
	return vector(self.x - v.x, self.y - v.y)
end

function vector:__mul(other)
	if type(other) == "number" then
		return vector(self.x * other, self.y * other)
	end
	
	return vector(self.x * other.x, self.y * other.y)
end

function vector:__div(other)
	if type(other) == "number" then
		return vector(self.x / other, self.y / other)
	end
	
	return vector(self.x / other.x, self.y / other.y)
end

function vector:__eq(v)
	return self.x == v.x and self.y == v.y
end