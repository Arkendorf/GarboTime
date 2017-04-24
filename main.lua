require("collision")
function love.load()
  love.graphics.setBackgroundColor(128,128,128)
  player = {}
  player.x = 0
  player.y = 0
  player.xV = 0
  player.yV = 0
  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = {{0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 1}}

  tilesetImage = love.graphics.newImage("tileset.png")
  tilesetImage:setFilter("nearest", "linear")
  tileSize = 32

  -- street
  steet = love.graphics.newQuad(8*tileSize, 11*tileSize, tileSize, tileSize,
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
end

function love.draw()
  love.graphics.translate(-camera.x + w/ 2, -camera.y + h / 2)
  for i, v in ipairs(map) do
    for i2 = 1, #v do
      if map[i][i2] == 1 then
        love.graphics.rectangle("fill", (i2 - 1) * tileSize, (i - 1) * tileSize, tileSize, tileSize)
      elseif map[i][i2] == 0 then
        love.graphics.draw(tilesetImage, steet,(i2 - 1)*tileSize, (i - 1)*tileSize)
      end
    end
  end
  love.graphics.rectangle("fill", player.x, player.y, 10, 10)
end
