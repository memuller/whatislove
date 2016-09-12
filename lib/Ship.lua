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
  object.state = 'movingIn'
  return object
end

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

function Ship.place()
  local lanes = math.floor((love.graphics.getWidth() -Ship.width*3)/Ship.width)
  local place = math.random(lanes)
  return Ship.width + (place*Ship.width), -Ship.height
end

function Ship:update()
  if self.state == 'movingIn' then
    self.y = self.y +Ship.height*.2
    if self.y > love.graphics.getHeight()/4 then
      self.state = 'idle'
    end
  end
end

function Ship:draw()
  love.graphics.rectangle('fill', self.x, self.y, Ship.width, Ship.height)
end

return Ship
