local isGUImade = false
local selectedRouteID = nil
local trailer, drivenVehicle, drivenVehicleID = nil
local getTrailerCP, deliverLoadCP, getTrailerBlip, deliverLoadBlip  = nil

function displayTruckerInfo() -- Exported function
	exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Lai uzsāktu darbu, tev ir nepieciešama smagā automašīna. Der vai nu RoadTrain vai Tanker smagais.")
end

function onTruckEnter(thePlayer, seat)
	if (thePlayer == getLocalPlayer()) and (trucks[getElementModel(getPedOccupiedVehicle(thePlayer))] and getVehicleController(getPedOccupiedVehicle(localPlayer)) == localPlayer) and seat == 0 then
		outputChatBox("Tu esi smagajā! Raksti /starttrucking, lai uzsāktu kravu vadāšanu!")
		outputChatBox("Tu jebkurā brīdī vari rakstīt /stoptruckingroute, lai beigtu iesākto maršrutu!")
		exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Raksti /starttrucking!")
	end
end
addEventHandler("onClientVehicleEnter", root, onTruckEnter)

function startTrucking()
	local job = getElementData(getLocalPlayer(), "job")
	if job == 7 then
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
	else
		outputChatBox("Tu nestrādā, kā tālbraucējs! Dodies uz domi, lai pieteiktos darbā pa tālbraucēju!")
	end
end
addCommandHandler("starttrucking", startTrucking, false)

function createTruckingWindow()
	if isGUImade == false then
		local px,py,pz = getElementPosition(localPlayer)
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
		selectedRouteID = guiGridListGetItemText(truckingRouteWindow, selectedRouteInfo[1]["row"], 1)
		getTrailerCP = createMarker(deliveryPoints[tonumber(selectedRouteID)][3], deliveryPoints[tonumber(selectedRouteID)][4], deliveryPoints[tonumber(selectedRouteID)][5], "checkpoint", 4, 255, 200, 0, 150) -- Saņemt kravu checkpoints.
		addEventHandler("onClientMarkerHit", getTrailerCP, makeTrailer)
		getTrailerBlip = createBlip(deliveryPoints[tonumber(selectedRouteID)][3], deliveryPoints[tonumber(selectedRouteID)][4], deliveryPoints[tonumber(selectedRouteID)][5], 42, 4, 255, 255 ,255)
		exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Kravas atrašanās vieta atzīmēta kartē ar T burtu!")
		destroyElement(truckingWindow)
		showCursor(false)
		isGUImade = false
	else
		outputChatBox("Tu neesi izvēlējies tālbraucēju maršrutu! Vispirms izvēlies vienu, tad meiģini vēlreiz.")
	end
end

function makeTrailer(thePlayer)
	local job = getElementData(getLocalPlayer(), "job")
	if job == 7 then
		if thePlayer == getLocalPlayer() then
			drivenVehicle = getPedOccupiedVehicle(localPlayer)
			if drivenVehicle and getVehicleController(drivenVehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
				drivenVehicleID = getElementModel(drivenVehicle)
				if (trucks[drivenVehicleID]) then
					destroyElement(getTrailerCP)
					destroyElement(getTrailerBlip)
					getTrailerCP = nil
					getTrailerBlip = nil
					triggerServerEvent("spawnTrailerForTruckDriver", resourceRoot, drivenVehicle, selectedRouteID)
					deliverLoadCP = createMarker(deliveryPoints[tonumber(selectedRouteID)][7], deliveryPoints[tonumber(selectedRouteID)][8], deliveryPoints[tonumber(selectedRouteID)][9], "checkpoint", 4, 255, 0, 0, 150)
					addEventHandler("onClientMarkerHit", deliverLoadCP, deliverTrailer)
					deliverLoadBlip = createBlip(deliveryPoints[tonumber(selectedRouteID)][7], deliveryPoints[tonumber(selectedRouteID)][8], deliveryPoints[tonumber(selectedRouteID)][9], 42, 4, 255, 255 ,255)
					exports.hud:sendBottomNotification(localPlayer, "Tālbraucējs", "Vezuma galapunkts kartē atzīmēts ar T burtu, gāzē uz to!")
					outputChatBox("[Tālbraucēja darbs] Ja krava netiks aizvesta "..tostring(timeTillTrailerGetsDeleted/1000/60) .. " minūtēs, tā tiks automātiski izdzēsta!")
				else
					outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai saņemtu kravu!")
				end
			else
				outputChatBox("Tev vajag atrasties iekš smagās automašīnas, lai saņemtu kravu!")
			end
		end
	else
		outputChatBox("Tu nestrādā, kā tālbraucējs! Dodies uz domi, lai pieteiktos darbā pa tālbraucēju!")
	end
end

function deliverTrailer(thePlayer)
	if thePlayer == getLocalPlayer() then
		local job = getElementData(getLocalPlayer(), "job")
		if job == 7 then
			drivenVehicle = getPedOccupiedVehicle(thePlayer)
			if drivenVehicle and getVehicleController(drivenVehicle) == localPlayer and getPedOccupiedVehicleSeat(localPlayer) == 0 then
				drivenVehicleID = getElementModel(drivenVehicle)
				if (trucks[drivenVehicleID]) then
					if getVehicleTowedByVehicle(drivenVehicle) == trailer then
						triggerServerEvent("checkIfTrailerIsOn", resourceRoot, drivenVehicle, trailer, tonumber(selectedRouteID))
						if getElementData(drivenVehicle, "solidtrucking:illegal") == true then
							setElementData(drivenVehicle, "solidtrucking:illegal", false)
						end
						destroyElement(deliverLoadCP)
						destroyElement(trailer)
						destroyElement(deliverLoadBlip)
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
		else
			outputChatBox("Tu nestrādā, kā tālbraucējs! Dodies uz domi, lai pieteiktos darbā pa tālbraucēju!")
		end
	end
end

function setTrailerVar(trailerToSet)
	trailer = trailerToSet
end
addEvent("setTrailerVar", true)
addEventHandler("setTrailerVar", getLocalPlayer(), setTrailerVar)


function checkIfTrailerIllegal()
	if exports.factions:isPlayerInFaction(getLocalPlayer(), 1) then
		local heavyTruck = getNearestVehicle(getLocalPlayer(),10)
		if heavyTruck then
			if trucks[getElementModel(heavyTruck)] then
				triggerServerEvent("searchIfIllegal", resourceRoot)
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
	local job = getElementData(getLocalPlayer(), "job")
	if job == 7 then
		if getTrailerCP and getTrailerblip then
			destroyElement(getTrailerCP)
			destroyElement(getTrailerBlip)
			getTrailerCP = nil
			getTrailerBlip = nil
			triggerServerEvent("deleteTrailer",resourceRoot, trailer)
			trailer = nil
		elseif deliverLoadCP and deliverLoadBlip then
			destroyElement(deliverLoadCP)
			destroyElement(deliverLoadBlip)
			deliverLoadCP = nil
			deliverLoadBlip = nil
			triggerServerEvent("deleteTrailer",resourceRoot, trailer)
			trailer = nil
		end
	else
		outputChatBox("Tu neesi tālbraucējs, tāpēc nevari apstādināt maršrutu!")
	end
end
addCommandHandler("stoptruckingroute", stopTruckingRoute, false)

function closeTruckingMenuOnExitButton(button, state)
	if button == "left" and state == "up" then
		if truckingWindow then
			destroyElement(truckingWindow)
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