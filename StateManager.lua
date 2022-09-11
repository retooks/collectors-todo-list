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
	if ns.db.char.state == nil then
		ns.db.char.state = {}
	end

	local allMounts = Database:GetAllItems(CONSTANTS.DB.TABLES.MOUNTS)
	for _, mount in pairs(allMounts) do
		if ns.db.char.state[mount.resetPeriod] == nil then
			ns.db.char.state[mount.resetPeriod] = {}
		end
		local owned = MountUtils:IsMountOwnedBySpellId(mount.spellId)
		if owned then
			ns.db.char.state[mount.resetPeriod][mount.name] = nil
		else
			if ns.db.char.state[mount.resetPeriod][mount.name] == nil then
				ns.db.char.state[mount.resetPeriod][mount.name] = false
			end
		end
	end

	for resetPeriod, mountList in pairs(ns.db.char.state) do
		for k,v in pairs(mountList) do
			--remove mounts from state if removed from db
			if allMounts[k] == nil or MountUtils:IsMountOwnedBySpellId(allMounts[k].spellId) then
				ns.db.char.state[resetPeriod][k] = nil
			end
		end
	end
end

function StateManager:SetValue(item, newState)
	local dbItem = Database:GetItem("mounts", item.name)	

	if ns.db.char.state[dbItem.resetPeriod][dbItem.name] ~= newState then
		ns.db.char.state[dbItem.resetPeriod][dbItem.name] = newState
		CollectorsToDoList:SendMessage(CONSTANTS.EVENTS.STATE_UPDATE, dbItem, newState)
	end
end

function StateManager:GetState(stateKey)
	return ns.db.char.state[stateKey]
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

	for k, v in pairs(CONSTANTS.RESET_PERIOD) do

	end

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