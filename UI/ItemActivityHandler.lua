-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.ItemActivityHandler = {}
local ItemActivityHandler = ns.ItemActivityHandler

local activities = {}

function ItemActivityHandler:AddActivity(itemName, activityName, activity)
    if activities[itemName] == nil then
        activities[itemName] = {}
    end
    activities[itemName][activityName] = activity
end

function ItemActivityHandler:GetActivity(itemName, activityName)
    if activities[itemName] == nil then
        return nil
    end
    return activities[itemName][activityName]
end