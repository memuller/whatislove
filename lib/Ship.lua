local Ship = {
  width = 20,
  height = 40
}

function Ship:new()
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.x, object.y = Ship.place()
  object.state = 'movingIn'
  return object
end
function Ship.place()
  local lanes = math.floor((love.graphics.getWidth() -Ship.width*3)/Ship.width)
  local place = math.random(lanes)
  return Ship.width + (place*Ship.width), -Ship.height
end
function Ship:draw()
  love.graphics.rectangle('fill', self.x, self.y, Ship.width, Ship.height)
end

return Ship
