local zeroIndexedTable =
    setmetatable(
    {},
    {
        __call = function(self, _t)
            return setmetatable(
                {
                    _internal = _t
                },
                {
                    __index = function(self, k)
                        return self._internal[k + 1]
                    end,
                    __newindex = function(self, k, v)
                        self._internal[k + 1] = v
                    end
                }
            )
        end
    }
)

-- usage

local myTable = {1, 2, 3, 4}
local t = zeroIndexedTable(myTable)

print(t[0])
--> 1
print(t[1])
--> 2
t[0] = -1
print(t[0])
--> 1
