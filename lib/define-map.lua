--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lib.lualib_bundle");
local ____exports = {}
local ____init = require("lib.create-map")
local createMap = ____init.createMap
local ____init = require("lib.clean-stores")
local clean = ____init.clean
function ____exports.defineMap(init)
    local Builder
    Builder = function(id, ...)
        local args = {...}
        if not Builder.cache[id] then
            local store
            store = createMap(
                function()
                    store:setKey("id", id)
                    local destroy
                    if init then
                        destroy = init(
                            _G,
                            store,
                            id,
                            unpack(args)
                        )
                    end
                    return function()
                        __TS__Delete(Builder.cache, id)
                        if destroy then
                            destroy(_G)
                        end
                    end
                end
            )
            Builder.cache[id] = store
        end
        return Builder.cache[id]
    end
    Builder.cache = {}
    if os.getenv("NODE_ENV") ~= "production" then
        Builder[clean] = function()
            for id in pairs(Builder.cache) do
                (function()
                    local ____self = Builder.cache[id]
                    return ____self[clean](____self)
                end)()
            end
            Builder.cache = {}
        end
    end
    return Builder
end
return ____exports
