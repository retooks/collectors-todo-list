-- Namespaces
local _, ns = ...

-- Expose functions
ns.ResetManager = {}
local ResetManager = ns.ResetManager

local CONSTANTS = ns.CONSTANTS
local StateManager = ns.StateManager

local resetPeriodDelays = {}


function ResetManager:OnInit()
    for _, v in pairs(ns.db.char.timers) do
        if ResetManager:HasTimerExpired(v) then
            ResetManager:TriggerTimer(v)
        else
            ResetManager:CreateTimer(v.resetPeriod, v.targetTime - time())
        end
    end

    resetPeriodDelays[CONSTANTS.RESET_PERIOD.DAILY] = C_DateAndTime.GetSecondsUntilDailyReset()
    resetPeriodDelays[CONSTANTS.RESET_PERIOD.WEEKLY] = C_DateAndTime.GetSecondsUntilWeeklyReset()
    resetPeriodDelays[CONSTANTS.RESET_PERIOD.BIWEEKLY] = ResetManager:GetSecondsUntilBiWeeklyReset()

    for k,_ in pairs(resetPeriodDelays) do
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
    for k,_ in pairs(StateManager:GetState(resetPeriod)) do
        StateManager:ResetItem({ ["name"] = k, ["resetPeriod"] = resetPeriod })
    end
end

function ResetManager:StartResetTimer(resetPeriod)
    if ns.db.char["timers"][resetPeriod] == nil then
        ResetManager:CreateTimer(resetPeriod, resetPeriodDelays[resetPeriod])
    end
end

function ResetManager:GetSecondsUntilBiWeeklyReset()
    local midWeekReset = ResetManager:GetSecondsUntilDayAndTime(CONSTANTS.DAY_OF_WEEK[7], 20, 0)
    local endWeekReset = C_DateAndTime.GetSecondsUntilWeeklyReset()

    return midWeekReset < endWeekReset and midWeekReset or endWeekReset
end

function ResetManager:GetSecondsUntilDayAndTime(dayOfWeek, hour, min)
    local target = date("*t")
    target["hour"] = hour
    target["min"] = min
    target["day"] = target["day"] + ResetManager:DaysUntilNextDayOfWeek(dayOfWeek)

    local diff = difftime(time(target), time())

    if diff < 0 then
        diff = diff + (7 * CONSTANTS.TIME.SECONDS_IN_DAY)
    end

    return diff
end

function ResetManager:DaysUntilNextDayOfWeek(dayOfWeek)
    local current = date("*t")
    local currentIndex = current["wday"]
    local currentDayOfWeek = CONSTANTS.DAY_OF_WEEK[currentIndex]

    local daysNeeded = 0
    while(currentDayOfWeek ~= dayOfWeek) do
        daysNeeded = daysNeeded + 1

        if (currentIndex == 7) then
            currentIndex = 1
        else
            currentIndex = currentIndex + 1
        end

        currentDayOfWeek = CONSTANTS.DAY_OF_WEEK[currentIndex]
    end
    return daysNeeded
end