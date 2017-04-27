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



  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = mapMaker({{1, 1},
                {1, 1}})

  screenshake = {x = 0, y = 0, time = 0, range = 1}

  player = {x= #map[1]*tileSize/2, y= #map*tileSize/2, xV = 0, yV = 0, w = 8, h = 8, hp = 8, ammo = 20}
  menu = true

  shader_load()
  enemies_load()
  explosion_load()
  bullet_load()
  vehicles_load()
end

function love.update(dt)
  vehicles_update(dt)
  if menu == false then
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
    if advancedCollideWithMap(player.x + player.xV + player.w/2, player.y + player.h/2, player.w, player.h, 0, "player") then
      if player.xV > 0 then
        while advancedCollideWithMap(player.x + 1 + player.w/2, player.y + player.h/2, player.w, player.h, 0, "player") == false do
          player.x = player.x + 1
        end
      else
        while advancedCollideWithMap(player.x - 1 + player.w/2, player.y + player.h/2, player.w, player.h, 0, "player") == false do
          player.x = player.x - 1
        end
      end
      player.xV = 0
    end
    player.x = player.x + player.xV

    if advancedCollideWithMap(player.x + player.w/2, player.y + player.yV + player.h/2, player.w, player.h, 0, "player") then
      if player.yV > 0 then
        while advancedCollideWithMap(player.x + player.w/2, player.y + 1 + player.h/2, player.w, player.h, 0, "player") == false do
          player.y = player.y + 1
        end
      else
        while advancedCollideWithMap(player.x + player.w/2, player.y - 1 + player.h/2, player.w, player.h, 0, "player") == false do
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

  player.xV = player.xV * 0.8
  player.yV = player.yV * 0.8


  if screenshake.time > 0 then
    screenshake.x = math.random(-screenshake.range, screenshake.range)
    screenshake.y = math.random(-screenshake.range, screenshake.range)
    screenshake.time = screenshake.time - dt
  else
    screenshake.time = 0
  end



  if love.keyboard.isDown("space") and inUse > 0 then
    newPos = rotate(0, vehicles[inUse].h/2 + player.h, vehicles[inUse].newAngle)
    player.x = vehicles[inUse].x + newPos.x - player.w/2
    player.y = vehicles[inUse].y + newPos.y - player.h/2
    if collideWithMap(player.x + player.w/2, player.y + player.h/2, player.w, player.h, "player") then
      newPos = rotate(0, -vehicles[inUse].h/2 - player.h, vehicles[inUse].newAngle)
      player.x = vehicles[inUse].x + newPos.x - player.w/2
      player.y = vehicles[inUse].y + newPos.y - player.h/2
    end
    inUse = 0
  end
end
camera.x = player.x
camera.y = player.y

mX, mY = love.mouse.getPosition()
carHighlighted = 0
for i, v in ipairs(vehicles) do
  object1Corners = {}
  object1Corners[1] = rotate(v.w/2, -v.h/2, v.angle)
  object1Corners[2] = rotate(v.w/2, v.h/2, v.angle)
  object1Corners[3] = rotate(-v.w/2, v.h/2, v.angle)
  object1Corners[4] = rotate(-v.w/2, -v.h/2, v.angle)
  for i = 1, 4 do
    object1Corners[i].x = object1Corners[i].x + v.x
    object1Corners[i].y = object1Corners[i].y + v.y
  end
  if inUse < 1 and PointWithinShape(object1Corners, mX + camera.x - w/2, mY + camera.y - h/2) and math.sqrt((v.x-player.x)*(v.x-player.x)+(v.y-player.y)*(v.y-player.y)) < v.w + 8 then
    carHighlighted = i
  end
end

bullet_update(dt)
enemies_update(dt)
shader_update(dt)
renderShader()
explosion_update(dt)
end

function love.draw()
  love.graphics.push()
  love.graphics.translate(-camera.x + w / 2 + screenshake.x, -camera.y + h / 2 + screenshake.y)
  love.graphics.setColor(255, 255, 255)



  for i, v in ipairs(map) do
    for i2 = 1, #v do
      love.graphics.draw(tilesetImage, tiles[map[i][i2]],(i2 - 1)*tileSize, (i - 1)*tileSize)
    end
  end

  -- draw enemies
  for i, v in ipairs(enemies) do
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
  end

  -- draw vehicles
  for i, v in ipairs(vehicles) do
    if carHighlighted == i then
      love.graphics.setColor(155, 155, 155)
    else
      love.graphics.setColor(255, 255, 255)
    end
    if v.type == 1 then
      love.graphics.draw(vehicleImg[1], v.x, v.y, v.newAngle, 1, 1, v.w/2, v.h/2)
    elseif v.type == 2 then
      love.graphics.draw(vehicleImg[2], v.x, v.y, v.newAngle, 1, 1, v.w/2, v.h/2)
    elseif v.type == 3 then
      love.graphics.draw(vehicleImg[3], v.x, v.y, v.newAngle, 1, 1, v.w/2, v.h/2)
    else
      love.graphics.draw(vehicleImg[4], v.x, v.y, v.newAngle, 1, 1, v.w/2, v.h/2)
    end
  end

  -- draw player
    if inUse < 1 then
      love.graphics.setColor(0, 255, 255)
      love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    end
  -- draw bullets
  love.graphics.setColor(128, 128, 128)
  for i,v in ipairs(bullets) do
    love.graphics.circle("fill", v.x, v.y, 3)
  end

  -- draw explosions
  for i,v in ipairs(explosion) do
    love.graphics.draw(tilesetImage,explosionImg[v.frame], v.x-16, v.y-16)
  end

  love.graphics.setColor(255, 255, 255)

  love.graphics.pop()
  love.graphics.setColor(255, 255, 255, 100)
  love.graphics.draw(shaderCanvas, 0, 0)
  if menu == false then
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (player.hp*32)/2, 0, player.hp*32, 32)
  end
  if inUse > 0 then
      love.graphics.setColor(200, 200, 200)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 - (vehicles[inUse].hp*16)/2, 32, vehicles[inUse].hp*16, 16)
  end
  love.graphics.setColor(255, 255, 255)

  love.graphics.print(tostring(carHighlighted))

  font = love.graphics.newFont("font.ttf", 50)
  love.graphics.setFont(font)

  if menu == true then
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(32, 32, 32, 150)
    love.graphics.rectangle("fill", 0, love.graphics.getHeight()/2 - 46 , 256, 64)
    love.graphics.setColor(255,255,255)
    love.graphics.print("start", 32, love.graphics.getHeight()/2 - 32)
  end
end

function love.mousepressed(x, y, button)
  if menu == true then
    if x > 0 and x < love.graphics.getWidth()/2 + 128
    and y >  love.graphics.getHeight()/2 - 64 and y <  love.graphics.getHeight()/2 + 64 then
      menu = false
    end
  else
    if button == 1 then
      if carHighlighted > 0 then
        inUse = carHighlighted
      elseif inUse < 1 and player.ammo > 0 then
        newBullet(x, y)
        player.ammo = player.ammo - 1
      end
    end
  end
end

function screenShake(time, range)
  screenshake.time = time
  screenshake.range = range
end
