require("astarlibrary")
function enemies_load()
  walkable = 0
  setWalkable(walkable)
  enemies = {}
  newEnemy(64, 64)
  newEnemy(64, 96)
  newEnemy(96, 64)
  newEnemy(64, 128)
  setMap(convertMapToNode(map))
end

function newEnemy(eX, eY)
  enemies[#enemies + 1] = {x = eX, y = eY, path = {}, goal = {x = math.floor((player.x + 4) / 8) + 1, y = math.floor((player.y + 4) / 8) + 1}}
end

function enemies_update(dt)

  for i = 1, #enemies do
    updateEnemyPath(i)
  end
end

function updateEnemyPath(num)
  if math.sqrt((player.x-enemies[num].x)*(player.x-enemies[num].x) + (player.y-enemies[num].y)*(player.y-enemies[num].y)) < 128 then
    if enemies[num].goal.x ~= math.floor((player.x + 4) / 8) + 1 or enemies[num].goal.x ~= math.floor((player.y + 4) / 8) + 1 then
      enemies[num].goal = {x = math.floor((player.x + 4) / 8) + 1, y = math.floor((player.y + 4) / 8) + 1}
      startingPoint = {x = math.floor(enemies[num].x / 8) + 1, y = math.floor(enemies[num].y / 8) + 1}
      enemies[num].path = findPath({startingPoint.x, startingPoint.y}, {enemies[num].goal.x,  enemies[num].goal.y})
    end
  else
    enemies[num].path = {}
  end
end

function convertMapToNode(map)
  nodeMap = {}
  for i, v in ipairs(map) do
    nodeMap[(i-1)*4+1] = {}
    nodeMap[(i-1)*4+2] = {}
    nodeMap[(i-1)*4+3] = {}
    nodeMap[(i-1)*4+4] = {}
    for i2 = 1, #v do
      for tilePortion = 1, 4 do
        nodeMap[(i-1)*4+1][(i2-1)*4 + tilePortion] = map[i][i2]
        nodeMap[(i-1)*4+2][(i2-1)*4 + tilePortion] = map[i][i2]
        nodeMap[(i-1)*4+3][(i2-1)*4 + tilePortion] = map[i][i2]
        nodeMap[(i-1)*4+4][(i2-1)*4 + tilePortion] = map[i][i2]
      end
    end
  end
  return nodeMap
end
