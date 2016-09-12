local Player = {
  width = 30,
  height = 40,
  moveIncrement = 20
}

function Player:new()
  local object = {}
  setmetatable(object, self)
  self.__index = self

  object.x, object.y = Player.place()

  return object
end

-- Decides the player's initial position,
-- given the dimensions of the game itself.
function Player:place()
  y = love.graphics.getHeight() - Player.height -5
  x = love.graphics.getWidth()/2
  return x,y
end

function Player:update()
  -- handles moving to the left or right if the corresponding keys are down.
  if love.keyboard.isDown('right') then
    self:handleMoveRight()
  else
    if love.keyboard.isDown('left') then self:handleMoveLeft() end
  end
end

-- Moves to the left, if possible.
function Player:handleMoveLeft()
  if self.x - Player.moveIncrement >= 0 + Player.width/2 then
    self.x = self.x - Player.moveIncrement
  end
end

-- Moves to the right, if possible
function Player:handleMoveRight()
  if self.x + Player.moveIncrement <= love.graphics.getWidth() - Player.width/2 then
    self.x = self.x + Player.moveIncrement
  end
end

function Player:draw()
  -- the player is a funny triangle pointing upwards
  love.graphics.polygon('fill', {
    self.x, self.y, --first point
    self.x +Player.width/2, self.y +Player.height, --second point
    self.x -Player.width/2, self.y +Player.height --third point
  })
end

return Player
