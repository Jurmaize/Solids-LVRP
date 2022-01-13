function updateDrug(drugObject, drugTypeID)
	if drugObject then
		if updateDrugHumidity(drugObject, drugTypeID) then
			if updateDrugGrowth(drugObject, drugTypeID) == #drugInfo[drugTypeID][10] then
				setElementData(drugObject, "soliddrugs:readytoharvest", true)
			else
				setTimer(updateDrug, drugInfo[drugTypeID][7], 1, drugObject, drugTypeID)
			end
		end
	end
end

function updateDrugHumidity(drugObject, drugTypeID)
	local plantHumidity = getElementData(drugObject, "soliddrugs:humidity")
	local newHumidity = plantHumidity - (math.random(drugInfo[drugTypeID][8], drugInfo[drugTypeID][9]))

	if plantHumidity > 0 then
		if newHumidity < 0 then
			setElementData(drugObject, "soliddrugs:humidity", 0)
		else
			setElementData(drugObject, "soliddrugs:humidity", newHumidity)
		end
	end

	if newHumidity < drugInfo[drugTypeID][6] then
		return false -- If new value is under requirement to grow, don't allow to grow.
	else
		return true -- If new value is above requirement to grow, then allow it to grow.
	end
end

function updateDrugGrowth(drugObject, drugTypeID)
	local currentGrowthStage = getElementData(drugObject,"soliddrugs:growthstage")
	if currentGrowthStage ~= #drugInfo[drugTypeID][10] then
		local newGrowthStage = currentGrowthStage+1
		setElementData(drugObject, "soliddrugs:growthstage", newGrowthStage)
		local growthSizes = drugInfo[drugTypeID][10][newGrowthStage]
		setObjectScale(drugObject, growthSizes[1], growthSizes[2], growthSizes[3])
		return newGrowthStage
	end
	return currentGrowthStage
end

function waterDrug(drugObject, drugTypeID) -- TODO jāpārtaisa, lai der priekš visām narkām
	local objectToWaterWith = nil
	for i=1, #waterSources do
		local itemToCheck = waterSources[i]
		if exports.global:hasItem(client, itemToCheck, 1) then
			objectToWaterWith = itemToCheck
			break
		end
	end
	if objectToWaterWith then
		local currentHumidity = getElementData(drugObject, "soliddrugs:humidity")
		local newHumidity = currentHumidity + waterSourcesAmount[objectToWaterWith]
		if newHumidity > drugInfo[drugTypeID][5] then
			setElementData(drugObject, "soliddrugs:humidity", drugInfo[drugTypeID][5])
		else
			setElementData(drugObject, "soliddrugs:humidity", newHumidity)
		end
		exports.global:takeItem(client, objectToWaterWith, 1)
		triggerClientEvent(client, "restartBaseWindowDrugs", client, drugTypeID, drugObject)
		triggerClientEvent(client, "informClientMessage", client, 1)
	else
		triggerClientEvent(client, "informClientMessage", client, 2)
	end
end
addEvent("waterDrug", true)
addEventHandler("waterDrug", root, waterDrug)