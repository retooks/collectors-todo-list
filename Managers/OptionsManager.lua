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
          args = {
            groupfield = {
              name = "Select Grouping",
              desc = "Change the breakdown of the list in each time.",
              type = "select",
              style = "dropdown",
              values = {
                ["EXPANSION"] = "Expansion",
                ["RESET_PERIOD"] = "Reset Period",
  },
              set = function(info, val)
                ns.db.profile.grouping = val
                ns.CategoryHandler:CreateCategories()
                ns.ItemDisplayHandler:AttachToCategories()
                ns.CategoryHandler:RefreshDisplay()
              end,
              get = function(info) return ns.db.profile.grouping end,
              order = 0
            },
          }
        },
        uioptions={
          name = "UI",
          type = "group",
          order = 1,
          args = {
            transparent = {
              name = "Enable transparency",
              desc = "Enables / disables the transparency on the UI.",
              type = "toggle",
              set = function(info, val)
                ns.db.profile.ui.transparent = val
                ns.UI:GetFrame():SetTransparency()
              end,
              get = function(info) return ns.db.profile.ui.transparent end,
              order = 0
            },
          }
        },
        mountoptions={
          name = "Mounts",
          type = "group",
          order = 2,
          args = {
            mountdesc = {
              name = "All the below options require a reload to take effect.",
              type = "description",
              order = 0,
            },
            mounts = {
              name = "Enable Mounts",
              desc = "Enables / disables the tracking of mounts.",
              type = "toggle",
              set = function(info, val) ns.db.profile.mounts = val end,
              get = function(info) return ns.db.profile.mounts end,
              order = 1
            },
            expansions = {
              name = "Expansions",
              desc = "Enables / disables the tracking of mounts.",
              type = "multiselect",
              values = CONSTANTS.EXPANSION,
              set = function(info, keyname, state) ns.db.profile.expansions[keyname] = state end,
              get = function(info, keyname) return ns.db.profile.expansions[keyname] end,
              order = 2
            },
          }
        },
        --petoptions={
        --  name = "Pets",
        --  type = "group",
        --  order = 3,
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
        --  order = 4,
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