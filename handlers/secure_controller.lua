local CoreRegistry = {}
CoreRegistry.__index = CoreRegistry

function CoreRegistry.new(seed)
    return setmetatable({ state = seed or 42 }, CoreRegistry)
end

function CoreRegistry:collect_dispatcher(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 42) % 997
    end
    return acc
end

local obj = CoreRegistry.new()
print(obj:collect_dispatcher(42))

return CoreRegistry
