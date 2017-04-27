tileType = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 1, [6] = 0, [7] = 0, [8] = 0, [9] = 1, [10] = 0, [11]= 1, [12] = 0,
            [13] = 0, [14] = 0, [15] = 0, [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0, [21]=1, [22]=1}


tilesetImage = love.graphics.newImage("tileset.png")
tilesetImage:setFilter("nearest", "linear")
tileSize = 32

tiles = {}
-- street Yellow
tiles[0] = love.graphics.newQuad(1*tileSize, 18*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
--street
tiles[2] = love.graphics.newQuad(4*tileSize, 18*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- Brick
tiles[1] = love.graphics.newQuad(10*tileSize, 0*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- side walk
tiles[3] = love.graphics.newQuad(0*tileSize, 20*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- street Yellow 2
tiles[4] = love.graphics.newQuad(0*tileSize, 18*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- vent
tiles[5] = love.graphics.newQuad(11*tileSize, 19*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
--ceil
tiles[6] = love.graphics.newQuad(8*tileSize, 12*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[7] = love.graphics.newQuad(7*tileSize, 1*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[8] = love.graphics.newQuad(7*tileSize, 2*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[9] = love.graphics.newQuad(12*tileSize, 1*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
blocks = {}

tiles[10] = love.graphics.newQuad(9*tileSize, 13*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[11] = love.graphics.newQuad(5*tileSize, 0*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[12] = love.graphics.newQuad(8*tileSize, 2*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[13] = love.graphics.newQuad(8*tileSize, 3*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[14] = love.graphics.newQuad(9*tileSize, 2*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[15] = love.graphics.newQuad(9*tileSize, 3*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[16] = love.graphics.newQuad(3*tileSize, 1*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[17] = love.graphics.newQuad(10*tileSize, 2*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[18] = love.graphics.newQuad(8*tileSize, 10*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[19] = love.graphics.newQuad(8*tileSize, 0*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[20] = love.graphics.newQuad(4*tileSize, 0*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[21] = love.graphics.newQuad(6*tileSize, 7*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[21] = love.graphics.newQuad(3*tileSize, 9*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

tiles[22] = love.graphics.newQuad(12*tileSize, 19*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())

blocks[1] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

  blocks[2] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 8, 8, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 9, 9, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 8, 8, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 8, 8, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 9, 9, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 8, 8, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 1, 2, 2, 0},
        {2, 2, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

  blocks[3] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 2, 2, 2, 2, 2, 2, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 9, 9, 9, 9, 9, 9, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 9, 2, 2, 2, 2, 9, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 9, 2, 9, 9, 2, 9, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 9, 2, 9, 9, 2, 9, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 9, 2, 2, 2, 2, 9, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 9, 9, 9, 9, 9, 9, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 2, 2, 2, 2, 2, 2, 2, 2, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 1, 2, 2, 0},
        {2, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

  blocks[4] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 1, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 12, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 14, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 20, 20, 20, 20, 20, 20, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 20, 20, 20, 20, 20, 20, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 20, 20, 20, 20, 20, 20, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 20, 20, 20, 20, 20, 20, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 20, 20, 20, 20, 20, 20, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 20, 20, 20, 20, 20, 20, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 18, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 17, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 17, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 13, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 15, 11, 1, 2, 2, 0},
        {2, 2, 1, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 1, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

  blocks[5] = {{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0},
  {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0},
  {2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,0},
  {2,2,1,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,21,1,2,2,0},
  {2,2,1,21,10,10,10,10,10,10,22,20,20,22,10,10,10,10,10,10,21,1,2,2,0},
  {2,2,1,21,10,6,6,6,6,10,22,3,3,22,10,6,6,6,6,10,21,1,2,2,0},
  {2,2,1,21,10,6,6,6,6,10,22,20,20,22,10,6,6,6,6,10,21,1,2,2,0},
  {2,2,1,21,10,6,6,6,6,10,22,3,3,22,10,6,6,6,6,10,21,1,2,2,0},
  {2,2,1,21,10,10,10,10,10,10,22,20,20,22,10,10,10,10,10,10,21,1,2,2,0},
  {2,2,1,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,21,1,2,2,0},
  {2,2,1,21,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,1,2,2,0},
  {2,2,1,21,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,1,2,2,0},
  {2,2,1,21,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,1,2,2,0},
  {2,2,1,21,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,1,2,2,0},
  {2,2,1,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,21,1,2,2,0},
  {2,2,1,21,10,10,10,10,10,10,22,20,20,22,10,10,10,10,10,10,21,1,2,2,0},
  {2,2,1,21,10,6,6,6,6,10,22,3,3,22,10,6,6,6,6,10,21,1,2,2,0},
  {2,2,1,21,10,6,6,6,6,10,22,20,20,22,10,6,6,6,6,10,21,1,2,2,0},
  {2,2,1,21,10,6,6,6,6,10,22,3,3,22,10,6,6,6,6,10,21,1,2,2,0},
  {2,2,1,21,10,10,10,10,10,10,22,20,20,22,10,10,10,10,10,10,21,1,2,2,0},
  {2,2,1,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,21,1,2,2,0},
  {2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,0},
  {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0},
  {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0},
  {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2}}

  blocks[6] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

  blocks[7] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

  blocks[8] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

function mapMaker(blockList)
  combinedLines = {}
  for i = 1, #blockList do
    combinedLine = {}
    for i2 = 1, #blockList[1] do
      if i2 == 1 then
        combinedLine = blocks[blockList[i][i2]]
      else
        combinedLine = addBlocksH(combinedLine, blocks[blockList[i][i2]])
      end
    end
    combinedLines[#combinedLines+1] = combinedLine
  end
  for i = 1, #combinedLines do
    if i == 1 then
      map = combinedLines[i]
    else
      map = addBlocksV(map, combinedLines[i])
    end
  end
  return map
end

function tableConcat (t1, t2)
  newTable = {}
  tables = {t1, t2}
  for i=1,2 do
    for i,v in ipairs(tables[i]) do
      newTable[#newTable+1] = v
    end
  end
  return newTable
end

function addBlocksH(block1, block2)
  combined = {}
  for i = 1, #block1 do
    combined[i] = tableConcat(block1[i], block2[i])
  end
  return combined
end

function addBlocksV(block1, block2)
  combined = tableConcat(block1, block2)
  return combined
end
