function startRockResource(startedResource)
	if startedResource == getThisResource() then
		createVehicle(dozerID, dozerSpawnLocationAndRotation[1], dozerSpawnLocationAndRotation[2], dozerSpawnLocationAndRotation[3], dozerSpawnLocationAndRotation[4], dozerSpawnLocationAndRotation[5], dozerSpawnLocationAndRotation[6])
		respawnRocks()
		setTimer(respawnRocks, rockRespawnCheckingTime, 0)
	end
end
addEventHandler("onResourceStart", root, startRockResource)


function respawnRocks() -- Will go over all rocks and re-spawn those, that are not spawned once every X minutes WITH RANDOM WEIGHT
	for i = 1, #rockCoords, 1 do
		if rockCoords[i][7] == nil then
			local rockChances = math.random(1,10)
			local typeOfRock = nil
			if rockChances <= 6 then
				typeOfRock = 1
				rockCoords[i][6] = math.random(smallRockMin, smallRockMax)
			elseif rockChances > 6 and rockChances <= 9 then
				typeOfRock = 2
				rockCoords[i][6] = math.random(mediumRockMin, mediumRockMax)
			else
				typeOfRock = 3
				rockCoords[i][6] = math.random(bigRockMin, bigRockMax)
			end
			local spawnedRock = createObject(rockTypes[typeOfRock][math.random(1,3)], rockCoords[i][2], rockCoords[i][3], rockCoords[i][4])
			rockCoords[i][7] = spawnedRock
			setElementFrozen(spawnedRock, true)
		end
	end
	outputDebugString("Rocks at the Quarry have been respawned!", 3, 0, 255, 0)
end

function pickRockForPlayer()
	local pickedRock = nil
	local i = 0
	repeat
		i = i + 1
		if i > #rockCoords then
			break
		end
		pickedRock = math.random(1,#rockCoords)
	until (rockCoords[pickedRock][7] ~= nil and rockCoords[pickedRock][5] == false)
	if rockCoords[pickedRock][7] ~= nil and rockCoords[pickedRock][5] == false then
		triggerClientEvent(client, "setClientPickedRock", client, pickedRock)
	else
		outputChatBox("There currently aren't any rocks to deliver! Wait a bit, for the miners to dig some up!", client)
	end
end
addEvent("chooseRockForPlayer", true)
addEventHandler("chooseRockForPlayer", root, pickRockForPlayer)

function addRockToDozer(pickedRock, dozer)
	rockCoords[pickedRock][5] = true
	attachElements(rockCoords[pickedRock][7], dozer, 0, 3.3, 0)
end
addEvent("serverAddRockToDozer", true)
addEventHandler("serverAddRockToDozer", root, addRockToDozer)

function deliverRock(pickedRock)
	local rockElement = rockCoords[pickedRock][7]
	destroyElement(rockElement)
	rockCoords[pickedRock][7] = nil
	local rockWeight = rockCoords[pickedRock][6]
	rocksInRockPile = rocksInRockPile + math.floor(rockWeight * rockKgMultiplier)
	payPlayerForRock(client, rockWeight)
end
addEvent("serverDeliverRock", true)
addEventHandler("serverDeliverRock", root, deliverRock)

function payPlayerForRock(client, rockWeight)
	local payAmount = rockWeight * moneyPerKg
	local rate = math.floor(payAmount)
	exports.global:giveMoney(client, rate)
end

function deleteDozerRock(pickedRock)
	local rockElement = rockCoords[tonumber(pickedRock)][7]
	destroyElement(rockElement)
	rockCoords[pickedRock][5] = false
end
addEvent("deleteRock", true)
addEventHandler("deleteRock", root, deleteDozerRock)