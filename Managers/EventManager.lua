-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.EventManager = {}
local EventManager = ns.EventManager

local CONSTANTS = ns.CONSTANTS
local CollectorsToDoList = ns.CollectorsToDoList

local stateCheckboxUpdates = {}

function EventManager:OnInit()
    CollectorsToDoList:RegisterMessage(CONSTANTS.EVENTS.STATE_UPDATE, function(...) EventManager:HandleStateUpdateEvent(...) end)
end

function EventManager:RegisterCheckboxForStateUpdate(itemName, stateKey, checkbox)
    if stateCheckboxUpdates[itemName] == nil then
        stateCheckboxUpdates[itemName] = {}
    end
    stateCheckboxUpdates[itemName][stateKey] = checkbox
end


function EventManager:HandleStateUpdateEvent(...)
    local args = {...}
    local eventName, eventItem, newValue, stateKey = unpack(args)
    if stateCheckboxUpdates[eventItem.name][stateKey] ~= nil then
        stateCheckboxUpdates[eventItem.name][stateKey]:SetChecked(newValue)
    end
end