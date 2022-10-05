-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.UI = {}
local UI = ns.UI

local CollectorsToDoList = ns.CollectorsToDoList
local StateManager = ns.StateManager
local CONSTANTS = ns.CONSTANTS
local Category = ns.Category
local TabHandler = ns.TabHandler

local MainFrame

local activeResetPeriods = {}
local categories = {}

-- TODO Rebuild how we build the UI panels
-- Need to be able to refresh/redo it based on options changing
function UI:OnInit()
    if (ns.db.char.ui == nil) then
        ns.db.char.ui = {}
    end
    UI:BuildFromState()
end

function UI:BuildFromState()
    local uiState = StateManager:ConvertStateToUI()

    for k,v in pairs(uiState) do
        table.insert(activeResetPeriods, k)
    end

    table.sort(activeResetPeriods, function(a,b) return CONSTANTS.RESET_PERIOD_DISPLAY_POSITION[a] < CONSTANTS.RESET_PERIOD_DISPLAY_POSITION[b] end)

    UI:CreateFrame()

    for resetPeriodName, resetPeriodValues in pairs(uiState) do
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
    tex:SetTexture(ns.isDF and "Interface/Professions/Professions" or "Interface/Addons/CollectorsToDoList/Textures/Professions")
    if ns.db.profile.ui.transparent then
        tex:SetBlendMode("ADD")
    end
    tex:SetSize(MainFrame:GetWidth(), MainFrame:GetHeight())
    tex:SetTexCoord(0.02940, 0.14501953125, 0.08294, 0.57397)

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
    MainFrame.ScrollFrame:SetClipsChildren(true)

    MainFrame.ScrollFrame.ScrollBar:ClearAllPoints()
    MainFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", MainFrame.ScrollFrame, "TOPRIGHT", -11, -18)
    MainFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", MainFrame.ScrollFrame, "BOTTOMRIGHT", -6, 18)

    for activeCount = 1, #activeResetPeriods do
        TabHandler:AddTab(activeResetPeriods[activeCount])
    end

    MainFrame:Hide()
    table.insert(UISpecialFrames, MainFrame:GetName())
end

function UI:AddCategory(tabName, categoryName)
    local cat = Category:CreateCategory(categoryName, TabHandler:GetTabContentFrame(tabName))
    cat.layoutIndex = TabHandler:GetTabContentFrame(tabName):GetNumChildren() + 1
    TabHandler:GetTabContentFrame(tabName):MarkDirty()

    if categories[tabName] == nil then
        categories[tabName] = {}
    end
    categories[tabName][categoryName] = cat
end

function UI:AddValue(tabName, categoryName, item, startingState)
    Category:AddValue(categories[tabName][categoryName], item, startingState)
    TabHandler:GetTabContentFrame(tabName):MarkDirty()
end