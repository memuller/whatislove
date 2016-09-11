local Player = {
  width = 30,
  height = 40,
  moveIncrement = 20
}

function Player:new()
  object = {}
  setmetatable(object, self)
  self.__index = self

  object.x, object.y = Player.place()

  return object
end

-- Decides the player's initial position
-- given the dimensions of the game itself.
function Player:place()
  y = love.graphics.getHeight() - Player.height -5
  x = love.graphics.getWidth()/2
  return x,y
end

function Player:update()
  if love.keyboard.isDown('right') then
    self.x = self.x + Player.moveIncrement
  else
    if love.keyboard.isDown('left') then
      self.x = self.x - Player.moveIncrement
    end
  end

end

function Player:draw()
  love.graphics.polygon('fill', {
    self.x, self.y,
    self.x +Player.width/2, self.y +Player.height,
    self.x -Player.width/2, self.y +Player.height
  })
end

return Player
