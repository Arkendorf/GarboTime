

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
    end
    if love.keyboard.isDown("s") then
      vehicles[inUse].speedV = vehicles[inUse].speedV - dt * 30 * vehicles[inUse].accel/4
    end
    if love.keyboard.isDown("a") then
      vehicles[inUse].goalAngle = vehicles[inUse].goalAngle - dt * vehicles[inUse].turn
    end
    if love.keyboard.isDown("d") then
      vehicles[inUse].goalAngle = vehicles[inUse].goalAngle + dt * vehicles[inUse].turn
    end
    if vehicles[inUse].type > 2 and love.mouse.isDown(1) then
      mX, mY = love.mouse.getPosition()
      newBullet(mX + math.random(1, 10), mY + math.random(1, 10))
    end
  end

  for i, v in ipairs(vehicles) do
    v.speed = v.speed + v.speedV
    v.speedV = v.speedV * 0.9

    v.angle = v.angle + (v.goalAngle - v.angle) * 0.1

    cartX, cartY = toCartesian(v.speedV, v.angle)
    v.x = v.x + cartX
    v.y = v.y + cartY
  end
end

function newVehicle(vX, vY, type)
  if type == 1 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 96, h = 48, type = 1, speed = 0, speedV = 0, angle = 0, goalAngle = 0, accel = 2, turn = 5, hp = 10}
  elseif type == 2 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 96, h = 64, type = 2, speed = 0, speedV = 0, angle = 0, goalAngle = 0, accel = 1.5, turn = 4, hp = 15}
  elseif type == 3 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 96, h = 64, type = 3, speed = 0, speedV = 0, angle = 0, goalAngle = 0, accel = 1, turn = 3, hp = 20}
  elseif type == 4 then
    vehicles[#vehicles + 1] = {x = vX, y = vY, w = 128, h = 96, type = 4, speed = 0, speedV = 0, angle = 0, goalAngle = 0, accel = 0.5, turn = 2, hp = 25}
  end
end
