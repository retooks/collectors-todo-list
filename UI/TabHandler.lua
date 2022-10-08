-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.TabHandler = {}
local TabHandler = ns.TabHandler

local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS

local tabs = {}
local displayedTabs = {}

local function Tab_OnClick(self)
    PanelTemplates_SetTab(self:GetParent(), self:GetID())

    local scrollChild = ns.UI:GetFrame().ScrollFrame:GetScrollChild()
    if (scrollChild) then
        scrollChild:Hide()
    end

    ns.UI:GetFrame().ScrollFrame:SetScrollChild(self.content)
    self.content:Show()
end

local function CreateTab(tabName)
    local tab = CreateFrame("Button", "CollectorsToDoList_Tab_"..tabName, ns.UI:GetFrame(), ns.isDF and "PanelTabButtonTemplate" or "CharacterFrameTabButtonTemplate")
    tab:SetText(tabName)
    tab:SetScript("OnClick", Tab_OnClick)

    tab.content = CreateFrame("Frame", nil, ns.UI:GetFrame().ScrollFrame, "VerticalLayoutFrame")
    tab.content:SetWidth(ns.UI:GetFrame().ScrollFrame:GetWidth())
    tab.content:Hide()
    tab.content:MarkDirty()

    return tab
end

function TabHandler:AddTab(tabName)
    -- Create it if it doesn't exist in tab table
    if tabs[tabName] == nil then
        tabs[tabName] = CreateTab(tabName)
        PanelTemplates_TabResize(tabs[tabName])
    end
    -- Add it to the tabs on the bottom of the frame
    table.insert(displayedTabs, tabName)
end

function TabHandler:RemoveAllDisplayed()
    for pos, tabName in pairs(displayedTabs) do
        tabs[tabName]:ClearAllPoints()
        tabs[tabName]:Hide()
        displayedTabs[pos] = nil
    end
end

function TabHandler:RefreshTabs()
    local currentX = 0
    local currentY = 0

    table.sort(displayedTabs, function(a,b)
        return CONSTANTS.TAB_DISPLAY_POSITION[a]  < CONSTANTS.TAB_DISPLAY_POSITION[b]
    end)

    local frameTabs = {}
    for pos, tabName in pairs(displayedTabs) do
        local tab = tabs[tabName]
        frameTabs[pos] = tab
        tab:SetID(pos)
        tab:Show()
        currentX, currentY = TabHandler:SetTabPoints(tab, currentX, currentY)
    end

    ns.UI:GetFrame().numTabs = #frameTabs
    ns.UI:GetFrame().Tabs = frameTabs

    Tab_OnClick(_G["CollectorsToDoList_Tab_" .. displayedTabs[1]])
end

function TabHandler:SetTabPoints(tab, currentXIn, currentYIn)
    local currentX = currentXIn
    local currentY = currentYIn
    tab:ClearAllPoints()
    tab:SetPoint("TOPLEFT", ns.UI:GetFrame(), "BOTTOMLEFT", currentX, currentY)
    currentX = currentX + PanelTemplates_GetTabWidth(tab)
    if currentX >= ns.UI:GetFrame():GetWidth() then
        currentY = currentY - tab:GetHeight() - 5
        currentX = 0
        currentX, currentY = TabHandler:SetTabPoints(tab, currentX, currentY)
    end
    return currentX, currentY
end

function TabHandler:GetAllTabs()
    return tabs
end

function TabHandler:GetTabContentFrame(tabName)
    if tabs[tabName] then
        return tabs[tabName].content
    end
end