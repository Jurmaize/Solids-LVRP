local minCocaLeaves = 2
local maxCocaLeaves = 5

function harvestCoca(drugObject)
	local cocaLeaf = drugInfo[2][11]
	local px,py,pz = getElementPosition(client)
	local wx,wy,wz = getElementPosition(drugObject)
	if getDistanceBetweenPoints3D(px,py,pz,wx,wy,wz) <= distanceFromPlayerToPlantForHarvest then
		local harvestAmount = math.random(minCocaLeaves, maxCocaLeaves)

		if exports.global:hasSpaceForItem(client, cocaLeaf, 1) then
			for i=1, harvestAmount do
				if exports.global:hasSpaceForItem(client, cocaLeaf, 1) then
					exports.global:giveItem(client, cocaLeaf, 1)
				else
					triggerClientEvent(client, "informClientMessage", client, 4)
					break
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
addEvent("harvestCoca", true)
addEventHandler("harvestCoca", root, harvestCoca)