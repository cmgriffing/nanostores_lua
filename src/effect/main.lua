--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local effects = 0
local resolves = {}
function ____exports.startEffect(self)
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
function ____exports.effect(self, cb)
    local endEffect = ____exports.startEffect(_G)
    return cb(_G):finally(endEffect)
end
function ____exports.allEffects(self)
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
function ____exports.clearEffects(self)
    effects = 0
end
return ____exports
