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

rockCoords = { -- id, x1, y1, z1, taken(true/false), weight (randomised on spawn), element (will get placed in on spawn, don't touch it here!)
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
costPerKg = 1 -- Cost per item bought.
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

craftingInfo = {
	"Metāla caurule = 2x Dzelzs stienis",
	"Metāla plāksne = 2x Dzelzs stienis 1x Ass metāls",
	"Ass metāla gabals = 1x Dzelzs stienis",
	"Ieroča stobrs = 2x Metāla caurules + 2x Metāla plāksnes",
	"Aptvere = 3x Metāla plāksnes + 1x Dzelzs stienis",
	"Belznis = 2x Metāla plāksnes + 3x Ass metāla gabals",
	"Pistoļveida rokturis = 3x metāla plāksnes + 1x Metāla caurule + 3x Ass metāla gabals",
	"Colt pistole = 1x Pistoļveida rokturis + 1x Metāla caurule + 2x Metāla plāksnes",
	"Deagle = 1x Pistoļveida rokturis + 1x Metāla caurule + 1x Aptvere + 4 Metāla plāksnes",
	"Uzi = 1x Pistoļveida rokturis + 2x metāla caurules + 1x Aptvere + 4 Metāla plāksnes + 2x Ass metāla gabals",
	"Bise = 4x Metāla caurules + 1x Aptvere + 4 Metāla plāksnes + 3 Ass Metāla gabals"
}

craftingRecipes = { -- item 1 id, item 1 amount, item 2 id, item 2 amount etc.
    [287] = {286, 2}, -- Metāla caurule = 2x Dzelzs stienis
    [288] = {286, 2}, -- Metāla plāksne = 2x Dzelzs stienis 1x Ass metāls
    [289] = {286, 1}, -- Ass metāla gabals = 1x Dzelzs stienis
    [290] = {287, 2, 288, 1}, -- Ieroča stobrs = 2x Metāla caurules + 2x Metāla plāksnes
    [291] = {289, 2, 288, 3}, -- Aptvere = 3x Metāla plāksnes + 1x Dzelzs stienis
    [292] = {287, 1, 289, 3}, -- Belznis = 2x Metāla plāksnes + 3x Ass metāla gabals
    [293] = {287, 2, 286, 2, 289, 1}, -- Pistoļveida rokturis = 3x metāla plāksnes + 1x Metāla caurule + 3x Ass metāla gabals
    [22] = {287, 1, 293, 1, 288, 1}, -- Colt pistole = 1x Pistoļveida rokturis + 1x Metāla caurule + 2x Metāla plāksnes
    [24] = {290, 1, 293, 1, 292, 1, 291, 1}, -- Deagle = 1x Pistoļveida rokturis + 1x Metāla caurule + 1x Aptvere + 4 Metāla plāksnes
    [25] = {290, 2, 292, 1, 288, 4}, -- Uzi = 1x Pistoļveida rokturis + 2x metāla caurules + 1x Aptvere + 4 Metāla plāksnes + 2x Ass metāla gabals
    [28] = {290, 1, 293, 1, 291, 1}, -- Bise = 4x Metāla caurules + 1x Aptvere + 4 Metāla plāksnes + 3 Ass Metāla gabals
}

craftingTimes = {
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
	[285] = { "Neapstrādāts Dzelzs", "Kilograms ar neapstrādātu dzelzi.", 4, 905, 0, 0, 0, 0, weight = 1, image = 285}, -- Solid 13/12/2021
	[286] = { "Dzelzs stienis", "Krāsnī cepts dzelzs stienis.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 286}, -- Solid 14/12/2021
	[287] = { "Metāla caurule", "Forša metāla caurule. Neuzmet nevienam to uz galvas!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 287}, -- Solid 14/12/2021
	[288] = { "Metāla plāksne", "Noderīga metāla plāksne. Ar to var taisīt lietas!.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 288}, -- Solid 14/12/2021
	[289] = { "Ass metāla gabals", "Nesagriez pirkstus!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 289}, -- Solid 14/12/2021
	[290] = { "Ieroča stobrs", "Pif paf, tikai iemācies salikt.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 290}, -- Solid 14/12/2021
	[291] = { "Aptvere", "Vajag vietu, kur iegrūst lodes.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 291}, -- Solid 14/12/2021
	[292] = { "Belznis", "Tā detaļa, kas uzsit pa patronu.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 292}, -- Solid 14/12/2021
	[293] = { "Pistoļveida rokturis", "Satver cītīgi!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 293}, -- Solid 14/12/2021


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