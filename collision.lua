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

function advancedCollision(x1, y1, w1, h1, a1, x2, y2, w2, h2, a2)
	object1Corners = {}
	object1Corners[1] = rotate(w1/2, -h1/2, a1)
	object1Corners[2] = rotate(w1/2, h1/2, a1)
	object1Corners[3] = rotate(-w1/2, h1/2, a1)
	object1Corners[4] = rotate(-w1/2, -h1/2, a1)

	object2Corners = {}
	object2Corners[1] = rotate(w2/2, -h2/2, a2)
	object2Corners[2] = rotate(w2/2, h2/2, a2)
	object2Corners[3] = rotate(-w2/2, h2/2, a2)
	object2Corners[4] = rotate(-w2/2, -h2/2, a2)

	for i = 1, 4 do
		if i+1 > 4 then
			i2 = 1
		else
			i2 = i+1
		end
		for j =1, 4 do
			if j+1 > 4 then
				j2 = 1
			else
				j2 = j+1
			end
			if checkIntersect({x1 + object1Corners[i][1],  y1 + object1Corners[i][2]},
                        {x1 + object1Corners[i2][1], y1 + object1Corners[i2][2]},
                        {x2 + object2Corners[j][1],  y2 + object2Corners[j][2]},
                        {x2 + object2Corners[j2][1], y2 + object2Corners[j2][2]}) then
				return true
			end
		end
	end
  return false
end

function collideWithMap(x, y, w, h, type, num)
  local objTile = {x = math.floor(x / tileSize) + 1, y = math.floor(y / tileSize) + 1}
  if w + h < tileSize then
    tileRadius = 3
  else
    tileRadius = math.ceil((w + h) / 32) + 2
  end
  for i = 1, tileRadius do
    for i2 = 1, tileRadius do
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

function advancedCollideWithMap(x, y, w, h, a, type, num)
  local objTile = {x = math.floor(x / tileSize) + 1, y = math.floor(y / tileSize) + 1}
  if w + h < tileSize then
    tileRadius = 3
  else
    tileRadius = math.ceil((w + h) / 32) + 2
  end
  for i = 1, tileRadius do
    for i2 = 1, tileRadius do
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
      if tileType[map[tileToCheck.y][tileToCheck.x]] == 1 and advancedCollision(x, y, w, h, a, (tileToCheck.x - 1) * tileSize + tileSize/2, (tileToCheck.y - 1) * tileSize + tileSize/2, tileSize, tileSize, 0) then
        return true
      end
    end
  end
  for i, v in ipairs(enemies) do
    if (type ~= "enemy" or num ~= i) and advancedCollision(x, y, w, h, a, v.x + v.w/2, v.y + v.h/2, v.w, v.h, 0) then
      return true
    end
  end
  for i, v in ipairs(vehicles) do
    if (type ~= "vehicle" or num ~= i) and advancedCollision(x, y, w, h, a, v.x, v.y, v.w, v.h, v.angle) then
      if type == "enemy" and v.speedV > 1 or v.speedV < -1 then
        return "dead"
      end
      return true
    end
  end
  if type ~= "player" and advancedCollision(x, y, w, h, a, player.x + 4, player.y + 4, 8, 8, 0) then
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
