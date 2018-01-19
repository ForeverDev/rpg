SPRITES = dofile("sprite_handler.lua")
local Player = dofile("player.lua")
local Animation = dofile("animation.lua")

local player = Player:new()

function love.load()

end

function love.keypressed(key)
	if key == "d" then
		player:set_animation("standing_right")
	elseif key == "a" then
		player:set_animation("standing_left")
	end
end

function love.update(dt)
	Animation.update_active_animations(love.timer.getTime())	
end

function love.draw()
    love.graphics.clear(127, 209, 239)
	player:draw()

end
