-- Namespaces
local addonName, ns = ...

-- Expose functions
ns.MountUtils = {}
local MountUtils = ns.MountUtils

function MountUtils:IsMountOwnedBySpellId(spellId)
	local _, _, _, _, _, _, _, _, _, _, isCollected, _ = C_MountJournal.GetMountInfoByID(C_MountJournal.GetMountFromSpell(spellId))
	return isCollected
end

function MountUtils:IsMountOwnedByItemId(itemId)
	local _, _, _, _, _, _, _, _, _, _, isCollected, _ = C_MountJournal.GetMountInfoByID(C_MountJournal.GetMountFromItem(itemId))
	return isCollected
end