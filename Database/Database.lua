-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.Database = {}
local Database = ns.Database

local CONSTANTS = ns.CONSTANTS

CONSTANTS.DB = {
	["TABLES"] = {
		["MOUNTS"] = "mounts"
	}
}

local defaults = {
    char = {
		ui = {
			mainFrame = {
				x = "10",
				y = "-10"
			}
		},
        timers = {},
        state = {}
    },
    profile = {
    	grouping = "expansion",
    	expansions = {
			["LEGION"] = true,
			["CATA"] = true,
			["SHADOWLANDS"] = true,
			["VANILLA"] = true,
			["WOD"] = true,
			["TBC"] = true,
			["BFA"] = true,
			["WOTLK"] = true,
			["MOP"] = true,
		}
    }
}

function Database:OnInit()
	ns.db = LibStub("AceDB-3.0"):New("CollectorsToDoListDB", defaults, true)
	ns.db.tables = {}

	CONSTANTS.DB.TABLES = {
		["MOUNTS"] = "mounts"
	}

	ns.Mounts_Shadowlands:OnInit()
end	

--[[

	Need a table to store mounts in
	Need to be able to add mounts to it (merge so we dont wipe anything)

	Need "class" for thing we store, Item for future proofing
	Should do some validation on items as they are added

--]]

function Database:AddItems(tableName, items)
	if ns.db.tables[tableName] == nil then
		ns.db.tables[tableName] = {}
	end
	for key, item in pairs(items) do
		ns.db.tables[tableName][key] = item
	end
end

function Database:GetItem(tableName, itemName)
	return ns.db.tables[tableName][itemName]
end

function Database:GetAllItems(tableName)
	return ns.db.tables[tableName]
end