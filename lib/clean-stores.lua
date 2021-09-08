--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lib.lualib_bundle");
local ____exports = {}
local ____init = require("lib.effect")
local clearEffects = ____init.clearEffects
____exports.clean = __TS__Symbol("clean")
function ____exports.cleanStores(...)
    local stores = {...}
    if os.getenv("NODE_ENV") == "production" then
        error(
            __TS__New(Error, "cleanStores() can be used only during development or tests"),
            0
        )
    end
    clearEffects()
    for ____, store in ipairs(stores) do
        if store then
            if store.mocked then
                __TS__Delete(store, "mocked")
            end
            store[____exports.clean](store)
        end
    end
end
return ____exports
