
local Player = require('./lib/Player')
local Ship = require('./lib/Ship')

function love.load()
  debug = ''
  math.randomseed(os.time())
  game = { time = 0 , ships = {}}
  player = Player:new()

  -- stuff for cheat input
  cheat = {}
  cheat.sequence = {'a', 'b', 'c'}
  cheat.successfulInputs = 0
  cheat.didIt = false
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

-- handles input of cheats.
function love.keyreleased(key)
  -- if the next key in the sequence is pressed...
  if key == cheat.sequence[cheat.successfulInputs+1] then
    -- increments the number of successful inputs
    cheat.successfulInputs = cheat.successfulInputs +1
    -- if the successfulInputs is equal to the length of the sequence,
    --  the cheat is done: set didIt and reset the process.
    if cheat.successfulInputs >= #cheat.sequence then
      cheat.didIt = true
      cheat.successfulInputs = 0
    end
  else -- inputing any other key that isn't the next in the sequence
       --  resets the whole thing.
    cheat.successfulInputs = 0
  end
end

function love.draw()
  love.graphics.print(game.time, 5, 5) -- prints game time

  for i,v in ipairs(game.ships) do
    v:draw()
  end
  player:draw()

  -- stuff for debugging the cheat input.
  love.graphics.print(cheat.successfulInputs, 5, 20)
  if cheat.didIt then love.graphics.print('YAY', 5, 60, 30) end
end
