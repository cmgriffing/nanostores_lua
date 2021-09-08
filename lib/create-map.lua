--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lib.lualib_bundle");
local ____exports = {}
local ____init = require("lib.clean-stores")
local clean = ____init.clean
function ____exports.createMap(init)
    local currentListeners
    local nextListeners = {}
    local destroy
    local store
    store = {
        active = false,
        value = {},
        set = function(self, newObject)
            for key in pairs(newObject) do
                store:setKey(key, newObject[key])
            end
            for key in pairs(store.value) do
                if not (newObject[key] ~= nil) then
                    store:setKey(key)
                end
            end
        end,
        setKey = function(self, key, newValue)
            if store.value then
                if type(newValue) == "nil" then
                    if store.value[key] ~= nil then
                        __TS__Delete(store.value, key)
                        store:notify(key)
                    end
                elseif store.value[key] ~= newValue then
                    store.value[key] = newValue
                    store:notify(key)
                end
            end
        end,
        notify = function(self, changedKey)
            currentListeners = nextListeners
            for ____, listener in __TS__Iterator(currentListeners) do
                listener(_G, store.value, changedKey)
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
                store.value = {}
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
                                store.active = false
                                destroy = nil
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
            store.active = nil
            store.value = nil
            nextListeners = {}
            destroy = nil
        end
    end
    return store
end
return ____exports
