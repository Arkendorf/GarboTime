
function love.mousepressed(x, y, button)

	if button == 1 then
		startX = player.x + player.w / 2
		startY = player.y + player.h / 2
		mouseX = x
		mouseY = y

		angle = math.atan2((mouseY - startY), (mouseX - startX))

		bulletDx = bulletSpeed * math.cos(angle)
		bulletDy = bulletSpeed * math.sin(angle)

		table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})

	end
end
