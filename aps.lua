local plane = KEYS[1]
local planes_spot = redis.call('hget', 'plane:'..plane, 'spot')

if planes_spot ~= nil
then
    math.randomseed(plane)

    local spot = math.random(1,99)

    return redis.call('hset', 'plane:'..plane,'spot', spot)
end