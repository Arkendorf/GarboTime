function shader_load()
  timeOfDay = 0
  shaderCanvas = love.graphics.newCanvas(w, h)
end

function shader_update(dt)
  timeOfDay = timeOfDay + dt * 15
  if timeOfDay > 240 then
    timeOfDay = 0
  end
end

function renderShader()
  love.graphics.setCanvas(shaderCanvas)
  love.graphics.clear()
  love.graphics.setColor(0, 0, 20, math.abs(timeOfDay - 120) * 3)
  love.graphics.rectangle("fill", 0, 0, w, h)
  love.graphics.translate(-camera.x + w/ 2, -camera.y + h / 2)

  love.graphics.setColor(0, 0, 20)
  for i, v in ipairs(map) do
    for i2 = 1, #v do
      if timeOfDay < 120 and i+1 <= #map and tileType[map[i][i2]] == 1 and tileType[map[i+1][i2]] == 0 then
        drawSimpleShadow((i2-1)*tileSize, (i-1)*tileSize, tileSize, tileSize, tileSize)
      elseif timeOfDay > 120 and i-1 >= 1 and tileType[map[i][i2]] == 1 and tileType[map[i-1][i2]] == 0 then
        drawSimpleShadow((i2-1)*tileSize, (i-1)*tileSize, tileSize, tileSize, tileSize)
      end
    end
  end
  -- draw player
  if inUse < 1 then
    drawSimpleShadow(player.x, player.y, 8, 8, 8)
  end
  -- draw enemies
  for i, v in ipairs(enemies) do
    drawSimpleShadow(v.x, v.y, 8, 8, 8)
  end

  -- draw vehicles
  for i, v in ipairs(vehicles) do
    drawShadow(v.x, v.y, v.w, v.h, 32, v.newAngle)
  end

  love.graphics.setCanvas()
end

function drawSimpleShadow(x, y, w, h, s)
  if timeOfDay == 120 then
    return
  elseif timeOfDay > 120 then
    love.graphics.setColor(0, 0, 20)
    love.graphics.rectangle("fill", x, y, w, -math.abs(timeOfDay-120)*s/32)
  elseif timeOfDay < 120 then
    love.graphics.setColor(0, 0, 20)
    love.graphics.rectangle("fill", x, y+h, w, math.abs(timeOfDay-120)*s/32)
  end
end

function drawShadow(x, y, w, h, s, angle)
  corners = {}
  corners[1] = rotate(w/2, -h/2, angle)
  corners[2] = rotate(w/2, h/2, angle)
  corners[3] = rotate(-w/2, h/2, angle)
  corners[4] = rotate(-w/2, -h/2, angle)
  if timeOfDay > 120 then
    if corners[1][2] > corners[2][2] and corners[1][2] > corners[3][2] and corners[1][2] > corners[4][2] then
      table.remove(corners, 1)
    elseif corners[2][2] > corners[1][2] and corners[2][2] > corners[3][2] and corners[2][2] > corners[4][2] then
      table.remove(corners, 2)
    elseif corners[3][2] > corners[2][2] and corners[3][2] > corners[1][2] and corners[3][2] > corners[4][2] then
      table.remove(corners, 3)
    else
      table.remove(corners, 4)
    end
    table.sort(corners, function(a, b) return a[1] < b[1] end)
    corners[4] = {corners[3][1], corners[3][2] -math.abs(timeOfDay-120)*s/32}
    corners[5] = {corners[2][1], corners[2][2] -math.abs(timeOfDay-120)*s/32}
    corners[6] = {corners[1][1], corners[1][2] -math.abs(timeOfDay-120)*s/32}
  else
    if corners[1][2] < corners[2][2] and corners[1][2] < corners[3][2] and corners[1][2] < corners[4][2] then
      table.remove(corners, 1)
    elseif corners[2][2] < corners[1][2] and corners[2][2] < corners[3][2] and corners[2][2] < corners[4][2] then
      table.remove(corners, 2)
    elseif corners[3][2] < corners[2][2] and corners[3][2] < corners[1][2] and corners[3][2] < corners[4][2] then
      table.remove(corners, 3)
    else
      table.remove(corners, 4)
    end
    table.sort(corners, function(a, b) return a[1] < b[1] end)
    corners[4] = {corners[3][1], corners[3][2] + math.abs(timeOfDay-120)*s/32}
    corners[5] = {corners[2][1], corners[2][2] + math.abs(timeOfDay-120)*s/32}
    corners[6] = {corners[1][1], corners[1][2] + math.abs(timeOfDay-120)*s/32}
  end
  triangles = love.math.triangulate(corners[1][1] + x, corners[1][2] + y, corners[2][1] + x, corners[2][2] + y, corners[3][1] + x, corners[3][2] + y, corners[4][1] + x, corners[4][2] + y, corners[5][1] + x, corners[5][2] + y, corners[6][1] + x, corners[6][2] + y)

  for i, v in ipairs(triangles) do
    love.graphics.polygon("fill", v)
  end
end
