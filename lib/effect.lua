--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lib.lualib_bundle");
local ____exports = {}
local effects = 0
local resolves = {}
function ____exports.startEffect()
    effects = effects + 1
    return function()
        effects = effects - 1
        if effects == 0 then
            local prevResolves = resolves
            resolves = {}
            for ____, i in ipairs(prevResolves) do
                i(_G)
            end
        end
    end
end
function ____exports.effect(cb)
    local endEffect = ____exports.startEffect()
    return cb(_G):finally(endEffect)
end
function ____exports.allEffects()
    if effects == 0 then
        return __TS__Promise.resolve()
    else
        return __TS__New(
            __TS__Promise,
            function(____, resolve)
                __TS__ArrayPush(resolves, resolve)
            end
        )
    end
end
function ____exports.clearEffects()
    effects = 0
end
return ____exports
