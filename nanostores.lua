--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____init = require("lib.effect")
    local clearEffects = ____init.clearEffects
    local startEffect = ____init.startEffect
    local allEffects = ____init.allEffects
    local effect = ____init.effect
    ____exports.clearEffects = clearEffects
    ____exports.startEffect = startEffect
    ____exports.allEffects = allEffects
    ____exports.effect = effect
end
do
    local ____init = require("lib.clean-stores")
    local clean = ____init.clean
    local cleanStores = ____init.cleanStores
    ____exports.clean = clean
    ____exports.cleanStores = cleanStores
end
do
    local ____init = require("lib.update")
    local update = ____init.update
    local updateKey = ____init.updateKey
    ____exports.update = update
    ____exports.updateKey = updateKey
end
do
    local ____init = require("lib.create-derived")
    local createDerived = ____init.createDerived
    ____exports.createDerived = createDerived
end
do
    local ____init = require("lib.create-store")
    local createStore = ____init.createStore
    ____exports.createStore = createStore
end
do
    local ____init = require("lib.keep-active")
    local keepActive = ____init.keepActive
    ____exports.keepActive = keepActive
end
do
    local ____init = require("lib.define-map")
    local defineMap = ____init.defineMap
    ____exports.defineMap = defineMap
end
do
    local ____init = require("lib.create-map")
    local createMap = ____init.createMap
    ____exports.createMap = createMap
end
do
    local ____init = require("lib.get-value")
    local getValue = ____init.getValue
    ____exports.getValue = getValue
end
return ____exports
