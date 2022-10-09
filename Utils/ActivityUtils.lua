-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.ActivityUtils = {}
local ActivityUtils = ns.ActivityUtils

function ActivityUtils:ActivityAttemptable(activity)
    local activityAttemptable = true
    if activity.type == ns.CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST then
        local questId = activity.questId
        activityAttemptable = activityAttemptable and C_TaskQuest.IsActive(questId)
    end
    return activityAttemptable
end

function ActivityUtils:CheckDepends(activity, item, itemState)
    local canShow = true

    if activity.dependsOn then
        for k, v in pairs(activity.dependsOn) do
            canShow = canShow and itemState[item.activities[v].name]
        end
    end

    canShow = canShow and ActivityUtils:ActivityAttemptable(activity)

    return canShow
end