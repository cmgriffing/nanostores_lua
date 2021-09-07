--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("get-value.index")
local getValue = ____index.getValue
function ____exports.update(self, store, updater)
    store:set(
        updater(
            _G,
            getValue(_G, store)
        )
    )
end
function ____exports.updateKey(self, store, key, updater)
    store:setKey(
        key,
        updater(
            _G,
            getValue(_G, store)[key]
        )
    )
end
return ____exports
