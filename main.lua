
local Player = require('./lib/Player')
local Ship = require('./lib/Ship')

function love.load()
  math.randomseed(os.time())
  game = { time = 0 }
  player = Player:new()
  ship = Ship:new()
end

function love.update(dt)
  game.time = game.time + dt
  player:update()
  ship:update()
end

function love.draw()
  love.graphics.print(game.time, 20, 20) -- prints game time
  player:draw()
  ship:draw()
end
