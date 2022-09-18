-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.UI = {}
local UI = ns.UI

local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS
local Category = ns.Category

local MainFrame

local activeResetPeriods = {}
local categories = {}
local tabs = {}
local latestCategory = {}

function UI:OnInit(initialState)
    if (ns.db.char.ui == nil) then
        ns.db.char.ui = {}
    end

    for k,v in pairs(initialState) do
        table.insert(activeResetPeriods, k)
    end

    table.sort(activeResetPeriods, function(a,b) return CONSTANTS.RESET_PERIOD_DISPLAY_POSITION[a] < CONSTANTS.RESET_PERIOD_DISPLAY_POSITION[b] end)

    UI:CreateFrame()
    CollectorsToDoList:RegisterMessage(CONSTANTS.EVENTS.STATE_UPDATE, function(...) local args = {...} UI:HandleStateUpdated(unpack(args)) end)

    for resetPeriodName, resetPeriodValues in pairs(initialState) do
        for catName, catValues in pairs(resetPeriodValues) do
            UI:AddCategory(resetPeriodName, catName)
            table.sort(catValues, function(a, b) return a.item.name < b.item.name end)
            for k, v in ipairs(catValues) do
                UI:AddCheckbox(resetPeriodName, catName, v.item, v.state)
            end
        end
    end
end

function UI:CloseFrame()
    MainFrame:Hide()
end

function UI:OpenFrame()
    MainFrame:Show()
end

function UI:ToggleFrame()
    if MainFrame:IsShown() then
        UI:CloseFrame()
    else
        UI:OpenFrame()
    end
end

local function Tab_OnClick(self)
    PanelTemplates_SetTab(self:GetParent(), self:GetID())
    
    local scrollChild = MainFrame.ScrollFrame:GetScrollChild()
    if (scrollChild) then
        scrollChild:Hide()
    end
    
    MainFrame.ScrollFrame:SetScrollChild(self.content)
    self.content:Show() 
end

local function SetTabs(frame, numTabs, ...)
    frame.numTabs = numTabs

    local contents = {}
    local frameName = frame:GetName()

    for i = 1, numTabs do   
        local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate")
        tab:SetID(i)
        tab:SetText(select(i, ...))
        tab:SetScript("OnClick", Tab_OnClick)
        
        tab.content = CreateFrame("Frame", nil, MainFrame.ScrollFrame)
        tab.content:SetSize(450, 500)
        tab.content:Hide()
        
        table.insert(contents, tab.content)
        
        if (i == 1) then
            tab:SetPoint("TOPLEFT", MainFrame, "BOTTOMLEFT", 5, 7)
        else
            tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", -14, 0)
        end 
    end
    
    Tab_OnClick(_G[frameName.."Tab1"])
    
    return unpack(contents)
end

function UI:CreateFrame() 
    MainFrame = CreateFrame("Frame", "CollectorsToDoList_MainFrame", UIParent, "UIPanelDialogTemplate")

    MainFrame:SetSize(450, 600)
    MainFrame:ClearAllPoints()
    MainFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", ns.db.char.ui.mainFrame.x, ns.db.char.ui.mainFrame.y)
    MainFrame:SetClampedToScreen(true)
    MainFrame:SetMovable(true)
    MainFrame:EnableMouse(true)
    MainFrame:RegisterForDrag("LeftButton")
    MainFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    MainFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        ns.db.char.ui.mainFrame.x = tostring(self:GetLeft())
        ns.db.char.ui.mainFrame.y = tostring(self:GetTop())
    end)

    --creates the text
    MainFrame.text = MainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    MainFrame.text:SetSize(0, 25)
    MainFrame.text:SetPoint("TOP", 0, -2)
    MainFrame.text:SetText("Collectors To-Do List")

    --create scroll frame
    MainFrame.ScrollFrame = CreateFrame("ScrollFrame", "CollectorsToDoList_ScrollFrame", MainFrame, "UIPanelScrollFrameTemplate")
    MainFrame.ScrollFrame:SetPoint("TOPLEFT", CollectorsToDoList_MainFrameDialogBG, "TOPLEFT", 4, -8)
    MainFrame.ScrollFrame:SetPoint("BOTTOMRIGHT", CollectorsToDoList_MainFrameDialogBG, "BOTTOMRIGHT", -3, 4)
    MainFrame.ScrollFrame:SetClipsChildren(true)

    MainFrame.ScrollFrame.ScrollBar:ClearAllPoints()
    MainFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", MainFrame.ScrollFrame, "TOPRIGHT", -12, -18)
    MainFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", MainFrame.ScrollFrame, "BOTTOMRIGHT", -7, 18)

    local tabTable = { SetTabs(MainFrame, #activeResetPeriods, unpack(activeResetPeriods)) }
    for activeCount = 1, #activeResetPeriods do
        tabs[activeResetPeriods[activeCount]] = tabTable[activeCount]
    end

    MainFrame:Hide()
end

function UI:AddCategory(tabName, categoryName)
    local cat = Category:CreateCategory(categoryName, tabs[tabName])

    if latestCategory[tabName] == nil then
        cat["frame"]:SetPoint("TOP", -18, -10)
    else
        cat["frame"]:SetPoint("TOP", latestCategory[tabName], "BOTTOM", 0, -10)
    end

    latestCategory[tabName] = cat["frame"]
    if categories[tabName] == nil then
        categories[tabName] = {}
    end
    categories[tabName][categoryName] = cat
end

function UI:AddCheckbox(tabName, categoryName, item, startingState)
    Category:AddCheckbox(categories[tabName][categoryName], item, startingState)
end

function UI:HandleStateUpdated(eventName, item, newValue)
    Category:GetCheckboxFromItem(categories[item["resetPeriod"]][item["expansion"]], item):SetChecked(newValue)
end