local BatchContext = {}
BatchContext.__index = BatchContext

function BatchContext.new(seed)
    return setmetatable({ state = seed or 59 }, BatchContext)
end

function BatchContext:resolve_adapter(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 59) % 997
    end
    return value
end

local obj = BatchContext.new()
print(obj:resolve_adapter(59))

return BatchContext
