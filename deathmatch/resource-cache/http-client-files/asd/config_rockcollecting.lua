---------------------------------Rock Collecting stuff starts here--------------------------------
dozerID = 486
dozerSpawnLocationAndRotation = {684.694, 898.503, -39.732, -0, 0, 100.087}
rockRespawnCheckingTime = 600000 -- 10 mins in miliseconds
rockTypes = {
	{905, 3930, 905}, -- small rocks
	{2936, 3929, 3931}, -- medium rocks
	{1303, 1303, 1304} -- big rocks
}
smallRockMin, smallRockMax = 50, 100 -- Weight for small rocks
mediumRockMin, mediumRockMax = 100, 250 -- Weight for medium rocks
bigRockMin, bigRockMax = 250, 500 -- Weight for big rocks
deliveryPoints = {
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

allowedToBuy = false
rocksInRockPile = 1
costPerKg = 1
infoSymbolSpawnLocation = {365.512, 862.976, 20.406}