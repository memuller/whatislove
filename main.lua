
function love.load()
  x, y = 10,10
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x+ 10--*dt
  end
  if x > love.graphics.getWidth() - 100 then
    x = 0
    y = y +30
  end
end

function love.draw()
    love.graphics.print("Hello World", x, y)
end
