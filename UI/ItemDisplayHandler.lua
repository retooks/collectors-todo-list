-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.ItemDisplayHandler = {}
local ItemDisplayHandler = ns.ItemDisplayHandler

local Category = ns.Category
local CONSTANTS = ns.CONSTANTS

local itemDisplays = {}

function ItemDisplayHandler:AddItemDisplay(item, itemDisplay)
    if itemDisplays[item.name] == nil then
        itemDisplays[item.name] = {}
    end
    itemDisplays[item.name]["item"] = item
    itemDisplays[item.name]["itemDisplay"] = itemDisplay
end

function ItemDisplayHandler:AddItemActivities(item, activities)
    if itemDisplays[item.name] == nil then
        itemDisplays[item.name] = {}
    end
    itemDisplays[item.name]["activities"] = activities
end

function ItemDisplayHandler:GetItemDisplay(itemName)
    return itemDisplays[itemName]
end

function ItemDisplayHandler:GetItemActivities(itemName)
    if itemDisplays[itemName] then
        return itemDisplays[itemName]["activities"]
    end
    return nil
end

function ItemDisplayHandler:GetItemDisplaysForField(fieldName, fieldValue)
    local matchingItemDisplays = {}
    for itemName, itemDisplay in pairs(itemDisplays) do
        if itemDisplay["item"][fieldName] == fieldValue then
            table.insert(matchingItemDisplays, itemDisplay["itemDisplay"])
        end
    end
    return matchingItemDisplays
end

function ItemDisplayHandler:GetAll()
    return itemDisplays
end

function ItemDisplayHandler:AttachToCategories()
    for itemName, itemAndDisplay in pairs(itemDisplays) do
        local item  = itemAndDisplay["item"]
        local targetCategory = ns.CategoryHandler:GetCategory(item["resetPeriod"], item[CONSTANTS.GROUPING_FIELDS[ns.db.profile.grouping]])
        Category:AddValue(targetCategory, itemAndDisplay["itemDisplay"])
        ns.TabHandler:GetTabContentFrame(item["resetPeriod"]):MarkDirty()
    end
end