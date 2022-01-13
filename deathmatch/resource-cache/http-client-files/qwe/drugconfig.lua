scriptAuthor = "Solid"
authorContactEmail = "lopexsw@gmail.com"

--------------------------------------------------------

drugModelID = { -- Model, ID
	{3409, 1}, -- Weed
	{1, 2}
}

-- Weed stuff starts

weedSeedID = 294

distanceBetweenWeedPlants = 2.5 -- Minimum distance in meters from weed plant center.
distanceFromPlayerToPlantForHarvest = 3
timeBetweenUpdates = 10000 -- Time between growth stage checks.
maxHumidity = 100
minHumidityChange = 5
maxHumidityChange = 15
minHumidityForGrowth = 40 -- (0 to maxHumidity) If humidity is above this number, plant will advance in growth.

growthStages = { -- Scale X, Scale Y, Scale Z
	{0.3, 0.3, 0.4}, -- 1 Starting Stage
	{0.35, 0.35, 0.5}, -- 2
	{0.4, 0.4, 0.6}, -- 3
	{0.5, 0.5, 0.8}, -- 4
	{0.6, 0.6, 1}, -- 5 Final stage
}

waterSources = {15,9,58,62,63,83,100,101} -- water item id's
waterSourcesAmount = {
	[15] = 45,
	[9] = 25,
	[58] = 35,
	[62] = 35,
	[63] = 35,
	[83] = 15,
	[100] = 30,
	[101] = 30,
}


weedItemID = 38
minWeedGrams = 10
maxWeedGrams = 20

weedBonusItemID = 30
minBonusGrams = 1
maxBonusGrams = 5

-- Weed stuff ends