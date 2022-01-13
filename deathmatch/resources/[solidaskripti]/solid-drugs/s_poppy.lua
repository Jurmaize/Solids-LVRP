local minPoppies = 2
local maxPoppies = 5

function harvestPoppy(drugObject)
	local poppyHeads = drugInfo[3][11]
	local px,py,pz = getElementPosition(client)
	local wx,wy,wz = getElementPosition(drugObject)
	if getDistanceBetweenPoints3D(px,py,pz,wx,wy,wz) <= distanceFromPlayerToPlantForHarvest then
		local harvestAmount = math.random(minPoppies, maxPoppies)

		if exports.global:hasSpaceForItem(client, poppyHeads, 1) then
			for i=1, harvestAmount do
				if exports.global:hasSpaceForItem(client, poppyHeads, 1) then
					exports.global:giveItem(client, poppyHeads, 1)
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
addEvent("harvestPoppy", true)
addEventHandler("harvestPoppy", root, harvestPoppy)