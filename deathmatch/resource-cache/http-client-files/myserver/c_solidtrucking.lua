local isGUImade = false
local selectedRouteID = nil
local trailer, drivenVehicle, drivenVehicleID = nil
local getTrailerCP, deliverLoadCP = nil

function onTruckEnter(thePlayer, seat)
	if (trucks[getElementModel(getPedOccupiedVehicle(thePlayer))]) then
		outputChatBox("Tu esi smagaja! Raksti /starttrucking, lai uzsāktu kravu vadāšanu!")
	end
end
addEventHandler("onClientVehicleEnter", root, onTruckEnter)

function startTrucking()
	drivenVehicle = getPedOccupiedVehicle(localPlayer)
	drivenVehicleID = getElementModel(drivenVehicle) -- TODO Jāpievieno checks pa domes darbu un error atbildes
	if drivenVehicle and getVehicleController(drivenVehicle) == localPlayer then
		if (trucks[drivenVehicleID]) then
			createTruckingWindow()
		else
			outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai uzsāktu tālbraucēja darbu!")
		end
	end
end
addCommandHandler("starttrucking", startTrucking, false)

function createTruckingWindow()
	if isGUImade == false then
		local px,py,pz = getElementPosition(localPlayer)
		outputChatBox("-"..tostring(px).."-"..tostring(py).."-"..tostring(pz).."-")
		local x = 0.25
		local y = 0.3
		local width = 0.5
		local height = 0.5

		truckingWindow = guiCreateWindow(x, y, width, height, "Tālbraucēja izvēlne", true)

		truckingRouteWindow = guiCreateGridList(0,0.05, 1, 0.8, true, truckingWindow)
		guiGridListAddColumn(truckingRouteWindow, "ID", 0.03)
		guiGridListAddColumn(truckingRouteWindow, "Kravas Saņemšana", 0.13)
		guiGridListAddColumn(truckingRouteWindow, "Galapunkts", 0.13)
		guiGridListAddColumn(truckingRouteWindow, "Distance līdz uzkravāšanās punktam", 0.2)
		guiGridListAddColumn(truckingRouteWindow, "Distance no uzkravāšanās līdz galamērķim", 0.2)
		guiGridListAddColumn(truckingRouteWindow, "Iespējamā peļņa", 0.2)
		guiGridListAddColumn(truckingRouteWindow, "Nelegāla krava", 0.1)

		for i = 1, #deliveryPoints, 1 do
			local possiblePay = nil
			local isIllegal = nil
			local distanceToPickup = math.floor(getDistanceBetweenPoints3D(px,py,pz,deliveryPoints[i][3],deliveryPoints[i][4],deliveryPoints[i][5]))
			local distanceToDelivery = math.floor(getDistanceBetweenPoints3D(deliveryPoints[i][3],deliveryPoints[i][4],deliveryPoints[i][5],deliveryPoints[i][7],deliveryPoints[i][8],deliveryPoints[i][9]))
			if deliveryPoints[i][10] == true then
				possiblePay = distanceToDelivery * payPerMeter + (distanceToDelivery * payPerMeter)*illegalBonus/100
				isIllegal = "Jā"
			else
				possiblePay = distanceToDelivery * payPerMeter
				isIllegal = "Nē"
			end
			guiGridListAddRow(truckingRouteWindow, deliveryPoints[i][1], deliveryPoints[i][2], deliveryPoints[i][6],
			tostring(distanceToPickup) .. " Metri",
			tostring(distanceToDelivery) .. " Metri",
			"$" .. tostring(possiblePay),
			isIllegal)
		end

		x = 0.01
		y = 0.875
		width = 0.1
		height = 0.1
		closeTruckingMenuButton = guiCreateButton(x, y, width, height, "Aizvērt", true, truckingWindow)
		addEventHandler("onClientGUIClick", closeTruckingMenuButton, closeTruckingMenuOnExitButton, false)

		x = 0.85
		y = 0.875
		width = 0.2
		height = 0.1
		pickTruckingRouteButton = guiCreateButton(x, y, width, height, "Izvēlēties maršrutu", true, truckingWindow)
		addEventHandler("onClientGUIClick", pickTruckingRouteButton, getSelectedRoute, false)
		showCursor(true)

		isGUImade = true
	end
end

function getSelectedRoute()
	local selectedRouteInfo = guiGridListGetSelectedItems(truckingRouteWindow)
	if #selectedRouteInfo == 7 then
		outputChatBox(guiGridListGetItemText(truckingRouteWindow, selectedRouteInfo[1]["row"], 1)) -- TODO Beigās noņemt
		selectedRouteID = guiGridListGetItemText(truckingRouteWindow, selectedRouteInfo[1]["row"], 1)

		getTrailerCP = createMarker(deliveryPoints[tonumber(selectedRouteID)][3], deliveryPoints[tonumber(selectedRouteID)][4], deliveryPoints[tonumber(selectedRouteID)][5], "checkpoint", 4, 255, 200, 0, 150) -- Saņemt kravu checkpoints.
		addEventHandler("onClientMarkerHit", getTrailerCP, makeTrailer)

		destroyElement(truckingWindow)
		showCursor(false)
		isGUImade = false
	else
		outputChatBox("Tu neesi izvēlējies tālbraucēju maršrutu! Vispirms izvēlies vienu, tad meiģini vēlreiz.")
	end
end

function makeTrailer(thePlayer)
	drivenVehicle = getPedOccupiedVehicle(localPlayer)
	drivenVehicleID = getElementModel(drivenVehicle) -- TODO Jāpievieno checks pa domes darbu un error atbildes
	if drivenVehicle and getVehicleController(drivenVehicle) == thePlayer then
		if (trucks[drivenVehicleID]) then
			destroyElement(getTrailerCP)
			local trailers = {584,435,450,591}
			local trailerToSpawn = trailers[math.random(1,4)]
			local prx, pry, prz = getElementRotation(thePlayer)
			local px,py,pz = getElementPosition(thePlayer)
			local trailerSpawnLocation = {px,py,pz+50}
			trailer = createVehicle(trailerToSpawn, trailerSpawnLocation[1], trailerSpawnLocation[2], trailerSpawnLocation[3], prx, pry, prz, "Trucker")
			attachTrailerToVehicle(drivenVehicle, trailer)
			deliverLoadCP = createMarker(deliveryPoints[tonumber(selectedRouteID)][7], deliveryPoints[tonumber(selectedRouteID)][8], deliveryPoints[tonumber(selectedRouteID)][9], "checkpoint", 4, 255, 200, 0, 150)
			addEventHandler("onClientMarkerHit", deliverLoadCP, deliverTrailer)
		end
	end
end

function deliverTrailer(thePlayer)
	drivenVehicle = getPedOccupiedVehicle(localPlayer)
	drivenVehicleID = getElementModel(drivenVehicle) -- TODO Jāpievieno checks pa domes darbu un error atbildes
	if drivenVehicle and getVehicleController(drivenVehicle) == thePlayer then
		if (trucks[drivenVehicleID]) then
			if (getVehicleTowedByVehicle(drivenVehicle) == trailer) then
				detachTrailerFromVehicle(drivenVehicle, trailer)
				destroyElement(trailer)
				trailer = nil
				triggerServerEvent("calculatePay", resourceRoot, tonumber(selectedRouteID))
				destroyElement(deliverLoadCP)
			end
		end
	end
end

function closeTruckingMenuOnExitButton(button, state)
	if button == "left" and state == "up" then
		if truckingWindow then
			destroyElement(truckingWindow)
			showCursor(false)
			isGUImade = false
		end
	end
end