local function doPay(client, rate)
	exports.global:giveMoney(client, rate)
end

function calculateTruckerPay(routeID)
	local seat = getPedOccupiedVehicleSeat(client)
	if not seat or seat ~= 0 then
		return
	end

	local routeDistance = math.floor(getDistanceBetweenPoints3D(deliveryPoints[routeID][3],deliveryPoints[routeID][4],deliveryPoints[routeID][5],deliveryPoints[routeID][7],deliveryPoints[routeID][8],deliveryPoints[routeID][9]))
	local calculatedPay = nil
	if deliveryPoints[routeID][10] == true then
		calculatedPay = routeDistance * payPerMeter + (routeDistance * payPerMeter)*illegalBonus/100
	else
		calculatedPay = routeDistance * payPerMeter
	end

	calculatedPay = math.floor(calculatedPay)

	if (exports.donators:hasPlayerPerk(client, 44)) then
		calculatedPay = calculatedPay + math.floor(calculatedPay*(donatorBonus/100))
	end

	doPay(client, calculatedPay)
end

function spawnTrailerForPlayer(drivenVehicle, routeID)
	local route = tonumber(routeID)
	local trailers = {584,435,450}
	local trailerToSpawn = trailers[math.random(1,3)]
	local prx, pry, prz = getElementRotation(client)
	local px,py,pz = getElementPosition(client)
	local trailerSpawnLocation = {px,py,pz+50}
	trailer = createVehicle(trailerToSpawn, trailerSpawnLocation[1], trailerSpawnLocation[2], trailerSpawnLocation[3], prx, pry, prz, "Trucker")
	setTimer(deleteTrailerAfterTimer, timeTillTrailerGetsDeleted, 1, trailer)
	attachTrailerToVehicle(drivenVehicle, trailer)
	if deliveryPoints[route][10] then
		setElementData(drivenVehicle, "solidtrucking:illegal", true)
		setElementData(drivenVehicle, "solidtrucking:illegalload", deliveryPoints[route][11])
		local cops = {}
		for id, player in ipairs(getElementsByType("player")) do 
			if exports.factions:isPlayerInFaction(player, policeFactionID) then
				table.insert(cops, player)
				playSoundFrontEnd(player, 49)
			end
		end
		outputChatBox("[RADIO] LSPD Dispičers: Anonīms zvanītājs paziņoja pa nelegālas kravas pārvešanu. Ja redzat smago automašīnu, pārbaudat to!", cops, 0, 194, 219)
	end
	triggerClientEvent(client, "setTrailerVar", client, trailer)
end
addEvent( "spawnTrailerForTruckDriver", true )
addEventHandler( "spawnTrailerForTruckDriver", root, spawnTrailerForPlayer)

function deleteTrailerAfterTimer(trailer)
	if isElement(trailer) then
		destroyElement(trailer)
	end
end

function checkIfPlayerHasTrailer(drivenVehicle, trailer, routeID)
	detachTrailerFromVehicle(drivenVehicle, trailer)
	destroyElement(trailer)
	calculateTruckerPay(routeID)
end
addEvent( "checkIfTrailerIsOn", true )
addEventHandler( "checkIfTrailerIsOn", root, checkIfPlayerHasTrailer)

function sendCheckAme()
	triggerEvent('sendAme', client, "pārbaudītu smagā traileri.")
end
addEvent("searchIfIllegal", true)
addEventHandler("searchIfIllegal", root, sendCheckAme)

function deleteTrailer(trailer)
	destroyElement(trailer)
end
addEvent("deleteTrailer", true)
addEventHandler("deleteTrailer", root, deleteTrailer)