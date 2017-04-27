

function vehicles_load()
  vehicleImg = {}
  vehicleImg[1] = love.graphics.newImage("racer.png")
  vehicleImg[2] = love.graphics.newImage("car.png")
  vehicleImg[3] = love.graphics.newImage("armoredcar.png")
  vehicleImg[4] = love.graphics.newImage("tank.png")
  vehicles = {}
  inUse = 1
  newVehicle(20 * 32, 32, 1)
  newVehicle(400, 32, 4)
end

function vehicles_update(dt)
  if inUse > 0 then
    if love.keyboard.isDown("w") then
      vehicles[inUse].speedV = vehicles[inUse].speedV + dt * 30 * vehicles[inUse].accel
      vehicles[inUse].angle = vehicles[inUse].newAngle
    end
    if love.keyboard.isDown("s") then
      vehicles[inUse].speedV = vehicles[inUse].speedV - dt * 30 * vehicles[inUse].accel/4
      vehicles[inUse].angle = vehicles[inUse].newAngle
    end
    if love.keyboard.isDown("a") then
      vehicles[inUse].newAngleV = vehicles[inUse].newAngleV - dt * vehicles[inUse].turn
    end
    if love.keyboard.isDown("d") then
      vehicles[inUse].newAngleV = vehicles[inUse].newAngleV + dt * vehicles[inUse].turn
    end
    -- if vehicles[inUse].type > 2 and love.mouse.isDown(1) then
    --   mX, mY = love.mouse.getPosition()
    --   newBullet(mX + math.random(1, 10), mY + math.random(1, 10))
    -- end
  end

  for i = 1, #vehicles do
    if advancedCollideWithMap(vehicles[i].x, vehicles[i].y, vehicles[i].w, vehicles[i].h, vehicles[i].newAngle + vehicles[i].newAngleV, "vehicle", i) then
      -- if vehicles[i].newAngleV < 0  then
      --   while advancedCollideWithMap(vehicles[i].x, vehicles[i].y, vehicles[i].w, vehicles[i].h, vehicles[i].newAngle - 1, "vehicle", i) do
      --     vehicles[i].newAngle = vehicles[i].newAngle - 1
      --   end
      -- else
      --   while advancedCollideWithMap(vehicles[i].x, vehicles[i].y, vehicles[i].w, vehicles[i].h, vehicles[i].newAngle + 1, "vehicle", i) do
      --     vehicles[i].newAngle = vehicles[i].newAngle + 1
      --   end
      -- end
      vehicles[i].angle = vehicles[i].newAngle
      vehicles[i].newAngleV = 0
    end
    vehicles[i].newAngle = vehicles[i].newAngle + vehicles[i].newAngleV
    vehicles[i].newAngleV = vehicles[i].newAngleV * 0.8
  --
  --
    cartX, cartY = toCartesian(vehicles[i].speedV, vehicles[i].angle)
    vX = vehicles[i].x + cartX
    vY = vehicles[i].y + cartY
    if advancedCollideWithMap(vX, vY, vehicles[i].w, vehicles[i].h, vehicles[i].angle, "vehicle", i) then
      -- if vehicles[i].speedV > 0 then
      --   cartX, cartY = toCartesian(1, vehicles[i].angle)
      --   vX = vehicles[i].x + cartX
      --   vY = vehicles[i].y + cartY
      --   while advancedCollideWithMap(vX, vY, vehicles[i].w, vehicles[i].h, vehicles[i].angle, "vehicle", i) do
      --     vehicles[i].speed = vehicles[i].speed + 1
      --     cartX, cartY = toCartesian(1, vehicles[i].angle)
      --     vX = vehicles[i].x + cartX
      --     vY = vehicles[i].y + cartY
      --   end
      -- else
      --   cartX, cartY = toCartesian(1, vehicles[i].angle)
      --   vX = vehicles[i].x + cartX
      --   vY = vehicles[i].y + cartY
      --   while advancedCollideWithMap(vX, vY, vehicles[i].w, vehicles[i].h, vehicles[i].angle, "vehicle", i) do
      --     vehicles[i].speed = vehicles[i].speed + 1
      --     cartX, cartY = toCartesian(1, vehicles[i].angle)
      --     vX = vehicles[i].x + cartX
      --     vY = vehicles[i].y + cartY
      --   end
      -- end
      vehicles[i].speedV = 0
    end
    vehicles[i].speed = vehicles[i].speed + vehicles[i].speedV
    vehicles[i].speedV = vehicles[i].speedV * 0.95

    cartX, cartY = toCartesian(vehicles[i].speedV, vehicles[i].angle)
    vehicles[i].x = vehicles[i].x + cartX
    vehicles[i].y = vehicles[i].y + cartY
  end
end

function newVehicle(vX, vY, type)
  if type == 1 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 64, h = 32, type = 1, speed = 0, speedV = 0, angle = 0, newAngle = 0, newAngleV = 0, accel = 1, turn = 1, hp = 10}
  elseif type == 2 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 80, h = 48, type = 2, speed = 0, speedV = 0, angle = 0, newAngle = 0, newAngleV = 0, accel = 0.75, turn = 0.75, hp = 15}
  elseif type == 3 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 80, h = 48, type = 3, speed = 0, speedV = 0, angle = 0, newAngle = 0, newAngleV = 0, accel = 0.5, turn = 0.5, hp = 20}
  elseif type == 4 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 96, h = 64, type = 4, speed = 0, speedV = 0, angle = 0, newAngle = 0, newAngleV = 0, accel = 0.25, turn = 0.25, hp = 25}
  end
end
