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
    local itemContainer = CreateFrame("Frame", nil, parent, "VerticalLayoutFrame")
    itemContainer:SetWidth(parent:GetWidth())
    itemContainer:SetHeight(25)
    itemContainer:SetPoint("TOP", 0, 0)

    local startingState = StateManager:GetState(item.resetPeriod, item.name)

    local checkboxName = ItemDisplay:GetCheckboxNameFromName(item.name)
    local checkbox = CreateFrame("CheckButton", "CollectorsToDoList_" .. "_Checkbox_" .. checkboxName, itemContainer, "ChatConfigCheckButtonTemplate")
    checkbox.layoutIndex = 1

    local checkboxText = checkbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    checkboxText:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
    checkboxText:SetText(item.name)

    checkbox.tooltip = item.tip

    checkbox:SetScript("OnClick", function (self, button, down)
        StateManager:SetValue(item, self:GetChecked())
    end)

    checkbox:SetChecked(startingState["main"])

    EventManager:RegisterCheckboxForStateUpdate(item.name, "main", checkbox)

    if item.activities then
        checkbox:Disable()
        ItemDisplay:RefreshActivities(item, itemContainer)
    end

    return itemContainer
end

function ItemDisplay:RefreshActivities(item, parent)
    local state = StateManager:GetState(item.resetPeriod, item.name)
    local currentActivities = ns.ItemDisplayHandler:GetItemActivities(item.name)
    if currentActivities ~= nil then
        for _, activityDisplay in pairs(currentActivities) do
            activityDisplay.layoutIndex = nil
            activityDisplay:Hide()
        end
    end
    local activities = {}
    for _, activity in pairs(item.activities) do
        if ns.ActivityUtils:CheckDepends(activity, item, state) then
            local activityDisplay = ItemDisplay:CreateActivityDisplay(item, activity, state, parent)
            table.insert(activities, activityDisplay)

            activityDisplay.layoutIndex = activity.id + 1
            activityDisplay.leftPadding = 15
            activityDisplay:Show()
        end
    end
    ns.ItemDisplayHandler:AddItemActivities(item, activities)
    parent:MarkDirty()
    return activities
end

function ItemDisplay:CreateActivityDisplay(item, activity, startingState, parent)
    local activityDisplay = ns.ItemActivityHandler:GetActivity(item.name, activity.name)
    if activityDisplay == nil then
        activityDisplay = CreateFrame("CheckButton", nil, parent, "ChatConfigCheckButtonTemplate")

        local checkboxText1 = activityDisplay:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        checkboxText1:SetPoint("LEFT", activityDisplay, "RIGHT", 5, 0)
        checkboxText1:SetText(activity.name)

        activityDisplay:SetScript("OnClick", function (self, button, down)
            StateManager:SetValue(item, self:GetChecked(), activity.name)
            ItemDisplay:RefreshActivities(item, parent)

        end)

        activityDisplay:SetChecked(startingState[activity.name])
        ns.ItemActivityHandler:AddActivity(item.name, activity.name, activityDisplay)
        EventManager:RegisterCheckboxForStateUpdate(item.name, activity.name, activityDisplay)
    end

    return activityDisplay
end

function ItemDisplay:GetCheckboxNameFromName(name)
    return name:match( "^%s*(.-)%s*$" )
end