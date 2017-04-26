require("modules")
require("enemies")
require("collision")
require("shader")
require("explosion")
require("moremath")
require("vehicle")

function love.load()
  healthBar = 8

  love.graphics.setBackgroundColor(128,128,128)
  player = {}
  player.x = 20 * 32
  player.y = 0
  player.xV = 0
  player.yV = 0
  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = mapMaker({{1, 1},
                  {1, 1}})

  shader_load()
  enemies_load()
  vehicles_load()
end

function love.update(dt)
  if inUse < 1 then
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
    if collideWithMap(player.x + player.xV, player.y, 8, 8, "player") then
      if player.xV > 0 then
        while collideWithMap(player.x + 1, player.y, 8, 8, "player") == false do
          player.x = player.x + 1
        end
      else
        while collideWithMap(player.x - 1, player.y, 8, 8, "player") == false do
          player.x = player.x - 1
        end
      end
      player.xV = 0
    end
    player.x = player.x + player.xV

    if collideWithMap(player.x, player.y + player.yV, 8, 8, "player") then
      if player.yV > 0 then
        while collideWithMap(player.x, player.y + 1, 8, 8, "player") == false do
          player.y = player.y + 1
        end
      else
        while collideWithMap(player.x, player.y - 1, 8, 8, "player") == false do
          player.y = player.y - 1
        end
      end
      player.yV = 0
    end
    player.y = player.y + player.yV
  else
    player.x = vehicles[inUse].x
    player.y = vehicles[inUse].y
  end
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

  for i, v in ipairs(vehicles) do
    if advancedCollision(player.x+4, player.y+4, 8, 8, 0, v.x, v.y, v.w, v.h, v.angle) then
      inUse = i
    end
  end

  enemies_update(dt)
  shader_update(dt)
  vehicles_update(dt)
  renderShader()

  if love.keyboard.isDown("space") then
    inUse = 0
  end
end

function love.draw()
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
    love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
  end

  -- draw vehicles
  for i, v in ipairs(vehicles) do
    love.graphics.setColor(255, 255, 255)
    if v.type == 1 then
      love.graphics.draw(vehicleImg[1], v.x, v.y, v.angle, 1, 1, v.w/2, v.h/2)
    elseif v.type == 2 then
      love.graphics.draw(vehicleImg[2], v.x, v.y, v.angle, 1, 1, v.w/2, v.h/2)
    elseif v.type == 3 then
      love.graphics.draw(vehicleImg[3], v.x, v.y, v.angle, 1, 1, v.w/2, v.h/2)
    else
      love.graphics.draw(vehicleImg[4], v.x, v.y, v.angle, 1, 1, v.w/2, v.h/2)
    end
  end
  love.graphics.setColor(255, 255, 255)

  love.graphics.pop()
  love.graphics.setColor(255, 255, 255, 100)
  love.graphics.draw(shaderCanvas, 0, 0)

  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (healthBar*32)/2, 0, healthBar*32, 32)
  if inUse > 0 then
      love.graphics.setColor(200, 200, 200)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (vehicles[inUse].hp*32)/2, 32, vehicles[inUse].hp*32, 16)
  end
  love.graphics.setColor(255, 255, 255)

  love.graphics.print(tostring(advancedCollideWithMap(vehicles[1].x, vehicles[1].y, vehicles[1].w, vehicles[1].h, vehicles[1].angle, "vehicle", 1)))
end
