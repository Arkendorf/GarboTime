require("enemies")
function love.load()
  player = {}
  player.x = 0
  player.y = 0
  player.xV = 0
  player.yV = 0
  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = {{0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1}}
  enemies_load()
end

function love.update(dt)
  if love.keyboard.isDown("w") then
    player.yV = player.yV - 1
  end
  if love.keyboard.isDown("s") then
    player.yV = player.yV + 1
  end
  if love.keyboard.isDown("a") then
    player.xV = player.xV - 1
  end
  if love.keyboard.isDown("d") then
    player.xV = player.xV + 1
  end
  player.x = player.x + player.xV
  player.y = player.y + player.yV
  player.xV = player.xV * 0.8
  player.yV = player.yV * 0.8

  camera.x = player.x
  camera.y = player.y

  for i = 1, #enemies do
    updateEnemyPath(i)
  end
end

function love.draw()
  love.graphics.translate(-camera.x + w/ 2, -camera.y + h / 2)
  love.graphics.rectangle("fill", player.x, player.y, 8, 8)
  for i, v in ipairs(map) do
    for i2 = 1, #v do
      if map[i][i2] == 1 then
        love.graphics.rectangle("fill", (i2 - 1) * 32, (i - 1) * 32, 32, 32)
      end
    end
  end

  -- draw enemies
  for i, v in ipairs(enemies) do
    love.graphics.rectangle("fill", v.x, v.y, 8, 8)
  end

  -- path test
  for i, v in ipairs(enemies) do
    for i2, v2 in ipairs(v.path) do
      love.graphics.rectangle("line", (v2[1]-1)*8, (v2[2]-1)*8, 8, 8)
    end
  end
end
