-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.CategoryValueList = {}
local CategoryValueList = ns.CategoryValueList


function CategoryValueList:CreateValueList(categoryName, parent)
    local categoryValueList = CreateFrame("Frame", "CollectorsToDoList_CategoryFrame_" .. categoryName .. "_Values", parent, "VerticalLayoutFrame")
    categoryValueList:SetWidth(350)
    categoryValueList.layoutIndex = 2

    return categoryValueList
end