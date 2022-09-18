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
				y = "900"
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

	migrateDataToLatest()

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

function migrateDataToLatest()
	migrateData100To101()
end

function migrateData100To101()
	if ns.db.char.dataVersion == nil then
		if ns.db.char.state["daily"] then
			ns.db.char.state["Daily"] = ns.db.char.state["daily"]
			ns.db.char.state["daily"] = nil
		end
		if ns.db.char.state["biweekly"] then
			ns.db.char.state["Bi-Weekly"] = ns.db.char.state["biweekly"]
			ns.db.char.state["biweekly"] = nil
		end
		if ns.db.char.state["weekly"] then
			ns.db.char.state["Weekly"] = ns.db.char.state["weekly"]
			ns.db.char.state["weekly"] = nil
		end
		if ns.db.char.state["fortnightly"] then
			ns.db.char.state["Fortnightly"] = ns.db.char.state["fortnightly"]
			ns.db.char.state["fortnightly"] = nil
		end
		if ns.db.char.state["monthly"] then
			ns.db.char.state["Monthly"] = ns.db.char.state["monthly"]
			ns.db.char.state["monthly"] = nil
		end
		if ns.db.char.state["unlimited"] then
			ns.db.char.state["Unlimited"] = ns.db.char.state["unlimited"]
			ns.db.char.state["unlimited"] = nil
		end

		if ns.db.char.timers["daily"] then
			ns.db.char.timers["Daily"] = ns.db.char.timers["daily"]
			ns.db.char.timers["Daily"]["resetPeriod"] = "Daily"
			ns.db.char.timers["daily"] = nil
		end
		if ns.db.char.timers["weekly"] then
			ns.db.char.timers["Weekly"] = ns.db.char.timers["weekly"]
			ns.db.char.timers["Weekly"]["resetPeriod"] = "Weekly"
			ns.db.char.timers["weekly"] = nil
		end

		ns.db.char.dataVersion = "1.0.1"
	end
end