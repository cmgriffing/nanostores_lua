--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.getValue(store)
    if store.active then
        return store.value
    else
        local result
        local unbind = store:subscribe(
            function(value)
                result = value
            end
        )
        unbind(_G)
        return result
    end
end
return ____exports
