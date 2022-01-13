scriptAuthor = "Solid"
authorsEmail = "lopexsw@gmail.com"

---------------------------------Rock Collecting stuff starts here--------------------------------
dozerID = 486 -- Dozer vehicle ID
dozerSpawnLocationAndRotation = {684.694, 898.503, -39.732, -0, 0, 100.087}
rockRespawnCheckingTime = 600000 -- Time in miliseconds before it checks to respawn rocks.
rockTypes = { -- Rock models
	{905, 3930, 905}, -- small rocks
	{2936, 3929, 3931}, -- medium rocks
	{1303, 1303, 1304} -- big rocks
}
smallRockMin, smallRockMax = 50, 100 -- Weight for small rocks
mediumRockMin, mediumRockMax = 100, 250 -- Weight for medium rocks
bigRockMin, bigRockMax = 250, 500 -- Weight for big rocks
deliveryPoints = { -- The two rock delivery points in the Quarry.
	{697.599, 842.293, -27.577},
	{685.038, 821.567, -27.421}
}
moneyPerKg = 1 -- Money per kg of rocks
rockKgMultiplier = 1 -- How many of the kilograms will go to the shop, so players can actually buy them. For example: 100kg rock = 100 kg purchasable. If you set this to 0.5 it'll be like this: 100kg rock = 50kg to buy.

rockCoords = { -- id, x1, y1, z1, taken(true/false), weight (randomised on spawn), element (will get placed in on spawn, don't touch it here!) ONLY EDIT ID, X, Y, Z, don't touch the rest!
	{1, 623.011, 845.697, -43.961, false,nil,nil},
	{2, 616.22, 819.919, -43.953, false,nil,nil},
	{3, 629.578, 837.12, -43.961, false,nil,nil},
	{4, 566.29, 885.826, -44.434, false,nil,nil},
	{5, 575.235, 917.624, -43.967, false,nil,nil},
	{6, 643.789, 915.107, -42.798, false,nil,nil},
	{7, 636.074, 887.236, -43.961, false,nil,nil}
}

--------------------RockPile Stuff starts here---------------------------

allowedToBuy = false -- Weather or not people can buy rocks by default. Should be turned on by admins via /ironon (minutes)
rocksInRockPile = 1 -- Number of rocks in the rock pile by default. Goes up as people deliver rocks.
costPerKg = 1 -- Cost $ per item bought.
infoSymbolSpawnLocation = {365.512, 862.976, 20.406} -- Info symbol location. X, Y, Z


ironOreItemID = 285 -- This is the ID of the ore in g_items.lua in item-system, make sure they match!
processedIronItemID = 286 -- This is the ID of the iron INGOT in g_items.lua in item system. Make sure they match!


--------------------Iron Cooking stuff starts here -----------------------

ovenModelID = 2417 -- Oven Model ID in the Owlgaming g_items.lua
cookTimePerKG = 6000  -- Cooking time per ore item in the oven.

----------------Weapon Crafting Stuff starts here-------------------------


craftingTableModelID = 936

metalBarrelID = 287
metalSheetID = 288
sharpMetalID = 289
weaponBarrelID = 290
magazineID = 291
firingPinID = 292
pistolHandleID = 293
coltID = 22
deagleID = 24
uziID = 28
shotgunID = 25

craftingInfo = { -- Crafting information that shows in the first tab of the crafting menu.
	"Metal barrel = 2x Iron bars",
	"Metal plate = 2x Iron bar 1x sharp metal piece",
	"Sharp metal piece = 1x Iron Bar",
	"Weapon barrel = 2x Metal Barrels + 2x Metal plates",
	"Magazine = 3x Metal plate + 1x Iron Bar",
	"Firing ping = 2x Metal Plate + 3x Sharp metal piece",
	"Pistol-like handle = 3x metal plates + 1x Metal barrel + 3x Sharp metal piece",
	"Colt pistol = 1x Pistol-like handle + 1x Metal barrel + 2x Metal plate",
	"Deagle = 1x Pistol-like handle + 1x Metal barrel + 1x Magazine + 4 Metal plate",
	"Uzi = 1x Pistol-like handle + 2x Metal barrel + 1x Magazine + 4 Metal plate + 2x Sharp metal piece",
	"Shotgun = 4x Metal barrel + 1x Magazine + 4 Metal plate + 3 Sharp metal piece"
}

craftingRecipes = { -- item 1 id, item 1 amount, item 2 id, item 2 amount etc.
    [287] = {286, 2},
    [288] = {286, 2},
    [289] = {286, 1},
    [290] = {287, 2, 288, 1},
    [291] = {289, 2, 288, 3},
    [292] = {287, 1, 289, 3},
    [293] = {287, 2, 286, 2, 289, 1},
    [22] = {287, 1, 293, 1, 288, 1},
    [24] = {290, 1, 293, 1, 292, 1, 291, 1},
    [25] = {290, 2, 292, 1, 288, 4},
    [28] = {290, 1, 293, 1, 291, 1},
}

craftingTimes = { -- Crafting time for each item in miliseconds.
	[287] = 60000,
	[288] = 6000,
	[289] = 6000,
	[290] = 6000,
	[291] = 6000,
	[292] = 6000,
	[293] = 6000,
	[22] = 6000,
	[24] = 6000,
	[28] = 6000,
	[25] = 6000,
}


-------------ITEMS FOR OWLGAMING ITEM SYSTEM IN g_items.lua--------------

--[[
	Don't forget to add the images and place them in the meta.xml!
	[242] = { "Workbench", "Workbench that can be used to make stuff on.", 4, 936, 0, 0, 0, 0, weight = 4, storage = true, capacity = 20 },
	[244] = { "Oven", "Oven that can be used for cooking stuff.", 4, 2417, 0, 0, 0, 0, weight = 4, storage = true, capacity = 10 },

	[285] = { "Crude Iron", "A kilogram of Crude Iron.", 4, 905, 0, 0, 0, 0, weight = 1, image = 285}, -- Solid 13/12/2021
	[286] = { "Iron bar", "Iron bar made in a oven.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 286}, -- Solid 14/12/2021
	[287] = { "Metal barrel", "Cool metal barrel! Don't drop it on anyone.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 287}, -- Solid 14/12/2021
	[288] = { "Metal plate", "Cool metal plate. You can make stuff with this!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 288}, -- Solid 14/12/2021
	[289] = { "Sharp metal piece", "Don't cut yourself!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 289}, -- Solid 14/12/2021
	[290] = { "Weapon barrel", "Pew, pew, only need to learn how to place it together.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 290}, -- Solid 14/12/2021
	[291] = { "Magazine", "You need somewhere to place the bullets, right?", 4, 2891, 0, 0, 0, 0, weight = 1, image = 291}, -- Solid 14/12/2021
	[292] = { "Firing pin", "That piece that hits the bullet", 4, 2891, 0, 0, 0, 0, weight = 1, image = 292}, -- Solid 14/12/2021
	[293] = { "Pistol-like handle", "Hold it tight!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 293}, -- Solid 14/12/2021


	-- name, description, category, model, rx, ry, rz, zoffset, weight

	-- categories:
	-- 1 = Food & Drink
	-- 2 = Keys
	-- 3 = Drugs
	-- 4 = Other
	-- 5 = Books
	-- 6 = Clothing & Accessories
	-- 7 = Electronics
	-- 8 = guns
	-- 9 = bullets
	-- 10 = wallet
]]