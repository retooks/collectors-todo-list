-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.Category = {}
local Category = ns.Category

function Category:CreateCategory(categoryName, parent)
    local category = CreateFrame("Frame", "CollectorsToDoList_CategoryFrame_" .. categoryName, parent, "VerticalLayoutFrame")
    category:SetWidth(parent:GetWidth())
    category:SetHeight(25)
    category:SetPoint("TOP", -50, -10)

    category.categoryHeader = ns.CategoryHeader:CreateHeader(categoryName, category)
    category.categoryValueList = ns.CategoryValueList:CreateValueList(categoryName, category)

    category.categoryHeader:SetScript("OnClick", function()
        Category:toggle(category)
    end)

    return category
end

function Category:toggle(category)
    local categoryHeader = category.categoryHeader
    local categoryValueList = category.categoryValueList

    categoryValueList:SetShown(not categoryValueList:IsShown())
    if ns.isDF then
        local collapsed = not categoryValueList:IsShown()
        local atlas = collapsed and "Professions-recipe-header-expand" or "Professions-recipe-header-collapse";
        categoryHeader.CollapseIcon:SetAtlas(atlas, TextureKitConstants.UseAtlasSize);
        categoryHeader.CollapseIconAlphaAdd:SetAtlas(atlas, TextureKitConstants.UseAtlasSize);
    end
    category:MarkDirty()
end

function Category:AddValue(category, value)
    value:SetParent(category.categoryValueList)
    value.layoutIndex = category.categoryValueList:GetNumChildren() + 1
    category.categoryValueList:MarkDirty()
end

function Category:GetNumChildren(category)
    return category.categoryValueList:GetNumChildren()
end