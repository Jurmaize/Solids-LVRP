scriptAuthor = "Solid"
authorContactEmail = "lopexsw@gmail.com"

--------------------------------------------------------
timeTillDrugCounterResets = 10000
currentGramCount = 0
maxAmountOfGrams = 30
maxArmorFromDrugs = 49

hpDrugModifier = 3
armorDrugModifier = 3

--------------------------------------------------------

minDistanceBetweenPlants = 2.5
distanceFromPlayerToPlantForHarvest = 2.5

drugTypes = {
	["weed"] = 1,
	["coca"] = 2,
	["poppy"] = 3,
}

drugInfo = { -- This array is used for growing various types of drugs. It has nothing to do with crafting them. Stuff like coca leaves are here, but making cocaine itself is elsewhere in the config.
	{ -- Weed
		294, -- Weed seed
		3409, -- Weed plant world model
		"Marihuānas izvēlne", -- Weed menu name
		{6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 20, 80, 81, 82, 115, 116, 117, 118, 119, 120, 121, 122, 125, 146, 147, 148, 149, 150, 151, 152, 153, 160, 19, 22, 24,25,26,27,40,83,84,87,88,110,123,124,126,128,129,130,132,133,145, 23, 41, 111, 112, 113, 114},
		100, -- Max humidity of the plant
		40, -- Minimum Humidity for the plant to grow
		10000, -- Time between plant updates. Includes checks for humidity, growing up etc.
		5, -- Minimum humidity change
		15, -- Maximum humidity change
		{ -- x,y,z scale
			{0.3, 0.3, 0.4}, -- 1 Starting Stage
			{0.35, 0.35, 0.5}, -- 2
			{0.4, 0.4, 0.6}, -- 3
			{0.5, 0.5, 0.8}, -- 4
			{0.6, 0.6, 1}, -- 5 Final stage
		},
		38, -- Weed item 1 to reward
		30, -- Weed item 2 to reward (has a chance of being given)
	},
	{ -- Coca
		295, -- Coca plant seed
		646, -- Coca plant world model
		"Coca auga izvēlne", -- Coca menu name
		{6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 20, 80, 81, 82, 115, 116, 117, 118, 119, 120, 121, 122, 125, 146, 147, 148, 149, 150, 151, 152, 153, 160, 19, 22, 24,25,26,27,40,83,84,87,88,110,123,124,126,128,129,130,132,133,145, 23, 41, 111, 112, 113, 114},
		100, -- Max humidity of the plant
		40, -- Minimum Humidity for the plant to grow
		10000, -- Time between plant updates. Includes checks for humidity, growing up etc.
		5, -- Minimum humidity change
		15, -- Maximum humidity change
		{ -- x,y,z scale
			{0.3, 0.3, 0.4}, -- 1 Starting Stage
			{0.4, 0.4, 0.45}, -- 2
			{0.5, 0.5, 0.5}, -- 3 Final stage
		},
		296, -- Coca leaves from item system
		nil,
	},
	{ -- Poppy
		302, -- Poppy plant seed
		862, -- Poppy plant world model
		"Magones auga izvēlne", -- Poppy menu name
		{6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 20, 80, 81, 82, 115, 116, 117, 118, 119, 120, 121, 122, 125, 146, 147, 148, 149, 150, 151, 152, 153, 160, 19, 22, 24,25,26,27,40,83,84,87,88,110,123,124,126,128,129,130,132,133,145, 23, 41, 111, 112, 113, 114},
		100, -- Max humidity of the plant
		40, -- Minimum Humidity for the plant to grow
		10000, -- Time between plant updates. Includes checks for humidity, growing up etc.
		5, -- Minimum humidity change
		15, -- Maximum humidity change
		{ -- x,y,z scale
			{0.2, 0.2, 0.4}, -- 1 Starting Stage
			{0.5, 0.5, 0.5}, -- 2
			{0.7, 0.7, 0.6}, -- 3
			{1, 1, 1}, 		 -- 4 Final stage
		},
		303, -- Juicy Poppy head from item system
		nil,
	}
}

waterSources = {15,9,58,62,63,83,100,101} -- water item id's
waterSourcesAmount = { -- amount of water each water source gives to a plant
	[15] = 45,
	[9] = 25,
	[58] = 35,
	[62] = 35,
	[63] = 35,
	[83] = 15,
	[100] = 30,
	[101] = 30,
}

-- Stuff for creating cocaine in a barrel starts here
cocaLeavesNeededToMakeCocaine = 5 -- Amount of leaf items needed to make cocaine.
cocaLeavesItemID = 296 -- Coca leaf item id from item system (also found in drugInfo)
cocaineBarrelObjectModel = 3632 -- World model of barrel where mixing will happen
cementPowderItemID = 298 -- Cement powder id in item system
-- waterSources are used for water item checks
petrolCanItemID = 57 -- patrol can item id in item system
drainCleanerItemID = 299 -- drain cleaner item id in item system
cocaineItemID = 34 -- Main item that'll be given to player when harvesting barrel of cocaine
cocaineBonusItemID = 31 -- Bonus item that'll be given to player when harvesting barrel of cocaine IF they're lucky!

timeToMixCocaLeaves = 6000 -- Time in miliseconds that it takes to mix the coca leaves up.
timeTillCocaineHarvest = 6000 -- Time in miliseconds after adding the last ingredient till when you can harvest it!
-- Cocaine making stuff ends here

-- Heroin making stuff starts here
poppiesNeededToMakeHeroin = 5
heroinItemID = 37

heroinBarrelObjectModel = 935
poppiesItemID = 303
coughSyrupItemID = 304
aspirinItemID = 305
aspirinCrushedItemID = 306
rustRemoverItemID = 307

timeTillHeroinHarvest = 6000
-- Heroin making stuff ends here


--[[
How to add a new drug:
1. Add it to drugTypes.
2. Add new info to drugInfo. How to do it, should be written there.
3. Add new entry to switch in c_planting.lua
4. Do all the planting in s_planting.lua
5. Call to individual script .lua for that drug from c_base.lua. For weed, it's c_weed.lua and s_weed.lua etc. add harvesting for that specific drug
6. Add new entry to switch in c_base.lua to call that specific drugs menu.
]]