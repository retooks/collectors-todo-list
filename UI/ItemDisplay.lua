-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.ItemDisplay = {}
local ItemDisplay = ns.ItemDisplay
local StateManager = ns.StateManager
local EventManager = ns.EventManager
local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS

function ItemDisplay:CreateItemDisplay(item, parent)
    local itemContainer = CreateFrame("Frame", nil, parent)
    itemContainer:SetWidth(ns.UI:GetFrame():GetWidth() * 7 / 9)
    itemContainer:SetHeight(25)
    itemContainer:SetPoint("TOP", 0, 0)

    local startingState = StateManager:GetState(item.resetPeriod, item.name)


    local checkboxName = ItemDisplay:GetCheckboxNameFromName(item.name)
    local checkbox = CreateFrame("CheckButton", "CollectorsToDoList_" .. "_Checkbox_" .. checkboxName, itemContainer, "ChatConfigCheckButtonTemplate")
    checkbox:SetPoint("TOPLEFT", 10, 0)

    local checkboxText = checkbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    checkboxText:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
    checkboxText:SetText(item.name)

    checkbox.tooltip = item.tip

    checkbox:SetScript("OnClick", function (self, button, down)
        StateManager:SetValue(item, self:GetChecked())
    end)

    checkbox:SetChecked(startingState["main"])

    EventManager:RegisterCheckboxForStateUpdate(item.name, "main", checkbox)

    if item.activities ~= nil then
        local latestActivityDisplay
        checkbox:Disable()
        itemContainer.activities = {}
        for k,v in pairs(item.activities) do
            --local activityAttemptable = true
            --if v.type == CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST then
            --    local questId = v.questId
            --    activityAttemptable = activityAttemptable and C_TaskQuest.IsActive(questId)
            --end

            -- Only create subvalue if we can attempt it
            --if activityAttemptable then
            local activityDisplay = ItemDisplay:CreateActivityDisplay(item, v, startingState, itemContainer)
            itemContainer.activities[v.name] = activityDisplay
            if latestActivityDisplay == nil then
                activityDisplay:SetPoint("TOPLEFT", checkbox, "BOTTOMLEFT", 15, 0)
            else
                activityDisplay:SetPoint("TOPLEFT", latestActivityDisplay, "BOTTOMLEFT", 0, 0)
            end
            latestActivityDisplay = activityDisplay
            itemContainer:SetHeight(itemContainer:GetHeight() + activityDisplay:GetHeight())
            --end
        end
    end

    return itemContainer
end

function ItemDisplay:CreateActivityDisplay(item, activity, startingState, parent)
    local activityDisplay = CreateFrame("CheckButton", nil, parent, "ChatConfigCheckButtonTemplate")

    local checkboxText1 = activityDisplay:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    checkboxText1:SetPoint("LEFT", activityDisplay, "RIGHT", 5, 0)
    checkboxText1:SetText(activity.name)

    activityDisplay:SetScript("OnClick", function (self, button, down)
        StateManager:SetValue(item, self:GetChecked(), activity.name)
    end)

    activityDisplay:SetChecked(startingState[activity.name])

    EventManager:RegisterCheckboxForStateUpdate(item.name, activity.name, activityDisplay)

    return activityDisplay
end

function ItemDisplay:GetCheckboxNameFromName(name)
    return name:match( "^%s*(.-)%s*$" )
end