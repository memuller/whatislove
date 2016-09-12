
local Player = require('./lib/Player')
local Ship = require('./lib/Ship')

function love.load()
  debug = ''
  math.randomseed(os.time())
  game = { time = 0 , ships = {}}
  player = Player:new()
end

function love.update(dt)
  game.time = game.time + dt --records elapsed time
  
  if Ship.shouldSpawn() then
    table.insert(game.ships, Ship:new())
  end

  for i,v in ipairs(game.ships) do
    v:update()
  end

  player:update()
end

function love.draw()
  love.graphics.print(game.time, 5, 5) -- prints game time

  for i,v in ipairs(game.ships) do
    v:draw()
  end
  player:draw()

  love.graphics.print(debug, 5, 20)
end
