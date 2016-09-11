
local Player = require('./lib/Player')
local Ship = require('./lib/Ship')

function love.load()
  math.randomseed(os.time())
  player = Player:new()
  ship = Ship:new()
end

function love.update(dt)
  player:update()
  ship:update()
end

function love.draw()
    player:draw()
    ship:draw()
end
