-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.CategoryValue = {}
local CategoryValue = ns.CategoryValue
local StateManager = ns.StateManager
local EventManager = ns.EventManager
local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS

function CategoryValue:CreateValue(item, parent, startingState)
    local valueContainer = CreateFrame("Frame", nil, parent)
    valueContainer:SetWidth(350)
    valueContainer:SetHeight(25)
    valueContainer:SetPoint("TOP", 0, 0)


    local checkboxName = CategoryValue:GetCheckboxNameFromName(item.name)
    local checkbox = CreateFrame("CheckButton", "CollectorsToDoList_" .. "_Checkbox_" .. checkboxName, valueContainer, "ChatConfigCheckButtonTemplate")
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

    local latestSubValue
    if item.activities ~= nil then
        checkbox:Disable()
        for k,v in pairs(item.activities) do
            local subValue = CategoryValue:CreateSubValue(item, v, startingState, valueContainer)
            if latestSubValue == nil then
                subValue:SetPoint("TOPLEFT", checkbox, "BOTTOMLEFT", 15, 0)
            else
                subValue:SetPoint("TOPLEFT", latestSubValue, "BOTTOMLEFT", 0, 0)
            end
            latestSubValue = subValue
            valueContainer:SetHeight(valueContainer:GetHeight() + 25)
        end
    end

    return valueContainer
end

function CategoryValue:CreateSubValue(item, activity, startingState, parent)
    local subValue = CreateFrame("CheckButton", nil, parent, "ChatConfigCheckButtonTemplate")

    local checkboxText1 = subValue:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    checkboxText1:SetPoint("LEFT", subValue, "RIGHT", 5, 0)
    checkboxText1:SetText(activity.name)

    subValue:SetScript("OnClick", function (self, button, down)
        StateManager:SetValue(item, self:GetChecked(), activity.name)
    end)

    subValue:SetChecked(startingState[activity.name])

    EventManager:RegisterCheckboxForStateUpdate(item.name, activity.name, subValue)

    return subValue
end

function CategoryValue:GetCheckboxNameFromName(name)
    return name:match( "^%s*(.-)%s*$" )
end