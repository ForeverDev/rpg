local sprites = {
    SPRITE_SIZE = 64;
    PADDING_SIZE = 16;
    SHEET_X = 64*10;
    SHEET_Y = 64*10;
    sheet = love.graphics.newImage("assets/sprite_sheet.png");
}

local function make_quad(x, y)
    return love.graphics.newQuad(
        sprites.PADDING_SIZE*(x + 1) + x*sprites.SPRITE_SIZE,
        sprites.PADDING_SIZE*(y + 1) + y*sprites.SPRITE_SIZE,
        sprites.SPRITE_SIZE,
        sprites.SPRITE_SIZE,
        sprites.SHEET_X,
        sprites.SHEET_Y
    )
end

sprites.grass = make_quad(0, 0)
sprites.dirt = make_quad(1, 0)
sprites.player = {}

-- load standing right animations
sprites.player.standing_right = {}
sprites.player.standing_right[1] = make_quad(2, 0)
sprites.player.standing_right[2] = make_quad(3, 0)
sprites.player.standing_right[3] = make_quad(4, 0)
sprites.player.standing_right[4] = make_quad(3, 0)

-- load standing left animations
sprites.player.standing_left = {}
sprites.player.standing_left[1] = make_quad(5, 0)
sprites.player.standing_left[2] = make_quad(6, 0)
sprites.player.standing_left[3] = make_quad(0, 1)
sprites.player.standing_left[4] = make_quad(6, 0)

return sprites
