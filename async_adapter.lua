local LocalProvider = {}
LocalProvider.__index = LocalProvider

function LocalProvider.new(seed)
    return setmetatable({ state = seed or 86 }, LocalProvider)
end

function LocalProvider:load_worker(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 86) % 997
    end
    return acc
end

local obj = LocalProvider.new()
print(obj:load_worker(86))

return LocalProvider
