local isGUImade = false
local selectedRouteID = nil
local trailer, drivenVehicle, drivenVehicleID = nil
local getTrailerCP, deliverLoadCP, getTrailerBlip, deliverLoadBlip  = nil

loadstring(exports.dgs:dgsImportFunction())() -- Load DGS functions

function displayTruckerInfo() -- Exported function
	exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Lai uzsāktu darbu, tev ir nepieciešama smagā automašīna. Der vai nu RoadTrain vai Tanker smagais.")
end

function onTruckEnter(vehicle, seat)
	if (trucks[getElementModel(vehicle)] and getVehicleController(vehicle) == localPlayer) and seat == 0 then
		outputChatBox("Tu esi smagajā! Raksti /starttrucking, lai uzsāktu kravu vadāšanu!")
		outputChatBox("Tu jebkurā brīdī vari rakstīt /stoptruckingroute, lai beigtu iesākto maršrutu!")
		exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Raksti /starttrucking!")
	end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, onTruckEnter)

function startTrucking()
	drivenVehicle = getPedOccupiedVehicle(localPlayer)
	if drivenVehicle and getVehicleController(drivenVehicle) == localPlayer then
		drivenVehicleID = getElementModel(drivenVehicle)
		if (trucks[drivenVehicleID]) then
			if getTrailerCP or getTrailerblip then
				outputChatBox("Tu jau esi iesācis vest kravu, nevari pieņemt vēlvienu pasūtījumu!")
			elseif deliverLoadCP or deliverLoadBlip then
				outputChatBox("Tu jau esi iesācis vest kravu, pabeidz šobrīdejo, pirms uzsāc jaunu!")
			else
				createTruckingWindow()
			end
		else
			outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai uzsāktu tālbraucēja darbu!")
		end
	else
		outputChatBox("Tu neatrodies smagajā automašīnā vai arī to nevadi!")
	end
end
addCommandHandler("starttrucking", startTrucking, false)

function createTruckingWindow()
	if isGUImade == false then
		local px,py,pz = getElementPosition(localPlayer)
		local x = 0.25
		local y = 0.2
		local width = 0.5
		local height = 0.5

		truckingWindow = dgsCreateWindow(x, y, width, height, "Tālbraucēja izvēlne", true)
		dgsWindowSetCloseButtonEnabled(truckingWindow, false)

		truckingRouteWindow = dgsCreateGridList(0,0, 1, 0.83, true, truckingWindow)
		dgsGridListAddColumn(truckingRouteWindow, "ID", 0.03, nil, "left")
		dgsGridListAddColumn(truckingRouteWindow, "Kravas Saņemšana", 0.2, nil, "left")
		dgsGridListAddColumn(truckingRouteWindow, "Galapunkts", 0.2, nil, "left")
		dgsGridListAddColumn(truckingRouteWindow, "Uzkravāšanās punkts", 0.13, nil, "left")
		dgsGridListAddColumn(truckingRouteWindow, "Uzkravāšanās punkts -> Galamērķis", 0.23, nil, "left")
		dgsGridListAddColumn(truckingRouteWindow, "Iespējamā peļņa", 0.1, nil, "left")
		dgsGridListAddColumn(truckingRouteWindow, "Nelegāla krava", 0.1, nil, "left")

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
			dgsGridListAddRow(truckingRouteWindow,i, deliveryPoints[i][1], deliveryPoints[i][2], deliveryPoints[i][6],
			tostring(distanceToPickup) .. " Metri",
			tostring(distanceToDelivery) .. " Metri",
			"$" .. tostring(possiblePay),
			isIllegal)
		end

		x = 0.01
		y = 0.84
		width = 0.1
		height = 0.1
		closeTruckingMenuButton = dgsCreateButton(x, y, width, height, "Aizvērt", true, truckingWindow)
		addEventHandler("onDgsMouseClickUp", closeTruckingMenuButton, closeTruckingMenuOnExitButton, false)

		x = 0.79
		y = 0.84
		width = 0.2
		height = 0.1
		pickTruckingRouteButton = dgsCreateButton(x, y, width, height, "Izvēlēties maršrutu", true, truckingWindow)
		addEventHandler("onDgsMouseClickUp", pickTruckingRouteButton, getSelectedRoute, false)
		showCursor(true)

		isGUImade = true
	end
end

function getSelectedRoute()
	local selectedRouteInfo = dgsGridListGetSelectedItems (truckingRouteWindow)
	if #selectedRouteInfo == 7 then
		selectedRouteID = dgsGridListGetItemText(truckingRouteWindow, selectedRouteInfo[1]["row"], 1)
		getTrailerCP = createMarker(deliveryPoints[tonumber(selectedRouteID)][3], deliveryPoints[tonumber(selectedRouteID)][4], deliveryPoints[tonumber(selectedRouteID)][5], "checkpoint", 4, 255, 200, 0, 150) -- Saņemt kravu checkpoints.
		addEventHandler("onClientMarkerHit", getTrailerCP, makeTrailer)
		getTrailerBlip = exports.customblips:createCustomBlip(deliveryPoints[tonumber(selectedRouteID)][3], deliveryPoints[tonumber(selectedRouteID)][4], 20, 20, "blips/trucking-blip.png", 9999)
		exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Kravas atrašanās vieta atzīmēta kartē ar smagās automašīnas ikonu!")
		dgsCloseWindow(truckingWindow)
		showCursor(false)
		isGUImade = false
	else
		outputChatBox("Tu neesi izvēlējies tālbraucēju maršrutu! Vispirms izvēlies vienu, tad meiģini vēlreiz.")
	end
end

function makeTrailer(thePlayer)
	if thePlayer == getLocalPlayer() then
		drivenVehicle = getPedOccupiedVehicle(localPlayer)
		if drivenVehicle and getVehicleController(drivenVehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
			drivenVehicleID = getElementModel(drivenVehicle)
			if (trucks[drivenVehicleID]) then
				destroyElement(getTrailerCP)
				exports.customblips:destroyCustomBlip(getTrailerBlip)
				getTrailerCP = nil
				getTrailerBlip = nil
				triggerServerEvent("spawnTrailerForTruckDriver", localPlayer, drivenVehicle, selectedRouteID)
				deliverLoadCP = createMarker(deliveryPoints[tonumber(selectedRouteID)][7], deliveryPoints[tonumber(selectedRouteID)][8], deliveryPoints[tonumber(selectedRouteID)][9], "checkpoint", 4, 255, 0, 0, 150)
				addEventHandler("onClientMarkerHit", deliverLoadCP, deliverTrailer)
				deliverLoadBlip = exports.customblips:createCustomBlip(deliveryPoints[tonumber(selectedRouteID)][7], deliveryPoints[tonumber(selectedRouteID)][8], 20, 20, "blips/trucking-blip.png", 9999)
				exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Vezuma galapunkts kartē atzīmēts ar smagās automašīnas ikonu!")
				outputChatBox("[Tālbraucēja darbs] Ja krava netiks aizvesta "..tostring(timeTillTrailerGetsDeleted/1000/60) .. " minūtēs, tā tiks automātiski izdzēsta!")
			else
				outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai saņemtu kravu!")
			end
		else
			outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai saņemtu kravu!")
		end
	end
end

function deliverTrailer(thePlayer)
	drivenVehicle = getPedOccupiedVehicle(thePlayer)
	if drivenVehicle and getVehicleController(drivenVehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
		drivenVehicleID = getElementModel(drivenVehicle)
		if (trucks[drivenVehicleID]) then
			if getVehicleTowedByVehicle(drivenVehicle) == trailer then
				triggerServerEvent("checkIfTrailerIsOn", localPlayer, drivenVehicle, trailer, tonumber(selectedRouteID))
				if getElementData(drivenVehicle, "solidtrucking:illegal") == true then
					setElementData(drivenVehicle, "solidtrucking:illegal", false)
				end
				destroyElement(deliverLoadCP)
				destroyElement(trailer)
				exports.customblips:destroyCustomBlip(deliverLoadBlip)
				trailer = nil
				deliverLoadCP = nil
				deliverLoadBlip = nil
				outputChatBox("Veiksmīgi aizvedi kravu! Lai uzsāktu jaunu ceļojumu, raksti /starttrucking.")
				exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Veiksmīgi piegādāji kravu!")
			else
				outputChatBox("Tev nav pieāķēta krava, vai arī tas nav tavs traileris!")
			end
		else
			outputChatBox("Tu nebrauc ar tālbraucēju auto!")
		end
	else
		outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai saņemtu kravu!")
	end
end

function setTrailerVar(trailerToSet)
	trailer = trailerToSet
end
addEvent("setTrailerVar", true)
addEventHandler("setTrailerVar", localPlayer, setTrailerVar)


function checkIfTrailerIllegal()
	if exports.factions:isPlayerInFaction(getLocalPlayer(), policeFactionID) then
		local heavyTruck = getNearestVehicle(getLocalPlayer(),10)
		if heavyTruck then
			if trucks[getElementModel(heavyTruck)] then
				triggerServerEvent("searchIfIllegal", localPlayer)
				if getElementData(heavyTruck, "solidtrucking:illegal") == true then
					local illegalLoad = getElementData(heavyTruck, "solidtrucking:illegalload")
					outputChatBox("Pēc trailera pārmeklēšanas, atrastu: ".. illegalLoad)
				else
					outputChatBox("Pēc trailera pārmeklēšanas, neko nelegālu neatrastu.")
				end
			else
				outputChatBox("Tuvākais transports nav traileris. Vari pameiģināt pieiet klāt savādāk.")
			end
		end
	else
		outputChatBox("Tu nestrādā policijā!")
	end
end
addCommandHandler("searchtrailer", checkIfTrailerIllegal, false)

function stopTruckingRoute()
	if getTrailerCP and getTrailerblip then
		destroyElement(getTrailerCP)
		exports.customblips:destroyCustomBlip(getTrailerblip)
		getTrailerCP = nil
		getTrailerBlip = nil
		triggerServerEvent("deleteTrailer",localPlayer, trailer)
		trailer = nil
	elseif deliverLoadCP and deliverLoadBlip then
		destroyElement(deliverLoadCP)
		exports.customblips:destroyCustomBlip(deliverLoadBlip)
		deliverLoadCP = nil
		deliverLoadBlip = nil
		triggerServerEvent("deleteTrailer",localPlayer, trailer)
		trailer = nil
	end
end
addCommandHandler("stoptruckingroute", stopTruckingRoute, true)

function closeTruckingMenuOnExitButton(button, state)
	if button == "left" and state == "up" then
		if truckingWindow then
			dgsCloseWindow(truckingWindow)
			showCursor(false)
			isGUImade = false
		end
	end
end

function getNearestVehicle(player,distance)
	local lastMinDis = distance-0.0001
	local nearestVeh = false
	local px,py,pz = getElementPosition(player)
	local pint = getElementInterior(player)
	local pdim = getElementDimension(player)

	for _,v in pairs(getElementsByType("vehicle")) do
		local vint,vdim = getElementInterior(v),getElementDimension(v)
		if vint == pint and vdim == pdim then
			local vx,vy,vz = getElementPosition(v)
			local dis = getDistanceBetweenPoints3D(px,py,pz,vx,vy,vz)
			if dis < distance then
				if dis < lastMinDis then 
					lastMinDis = dis
					nearestVeh = v
				end
			end
		end
	end
	return nearestVeh
end

function getPlayersByData(dataName)
    if dataName and type(dataName) == "string" then
	local playersTable = {}
	for i,v in ipairs(getElementsByType("player")) do
	    if getElementData(v, dataName) then
                table.insert(playersTable, v)
	    end
	end
	if #playersTable == 0 then
	    return false
	end
	return playersTable
    else
        return false
    end
end