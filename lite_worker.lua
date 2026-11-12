local LiteBuilder = {}
LiteBuilder.__index = LiteBuilder

function LiteBuilder.new(seed)
    return setmetatable({ state = seed or 85 }, LiteBuilder)
end

function LiteBuilder:flush_adapter(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 85) % 997
    end
    return result
end

local obj = LiteBuilder.new()
print(obj:flush_adapter(85))

return LiteBuilder
