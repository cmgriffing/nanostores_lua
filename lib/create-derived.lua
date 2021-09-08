--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lib.lualib_bundle");
local ____exports = {}
local ____init = require("lib.create-store")
local createStore = ____init.createStore
local ____init = require("lib.get-value")
local getValue = ____init.getValue
function ____exports.createDerived(stores, cb)
    if not __TS__ArrayIsArray(stores) then
        stores = {stores}
    end
    local derived
    derived = createStore(
        function()
            local values = stores:map(
                function(store) return getValue(store) end
            )
            derived:set(
                cb(
                    _G,
                    __TS__Spread(values)
                )
            )
            local unbinds = stores:map(
                function(store, index)
                    return store:listen(
                        function(value)
                            values[index] = value
                            derived:set(
                                cb(
                                    _G,
                                    __TS__Spread(values)
                                )
                            )
                        end
                    )
                end
            )
            return function()
                for ____, unbind in __TS__Iterator(unbinds) do
                    unbind(_G)
                end
            end
        end
    )
    return derived
end
return ____exports
