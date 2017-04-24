require("astarlibrary")
function civilians_load()
  walkable = 0
  setWalkable(walkable)
  civilians = {}
  newCivilian(64, 64)
end

function newCivilian(eX, eY)
  setMap(convertMapToNode(map))
  startingPoint2 = {x = math.floor(eX / 8) + 1, y = math.floor(eY / 8) + 1}
  civilians[#civilians + 1] = {x = eX, y = eY, path = juliansEvilFunc()}
end

function juliansEvilFunc()
 return findPath({startingPoint2.x, startingPoint2.y}, { math.floor((math.random(#map[1]*32)) / 8) + 1,  math.floor((#map*32) / 8) + 1}) or juliansEvilFunc()
end
function updateCivilianPath(num)
end
