function bullet_load()
  bullets = {}
    bulletSpeed= 200
end

function love.mousepressed(x, y, button)
	if button == 1 then
		 startX = player.x + player.w / 2
		 startY = player.y + player.h / 2
		 mouseX = x
		 mouseY = y

		 angle = math.atan2((mouseY - startY), (mouseX - startX)) 
     bulletR = math.sqrt((mouseX - startX) * (mouseX - startX) + (mouseY - startY) * (mouseY - startY))
     angled = math.deg(angle)

		 bulletDx = bulletSpeed * math.cos(angle)
		 bulletDy = bulletSpeed * math.sin(angle)

		table.insert(bullets, {x = startX, y = startY, theta = angle, r = bulletR, dx = bulletDx, dy = bulletDy})

	end
end

function bullet_update(dt)
  for i2,v in ipairs(bullets) do
    v.r = v.r + dt * bulletSpeed
    v.x = v.r * math.cos(v.theta)
    v.y = v.r * math.sin(v.theta)
  end
end
