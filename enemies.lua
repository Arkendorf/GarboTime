require("astarlibrary")
function enemies_load()
  walkable = 0
  setWalkable(walkable)
  enemies = {}
  newEnemy(64, 64)
  newEnemy(64, 96)
  newEnemy(96, 64)
  newEnemy(64, 128)
end

function newEnemy(eX, eY)
  enemies[#enemies + 1] = {x = eX, y = eY, path = {}}
end

function updateEnemyPath(num)
  setMap(convertMapToNode(map))
  startingPoint = {x = math.floor(enemies[num].x / 8) + 1, y = math.floor(enemies[num].y / 8) + 1}
  enemies[num].path = findPath({startingPoint.x, startingPoint.y}, { math.floor((player.x + 4) / 8) + 1,  math.floor((player.y + 4) / 8) + 1})

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
