local plane = KEYS[1]
local planes_spot = redis.call('hget', 'plane:'..plane, 'spot')

if (tonumber(plane) > 80)
then
    return {err="Plane id bigger than 80"}
elseif (planes_spot)
then
    return {err="Plane already has parking spot"}
else
    math.randomseed(plane)

    local spot = math.random(1,99)

    return redis.call('hset', 'plane:'..plane,'spot', spot)
end