require("astarlibrary")
function enemies_load()
  explosionTimer = 0.75
  walkable = 0
  setWalkable(walkable)
  enemies = {}

  newEnemy (0,0)
  
end

function newEnemy(eX, eY)
  enemies[#enemies + 1] = {x = eX, y = eY, w = 8, h = 8, xV = 0, yV = 0, goal = {x = player.x, y = player.y}, timer = explosionTimer, oldPos = {eX, eY}}
end

function enemies_update(dt)
  for i = 1, #enemies do
    updateEnemy(i, dt)
  end
  enemies = removeNil(enemies)
end

function updateEnemy(num, dt)
  if enemies[num].timer < explosionTimer then
    enemies[num].timer = enemies[num].timer - dt
    if enemies[num].timer <=0 then
      newExplosion(enemies[num].x, enemies[num].y)
      enemies[num] = nil
    end
  else
    if advancedCollideWithMap(enemies[num].x + enemies[num].w/2, enemies[num].y + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) == "dead" then
      screenShake(0.5, 1)
      enemies[num] = nil
      addAmmo()
      if inUse > 0 then
        vehicles[inUse].hp = vehicles[inUse].hp-1
      end
    else
      local dist = math.sqrt((player.x-enemies[num].x)*(player.x-enemies[num].x) + (player.y-enemies[num].y)*(player.y-enemies[num].y))
      if dist < 9 then
        enemies[num].timer = enemies[num].timer - dt
      elseif dist < 128 then
        oldPos = {x = enemies[num].x, y = enemies[num].y}
        if (player.x-enemies[num].x) > 0 then
          enemies[num].xV = enemies[num].xV + 0.5
        elseif (player.x-enemies[num].x) < 0 then
          enemies[num].xV = enemies[num].xV - 0.5
        end
        if (player.y-enemies[num].y) > 0 then
          enemies[num].yV = enemies[num].yV + 0.5
        elseif (player.y-enemies[num].y) < 0 then
          enemies[num].yV = enemies[num].yV - 0.5
        end
      end
      if advancedCollideWithMap(enemies[num].x + enemies[num].xV + enemies[num].w/2, enemies[num].y + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) then
        if enemies[num].xV > 0 then
          while advancedCollideWithMap(enemies[num].x + 1 + enemies[num].w/2, enemies[num].y + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) == false do
            enemies[num].x = enemies[num].x + 1
          end
        else
          while advancedCollideWithMap(enemies[num].x - 1 + enemies[num].w/2, enemies[num].y + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) == false do
            enemies[num].x = enemies[num].x - 1
          end
        end
        enemies[num].xV = 0
      end
      enemies[num].x = enemies[num].x + enemies[num].xV

      if advancedCollideWithMap(enemies[num].x + enemies[num].w/2, enemies[num].y + enemies[num].yV + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) then
        if enemies[num].yV > 0 then
          while advancedCollideWithMap(enemies[num].x + enemies[num].w/2, enemies[num].y + 1 + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) == false do
            enemies[num].y = enemies[num].y + 1
          end
        else
          while advancedCollideWithMap(enemies[num].x + enemies[num].w/2, enemies[num].y - 1 + enemies[num].h/2, enemies[num].w, enemies[num].h, 0, "enemy", num) == false do
            enemies[num].y = enemies[num].y - 1
          end
        end
        enemies[num].yV = 0
      end
      enemies[num].y = enemies[num].y + enemies[num].yV

      enemies[num].xV = enemies[num].xV * 0.8
      enemies[num].yV = enemies[num].yV * 0.8

      if enemies[num].x == enemies[num].oldPos.x and enemies[num].y == enemies[num].oldPos.y then
        enemies[num].timer = enemies[num].timer - dt
      end
    end
  end
  for i, v in ipairs(bullets) do
    if collision(v.x, v.y, 2, 2, enemies[num].x, enemies[num].y, enemies[num].w, enemies[num].h) then
      newExplosion(enemies[num].x, enemies[num].y)
      addAmmo()
      table.remove(enemies, num)
      table.remove(bullets, i)
      break
    end
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

function removeNil(t)
  local ans = {}
  for _,v in pairs(t) do
    ans[ #ans+1 ] = v
  end
  return ans
end
