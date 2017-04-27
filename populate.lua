function populateEnemy(num)
  for i = 1, num do
    if math.random() == 1 then
      eX = math.random(1, 3)
    else
      eX = math.random(21, 25)
    end
    if math.random() == 1 then
      eY = math.random(1, 3)
    else
      eY = math.random(21, 25)
    end

    newEnemy(x * 32, y * 32)
  end
end
