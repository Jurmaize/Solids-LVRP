local minHeroinAmount = 1
local maxHeroinAmount = 5
local aspirinAmountAfterCrushing = 3

local function makeHeroin(playerSource)
	local closestObject = getNearestObject(playerSource, distanceFromPlayerToPlantForHarvest)
	if closestObject then
		if getElementModel(closestObject) == heroinBarrelObjectModel then
			triggerEvent('sendAme', playerSource, "ielūkojas mucā.")
			if getElementData(closestObject, "soliddrugs:poppies") then
				triggerClientEvent(playerSource, "openHeroinBarrelGUI", playerSource, closestObject)
			else
				setElementData(closestObject, "soliddrugs:poppies", 0)
				setElementData(closestObject, "soliddrugs:water", false)
				setElementData(closestObject, "soliddrugs:coughsyrup", false)
				setElementData(closestObject, "soliddrugs:aspirin:crushed", false)
				setElementData(closestObject, "soliddrugs:rust", false)
				setElementData(closestObject, "soliddrugs:readytoharvest", false)
				triggerClientEvent(playerSource, "openHeroinBarrelGUI", playerSource, closestObject)
			end
		else
			outputChatBox("Tev tuvākais objekts nav heroīna muca! Pieej tuvāk.", playerSource)
		end
	else
		outputChatBox("Tev tuvumā neatrodas heroīna muca!", playerSource)
	end
end
addCommandHandler("makeheroin", makeHeroin, false, true)

local heroinActions = {
	[1] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, poppiesItemID, 1) then
			local currentPoppyCount = getElementData(barrelObject, "soliddrugs:poppies")
			if currentPoppyCount <= poppiesNeededToMakeHeroin then
				setElementData(barrelObject, "soliddrugs:poppies", currentPoppyCount+1)
				exports.global:takeItem(playerSource, poppiesItemID, 1)
				triggerClientEvent(playerSource, "restartHeroinWindow", playerSource, barrelObject)
				triggerEvent('sendAme', playerSource, "iemet pāris magoņu galviņas mucā.")
			end
		else
			outputChatBox("Tev nav magoņu galviņas, ko ielikt mucā!", playerSource)
		end
	end,
	[2] = function(playerSource, barrelObject)
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
			triggerClientEvent(playerSource, "restartHeroinWindow", playerSource, barrelObject)
			triggerEvent('sendAme', playerSource, "ielej šķidrumu mucā.")
		else
			outputChatBox("Tev nav derīgu škidrumu, ko ieliet mucā!", playerSource)
		end
	end,
	[3] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, coughSyrupItemID, 1) then
			setElementData(barrelObject, "soliddrugs:coughsyrup", true)
			exports.global:takeItem(playerSource, coughSyrupItemID, 1)
			triggerClientEvent(playerSource, "restartHeroinWindow", playerSource, barrelObject)
			triggerEvent('sendAme', playerSource, "ielej klepus zāles mucā.")
		else
			outputChatBox("Tev nav klepus zāles, ko ieliet mucā!", playerSource)
		end
	end,
	[4] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, aspirinCrushedItemID, 1) then
			exports.global:takeItem(playerSource, aspirinCrushedItemID, 1)
			setElementData(barrelObject, "soliddrugs:aspirin:crushed", true)
			triggerClientEvent(playerSource, "restartHeroinWindow", playerSource, barrelObject)
			triggerEvent('sendAme', playerSource, "pieber šauju Aspirīna pulvera.")
		else
			outputChatBox("Tev nav Aspirīna pulvera, ko iebērt mucā!", playerSource)
		end
	end,
	[5] = function(playerSource, barrelObject)
		if exports.global:hasItem(playerSource, rustRemoverItemID, 1) then
			exports.global:takeItem(playerSource, rustRemoverItemID, 1)
			outputChatBox("Rūsas noņēmējs tika pieliets un tagad ir jāuzgaida līdz ķimikālijas samiksējas! ((Čatā redzēsi, kad ir gatavs!))")
			triggerEvent('sendAme', playerSource, "ielej pudeli ar rūsas noņēmēju mucā.")
			setTimer(function(barrelObject) 
				setElementData(barrelObject, "soliddrugs:rust", true)
				triggerClientEvent(playerSource, "restartHeroinWindow", playerSource, barrelObject)
				outputChatBox("Ķimikālijas ir samaisījušās!", playerSource)
			end, timeTillHeroinHarvest, 1, barrelObject)
		else
			outputChatBox("Tev nav rūsas noņēmējs, ko ieliet mucā!", playerSource)
		end
	end,
	[6] = function(playerSource, barrelObject)
		local harvestGramAmount = math.random(minHeroinAmount, maxHeroinAmount)
		if exports.global:hasSpaceForItem(playerSource, heroinItemID, harvestGramAmount) then
			exports.global:giveItem(playerSource, heroinItemID, harvestGramAmount)

			setElementData(barrelObject, "soliddrugs:poppies", 0)
			setElementData(barrelObject, "soliddrugs:water", false)
			setElementData(barrelObject, "soliddrugs:coughsyrup", false)
			setElementData(barrelObject, "soliddrugs:aspirin:crushed", false)
			setElementData(barrelObject, "soliddrugs:rust", false)
			setElementData(barrelObject, "soliddrugs:readytoharvest", false)
			triggerClientEvent(playerSource, "restartHeroinWindow", playerSource, barrelObject)
			outputChatBox("Tu nokasīji gatavo heroīnu no mucas malām!", playerSource)
			triggerEvent('sendAme', playerSource, "nokasa heroīnu no mucas malām.")
		else
			outputChatBox("Tev nav vietas saražotajam daudzumam!", playerSource)
		end
	end,
}

local function doHeroinAction(actionNumber, barrelObject)
	heroinActions[actionNumber](client, barrelObject)
end
addEvent("doHeroinAction", true)
addEventHandler("doHeroinAction", root, doHeroinAction)


function crushAspirin()
	if exports.global:hasItem(client, aspirinItemID, 1) then
		exports.global:takeItem(client, aspirinItemID, 1)
		for i=1, aspirinAmountAfterCrushing do
			exports.global:giveItem(client, aspirinCrushedItemID, 1)
		end
	else
		outputChatBox("Tev nav aspirīns, ko pulvarizēt!", client)
	end
end
addEvent("crushAspirin", true)
addEventHandler("crushAspirin", root, crushAspirin)