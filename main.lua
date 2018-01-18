local sprites = dofile("sprite_handler.lua")
local SCALE_FACTOR = 1.5
local t = love.timer.getTime()
local index = 1
local d = 1

function love.load()

end

function love.update(dt)

end

function love.draw()
    love.graphics.clear(127, 209, 239)
    for i = 1, 10 do
        love.graphics.draw(sprites.sheet, sprites.grass, (i-1)*64, 300)
        for j = 1, 10 do
            love.graphics.draw(sprites.sheet, sprites.dirt, (i-1)*64, 300+j*64)
        end
    end

    love.graphics.draw(sprites.sheet, sprites.player.standing_right[index], 128, 300 - 64)
    love.graphics.draw(sprites.sheet, sprites.player.standing_left[index], 128+64, 300 - 64)
    if love.timer.getTime() - t > 0.2 then
        index = index + d
        if index > 3 then
            index = 3
            d = -1
        elseif index <= 0 then
            index = 1
            d = 1
        end
        t = love.timer.getTime()
    end
end
