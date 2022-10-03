-- Namespaces
local _, ns = ...

-- name = true,
-- expansion = true,
-- type = true,
-- activity = true,
-- itemId = true

ns.Mounts_Shadowlands = {}
local Mounts_Shadowlands = ns.Mounts_Shadowlands

local CONSTANTS = ns.CONSTANTS

--["Enchanted Wakener's Runestag"] = {
--	name = "Enchanted Wakener's Runestag",
--	expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
--	type = CONSTANTS.ITEM_TYPE.MOUNT,
--	itemId = 180723,
--	spellId = 332247,
--	resetPeriod = CONSTANTS.RESET_PERIOD.BIWEEKLY,
--	tip = "From Queen's Conservatory",
--	activities = {
--		["Kill Rare"] = { name = "Kill Rare", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=123456},
--		["Daily Quest 1"] = { name = "Daily Quest 1", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=12345},
--		["Loot some chest"] = { name = "Loot some chest", type = CONSTANTS.ACTIVITY_TYPE.LOOT_CONTAINER, containerId=1234},
--		["Get Achievement"] = { name = "Get Achievement", type = CONSTANTS.ACTIVITY_TYPE.ACHIEVEMENT, achievementId=67321},
--		["Get different Achievement"] = { name = "Get different Achievement", type = CONSTANTS.ACTIVITY_TYPE.ACHIEVEMENT, achievementId=67322}
--	}
--}

local mounts = {
    ["Shadeleaf Runestag"] = {
        name = "Shadeleaf Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180413,
        spellId = 332243,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Buy from vendor."
    },
    ["Wakener's Runestag"] = {
        name = "Wakener's Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180414,
        spellId = 332244,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "From Queen's Conservatory"
    },
    ["Winterborn Runestag"] = {
        name = "Winterborn Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180415,
        spellId = 332245,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Buy from vendor."
    },
    ["Enchanted Shadeleaf Runestag"] = {
        name = "Enchanted Shadeleaf Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180722,
        spellId = 332246,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Buy from vendor."
    },
    ["Enchanted Wakener's Runestag"] = {
        name = "Enchanted Wakener's Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180723,
        spellId = 332247,
        resetPeriod = CONSTANTS.RESET_PERIOD.BIWEEKLY,
        tip = "From Queen's Conservatory"
    },
    ["Enchanted Winterborn Runestag"] = {
        name = "Enchanted Winterborn Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180724,
        spellId = 332248,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Revered with Marasmius"
    },
    ["Shimmermist Runner"] = {
        name = "Shimmermist Runner",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180727,
        spellId = 332252,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Rare at the end of Mistveil Tangle maze."
    },
    ["Duskflutter Ardenmoth"] = {
        name = "Duskflutter Ardenmoth",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180729,
        spellId = 332256,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Exalted with The Wild Hunt"
    },
    ["Spinemaw Gladechewer"] = {
        name = "Spinemaw Gladechewer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180725,
        spellId = 334364,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Gormtamer Tizo"
    },
    ["War-Bred Tauralus"] = {
        name = "War-Bred Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182077,
        spellId = 332455,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Necrolord Campaign"
    },
    ["Plaguerot Tauralus"] = {
        name = "Plaguerot Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182076,
        spellId = 332456,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Buy from vendor."
    },
    ["Bonehoof Tauralus"] = {
        name = "Bonehoof Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182075,
        spellId = 332457,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Tahonta. Must have Neena abomination with you.",
        activities = {
            ["Recruit Neena"] = { name = "Recruit Neena", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=57603 },
            ["Kill Tahonta"] = { name = "Kill Tahonta", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=162586 },
        }
    },
    ["Chosen Tauralus"] = {
        name = "Chosen Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182074,
        spellId = 332460,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "Complete stitchyard weekly quests for materials."
    },
    ["Armored War-Bred Tauralus"] = {
        name = "Armored War-Bred Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181822,
        spellId = 332462,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Necrolord Campaign"
    },
    ["Armored Plaguerot Tauralus"] = {
        name = "Armored Plaguerot Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181821,
        spellId = 332464,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Necrolord Renown"
    },
    ["Armored Bonehoof Tauralus"] = {
        name = "Armored Bonehoof Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181815,
        spellId = 332466,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Sabriel the Bonecleaver. Necrolord to spawn it. Buy from vendor."
    },
    ["Armored Chosen Tauralus"] = {
        name = "Armored Chosen Tauralus",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181820,
        spellId = 332467,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "Complete stitchyard weekly quests."
    },
    ["Blisterback Bloodtusk"] = {
        name = "Blisterback Bloodtusk",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182085,
        spellId = 332478,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Warbringer Mal'Korak",
        activities = {
            ["Kill Warbringer Mal'Korak"] = { name = "Kill Warbringer Mal'Korak", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=162819 },
        }
    },
    ["Gorespine"] = {
        name = "Gorespine",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182084,
        spellId = 332480,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Nerissa Heartless",
        activities = {
            ["Kill Nerissa Heartless"] = { name = "Kill Nerissa Heartless", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=162690 },
        }
    },
    ["Lurid Bloodtusk"] = {
        name = "Lurid Bloodtusk",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182082,
        spellId = 332484,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Exalted with The Undying Army"
    },
    ["Silvertip Dredwing"] = {
        name = "Silvertip Dredwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181316,
        spellId = 312777,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Any of the 4 covenant features."
    },
    ["Rampart Screecher"] = {
        name = "Rampart Screecher",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182596,
        spellId = 332903,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Glory of the Nathria Raider"
    },
    ["Harvester's Dredwing"] = {
        name = "Harvester's Dredwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 185996,
        spellId = 332904,
        resetPeriod = CONSTANTS.RESET_PERIOD.FORTNIGHTLY,
        tip = "Venthyr Assault"
    },
    ["Endmire Flyer"] = {
        name = "Endmire Flyer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180582,
        spellId = 332905,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Famu the Infinite"
    },
    ["Inquisition Gargon"] = {
        name = "Inquisition Gargon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182954,
        spellId = 332923,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Exalted with Avowed"
    },
    ["Sinfall Gargon"] = {
        name = "Sinfall Gargon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183715,
        spellId = 332927,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Buy from vendor."
    },
    ["Crypt Gargon"] = {
        name = "Crypt Gargon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180945,
        spellId = 332932,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Venthyr Campaign"
    },
    ["Desire's Battle Gargon"] = {
        name = "Desire's Battle Gargon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182209,
        spellId = 332949,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "Ember Court. Become Best Friends with The Countess and then complete it once more with her Very Happy or Elated."
    },
    ["Gravestone Battle Gargon"] = {
        name = "Gravestone Battle Gargon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182332,
        spellId = 333021,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Venthyr Renown"
    },
    ["Battle Gargon Silessa"] = {
        name = "Battle Gargon Silessa",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183798,
        spellId = 333023,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Fix three Broken Mirrors. Needs Venthyr Travel Network at rank 3."
    },
    ["Loyal Gorger"] = {
        name = "Loyal Gorger",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182589,
        spellId = 333027,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Worldedge Gorger. Then complete 7 daily quests from the Gorger Spawn."
    },
    ["Pale Acidmaw"] = {
        name = "Pale Acidmaw",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180726,
        spellId = 334365,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Any of the 4 covenant features."
    },
    ["Wild Glimmerfur Prowler"] = {
        name = "Wild Glimmerfur Prowler",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180730,
        spellId = 334366,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Valfir the Unrelenting. Night Fae to spawn it. Buy from vendor."
    },
    ["Phalynx of Loyalty"] = {
        name = "Phalynx of Loyalty",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180761,
        spellId = 334382,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Path of Ascension"
    },
    ["Phalynx of Humility"] = {
        name = "Phalynx of Humility",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180762,
        spellId = 334386,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Temple of Purity treasure. Buy from vendor."
    },
    ["Phalynx of Courage"] = {
        name = "Phalynx of Courage",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180763,
        spellId = 334391,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Kyrian Campaign."
    },
    ["Wildseed Cradle"] = {
        name = "Wildseed Cradle",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180731,
        spellId = 334352,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Treasure - Cache of the Moon."
    },
    ["Phalynx of Purity"] = {
        name = "Phalynx of Purity",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180764,
        spellId = 334398,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Buy from vendor."
    },
    ["Eternal Phalynx of Purity"] = {
        name = "Eternal Phalynx of Purity",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180765,
        spellId = 334403,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Kyrian Renown."
    },
    ["Eternal Phalynx of Courage"] = {
        name = "Eternal Phalynx of Courage",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180766,
        spellId = 334406,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Kyrian Campaign."
    },
    ["Eternal Phalynx of Loyalty"] = {
        name = "Eternal Phalynx of Loyalty",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180767,
        spellId = 334408,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Death Foursworn then buy from vendor."
    },
    ["Eternal Phalynx of Humility"] = {
        name = "Eternal Phalynx of Humility",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180768,
        spellId = 334409,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Learning from the Masters then buy from vendor."
    },
    ["Silverwind Larion"] = {
        name = "Silverwind Larion",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180772,
        spellId = 334433,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Treasure - Vesper of the Silver Wind. Collect 50 Anima Crystal Shards from around Bastion."
    },
    ["Marrowfang"] = {
        name = "Marrowfang",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181819,
        spellId = 336036,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Dungeon - Necrotic Wake Mythic"
    },
    ["Callow Flayedwing"] = {
        name = "Callow Flayedwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181818,
        spellId = 336038,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Drop from mobs in Maldraxxas. Cracked Blight-Touched Egg."
    },
    ["Gruesome Flayedwing"] = {
        name = "Gruesome Flayedwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181300,
        spellId = 336039,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Any of the 4 covenant features."
    },
    ["Bonesewn Fleshroc"] = {
        name = "Bonesewn Fleshroc",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182078,
        spellId = 336041,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "Abominable Stitching."
    },
    ["Hulking Deathroc"] = {
        name = "Hulking Deathroc",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182079,
        spellId = 336042,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Violet Mistake",
        activities = {
            ["Kill Violet Mistake"] = { name = "Kill Violet Mistake", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=157309 },
        }
    },
    ["Predatory Plagueroc"] = {
        name = "Predatory Plagueroc",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182080,
        spellId = 336045,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Gieger. Necrolord summon. Buy from vendor."
    },
    ["Dauntless Duskrunner"] = {
        name = "Dauntless Duskrunner",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 181317,
        spellId = 336064,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Any of the 4 covenant features."
    },
    ["Sinrunner Blanchy"] = {
        name = "Sinrunner Blanchy",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182614,
        spellId = 339588,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare spawn Dead Blanchy in Revendreth. Bring different items each time. Need to complete 7 different times."
    },
    ["Arboreal Gulper"] = {
        name = "Arboreal Gulper",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182650,
        spellId = 339632,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Humon'gozz"
    },
    ["Mawsworn Charger"] = {
        name = "Mawsworn Charger",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186655,
        spellId = 339956,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Flawless Master"
    },
    ["Hand of Hrestimorak"] = {
        name = "Hand of Hrestimorak",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186653,
        spellId = 339957,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Glory of the Dominant Raider"
    },
    ["Umbral Scythehorn"] = {
        name = "Umbral Scythehorn",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183053,
        spellId = 340503,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Revered with Court of Night"
    },
    ["Court Sinrunner"] = {
        name = "Court Sinrunner",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183518,
        spellId = 341639,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Exalted with Court of Harvesters"
    },
    ["Warstitched Darkhound"] = {
        name = "Warstitched Darkhound",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183615,
        spellId = 341766,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Covenant Mission Table"
    },
    ["Highwind Darkmane"] = {
        name = "Highwind Darkmane",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183618,
        spellId = 341776,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Covenant Mission Table"
    },
    ["Gilded Prowler"] = {
        name = "Gilded Prowler",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183740,
        spellId = 342334,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Exalted with The Ascended"
    },
    ["Ascended Skymane"] = {
        name = "Ascended Skymane",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183741,
        spellId = 342335,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Rare - Ascended Council"
    },
    ["Amber Ardenmoth"] = {
        name = "Amber Ardenmoth",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183800,
        spellId = 342666,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "The Wild Hunt Paragon Cache"
    },
    ["Vibrant Flutterwing"] = {
        name = "Vibrant Flutterwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183801,
        spellId = 342667,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Revered with Marasmius"
    },
    ["Desertwing Hunter"] = {
        name = "Desertwing Hunter",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187666,
        spellId = 342668,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Pale Regal Cervid"] = {
        name = "Pale Regal Cervid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187639,
        spellId = 342671,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Vespoid Flutterer"] = {
        name = "Vespoid Flutterer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187660,
        spellId = 342678,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Deepstar Aurelid"] = {
        name = "Deepstar Aurelid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187676,
        spellId = 342680,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Hirukon"
    },
    ["Battle-Hardened Aquilon"] = {
        name = "Battle-Hardened Aquilon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186480,
        spellId = 343550,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - On the Offensive"
    },
    ["Battle-Bound Warhound"] = {
        name = "Battle-Bound Warhound",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184062,
        spellId = 344228,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rareish - Theater of Pain"
    },
    ["Bulbous Necroray"] = {
        name = "Bulbous Necroray",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184160,
        spellId = 344574,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Maldraxxus/Necrolord Callings - Tribute of the Ambitious"
    },
    ["Infested Necroray"] = {
        name = "Infested Necroray",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184161,
        spellId = 344576,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Maldraxxus/Necrolord Callings - Tribute of the Ambitious"
    },
    ["Pestilent Necroray"] = {
        name = "Pestilent Necroray",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184162,
        spellId = 344575,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Maldraxxus/Necrolord Callings - Tribute of the Ambitious"
    },
    ["Bound Shadehound"] = {
        name = "Bound Shadehound",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184168,
        spellId = 344577,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Rare - Feral Shadehound"
    },
    ["Corridor Creeper"] = {
        name = "Corridor Creeper",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184166,
        spellId = 344578,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Twisting Corridors: Layer 8"
    },
    ["Voracious Gorger"] = {
        name = "Voracious Gorger",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184183,
        spellId = 344659,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Glory of the Shadowlands Hero"
    },
    ["Slime Serpent"] = {
        name = "Slime Serpent",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        spellId = 346141,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Solo Plagefall Heroic"
    },
    ["Tazavesh Gearglider"] = {
        name = "Tazavesh Gearglider",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186637,
        spellId = 346554,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Fake it 'Til You make It"
    },
    ["Serenade"] = {
        name = "Serenade",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187669,
        spellId = 346719,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Lord of the Corpseflies"] = {
        name = "Lord of the Corpseflies",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186489,
        spellId = 347250,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Fleshwing"
    },
    ["Soaring Razorwing"] = {
        name = "Soaring Razorwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186648,
        spellId = 347251,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Tier 6 with The Archivists' Codex"
    },
    ["Tamed Mauler"] = {
        name = "Tamed Mauler",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186641,
        spellId = 347536,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Archivists' Codex Paragon Cache"
    },
    ["Beryl Shardhide"] = {
        name = "Beryl Shardhide",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186644,
        spellId = 347810,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Death's Advance Paragon Cache"
    },
    ["Vengeance"] = {
        name = "Vengeance",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186642,
        spellId = 351195,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "Sylvanas - Sanctum of Domination Mythic"
    },
    ["Hand of Bahmethra"] = {
        name = "Hand of Bahmethra",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 185973,
        spellId = 352309,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "Rare - Tormetors of Torghast"
    },
    ["Wild Hunt Legsplitter"] = {
        name = "Wild Hunt Legsplitter",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186000,
        spellId = 352441,
        resetPeriod = CONSTANTS.RESET_PERIOD.FORTNIGHTLY,
        tip = "Night Fae Maw Invasion"
    },
    ["Undying Darkhound"] = {
        name = "Undying Darkhound",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186103,
        spellId = 352742,
        resetPeriod = CONSTANTS.RESET_PERIOD.FORTNIGHTLY,
        tip = "Necrolord Maw Invasion"
    },
    ["Cartel Master's Gearglider"] = {
        name = "Cartel Master's Gearglider",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186638,
        spellId = 353263,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Dungeon - Tazavesh"
    },
    ["Ardenweald Wilderling"] = {
        name = "Ardenweald Wilderling",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186493,
        spellId = 353856,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Night Fae Renown."
    },
    ["Autumnal Wilderling"] = {
        name = "Autumnal Wilderling",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186494,
        spellId = 353857,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Night Fae Renown 70 then buy from vendor."
    },
    ["Winter Wilderling"] = {
        name = "Winter Wilderling",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186495,
        spellId = 353858,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - On the Offensive"
    },
    ["Summer Wilderling"] = {
        name = "Summer Wilderling",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186492,
        spellId = 353859,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Escaped Wilderling"
    },
    ["Obsidian Gravewing"] = {
        name = "Obsidian Gravewing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186478,
        spellId = 353866,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Venthyr Renown 70 then buy from vendor."
    },
    ["Sinfall Gravewing"] = {
        name = "Sinfall Gravewing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186476,
        spellId = 353872,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Venthyr Renown."
    },
    ["Pale Gravewing"] = {
        name = "Pale Gravewing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186477,
        spellId = 353873,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - On the Offensive"
    },
    ["Elysian Aquilon"] = {
        name = "Elysian Aquilon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186482,
        spellId = 353875,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Kyrian Renown."
    },
    ["Forsworn Aquilon"] = {
        name = "Forsworn Aquilon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186483,
        spellId = 353877,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Wild Worldcracker"
    },
    ["Ascendant's Aquilon"] = {
        name = "Ascendant's Aquilon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186485,
        spellId = 353880,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Kyrian Renown 70 then buy from vendor."
    },
    ["Maldraxxian Corpsefly"] = {
        name = "Maldraxxian Corpsefly",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186487,
        spellId = 353883,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Necrolord Renown."
    },
    ["Regal Corpsefly"] = {
        name = "Regal Corpsefly",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186488,
        spellId = 353884,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Necrolord Renown 70 then buy from vendor."
    },
    ["Battlefield Swarmer"] = {
        name = "Battlefield Swarmer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186490,
        spellId = 353885,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - On the Offensive"
    },
    ["Sanctum Gloomcharger"] = {
        name = "Sanctum Gloomcharger",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186656,
        spellId = 354351,
        resetPeriod = CONSTANTS.RESET_PERIOD.WEEKLY,
        tip = "The Nine - Sanctum of Domnation all difficulties."
    },
    ["Soulbound Gloomcharger"] = {
        name = "Soulbound Gloomcharger",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186657,
        spellId = 354352,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Ve'nari Paragon Cache",
        activities = {
            ["Acquisition: Blazing Ingots"] = { name = "Acquisition: Blazing Ingots", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63050},
            ["A Shadowed Fate"] = { name = "A Shadowed Fate", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63166},
            ["Disrupting the Flow"] = { name = "Disrupting the Flow", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=60732},
            ["Torment for the Taking"] = { name = "Torment for the Taking", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63062},
            ["Misery's Company"] = { name = "Misery's Company", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63100},
            ["A Monument to Vengeance"] = { name = "A Monument to Vengeance", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63039},
            ["Sundered Souls"] = { name = "Sundered Souls", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63043},
            ["Acquisition: Runeforged Shackles"] = { name = "Acquisition: Runeforged Shackles", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63047},
            ["Drowned and Torn Asunder"] = { name = "Drowned and Torn Asunder", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63179},
            ["Acquisition: Crystallized Stygia"] = { name = "Acquisition: Crystallized Stygia", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63031},
            ["A Suitable Demise"] = { name = "A Suitable Demise", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=60775},
            ["Dust to Dust"] = { name = "Dust to Dust", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=61088},
            ["Eye of the Scryer"] = { name = "Eye of the Scryer", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=60622},
            ["The Jailer's Share"] = { name = "The Jailer's Share", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=61079},
            ["Misery Business"] = { name = "Misery Business", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=60646},
            ["Death Motes"] = { name = "Death Motes", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=60762},
            ["Grathalax, the Extractor"] = { name = "Grathalax, the Extractor", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=61104},
            ["Disrupting the Cycle"] = { name = "Disrupting the Cycle", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=61103},
            ["A Spark of Light"] = { name = "A Spark of Light", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=61075},
            ["Words of Warding"] = { name = "Words of Warding", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=61765},
            ["Power of the Colossus"] = { name = "Power of the Colossus", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=62234},
            ["Forces of Perdition"] = { name = "Forces of Perdition", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=62214},
            ["Acquisition: Stygic Ore"] = { name = "Acquisition: Stygic Ore", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63072},
            ["Rodent Removal"] = { name = "Rodent Removal", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=62239},
            ["What They Know"] = { name = "What They Know", type = CONSTANTS.ACTIVITY_TYPE.DAILY_QUEST, questId=63069},
        }
    },
    ["Fallen Charger"] = {
        name = "Fallen Charger",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186659,
        spellId = 354353,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Fallen Charger"
    },
    ["Hand of Nilganihmaht"] = {
        name = "Hand of Nilganihmaht",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186713,
        spellId = 354354,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Secret Mount."
    },
    ["Hand of Salaranga"] = {
        name = "Hand of Salaranga",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186654,
        spellId = 354355,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Breaking the Chains"
    },
    ["Amber Shardhide"] = {
        name = "Amber Shardhide",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186647,
        spellId = 354356,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Revered with Death's Advance"
    },
    ["Crimson Shardhide"] = {
        name = "Crimson Shardhide",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186645,
        spellId = 354357,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Malbog"
    },
    ["Darkmaul"] = {
        name = "Darkmaul",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186646,
        spellId = 354358,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Pick Invasive Mawshrooms in Korthia until you have 10."
    },
    ["Fierce Razorwing"] = {
        name = "Fierce Razorwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186649,
        spellId = 354359,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Death's Advance Paragon Cache"
    },
    ["Garnet Razorwing"] = {
        name = "Garnet Razorwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186652,
        spellId = 354360,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Reliwik the Defiant"
    },
    ["Dusklight Razorwing"] = {
        name = "Dusklight Razorwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186651,
        spellId = 354361,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Farm up to 2 Lost Razorwing Eggs a day from gorger mobs in Korthia until you have 10."
    },
    ["Maelie, the Wanderer"] = {
        name = "Maelie, the Wanderer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186643,
        spellId = 354362,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Find Maelie in Korthia."
    },
    ["Rampaging Mauler"] = {
        name = "Rampaging Mauler",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187183,
        spellId = 356501,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Konthrogz the Obilterator"
    },
    ["Heartlight Vombata"] = {
        name = "Heartlight Vombata",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187629,
        spellId = 359229,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Exalted with The Enlightened"
    },
    ["Curious Crystalsniffer"] = {
        name = "Curious Crystalsniffer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187630,
        spellId = 359230,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Darkened Vombata"] = {
        name = "Darkened Vombata",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187631,
        spellId = 359231,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Adorned Vombata"] = {
        name = "Adorned Vombata",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187632,
        spellId = 359232,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Deathrunner"] = {
        name = "Deathrunner",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187638,
        spellId = 359278,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Sundered Zerethsteed"] = {
        name = "Sundered Zerethsteed",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187641,
        spellId = 359277,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Anointed Protostag"] = {
        name = "Anointed Protostag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187640,
        spellId = 359276,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Revered with The Enlightened"
    },
    ["Forged Spiteflyer"] = {
        name = "Forged Spiteflyer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187664,
        spellId = 359367,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Buzz"] = {
        name = "Buzz",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187665,
        spellId = 359366,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Bronzewing Vespoid"] = {
        name = "Bronzewing Vespoid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187663,
        spellId = 359364,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Mawdapted Raptora"] = {
        name = "Mawdapted Raptora",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187667,
        spellId = 359372,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Raptora Swooper"] = {
        name = "Raptora Swooper",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187668,
        spellId = 359373,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Bronze Helicid"] = {
        name = "Bronze Helicid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187670,
        spellId = 359376,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Unsuccessful Prototype Fleetpod"] = {
        name = "Unsuccessful Prototype Fleetpod",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187671,
        spellId = 359377,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Scarlet Helicid"] = {
        name = "Scarlet Helicid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187672,
        spellId = 359378,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Genesis Crawler"] = {
        name = "Genesis Crawler",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187677,
        spellId = 359401,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Tarachnid Creeper"] = {
        name = "Tarachnid Creeper",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187678,
        spellId = 359402,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Ineffable Skitterer"] = {
        name = "Ineffable Skitterer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187679,
        spellId = 359403,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Goldplate Bufonid"] = {
        name = "Goldplate Bufonid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187683,
        spellId = 359413,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Shimmering Aurelid"] = {
        name = "Shimmering Aurelid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187675,
        spellId = 359379,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Glory of the Sepulcher Raider"
    },
    ["Cryptic Aurelid"] = {
        name = "Cryptic Aurelid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 187673,
        spellId = 359381,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - From A to Zereth"
    },
    ["Carcinized Zerethsteed"] = {
        name = "Carcinized Zerethsteed",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 190771,
        spellId = 359545,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "The Jailer - Sepulcher of the First Ones Heroic"
    },
    ["Colossal Soulshredder Mawrat"] = {
        name = "Colossal Soulshredder Mawrat",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 188736,
        spellId = 363297,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - Flawless Master (Layer 16)"
    },
    ["Colossal Umbrahide Mawrat"] = {
        name = "Colossal Umbrahide Mawrat",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 188700,
        spellId = 363178,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Drop - Torghast Layer 13 or higher. Don't need a perfect run."
    },
    ["Colossal Ebonclaw Mawrat"] = {
        name = "Colossal Ebonclaw Mawrat",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 188696,
        spellId = 363136,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Achievement - The Jailer's Gauntlet: Layer 4"
    },
    ["Patient Bufonid"] = {
        name = "Patient Bufonid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 188808,
        spellId = 363701,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Quest - The Patient Bufonid. Starts in Haven."
    },
    ["Prototype Leaper"] = {
        name = "Prototype Leaper",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 188809,
        spellId = 363703,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Russet Bufonid"] = {
        name = "Russet Bufonid",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 188810,
        spellId = 363706,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Heartbond Lupine"] = {
        name = "Heartbond Lupine",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 190580,
        spellId = 367673,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Protoform Synthesis"
    },
    ["Colossal Plaguespew Mawrat"] = {
        name = "Colossal Plaguespew Mawrat",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 190765,
        spellId = 368105,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Rhuv, Gorger of Ruin",
        activities = {
            ["Kill Rhuv, Gorger of Ruin"] = { name = "Kill Rhuv, Gorger of Ruin", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=182120 },
        }
    },
    ["Colossal Wraithbound Mawrat"] = {
        name = "Colossal Wraithbound Mawrat",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 190766,
        spellId = 368128,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Treasure - Mawsworn Supply Chest"
    },
    ["Zereth Overseer"] = {
        name = "Zereth Overseer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 190768,
        spellId = 368158,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "The Jailer - Sepulcher of the First Ones Mythic"
    },
    ["Hopecrusher Gargon"] = {
        name = "Hopecrusher Gargon",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180581,
        spellId = 312753,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Hopecrusher",
        activities = {
            ["Kill Hopecrusher"] = { name = "Kill Hopecrusher", type = CONSTANTS.ACTIVITY_TYPE.RARE_KILL, npcId=166679 },
        }
    },
    ["Battle Gargon Vrednic"] = {
        name = "Battle Gargon Vrednic",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180948,
        spellId = 312754,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Venthyr Campaign"
    },
    ["Dreamlight Runestag"] = {
        name = "Dreamlight Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180263,
        spellId = 312759,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Night Fae Campaign"
    },
    ["Enchanted Dreamlight Runestag"] = {
        name = "Enchanted Dreamlight Runestag",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180721,
        spellId = 312761,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Night Fae Campaign"
    },
    ["Mawsworn Soulhunter"] = {
        name = "Mawsworn Soulhunter",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 184167,
        spellId = 312762,
        resetPeriod = CONSTANTS.RESET_PERIOD.FORTNIGHTLY,
        tip = "Rare - Gorged Shadehound"
    },
    ["Darkwarren Hardshell"] = {
        name = "Darkwarren Hardshell",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183052,
        spellId = 312763,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Covenant Mission Table"
    },
    ["Swift Gloomhoof"] = {
        name = "Swift Gloomhoof",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180728,
        spellId = 312767,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Night Mare"
    },
    ["Sundancer"] = {
        name = "Sundancer",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180773,
        spellId = 312765,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Sundancer"
    },
    ["Chittering Animite"] = {
        name = "Chittering Animite",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 183617,
        spellId = 312776,
        resetPeriod = CONSTANTS.RESET_PERIOD.UNLIMITED,
        tip = "Covenant Mission Table"
    },
    ["Horrid Dredwing"] = {
        name = "Horrid Dredwing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180461,
        spellId = 332882,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Harika the Horrid. Venthyr to summon. or buy from vendor."
    },
    ["Silky Shimmermoth"] = {
        name = "Silky Shimmermoth",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 180748,
        spellId = 318051,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Achievement - Ardenweald's a Stage then buy from vendor."
    },
    ["Colossal Slaughterclaw"] = {
        name = "Colossal Slaughterclaw",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 182081,
        spellId = 327405,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "The Undying Army Paragon Cache"
    },
    ["Mastercraft Gravewing"] = {
        name = "Mastercraft Gravewing",
        expansion = CONSTANTS.EXPANSION.SHADOWLANDS,
        type = CONSTANTS.ITEM_TYPE.MOUNT,
        itemId = 186479,
        spellId = 215545,
        resetPeriod = CONSTANTS.RESET_PERIOD.DAILY,
        tip = "Rare - Stygian Stonecrusher"
    },

}

function Mounts_Shadowlands:OnInit()
    ns.Database:AddItems(CONSTANTS.DB.TABLES.MOUNTS, mounts)
end