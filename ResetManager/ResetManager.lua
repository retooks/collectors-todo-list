-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.ResetManager = {}
local ResetManager = ns.ResetManager

local CollectorsToDoList = ns.CollectorsToDoList
local Timer = ns.Timer
local CONSTANTS = ns.CONSTANTS
local StateManager = ns.StateManager

local resetPeriodDelays = {}


function ResetManager:OnInit()
    for k, v in pairs(ns.db.char.timers) do
        if ResetManager:HasTimerExpired(v) then
            ResetManager:TriggerTimer(v)
        else
            ResetManager:CreateTimer(v.resetPeriod, v.targetTime - time())
        end
    end

    resetPeriodDelays[CONSTANTS.RESET_PERIOD.DAILY] = C_DateAndTime.GetSecondsUntilDailyReset()
    resetPeriodDelays[CONSTANTS.RESET_PERIOD.WEEKLY] = C_DateAndTime.GetSecondsUntilWeeklyReset()

    for k,v in pairs(resetPeriodDelays) do
        ResetManager:StartResetTimer(k)
    end
end

function ResetManager:CreateTimer(resetPeriod, delay)
    if delay ~= nil then
        local timer = {
            targetTime = time() + delay,
            resetPeriod = resetPeriod
        }
        ns.db.char["timers"][resetPeriod] = timer
        C_Timer.After(delay, function() ResetManager:TriggerTimer(timer) end)
    end
end

function ResetManager:HasTimerExpired(timer)
    return (timer.targetTime < time())
end

function ResetManager:TriggerTimer(timer)
    ResetManager:ResetTimePeriod(timer.resetPeriod)
    ns.db.char["timers"][timer.resetPeriod] = nil
    ResetManager:StartResetTimer(timer.resetPeriod)
end

function ResetManager:ResetTimePeriod(resetPeriod)
    for k,v in pairs(StateManager:GetState(resetPeriod)) do
        StateManager:SetValue({ ["name"] = k }, false)
    end
end

function ResetManager:StartResetTimer(resetPeriod)
    if ns.db.char["timers"][resetPeriod] == nil then
        ResetManager:CreateTimer(resetPeriod, resetPeriodDelays[resetPeriod])
    end
end