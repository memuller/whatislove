local Ship = {
  width = 20,
  height = 40
}
function Ship:new()
  local object = {}
  setmetatable(object, self)
  self.__index = self
  return object
end
return Ship
