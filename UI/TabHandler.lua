-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.TabHandler = {}
local TabHandler = ns.TabHandler

local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS

local tabs = {}
local tabsSize = 0
local tabIds = {}
local displayedTabs = {}
local displayedTabsSize = 0
local activeTabName

local function Tab_OnClick(self)
    PanelTemplates_SetTab(self:GetParent(), self:GetID())

    local scrollChild = ns.UI:GetFrame().ScrollFrame:GetScrollChild()
    if (scrollChild) then
        scrollChild:Hide()
    end

    activeTabName = tabIds[self:GetID()]:GetText()

    ns.UI:GetFrame().ScrollFrame:SetScrollChild(self.content)
    self.content:Show()
end

local function CreateTab(tabName)
    local id = #tabIds + 1
    local tab = CreateFrame("Button", "CollectorsToDoList_Tab_"..tabName, ns.UI:GetFrame(), ns.isDF and "PanelTabButtonTemplate" or "CharacterFrameTabButtonTemplate")
    tab:SetID(id)
    tab:SetText(tabName)
    tab:SetScript("OnClick", Tab_OnClick)

    tabIds[id] = tab

    tab.content = CreateFrame("Frame", nil, ns.UI:GetFrame().ScrollFrame, "VerticalLayoutFrame")
    tab.content:SetWidth(350)
    tab.content:Hide()
    tab.content:MarkDirty()

    return tab
end

function TabHandler:AddTab(tabName)
    -- Create it if it doesn't exist in tab table
    if tabs[tabName] == nil then
        tabs[tabName] = CreateTab(tabName)
        tabsSize = tabsSize + 1
        ns.UI:GetFrame().numTabs = tabsSize
        --TODO need to remove tabs from this to add/remove them
        ns.UI:GetFrame().Tabs = tabIds
    end
    -- Add it to the tabs on the bottom of the frame
    displayedTabs[tabName] = tabs[tabName]
    displayedTabsSize = displayedTabsSize + 1

    -- Ensure the state of all the tabs is correct when new one is added to the frame
    if activeTabName == nil then
        Tab_OnClick(_G["CollectorsToDoList_Tab_" .. tabName])
    else
        Tab_OnClick(_G["CollectorsToDoList_Tab_" .. activeTabName])
    end

    TabHandler:RefreshTabs()
end

function TabHandler:RemoveTab(tabName)
    -- Remove it from the bottom of the frame
    tabs[tabName]:ClearAllPoints()
    for id, tabNameL in pairs(tabIds) do
        if tabName == tabNameL then
            PanelTemplates_DisableTab(ns.UI:GetFrame(), id)
        end
    end
    displayedTabs[tabName] = nil
    displayedTabsSize = displayedTabsSize - 1
    -- If it is the active one swap to the first tab
    if activeTabName == tabName then
        for tabNameL, tab in pairs(displayedTabs) do
            tab:Hide()
            Tab_OnClick(_G["CollectorsToDoList_Tab_" .. tabNameL])
            break
        end
    end
    TabHandler:RefreshTabs()
end

function TabHandler:RemoveAllDisplayed()
    for tabName, tab in pairs(displayedTabs) do
        TabHandler:RemoveTab(tabName)
    end
end

function TabHandler:RefreshTabs()
    --TODO handle tab order
    local frame = ns.UI:GetFrame()
    local maxWidth = frame:GetWidth()

    local currentX = 0
    local currentY = 0

    for tabName, tab in pairs(displayedTabs) do
        tab:Show()
        tab:ClearAllPoints()
        tab:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", currentX, currentY)
        currentX = currentX + PanelTemplates_GetTabWidth(tab)
        if currentX >= maxWidth then
            currentY = currentY - tab:GetHeight() - 5
            currentX = 0
            tab:ClearAllPoints()
            tab:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", currentX, currentY)
            currentX = currentX + PanelTemplates_GetTabWidth(tab)
        end
    end
end

function TabHandler:GetTabContentFrame(tabName)
    if tabs[tabName] then
        return tabs[tabName].content
    end
end