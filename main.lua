
require("enemies")
require("collision")
function love.load()
  love.graphics.setBackgroundColor(128,128,128)
  player = {}
  player.x = 32
  player.y = 0
  player.xV = 0
  player.yV = 0
  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = {{1, 2, 2, 0, 2, 2, 1},
        {1, 2, 2, 0, 2, 2, 1},
        {1, 2, 2, 0, 2, 2, 1},
        {1, 2, 2, 0, 2, 2, 1},
        {1, 2, 2, 0, 2, 2, 1}}

  tileType = {0, 1, 0}
  enemies_load()

  tilesetImage = love.graphics.newImage("tileset.png")
  tilesetImage:setFilter("nearest", "linear")
  tileSize = 32

  -- street Yellow
  street1 = love.graphics.newQuad(1*tileSize, 18*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())
  --street
  street2 = love.graphics.newQuad(4*tileSize, 18*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())
  -- Brick
  Brick = love.graphics.newQuad(0*tileSize, 19*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())
end

function love.update(dt)
  if love.keyboard.isDown("w") then
    player.yV = player.yV - 1
  end
  if love.keyboard.isDown("s") then
    player.yV = player.yV + 1
  end
  if love.keyboard.isDown("a") then
    player.xV = player.xV - 1
  end
  if love.keyboard.isDown("d") then
    player.xV = player.xV + 1
  end

  if playerCollide(player.x + player.xV, player.y) then
    if player.xV > 0 then
      while playerCollide(player.x + 1, player.y) == false do
        player.x = player.x + 1
      end
    else
      while playerCollide(player.x - 1, player.y) == false do
        player.x = player.x - 1
      end
    end
    player.xV = 0
  end
  player.x = player.x + player.xV

  if playerCollide(player.x, player.y + player.yV) then
    if player.yV > 0 then
      while playerCollide(player.x, player.y + 1) == false do
        player.y = player.y + 1
      end
    else
      while playerCollide(player.x, player.y - 1) == false do
        player.y = player.y - 1
      end
    end
    player.yV = 0
  end
  player.y = player.y + player.yV

  player.xV = player.xV * 0.8
  player.yV = player.yV * 0.8

  camera.x = player.x
  camera.y = player.y

  for i = 1, #enemies do
    updateEnemyPath(i)
  end
end

function love.draw()
  love.graphics.translate(-camera.x + w/ 2, -camera.y + h / 2)
  for i, v in ipairs(map) do
    for i2 = 1, #v do
      if map[i][i2] == 1 then
          love.graphics.draw(tilesetImage, Brick,(i2 - 1)*tileSize, (i - 1)*tileSize)
      elseif map[i][i2] == 0 then
        love.graphics.draw(tilesetImage, street1,(i2 - 1)*tileSize, (i - 1)*tileSize)
      elseif map[i][i2] == 2 then
        love.graphics.draw(tilesetImage, street2,(i2 - 1)*tileSize, (i - 1)*tileSize)

      end
    end
  end
  love.graphics.rectangle("fill", player.x, player.y, 10, 10)

  -- draw enemies
  for i, v in ipairs(enemies) do
    love.graphics.rectangle("fill", v.x, v.y, 8, 8)
  end

  -- path test
  for i, v in ipairs(enemies) do
    for i2, v2 in ipairs(v.path) do
      love.graphics.rectangle("line", (v2[1]-1)*8, (v2[2]-1)*8, 8, 8)
    end
  end
end
