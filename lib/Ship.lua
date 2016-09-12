local Ship = {
  width = 20,
  height = 40,
  maxShips = 3,
  spawnInterval = 3,
  spawnChance = .1,
  lastSpawn = 0,
  spawnPending = true
}

function Ship:new()
  local object = {}
  setmetatable(object, self)
  self.__index = self

  object.x, object.y = Ship.place()
  -- ships start moving to their initial positions.
  object.state = 'movingIn'

  return object
end

-- decides if a new enemy ship should be spawned, using a spawn queue with various criteria:
-- -- always spawns one ship on start (due to spawnPending being true)
-- -- if _spawnPending_ time has passed since the last spawn, we will spawn one ship...
-- -- ...with a probability of _spawnChance_ per frame update.
function Ship.shouldSpawn()
  -- if we're at maxShips, we'll never want to spawn more.
  if #(game.ships) >= Ship.maxShips then return false end
  -- if some time passed, we'll queue up a ship spawn.
  if not Ship.spawnPending and Ship.spawnInterval < game.time - Ship.lastSpawn then
    Ship.spawnPending = true
  end
  -- if there's a spawn queued...
  if Ship.spawnPending then
    -- ...there's a chance to actually spawn a ship.
    if Ship.spawnChance >= math.random() then
      -- if the chance triggers, record the spawn time and clear the spawn queue.
      Ship.lastSpawn = game.time
      Ship.spawnPending = false
      return true
    end
  end
  -- if all else fails, by default there's no ship to spawn.
  return false
end

-- decides the position of a newly spawning ship.
function Ship.place()
  -- splits the screen in a series of 'lanes' whose width is the same as the ship.
  local lanes = math.floor((love.graphics.getWidth() -Ship.width*3)/Ship.width)
  -- chooses one of those lanes
  local place = math.random(lanes)
  -- positions in the given lane, but off-screen.
  return Ship.width + (place*Ship.width), -Ship.height
end

function Ship:update()
  -- if we're doing the initial ship move, it descends to around 1/5 of the screen
  --  then stops and switches to the idle state.
  if self.state == 'movingIn' then
    self.y = self.y +Ship.height*.2
    if self.y > love.graphics.getHeight()/(5 * math.random()) then
      self.state = 'idle'
    end
  end
end

function Ship:draw()
  love.graphics.rectangle('fill', self.x, self.y, Ship.width, Ship.height)
end

return Ship
