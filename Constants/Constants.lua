-- Namespaces
local addonName, ns = ...

ns.CONSTANTS = {}
local CONSTANTS = ns.CONSTANTS

CONSTANTS.EVENTS = {
	["STATE_UPDATE"] = "CollectorsToDoList_StateUpdate_Event"
}

CONSTANTS.ACTIVITY_TYPE = {
	["ACHIEVEMENT"] = "achievement",
	["RAID_BOSS"] = "raidboss",
	["RARE_KILL"] = "rarekill",
}

CONSTANTS.ITEM_TYPE = {
	["MOUNT"] = "mount",
	["PET"] = "pet",
	["TOY"] = "toy"
}

CONSTANTS.EXPANSION = {
	["VANILLA"] = "Vanilla",
	["TBC"] = "The Burning Crusade",
	["WOTLK"] = "Wrath of the Lich King",
	["CATA"] = "Cataclysm",
	["MOP"] = "Mists of Pandaria",
	["WOD"] = "Warlords of Draenor",
	["LEGION"] = "Legion",
	["BFA"] = "Battle for Azeroth",
	["SHADOWLANDS"] = "Shadowlands",
}

CONSTANTS.RESET_PERIOD = {
	["DAILY"] = "daily",
	["BIWEEKLY"] = "biweekly",
	["WEEKLY"] = "weekly",
	["FORTNIGHTLY"] = "fortnightly",
	["MONTHLY"] = "monthly",
	["UNLIMITED"] = "unlimited"
}

CONSTANTS.DAY_OF_WEEK = {
	"Sunday",
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday",
}

CONSTANTS.REGION_RESET_DAY = {
	3, -- US (1)
	3, -- Korea (2)
	4, -- Europe (3)
	5, -- Taiwan (4)
	5 -- China (5)
}