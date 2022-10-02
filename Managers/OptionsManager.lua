-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.OptionsManager = {}
local OptionsManager = ns.OptionsManager
local Database = ns.Database

local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS

local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

function OptionsManager:OnInit()
	local profileOptionsTable = LibStub("AceDBOptions-3.0"):GetOptionsTable(ns.db)

    myOptionsTable = {
      type = "group",
      args = {
        generaloptions={
          name = "General Options",
          type = "group",
          order = 0,
          args={
            groupfield = {
              name = "Select Grouping",
              desc = "Enables / disables the tracking of mounts.",
              type = "select",
              style = "dropdown",
              values = {
                ["expansion"] = "Expansion",
                ["resetPeriod"] = "Reset Period" 
              },
              set = function(info,val) ns.db.profile.grouping = val end,
              get = function(info) return ns.db.profile.grouping end,
              order = 0
            },
          }
        },
        mountoptions={
          name = "Mounts",
          type = "group",
          order = 1,
          args={
            mounts = {
              name = "Enable Mounts",
              desc = "Enables / disables the tracking of mounts.",
              type = "toggle",
              set = function(info,val) ns.db.profilet.mounts = val end,
              get = function(info) return ns.db.profile.mounts end,
              order = 0
            },
            expansions = {
              name = "Expansions",
              desc = "Enables / disables the tracking of mounts.",
              type = "multiselect",
              values = CONSTANTS.EXPANSION,
              set = function(info, keyname, state) ns.db.profile.expansions[keyname] = state end,
              get = function(info, keyname) return ns.db.profile.expansions[keyname] end,
              order = 1
            },
          }
        },
        --petoptions={
        --  name = "Pets",
        --  type = "group",
        --  order = 2,
        --  args={
        --    pets = {
        --      name = "Enable Pets",
        --      desc = "Enables / disables the tracking of pets.",
        --      type = "toggle",
        --      set = function(info,val) ns.test.pets = val end,
        --      get = function(info) return ns.test.pets end,
        --    }
        --  }
        --},
        --toyoptions={
        --  name = "Toys",
        --  type = "group",
        --  order = 3,
        --  args={
        --    toys = {
        --      name = "Enable Toys",
        --      desc = "Enables / disables the tracking of toys.",
        --      type = "toggle",
        --      set = function(info,val) ns.test.toys = val end,
        --      get = function(info) return ns.test.toys end,
        --    },
        --  }
        --},
        profiles=profileOptionsTable
      }
    }

    AceConfig:RegisterOptionsTable(addonName, myOptionsTable)
    AceConfigDialog:AddToBlizOptions(addonName, "Collectors To-Do List")
end