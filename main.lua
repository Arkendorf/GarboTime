require("bullet")
require("modules")
require("enemies")
require("collision")
require("shader")
require("explosion")
require("moremath")
require("vehicle")

function love.load()

  love.graphics.setBackgroundColor(128,128,128)
	player = {x=32, y=0, xV = 0, yV = 0, w = 8, h = 8, hp = 8, ammo = 20}
  menu = true

  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = mapMaker({{1, 1},
                {1, 1}})

  shader_load()
  enemies_load()
  bullet_load()
  vehicles_load()
end

function love.update(dt)
  if inUse < 1 then
    if love.keyboard.isDown("w") then
      player.yV = player.yV - dt * 24
    end
    if love.keyboard.isDown("s") then
      player.yV = player.yV + dt * 24
    end
    if love.keyboard.isDown("a") then
      player.xV = player.xV - dt * 24
    end
    if love.keyboard.isDown("d") then
      player.xV = player.xV + dt * 24
    end
    if collideWithMap(player.x + player.xV, player.y, player.w, player.h, "player") then
      if player.xV > 0 then
        while collideWithMap(player.x + 1, player.y, player.w, player.h, "player") == false do
          player.x = player.x + 1
        end
      else
        while collideWithMap(player.x - 1, player.y, player.w, player.h, "player") == false do
          player.x = player.x - 1
        end
      end
      player.xV = 0
    end
    player.x = player.x + player.xV

    if collideWithMap(player.x, player.y + player.yV, player.w, player.h, "player") then
      if player.yV > 0 then
        while collideWithMap(player.x, player.y + 1, player.w, player.h, "player") == false do
          player.y = player.y + 1
        end
      else
        while collideWithMap(player.x, player.y - 1, player.w, player.h, "player") == false do
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
  elseif player.x > #map[1]*tileSize-player.w then
    player.x = #map[1]*tileSize-player.w
    player.xV = 0
  end
  if player.y < 0 then
    player.y = 0
    player.yV = 0
  elseif player.y > #map*tileSize-player.h then
    player.y = #map*tileSize-player.h
    player.yV = 0
  end

  player.xV = player.xV * 0.8
  player.yV = player.yV * 0.8

  camera.x = player.x
  camera.y = player.y

  for i, v in ipairs(vehicles) do
    if advancedCollision(player.x+player.w/2, player.y+player.h/2, player.w, player.h, 0, v.x, v.y, v.w, v.h, v.angle) then
      inUse = i
    end
  end

  bullet_update(dt)
  enemies_update(dt)
  shader_update(dt)
  vehicles_update(dt)
  renderShader()

  if love.keyboard.isDown("space") then
    inUse = 0
  end
end

function love.draw()
  if menu == false then
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
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)

  -- draw bullets
    love.graphics.setColor(128, 128, 128)
    for i,v in ipairs(bullets) do
      love.graphics.circle("fill", v.x, v.y, 3)
    end


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
  love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (player.hp*32)/2, 0, player.hp*32, 32)
  if inUse > 0 then
      love.graphics.setColor(200, 200, 200)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (vehicles[inUse].hp*16)/2, 32, vehicles[inUse].hp*16, 16)
  end
  love.graphics.setColor(255, 255, 255)

  love.graphics.print(tostring(advancedCollideWithMap(vehicles[1].x, vehicles[1].y, vehicles[1].w, vehicles[1].h, vehicles[1].angle, "vehicle", 1)))
  else
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 - 128, love.graphics.getHeight()/2 - 64 , 256, 128)
    love.graphics.setColor(0, 0, 256)
    love.graphics.print("Start", love.graphics.getWidth()/2 - 64, love.graphics.getHeight()/2 - 32 , 0, 4, 4)
  end
end

function love.mousepressed(x, y, button)
  if menu == true then
    if x > love.graphics.getWidth()/2 - 128 and x < love.graphics.getWidth()/2 + 128
    and y >  love.graphics.getHeight()/2 - 64 and y <  love.graphics.getHeight()/2 + 64 then
      menu = false
    end
  else
    if button == 1 then
      if inUse < 1 and player.ammo > 0 then
        newBullet(x, y)
        player.ammo = player.ammo - 1
      end
    end
  end
end
