local minCocaineAmount = 1
local maxCocaineAmount = 5
local minBonusCocaineAmount = 1
local maxBonusCocaineAmount = 3

function makeCocaine(playerSource)
	local closestObject = getNearestObject(playerSource, distanceFromPlayerToPlantForHarvest) -- Reusing harvest distance, cause why not :P
	if closestObject then
		if getElementModel(closestObject) == cocaineBarrelObjectModel then
			triggerEvent('sendAme', playerSource, "ielūkojas mucā.")
			if getElementData(closestObject, "soliddrugs:cocaleaves") then
				triggerClientEvent(playerSource, "openBarrelGUI", playerSource, closestObject)
			else
				setElementData(closestObject, "soliddrugs:cocaleaves", 0)
				setElementData(closestObject, "soliddrugs:cocamixed", false)
				setElementData(closestObject, "soliddrugs:cementpowder", false)
				setElementData(closestObject, "soliddrugs:water", false)
				setElementData(closestObject, "soliddrugs:petrol", false)
				setElementData(closestObject, "soliddrugs:sulfuricacid", false)
				setElementData(closestObject, "soliddrugs:readytoharvest", false)
				triggerClientEvent(playerSource, "openBarrelGUI", playerSource, closestObject)
			end
		else
			outputChatBox("Tev tuvākais objekts nav kokaīna muca! Pieej tuvāk.", playerSource)
		end
	else
		outputChatBox("Tev tuvumā neatrodas kokaīna muca!", playerSource)
	end
end
addCommandHandler("makecocaine", makeCocaine, false, true)

local cocaineActions = {
	[1] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, cocaLeavesItemID, 1) then
			local currentLeafCount = getElementData(barrelObject, "soliddrugs:cocaleaves")
			if currentLeafCount <= cocaLeavesNeededToMakeCocaine then
				setElementData(barrelObject, "soliddrugs:cocaleaves", currentLeafCount+1)
				exports.global:takeItem(playerSource, cocaLeavesItemID, 1)
				triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
				triggerEvent('sendAme', playerSource, "iemet pāris coca lapas mucā.")
			end
		else
			outputChatBox("Tev nav coca lapas, ko ielikt mucā!", playerSource)
		end
	end,
	[2] = function(playerSource, barrelObject)
		outputChatBox("Lapu sasmalcināšana uzsākta! Gaidiet, kamēr tā tiks pabeigta!", playerSource)
		triggerEvent('sendAme', playerSource, "ar rokām sāk smalcināt lapas, kas ir mucā.")
		setTimer(function(barrelObject) 
			outputChatBox("Lapu sasmalcināšana pabeigta!", playerSource)
			setElementData(barrelObject, "soliddrugs:cocamixed", true)
			triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
		end, timeToMixCocaLeaves, 1, barrelObject)
	end,
	[3] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, cementPowderItemID, 1) then
			setElementData(barrelObject, "soliddrugs:cementpowder", true)
			exports.global:takeItem(playerSource, cementPowderItemID, 1)
			triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
			triggerEvent('sendAme', playerSource, "ieber veselu maisu ar cementa pulveri mucā.")
		else
			outputChatBox("Tev nav cementa pulveris, ko iebērt mucā!", playerSource)
		end
	end,
	[4] = function(playerSource, barrelObject)
		local objectToWaterWith = nil
		for i=1, #waterSources do
			local itemToCheck = waterSources[i]
			if exports.global:hasItem(playerSource, itemToCheck, 1) then
				objectToWaterWith = itemToCheck
				break
			end
		end
		if objectToWaterWith then
			setElementData(barrelObject, "soliddrugs:water", true)
			exports.global:takeItem(playerSource, objectToWaterWith, 1)
			triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
			triggerEvent('sendAme', playerSource, "ielej šķidrumu mucā.")
		else
			outputChatBox("Tev nav derīgu škidrumu, ko ieliet mucā!", playerSource)
		end
	end,
	[5] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, petrolCanItemID, 25) then
			exports.global:takeItem(playerSource, petrolCanItemID, 25)
			setElementData(barrelObject, "soliddrugs:petrol", true)
			triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
			triggerEvent('sendAme', playerSource, "ielej degvielu no kanniņas mucā.")
		else
			outputChatBox("Tev nav degvielas, ko ieliet mucā!", playerSource)
		end
	end,
	[6] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, drainCleanerItemID, 1) then
			exports.global:takeItem(playerSource, drainCleanerItemID, 1)
			outputChatBox("Sērskābe tika pielieta un tagad ir jāuzgaida līdz ķimikālijas samiksējas! ((Čatā redzēsi, kad ir gatavs!))")
			triggerEvent('sendAme', playerSource, "ielej pudeli ar ķimikālijām mucā.")
			setTimer(function(barrelObject) 
				setElementData(barrelObject, "soliddrugs:sulfuricacid", true)
				triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
				outputChatBox("Ķimikālijas ir samaisījušās!", playerSource)
			end, timeTillCocaineHarvest, 1, barrelObject)
		else
			outputChatBox("Tev nav līdzeklis ar sērskābi, ko ieliet mucā!", playerSource)
		end
	end,
	[7] = function(playerSource, barrelObject)
		local harvestGramAmount = math.random(minCocaineAmount, maxCocaineAmount)
		if exports.global:hasSpaceForItem(playerSource, cocaineItemID, harvestGramAmount) then
			exports.global:giveItem(playerSource, cocaineItemID, harvestGramAmount)

			if math.random(3) == 3 then -- Gives them bonus item if they're lucky! Comment out the if math.random block if you don't want a bonus item to be given!
				local bonusHarvestAmount = math.random(minBonusCocaineAmount, maxBonusCocaineAmount)
				if exports.global:hasSpaceForItem(playerSource, cocaineBonusItemID, bonusHarvestAmount) then
					exports.global:giveItem(playerSource, cocaineBonusItemID, bonusHarvestAmount)
				else
					outputChatBox("Tu būtu dabūjis vel bonusa kokaīna alkoīdus, bet tev nebija vieta viņiem.", playerSource)
				end
			end

			setElementData(barrelObject, "soliddrugs:cocaleaves", 0)
			setElementData(barrelObject, "soliddrugs:cocamixed", false)
			setElementData(barrelObject, "soliddrugs:cementpowder", false)
			setElementData(barrelObject, "soliddrugs:water", false)
			setElementData(barrelObject, "soliddrugs:petrol", false)
			setElementData(barrelObject, "soliddrugs:sulfuricacid", false)
			setElementData(barrelObject, "soliddrugs:readytoharvest", false)
			triggerClientEvent(playerSource, "restartCocaineWindow", playerSource, barrelObject)
			outputChatBox("Tu nokasīji gatavo kokaīnu no mucas malām!", playerSource)
			triggerEvent('sendAme', playerSource, "nokasa kokaīnu no mucas malām.")
		else
			outputChatBox("Tev nav vietas saražotajam daudzumam!", playerSource)
		end
	end,
}

local function doCocaineAction(actionNumber, barrelObject)
	cocaineActions[actionNumber](client, barrelObject)
end
addEvent("doCocaineAction", true)
addEventHandler("doCocaineAction", root, doCocaineAction)