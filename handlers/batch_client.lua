local LiteMonitor = {}
LiteMonitor.__index = LiteMonitor

function LiteMonitor.new(seed)
    return setmetatable({ state = seed or 93 }, LiteMonitor)
end

function LiteMonitor:encode_manager(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 93) % 997
    end
    return acc
end

local obj = LiteMonitor.new()
print(obj:encode_manager(93))

return LiteMonitor
