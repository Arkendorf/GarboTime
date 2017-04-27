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
  love.graphics.translate(-camera.x + w / 2 + screenshake.x, -camera.y + h / 2 + screenshake.y)

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

  -- draw explosions
  for i,v in ipairs(explosion) do
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(tilesetImage,explosionImg[v.frame], v.x-16, v.y-16)
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
    if corners[1].y > corners[2].y and corners[1].y > corners[3].y and corners[1].y > corners[4].y then
      table.remove(corners, 1)
    elseif corners[2].y > corners[1].y and corners[2].y > corners[3].y and corners[2].y > corners[4].y then
      table.remove(corners, 2)
    elseif corners[3].y > corners[2].y and corners[3].y > corners[1].y and corners[3].y > corners[4].y then
      table.remove(corners, 3)
    else
      table.remove(corners, 4)
    end
    table.sort(corners, function(a, b) return a.x < b.x end)
    corners[4] = {x = corners[3].x, y = corners[3].y -math.abs(timeOfDay-120)*s/32}
    corners[5] = {x = corners[2].x, y = corners[2].y -math.abs(timeOfDay-120)*s/32}
    corners[6] = {x = corners[1].x, y = corners[1].y -math.abs(timeOfDay-120)*s/32}
  else
    if corners[1].y < corners[2].y and corners[1].y < corners[3].y and corners[1].y < corners[4].y then
      table.remove(corners, 1)
    elseif corners[2].y < corners[1].y and corners[2].y < corners[3].y and corners[2].y < corners[4].y then
      table.remove(corners, 2)
    elseif corners[3].y < corners[2].y and corners[3].y < corners[1].y and corners[3].y < corners[4].y then
      table.remove(corners, 3)
    else
      table.remove(corners, 4)
    end
    table.sort(corners, function(a, b) return a.x < b.x end)
    corners[4] = {x = corners[3].x, y = corners[3].y + math.abs(timeOfDay-120)*s/32}
    corners[5] = {x = corners[2].x, y = corners[2].y + math.abs(timeOfDay-120)*s/32}
    corners[6] = {x = corners[1].x, y = corners[1].y + math.abs(timeOfDay-120)*s/32}
  end
  triangles = love.math.triangulate(corners[1].x + x, corners[1].y + y, corners[2].x + x, corners[2].y + y, corners[3].x + x, corners[3].y + y, corners[4].x + x, corners[4].y + y, corners[5].x + x, corners[5].y + y, corners[6].x + x, corners[6].y + y)

  for i, v in ipairs(triangles) do
    love.graphics.polygon("fill", v)
  end
end
