
local Player = require('./lib/Player')

function love.load()
  player = Player:new(200,200)
end

function love.update(dt)
  player:update()

end

function love.draw()
    player:draw()
end
