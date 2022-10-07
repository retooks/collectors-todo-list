-- Namespaces
local _, ns = ...

ns.CONSTANTS = {}
local CONSTANTS = ns.CONSTANTS

CONSTANTS.EVENTS = {
	["STATE_UPDATE"] = "CollectorsToDoList_StateUpdate_Event"
}

CONSTANTS.ACTIVITY_TYPE = {
	["ACHIEVEMENT"] = "achievement",
	["DAILY_QUEST"] = "dailyquest",
	["LOOT_CONTAINER"] = "lootcontainer",
	["RAID_BOSS"] = "raidboss",
	["RARE_KILL"] = "rarekill",
}

CONSTANTS.ITEM_TYPE = {
	["MOUNT"] = "mount",
	["PET"] = "pet",
	["TOY"] = "toy"
}

CONSTANTS.EXPANSION = {
	--["VANILLA"] = "Vanilla",
	--["TBC"] = "The Burning Crusade",
	--["WOTLK"] = "Wrath of the Lich King",
	--["CATA"] = "Cataclysm",
	--["MOP"] = "Mists of Pandaria",
	--["WOD"] = "Warlords of Draenor",
	--["LEGION"] = "Legion",
	--["BFA"] = "Battle for Azeroth",
	["SHADOWLANDS"] = "Shadowlands",
	--["DRAGONFLIGHT"] = "Dragonflight"
}

CONSTANTS.RESET_PERIOD = {
	["DAILY"] = "Daily",
	["BIWEEKLY"] = "Bi-Weekly",
	["WEEKLY"] = "Weekly",
	["FORTNIGHTLY"] = "Fortnightly",
	["MONTHLY"] = "Monthly",
	["UNLIMITED"] = "Unlimited"
}

CONSTANTS.RESET_PERIOD_DISPLAY_POSITION = {
	["Daily"] = 1,
	["Bi-Weekly"] = 2,
	["Weekly"] = 3,
	["Fortnightly"] = 4,
	["Monthly"] = 5,
	["Unlimited"] = 6
}

CONSTANTS.GROUPING_FIELDS = {
	["EXPANSION"] = "expansion",
	["RESET_PERIOD"] = "resetPeriod"
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

CONSTANTS.TIME = {
	["SECONDS_IN_DAY"] = 86400,
}