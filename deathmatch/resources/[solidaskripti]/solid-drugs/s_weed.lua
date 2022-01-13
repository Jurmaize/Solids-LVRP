local minWeedGrams = 5
local maxWeedGrams = 15
local minBonusGrams = 1
local maxBonusGrams = 3

function harvestWeed(drugObject)
	local px,py,pz = getElementPosition(client)
	local wx,wy,wz = getElementPosition(drugObject)
	if getDistanceBetweenPoints3D(px,py,pz,wx,wy,wz) <= distanceFromPlayerToPlantForHarvest then
		local harvestGramAmount = math.random(minWeedGrams, maxWeedGrams)
		if exports.global:hasSpaceForItem(client, drugInfo[1][11], harvestGramAmount) then
			exports.global:giveItem(client, drugInfo[1][11], harvestGramAmount) 							-- Main weed item

			if math.random(3) == 2 then 															-- Bonus item if lucky ;) 33% chance of getting it
				local harvestBonusAmount = math.random(minBonusGrams, maxBonusGrams)
				if exports.global:hasSpaceForItem(client, drugInfo[1][12], harvestBonusAmount) then
					exports.global:giveItem(client, drugInfo[1][12], harvestBonusAmount)
				end
			end

			destroyElement(drugObject)
			triggerClientEvent(client, "closeBaseWindowDrugs", client)
		else
			triggerClientEvent(client, "informClientMessage", client, 4)
		end
	else
		triggerClientEvent(client, "informClientMessage", client, 3)
	end
end
addEvent("harvestWeed", true)
addEventHandler("harvestWeed", root, harvestWeed)