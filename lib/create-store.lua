--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lib.lualib_bundle");
local ____exports = {}
local ____init = require("lib.clean-stores")
local clean = ____init.clean
function ____exports.createStore(init)
    local currentListeners
    local nextListeners = {}
    local destroy
    local store
    store = {
        set = function(self, newValue)
            store.value = newValue
            currentListeners = nextListeners
            for ____, listener in __TS__Iterator(currentListeners) do
                listener(_G, store.value)
            end
        end,
        subscribe = function(self, listener)
            local unbind = store:listen(listener)
            listener(_G, store.value)
            return unbind
        end,
        listen = function(self, listener)
            if not store.active then
                store.active = true
                if init then
                    destroy = init(_G)
                end
            end
            if nextListeners == currentListeners then
                nextListeners = __TS__ArraySlice(nextListeners)
            end
            __TS__ArrayPush(nextListeners, listener)
            return function()
                if nextListeners == currentListeners then
                    nextListeners = __TS__ArraySlice(nextListeners)
                end
                local index = __TS__ArrayIndexOf(nextListeners, listener)
                __TS__ArraySplice(nextListeners, index, 1)
                if not #nextListeners then
                    setTimeout(
                        _G,
                        function()
                            if store.active and (not #nextListeners) then
                                if destroy then
                                    destroy(_G)
                                end
                                destroy = nil
                                store.active = nil
                            end
                        end,
                        1000
                    )
                end
            end
        end
    }
    if os.getenv("NODE_ENV") ~= "production" then
        store[clean] = function()
            if destroy then
                destroy(_G)
            end
            store.active = false
            store.value = nil
            nextListeners = {}
            destroy = nil
        end
    end
    return store
end
return ____exports
