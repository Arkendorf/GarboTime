function love.load()
  player = {}
  player.x = 0
  player.y = 0
  player.xV = 0
  player.yV = 0
  w, h = love.graphics.getDimensions()
  camera = {x = 0, y = 0}
  map = {{1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 1}}
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
end

function love.draw()
  love.graphics.translate(-camera.x + w/ 2, -camera.y + h / 2)
  love.graphics.rectangle("fill", player.x, player.y, 10, 10)
  for i, v in ipairs(map) do
    for i2 = 1, #v do
      if map[i][i2] == 1 then
        love.graphics.rectangle("fill", (i2 - 1) * 40, (i - 1) * 40, 40, 40)
      end
    end
  end
end
