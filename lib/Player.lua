local Player = {
}
function Player:new(x,y)
  object = {}
  setmetatable(object, self)
  self.__index = self

  object.x, object.y = x,y

  return object
end
return Player
