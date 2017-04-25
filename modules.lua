tileType = {[0] = 0, [1] = 0, [2] = 0, [3] = 1, [4] = 0}


tilesetImage = love.graphics.newImage("tileset.png")
tilesetImage:setFilter("nearest", "linear")
tileSize = 32

tiles = {}
-- street Yellow
tiles[0] = love.graphics.newQuad(1*tileSize, 18*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
--street
tiles[2] = love.graphics.newQuad(4*tileSize, 18*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- Brick
tiles[1] = love.graphics.newQuad(10*tileSize, 0*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- side walk
tiles[3] = love.graphics.newQuad(0*tileSize, 20*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
-- street Yellow 2
tiles[4] = love.graphics.newQuad(0*tileSize, 18*tileSize, tileSize, tileSize,
tilesetImage:getWidth(), tilesetImage:getHeight())
blocks = {}
blocks[1] = {{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2, 2, 0},
      {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
      {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2}}

function mapMaker(blockList)
  combinedLines = {}
  for i = 1, #blockList do
    combinedLine = {}
    for i2 = 1, #blockList[1] do
      if i2 == 1 then
        combinedLine = blocks[blockList[i][i2]]
      else
        combinedLine = addBlocksH(combinedLine, blocks[blockList[i][i2]])
      end
    end
    combinedLines[#combinedLines+1] = combinedLine
  end
  for i = 1, #combinedLines do
    if i == 1 then
      map = combinedLines[i]
    else
      map = addBlocksV(map, combinedLines[i])
    end
  end
  return map
end

function tableConcat (t1, t2)
  newTable = {}
  tables = {t1, t2}
  for i=1,2 do
    for i,v in ipairs(tables[i]) do
      newTable[#newTable+1] = v
    end
  end
  return newTable
end

function addBlocksH(block1, block2)
  combined = {}
  for i = 1, #block1 do
    combined[i] = tableConcat(block1[i], block2[i])
  end
  return combined
end

function addBlocksV(block1, block2)
  combined = tableConcat(block1, block2)
  return combined
end
