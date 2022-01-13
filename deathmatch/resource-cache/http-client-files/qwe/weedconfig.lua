scriptAuthor = "Solid"
authorContactEmail = "lopexsw@gmail.com"

--------------------------------------------------------

drugModelID = { -- Model, ID
	{3409, 1}, -- Weed
	{1, 1}
}


distanceBetweenWeedPlants = 1.5 -- Minimum distance in meters from weed plant center.
distanceFromPlayerToPlantForHarvest = 2
timeBetweenUpdates = 10000 -- Time between growth stage checks.
maxHumidity = 100
minHumidityChange = 5
maxHumidityChange = 15
minHumidityForGrowth = 60 -- (0 to maxHumidity) If humidity is above this number, plant will advance in growth.

growthStages = { -- Scale X, Scale Y, Scale Z
	{0.3, 0.3, 0.4}, -- 1 Starting Stage
	{0.35, 0.35, 0.5}, -- 2
	{0.4, 0.4, 0.6}, -- 3
	{0.5, 0.5, 0.8}, -- 4
	{0.6, 0.6, 1}, -- 5 Final stage
}

waterSources = {10,20,30} -- water item id's
waterSourcesAmount = {
	[10] = 10,
	[20] = 20,
	[30] = 30,
}


weedItemID = 28
minWeedGrams = 10
maxWeedGrams = 20

weedBonusItemID = 30
minBonusGrams = 1
maxBonusGrams = 5