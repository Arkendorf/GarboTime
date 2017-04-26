function collision(x1, y1, w1, h1, x2, y2, w2, h2)
  if x1 < x2 + w2 and
    x1 + w1 > x2 and
    y1 < y2 + h2 and
    h1 + y1 > y2 then
    return true
  else
    return false
  end
end

function collideWithMap(x, y, w, h, type, num)
  local objTile = {x = math.floor(x / tileSize) + 1, y = math.floor(y / tileSize) + 1}
  if w + h < tileSize then
    tileRadius = 3
  else
    tileRadius = math.ceil((w + h) / 32) + 2
  end
  for i = 1, 3 do
    for i2 = 1, 3 do
      tileToCheck = {x = objTile.x - math.ceil(tileRadius/2) + i2, y = objTile.y - math.ceil(tileRadius/2) + i}
      if tileToCheck.x < 1 then
        tileToCheck.x = 1
      elseif tileToCheck.x > #map[1] then
        tileToCheck.x = #map[1]
      end
      if tileToCheck.y < 1 then
        tileToCheck.y = 1
      elseif tileToCheck.y > #map then
        tileToCheck.y = #map
      end
      if tileType[map[tileToCheck.y][tileToCheck.x]] == 1 and collision(x, y, w, h, (tileToCheck.x - 1) * tileSize, (tileToCheck.y - 1) * tileSize, tileSize, tileSize) then
        return true
      end
    end
  end
  for i, v in ipairs(enemies) do
    if (type ~= "enemy" or num ~= i) and collision(x, y, w, h, v.x, v.y, v.w, v.h) then
      return true
    end
  end
  if type ~= "player" and collision(x, y, w, h, player.x, player.y, 8, 8) then
    return true
  end
  return false
end

function oldPlayerCollide(x, y)
  for i, v in ipairs(map) do
    for i2 = 1, #map[i] do
      if tileType[map[i][i2]] == 1 and collision(x, y, 8, 8, (i2-1)*32, (i-1)*32, 32, 32) then
        return true
      end
    end
  end
  return false
end
