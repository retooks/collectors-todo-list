-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.CategoryHeader = {}
local CategoryHeader = ns.CategoryHeader

function CategoryHeader:CreateHeader(categoryName, parent)
    local categoryHeader = CreateFrame("Button", "CollectorsToDoList_CategoryFrame_" .. categoryName .. "_Header", parent, "CategoryHeaderTemplate")
    categoryHeader:SetWidth(350)
    categoryHeader:SetPoint("TOP", 0, 0)
    categoryHeader.layoutIndex = 1

    categoryHeader:SetScript("OnEnter", function()
        categoryHeader.Label:SetFontObject(GameFontHighlight_NoShadow);
    end)

    categoryHeader:SetScript("OnLeave", function()
        categoryHeader.Label:SetFontObject(GameFontNormal_NoShadow);
    end)

    categoryHeader.Label:SetText(categoryName)

    local collapsed = false
    local atlas = collapsed and "Professions-recipe-header-expand" or "Professions-recipe-header-collapse";
    categoryHeader.CollapseIcon:SetAtlas(atlas, TextureKitConstants.UseAtlasSize);
    categoryHeader.CollapseIconAlphaAdd:SetAtlas(atlas, TextureKitConstants.UseAtlasSize);

    categoryHeader:SetScript("OnClick", function()
        Category:toggle(category)
    end)

    return categoryHeader
end