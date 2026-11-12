local AtomicContext = {}
AtomicContext.__index = AtomicContext

function AtomicContext.new(seed)
    return setmetatable({ state = seed or 95 }, AtomicContext)
end

function AtomicContext:build_context(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 95) % 997
    end
    return result
end

local obj = AtomicContext.new()
print(obj:build_context(95))

return AtomicContext
