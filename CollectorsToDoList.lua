-- Namespaces
local addonName, ns = ...

local CollectorsToDoList = ns.CollectorsToDoList

local Database = ns.Database
local ResetManager = ns.ResetManager
local StateManager = ns.StateManager
local EventManager = ns.EventManager
local OptionsManager = ns.OptionsManager
local UI = ns.UI

function CollectorsToDoList:OnInitialize()
    -- Called when the addon is loaded
    ns.isDF = select(4, GetBuildInfo()) >= 100000

    Database:OnInit()
    ResetManager:OnInit()
    self:RegisterChatCommand("ctdl", "ChatCommand")
    self:RegisterChatCommand("ctdldebug", "ChatCommandDebug")
end

function CollectorsToDoList:OnEnable()
    -- Called when the addon is enabled
    local loaded, reason = LoadAddOn("Blizzard_Collections")
    if (loaded) then
        --Depends on Blizz Collections
        StateManager:OnInit()
        EventManager:OnInit()
        OptionsManager:OnInit()
        UI:OnInit()
    else
        self:Print("it broke ", reason)
    end

end

function CollectorsToDoList:OnDisable()
    -- Called when the addon is disabled
end

function CollectorsToDoList:ChatCommand(input)
    if input == "" then
        UI:ToggleFrame()
    elseif input == "open" then
        UI:OpenFrame()
    elseif input == "close" then
        UI:CloseFrame()
    end
end

--@alpha@

function CollectorsToDoList:ChatCommandDebug(input)
    self:Print("debug")
end

function CollectorsToDoList:DumpMounts()
    ns.db.char.mounts = {}
    local mountIds = C_MountJournal.GetMountIDs()
    
    for i = 1, #mountIds do 
        local name, spellID, icon, _, _, sourceType, _, isFactionSpecific, faction, _, _, mountID = C_MountJournal.GetMountInfoByID(mountIds[i])
        local _, description, source, _, mountTypeID, _, _, _, _ = C_MountJournal.GetMountInfoExtraByID(mountID)
        if faction == nil then
            faction = "any"
        end
        table.insert(ns.db.char.mounts, strjoin("¬", 
            tostring(mountID), 
            tostring(name), 
            tostring(spellID), 
            tostring(icon), 
            tostring(sourceType), 
            tostring(isFactionSpecific), 
            tostring(faction),
            tostring(description),
            tostring(source), 
            tostring(mountTypeID)))
    end
end

function CollectorsToDoList:dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. CollectorsToDoList:dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
--@end-alpha@