-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.Category = {}
local Category = ns.Category

local CollectorsToDoList = ns.CollectorsToDoList
local StateManager = ns.StateManager


function Category:CreateCategory(categoryName, parent)
    local category = CreateFrame("Frame", "CollectorsToDoList_CategoryFrame_" .. categoryName, parent, BackdropTemplateMixin and "BackdropTemplate")
    category:SetWidth(350)
    category:SetHeight(25)
    category:SetPoint("TOP", -50, -10)

    --adds a background to the frame
    category:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background-Corrupted",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 1, edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
      })

    --creates the text
    category.text = category:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    category.text:SetSize(0, 25)
    category.text:SetPoint("TOP", 0, -2)
    category.text:SetText(categoryName)

    --CollectorsToDoList:Print(category.text:GetStringHeight())

    return {
    	["frame"] = category,
    	["categoryName"] = categoryName,
    	["checkboxes"] = {},
    	["latestCheckbox"] = nil,
    }
end

function Category:IncreaseHeight(category, increase)
	height = category["frame"]:GetHeight()
	category["frame"]:SetHeight(height + increase)
end	

function Category:CreateCheckbox(category, item)
    local checkboxName = Category:GetCheckboxNameFromName(item.name)
    local checkbox = CreateFrame("CheckButton", "CollectorsToDoList_" .. category["categoryName"] .. "_Checkbox_" .. checkboxName, category["frame"], "ChatConfigCheckButtonTemplate")

    checkboxText = checkbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    checkboxText:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
    checkboxText:SetText(item.name)

    checkbox.tooltip = item.tip

    checkbox:SetScript("OnClick", function (self, button, down)
        StateManager:SetValue(item, self:GetChecked())
    end)

    category["checkboxes"][checkboxName] = checkbox

    return checkbox
end

function Category:AddCheckbox(category, item, startingState)
	local checkbox = Category:CreateCheckbox(category, item)
    checkbox:SetChecked(startingState)
	if category["latestCheckbox"] == nil then
		-- at top of category
		checkbox:SetPoint("TOPLEFT", 20, -20)
	else
		checkbox:SetPoint("TOPLEFT", category["latestCheckbox"], "BOTTOMLEFT", 0, 0)
	end

	category["latestCheckbox"] = checkbox
	Category:IncreaseHeight(category, 24)
end

function Category:GetCheckboxNameFromName(name)
    return name:match( "^%s*(.-)%s*$" )
end

function Category:GetCheckboxFromItem(category, item)
    return category["checkboxes"][Category:GetCheckboxNameFromName(item.name)]
end