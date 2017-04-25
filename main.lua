require("modules")
require("enemies")
require("collision")
require("shader")

function love.load()
  healthBar = 8

  love.graphics.setBackgroundColor(128,128,128)
  player = {}
  player.x = 32
  player.y = 0
  player.xV = 0
  player.yV = 0
  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = mapMaker({{1, 1},
                  {1, 1}})

  shader_load()
  enemies_load()
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

  if player.x < 0 then
    player.x = 0
    player.xV = 0
  elseif player.x > #map[1]*tileSize-8 then
    player.x = #map[1]*tileSize-8
    player.xV = 0
  end
  if player.y < 0 then
    player.y = 0
    player.yV = 0
  elseif player.y > #map*tileSize-8 then
    player.y = #map*tileSize-8
    player.yV = 0
  end


  player.xV = player.xV * 0.8
  player.yV = player.yV * 0.8

  camera.x = player.x
  camera.y = player.y

  enemies_update(dt)
  shader_update(dt)
  renderShader()
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (healthBar*32)/2, 0, healthBar*32, 32)
  love.graphics.setColor(255, 255, 255)

  love.graphics.push()
  love.graphics.translate(-camera.x + w/ 2, -camera.y + h / 2)
  love.graphics.setColor(255, 255, 255)

  for i, v in ipairs(map) do
    for i2 = 1, #v do

          love.graphics.draw(tilesetImage, tiles[map[i][i2]],(i2 - 1)*tileSize, (i - 1)*tileSize)

    end
  end
  -- draw player
    love.graphics.setColor(0, 255, 255)
    love.graphics.rectangle("fill", player.x, player.y, 8, 8)

  -- draw enemies
  for i, v in ipairs(enemies) do
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", v.x, v.y, 8, 8)
  end
  love.graphics.setColor(255, 255, 255)

  -- path test
  for i, v in ipairs(enemies) do
    for i2, v2 in ipairs(v.path) do
      love.graphics.rectangle("line", (v2[1]-1)*8, (v2[2]-1)*8, 8, 8)
    end
  end
  
  love.graphics.pop()
  love.graphics.setColor(255, 255, 255, 100)
  love.graphics.draw(shaderCanvas, 0, 0)
end
