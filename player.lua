local Animation = dofile("animation.lua")

local Player = {}

function Player:new()

	local self = setmetatable({}, {__index = Player})
	self.animations = {
		standing_right = Animation:new(SPRITES.player.standing_right);
		standing_left  = Animation:new(SPRITES.player.standing_left);
	}
	self.current_animation = self.animations.standing_right
	self.x = 0
	self.y = 0
	self:set_animation("standing_right")

	return self

end

function Player:set_animation(anim)
	self.current_animation = self.animations[anim]
	self.current_animation:rewind()
	self.current_animation:play()
end

function Player:draw()
	love.graphics.draw(SPRITES.sheet, self.current_animation:get_frame(), self.x, self.y)
end

return Player
