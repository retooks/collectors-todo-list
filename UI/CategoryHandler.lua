-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.CategoryHandler = {}
local CategoryHandler = ns.CategoryHandler

local CONSTANTS = ns.CONSTANTS

local categories = {}
local displayedCategories = {}

function CategoryHandler:AddCategory(tabName, categoryName, category)
    if categories[tabName] == nil then
        categories[tabName] = {}
    end
    categories[tabName][categoryName] = category
end

function CategoryHandler:GetCategory(tabName, categoryName)
    if categories[tabName] == nil then
        return nil
    end
    return categories[tabName][categoryName]
end

function CategoryHandler:CreateCategories()
    local tabs = ns.TabHandler:GetAllTabs()
    for _, groupingValue in pairs(CONSTANTS[ns.db.profile.grouping]) do
        for tabName, _ in pairs(tabs) do
            if CategoryHandler:GetCategory(tabName, groupingValue) == nil then
                local tabContent = ns.TabHandler:GetTabContentFrame(tabName)
                local category = ns.Category:CreateCategory(groupingValue, tabContent)
                CategoryHandler:AddCategory(tabName, groupingValue, category)
            end
        end
    end
end

function CategoryHandler:RefreshDisplay()
    for tabName, _ in pairs(ns.TabHandler:GetAllTabs()) do
        local tabContent = ns.TabHandler:GetTabContentFrame(tabName)

        -- Remove all the current categories
        if displayedCategories[tabName] ~= nil then
            for pos, category in pairs(displayedCategories[tabName]) do
                category.layoutIndex = nil
                category:Hide()
                displayedCategories[tabName][pos] = nil
            end
        end

        for _, groupingValue in pairs(CONSTANTS[ns.db.profile.grouping]) do
            local category = CategoryHandler:GetCategory(tabName, groupingValue)
            if category ~= nil then
                if displayedCategories[tabName] == nil then
                    displayedCategories[tabName] = {}
                end
                category:Hide()
                -- Only display if it has children?
                if ns.Category:GetNumChildren(category) > 0 then
                    table.insert(displayedCategories[tabName], category)
                    category.layoutIndex = #displayedCategories[tabName]
                    category:Show()
                end
            end
        end

        tabContent:MarkDirty()
    end
end
