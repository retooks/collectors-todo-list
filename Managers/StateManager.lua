-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.StateManager = {}
local StateManager = ns.StateManager
local Database = ns.Database
local MountUtils = ns.MountUtils

local CollectorsToDoList = ns.CollectorsToDoList
local CONSTANTS = ns.CONSTANTS

function StateManager:OnInit()
	local allMounts = Database:GetAllItems(CONSTANTS.DB.TABLES.MOUNTS)
-- For each mount
	for _, mount in pairs(allMounts) do
		if ns.db.char.state[mount.resetPeriod] == nil then
			ns.db.char.state[mount.resetPeriod] = {}
		end
--		if it is owned remove from state and ignore
		local owned = MountUtils:IsMountOwnedBySpellId(mount.spellId)
		if owned then
			StateManager:RemoveValue(mount)
		else
--       if not in state add to state
		if ns.db.char.state[mount.resetPeriod][mount.name] == nil then
--		handle reset period change, check other periods to see if it exists, copy it over
			local optionalOldPeriod = StateManager:ExistsInOtherPeriod(mount)
			if optionalOldPeriod == nil then
				StateManager:InitValue(mount)
			else
				ns.db.char.state[mount.resetPeriod][mount.name] = ns.db.char.state[optionalOldPeriod][mount.name]
				ns.db.char.state[optionalOldPeriod][mount.name] = nil
			end
		end
--		if activities have changed, refresh activity state
			ns.db.char.state[mount.resetPeriod][mount.name] = StateManager:ActivitiesChanged(mount)
		end
	end
-- For each state entry
	for resetPeriod, mountList in pairs(ns.db.char.state) do
		for k,v in pairs(mountList) do
--		if not in database, remove state
--		if owned now, remove from state
			if allMounts[k] == nil or MountUtils:IsMountOwnedBySpellId(allMounts[k].spellId) then
				StateManager:RemoveValue(k)
			end
		end
	end
end

function StateManager:InitValue(item)
	local tmpState = {
		["main"] = false
	}
	if item.activities ~= nil then
		for k,v in pairs(item.activities) do
			tmpState[k] = false
		end
	end
	ns.db.char.state[item.resetPeriod][item.name] = tmpState
end

function StateManager:ResetItem(item)
	if ns.db.char.state[item.resetPeriod][item.name] ~= nil then
		for k,v in pairs(ns.db.char.state[item.resetPeriod][item.name]) do
			ns.db.char.state[item.resetPeriod][item.name][k] = false
		end
	end
end

function StateManager:RemoveValue(item)
	ns.db.char.state[item.resetPeriod][item.name] = nil
end

function StateManager:ActivitiesChanged(item)
	local finalActivities = {
		["main"] = ns.db.char.state[item.resetPeriod][item.name]["main"]
	}
	if (item.activities ~= nil) then
		for k,v in pairs(item.activities) do
			local activityValue = ns.db.char.state[item.resetPeriod][item.name][k]
			if activityValue ~= nil then
				finalActivities[k] = activityValue
			else
				finalActivities[k] = false
			end
		end
	end
	return finalActivities
end

function StateManager:ExistsInOtherPeriod(item)
	for k,v in pairs(CONSTANTS.RESET_PERIOD) do
		if ns.db.char.state[v][item.name] ~= nil then
			return v
		end
	end
	return nil
end

function StateManager:SetValue(item, newState, itemKey)
	local dbItem = Database:GetItem(CONSTANTS.DB.TABLES.MOUNTS, item.name)

	local stateKey = "main"
	if itemKey ~= nil then
		stateKey = itemKey
	end

	if ns.db.char.state[dbItem.resetPeriod][dbItem.name][stateKey] ~= newState then
		ns.db.char.state[dbItem.resetPeriod][dbItem.name][stateKey] = newState
		CollectorsToDoList:SendMessage(CONSTANTS.EVENTS.STATE_UPDATE, dbItem, newState, stateKey)

		-- check status of activies
		if dbItem.activities ~= nil then
			local activitiesDone = true
			for k,v in pairs(dbItem.activities) do
				activitiesDone = activitiesDone and ns.db.char.state[dbItem.resetPeriod][dbItem.name][k]
			end
			if activitiesDone then
				StateManager:SetValue(dbItem, true, "main")
			else
				StateManager:SetValue(dbItem, false, "main")
			end
		end


	end
end

function StateManager:GetState(resetPeriod, itemName)
	if itemName == nil then
		return ns.db.char.state[resetPeriod]
	else
		return ns.db.char.state[resetPeriod][itemName]
	end
end

-- {
	-- [Daily] = {
		-- [Category] = { 
	        --[1] =  {["item"] = {}, ["state"] = true},
	        --[2] =  {["item"] = {}, ["state"] = true},
	        --[3] =  {["item"] = {}, ["state"] = false},
	    --} ,
	    -- [Category] = {},
	    -- [Category] = {},
	--},
	-- [Weekly] = {
		-- [Category] = { 
	        --[1] =  {["item"] = {}, ["state"] = true},
	        --[2] =  {["item"] = {}, ["state"] = true},
	        --[3] =  {["item"] = {}, ["state"] = false},
	    --} ,
	    -- [Category] = {},
	    -- [Category] = {},
	--},
-- }
function StateManager:ConvertStateToUI()
	local uiState = {}

	for k, v in pairs(ns.db.char.state) do
		for key, value in pairs(ns.db.char.state[k]) do
			local item = Database:GetItem(CONSTANTS.DB.TABLES.MOUNTS, key)
			if uiState[item["resetPeriod"]] == nil then
				uiState[item["resetPeriod"]] = {}
			end
			if uiState[item["resetPeriod"]][item["expansion"]] == nil then
				uiState[item["resetPeriod"]][item["expansion"]] = {}
			end
			table.insert(uiState[item["resetPeriod"]][item["expansion"]], { ["item"] = item, ["state"] = value })
		end
	end

	return uiState
end