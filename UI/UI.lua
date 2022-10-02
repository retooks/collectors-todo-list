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

function UI:OnInit(initialState)
    if (ns.db.char.ui == nil) then
        ns.db.char.ui = {}
    end

    for k,v in pairs(initialState) do
        table.insert(activeResetPeriods, k)
    end

    table.sort(activeResetPeriods, function(a,b) return CONSTANTS.RESET_PERIOD_DISPLAY_POSITION[a] < CONSTANTS.RESET_PERIOD_DISPLAY_POSITION[b] end)

    UI:CreateFrame()

    for resetPeriodName, resetPeriodValues in pairs(initialState) do
        for catName, catValues in pairs(resetPeriodValues) do
            UI:AddCategory(resetPeriodName, catName)
            table.sort(catValues, function(a, b) return a.item.name < b.item.name end)
            for k, v in ipairs(catValues) do
                UI:AddValue(resetPeriodName, catName, v.item, v.state)
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
        local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "PanelTabButtonTemplate")
        tab:SetID(i)
        tab:SetText(select(i, ...))
        tab:SetScript("OnClick", Tab_OnClick)

        tab.content = CreateFrame("Frame", nil, MainFrame.ScrollFrame, "VerticalLayoutFrame")
        tab.content:SetWidth(350)
        tab.content:Hide()
        tab.content:MarkDirty()
        
        table.insert(contents, tab.content)
        
        if (i == 1) then
            tab:SetPoint("TOPLEFT", MainFrame, "BOTTOMLEFT", 5, -1)
        else
            tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", 0, 0)
        end 
    end
    
    Tab_OnClick(_G[frameName.."Tab1"])
    
    return unpack(contents)
end

function UI:CreateFrame() 
    MainFrame = CreateFrame("Frame", "CollectorsToDoList_MainFrame", UIParent)

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


    local tex = MainFrame:CreateTexture(nil, "BACKGROUND")
    tex:SetAllPoints()
    tex:SetTexture("Interface/Professions/Professions")
    --tex:SetBlendMode("ADD") --TODO add option
    tex:SetSize(450, 600)
    tex:SetTexCoord(0.02940, 0.14501953125, 0.08294, 0.57397)

    --TODO add close button

    local closeButton = CreateFrame("Button", "CTDL_CloseButton", MainFrame, "UIPanelCloseButton")
    closeButton:SetSize(20, 20)
    closeButton:SetPoint("TOPRIGHT", MainFrame, "TOPRIGHT", -5, -5)

    CreateFrame("Frame", "CTDL_BorderNineSlice", MainFrame, "BorderNineSlice")

    --creates the text
    MainFrame.text = MainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    MainFrame.text:SetSize(0, 25)
    MainFrame.text:SetPoint("TOP", 0, -2)
    MainFrame.text:SetText("Collectors To-Do List")

    --create scroll frame
    MainFrame.ScrollFrame = CreateFrame("ScrollFrame", "CollectorsToDoList_ScrollFrame", MainFrame, "UIPanelScrollFrameTemplate")
    MainFrame.ScrollFrame:SetWidth(375)
    MainFrame.ScrollFrame:SetPoint("TOPLEFT", MainFrame, "TOPLEFT", 50, -33)
    MainFrame.ScrollFrame:SetPoint("BOTTOMRIGHT", MainFrame, "BOTTOMRIGHT", -25, 4)
    MainFrame.ScrollFrame:SetClipsChildren(true)

    MainFrame.ScrollFrame.ScrollBar:ClearAllPoints()
    MainFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", MainFrame.ScrollFrame, "TOPRIGHT", -16, -18)
    MainFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", MainFrame.ScrollFrame, "BOTTOMRIGHT", -11, 18)

    local tabTable = { SetTabs(MainFrame, #activeResetPeriods, unpack(activeResetPeriods)) }
    for activeCount = 1, #activeResetPeriods do
        tabs[activeResetPeriods[activeCount]] = tabTable[activeCount]
    end

    MainFrame:Hide()
end

function UI:AddCategory(tabName, categoryName)
    local cat = Category:CreateCategory(categoryName, tabs[tabName])
    cat.layoutIndex = tabs[tabName]:GetNumChildren() + 1
    tabs[tabName]:MarkDirty()

    if categories[tabName] == nil then
        categories[tabName] = {}
    end
    categories[tabName][categoryName] = cat
end

function UI:AddValue(tabName, categoryName, item, startingState)
    Category:AddValue(categories[tabName][categoryName], item, startingState)
    tabs[tabName]:MarkDirty()
end