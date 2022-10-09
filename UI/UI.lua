-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.UI = {}
local UI = ns.UI

local CollectorsToDoList = ns.CollectorsToDoList
local StateManager = ns.StateManager
local CONSTANTS = ns.CONSTANTS
local Category = ns.Category
local Database = ns.Database
local CategoryHandler = ns.CategoryHandler
local TabHandler = ns.TabHandler
local ItemDisplayHandler = ns.ItemDisplayHandler
local ItemDisplay = ns.ItemDisplay

local MainFrame

function UI:OnInit()
    if (ns.db.char.ui == nil) then
        ns.db.char.ui = {}
    end
    UI:CreateFrame()
    UI:BuildFromState()
end

function UI:BuildFromState()

    -- CreateItemDisplays
    for _, resetPeriodName in pairs(CONSTANTS.RESET_PERIOD) do
        local resetPeriodState = StateManager:GetState(resetPeriodName)
        if resetPeriodState ~= nil then
            for itemName, _ in pairs(StateManager:GetState(resetPeriodName)) do
                local item = Database:GetItem(CONSTANTS.DB.TABLES.MOUNTS, itemName)
                local itemDisplay = ItemDisplay:CreateItemDisplay(item, MainFrame)
                ItemDisplayHandler:AddItemDisplay(item, itemDisplay)
            end
        end
    end

    -- CreateTabs
    local uiState = StateManager:ConvertStateToUI()
    local activeResetPeriods = {}
    for resetPeriodName, _ in pairs(uiState) do
        table.insert(activeResetPeriods, resetPeriodName)
    end

    for activeCount = 1, #activeResetPeriods do
        TabHandler:AddTab(activeResetPeriods[activeCount])
    end

    TabHandler:RefreshTabs()

    --CreateCategories
    CategoryHandler:CreateCategories()


    --AssignItems
    ItemDisplayHandler:AttachToCategories()

    CategoryHandler:RefreshDisplay()

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

function UI:GetFrame()
    return MainFrame
end

function UI:CreateFrame()
    MainFrame = CreateFrame("Frame", "CollectorsToDoList_MainFrame", UIParent)

    MainFrame:SetSize(350, 600)
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
    tex:SetTexture("Interface/Addons/CollectorsToDoList/Textures/Professions")
    tex:SetSize(MainFrame:GetWidth(), MainFrame:GetHeight())
    tex:SetTexCoord(0.02940, 0.14501953125, 0.08294, 0.57397)

    function MainFrame:SetTransparency()
        if ns.db.profile.ui.transparent then
            tex:SetBlendMode("ADD")
        else
            tex:SetBlendMode("DISABLE")
        end
    end

    MainFrame:SetTransparency()

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
    MainFrame.ScrollFrame:SetWidth(MainFrame:GetWidth() * 5 / 6)
    MainFrame.ScrollFrame:SetPoint("TOPLEFT", MainFrame, "TOPLEFT", 10, -33)
    MainFrame.ScrollFrame:SetPoint("BOTTOMRIGHT", MainFrame, "BOTTOMRIGHT", -25, 4)

    MainFrame.ScrollFrame.ScrollBar:ClearAllPoints()
    MainFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", MainFrame.ScrollFrame, "TOPRIGHT", 2, -18)
    MainFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", MainFrame.ScrollFrame, "BOTTOMRIGHT", 2, 18)

    MainFrame:Hide()
    table.insert(UISpecialFrames, MainFrame:GetName())
end