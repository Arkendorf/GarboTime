function newExplosion(x, y)
  screenShake(1, 3)

  local startX = x
  local startY = y


  table.insert(explosion, {x = startX, y = startY, frame = 1, time = 0})

  --if startX <= player.x + 32 or startX >= player.x - 32 or startY <= player.y + 32 or startY >= player.y - 32 then
  if math.sqrt((player.x-startX)*(player.x-startX)+(player.y-startY)*(player.y-startY)) <= 40 then
    player.hp = player.hp - 4
  end
end

function explosion_update (dt)
  for i,v in ipairs(explosion) do
    v.time = v.time + dt
    v.frame = math.floor(v.time * frameSpeed) + 1
    if v.frame > #explosionImg then
      explosion[i] = nil
    end
  end
  explosion = removeNil(explosion)
end

function explosion_load ()

  explosion = {}
  explosionImg = {}

  explosionImg[1] = love.graphics.newQuad(8*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  explosionImg[2] = love.graphics.newQuad(9*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  explosionImg[3] = love.graphics.newQuad(10*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  explosionImg[4] = love.graphics.newQuad(11*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  explosionImg[5] = love.graphics.newQuad(12*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  explosionImg[6] = love.graphics.newQuad(13*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  explosionImg[7] = love.graphics.newQuad(14*tileSize, 17*tileSize, tileSize, tileSize,
  tilesetImage:getWidth(), tilesetImage:getHeight())

  frameSpeed = 14
end
