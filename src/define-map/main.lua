--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____main = require("create-map.main")
local createMap = ____main.createMap
local ____main = require("clean-stores.main")
local clean = ____main.clean
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
