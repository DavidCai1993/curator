-- getJob
-- KEYS[1] job name

local objName = 'curator:jobs'
local result = redis.call('hget', objName, KEYS[1])

if result ~= nil then
  redis.call('hdel', objName, KEYS[1])
end

local nAdd = redis.call('hset', objName, KEYS[1], 1)

return nAdd
