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



function playerCollide(x, y)
  for i, v in ipairs(map) do
    for i2 = 1, #map[i] do
      if tileType[map[i][i2] + 1] == 1 and collision(x, y, 10, 10, (i2-1)*32, (i-1)*32, 32, 32) then
        return true
      end
    end
  end
  return false
end
