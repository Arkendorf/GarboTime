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
        drawShadow((i2-1)*tileSize, (i-1)*tileSize, tileSize)
      elseif timeOfDay > 120 and i-1 >= 1 and tileType[map[i][i2]] == 1 and tileType[map[i-1][i2]] == 0 then
        drawShadow((i2-1)*tileSize, (i-1)*tileSize, tileSize)
      end
    end
  end
  -- draw player
    drawShadow(player.x, player.y, 8)

  -- draw enemies
  for i, v in ipairs(enemies) do
    drawShadow(v.x, v.y, 8)
  end

  love.graphics.setCanvas()
end

function drawShadow(x, y, size)
  if timeOfDay == 120 then
    return
  elseif timeOfDay > 120 then
    love.graphics.setColor(0, 0, 20)
    love.graphics.rectangle("fill", x, y, size, -math.abs(timeOfDay-120)*size/32)
  elseif timeOfDay < 120 then
    love.graphics.setColor(0, 0, 20)
    love.graphics.rectangle("fill", x, y+size, size, math.abs(timeOfDay-120)*size/32)
  end
end
