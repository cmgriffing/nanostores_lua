--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____init = require("lib.get-value")
local getValue = ____init.getValue
function ____exports.update(store, updater)
    store:set(
        updater(
            _G,
            getValue(store)
        )
    )
end
function ____exports.updateKey(store, key, updater)
    store:setKey(
        key,
        updater(
            _G,
            getValue(store)[key]
        )
    )
end
return ____exports
