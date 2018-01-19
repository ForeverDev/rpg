local Animation = {}

active_animations = {}

function Animation.update_active_animations(t)
	for i, v in pairs(active_animations) do
		if v.active and (t - v.last_change > v.frame_pause) then
			v:advance()
			v.last_change = t
		end
	end	
end

function Animation:new(frames)

	if #frames == 0 or not frames then
		error("Animation:new requires a table of at least one quad")
	end

	local self = setmetatable({}, {__index = Animation})
	self.frames = frames
	self.index = 1
	self.frame_pause = 0.3
	self.last_change = love.timer.getTime()
	self.active = false
	
	-- store in active list
	active_animations[self] = self

	return self

end

function Animation:get_frame()
	return self.frames[self.index]
end

function Animation:rewind()
	self.index = 1
end

function Animation:play()
	self.active = true
end

function Animation:stop()
	self.active = false
	self:rewind()
end

function Animation:pause()
	self.active = false
end

function Animation:set_frame(n)
	self.index = n
	if self.index < 1 or self.index > #self.frames then
		error("animation index " .. n .. " out of range")
	end
end

function Animation:advance()
	self.index = self.index + 1
	if self.index > #self.frames then
		self.index = 1
	end
end

return Animation
