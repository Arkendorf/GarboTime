function bullet_load()
	bulletSpeed = 250
	bullets = {}
end

function bullet_update(dt)
	for i,v in ipairs(bullets) do
		if collideWithMap(v.x, v.y, 2, 2, "bullet") == true then
			bullets[i] = nil
		else
	    v.x = v.x + (v.dx * dt)
	    v.y = v.y + (v.dy * dt)
			v.t = v.t + dt
			if v.t > 7 then
				bullets[i] = nil
			end
		end
  end
	bullets = removeNil(bullets)
end

function newBullet(x, y)
	mX = x + camera.x - w/2
	mY = y + camera.y - h/2
	startX = player.x + player.w / 2
	startY = player.y + player.h / 2
	angle = math.atan2((mY - startY), (mX - startX))
	bulletDx = bulletSpeed * math.cos(angle)
	bulletDy = bulletSpeed * math.sin(angle)

	table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy, t = 0})
end

function addAmmo(num)
	if num == nil then
		player.ammo = player.ammo + math.random(1, 3)
	else
		player.ammo = player.ammo + num
	end
end
