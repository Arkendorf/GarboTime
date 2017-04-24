require("astarlibrary")
function enemies.load()
  walkable = 0
  setWalkable(walkable)
  enemies = {}

end

function newEnemy(eX, eY)
  enemies[#enemies + 1] = {x = eX, y = eY, path = {}}
end

function convertMapToNode(map)
  nodeMap = {}
  for i, v in ipairs(map) do
    nodeMap[i] = {}
    for i2 = 1, #v do
      if map[i][i2] == walkable then
        for tilePortion = 1, 4 do
          
        end
      end
    end
  end
end
