local dozer = nil
local pickedRock = nil
local pickedRockMarker, pickedRockBlip = nil
local pickedDeliveryRoute = nil
local deliverRockMarker, deliverRockBlip = nil

function onDozerEnter(vehicle, seat)
	if getElementModel(vehicle) == dozerID and getVehicleController(vehicle) == source and seat == 0 then
		outputChatBox("You got into a bulldozer! Write /startdozer, to start collecting rocks!")
		outputChatBox("To stop working, write /stopdozer")
		exports.hud:sendBottomNotification(localPlayer, "Rock collecting", "Write /startdozer!")
	end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, onDozerEnter)


function startDozerWork()
	dozer = getPedOccupiedVehicle(localPlayer)
	if dozer and getVehicleController(dozer) == localPlayer then
		if getElementModel(dozer) == dozerID then
			if pickedRockMarker or pickedRockBlip or deliverRockBlip or deliverRockMarker then
				outputChatBox("You've already started working!")
			else
				triggerServerEvent("chooseRockForPlayer", localPlayer)
			end
		else
			outputChatBox("You need to be in a bulldozer to start working as a rock collector.")
		end
	else
		outputChatBox("You're not in a bulldozer or aren't driving one.")
	end
end
addCommandHandler("startdozer", startDozerWork, false)

function stopDozer()
	if pickedRockMarker or pickedRockBlip or deliverRockMarker or deliverRockBlip or pickedRock or pickedDeliveryRoute then
		if pickedRockMarker or pickedRockBlip then
			destroyElement(pickedRockMarker)
			destroyElement(pickedRockBlip)
			pickedRockMarker = nil
			pickedRockBlip = nil
			pickedRock = nil
		elseif deliverRockMarker or deliverRockBlip or pickedDeliveryRoute then
			triggerServerEvent("deleteRock", localPlayer, pickedRock)
			setElementData(dozer, "rockcollecting:hasrock", false)
			destroyElement(deliverRockMarker)
			destroyElement(deliverRockBlip)
			deliverRockBlip = nil
			deliverRockMarker = nil
			pickedRock = nil
			pickedDeliveryRoute = nil
		end
	end
end
addCommandHandler("stopdozer", stopDozer, false)

function setPickedRockForClient(rock)
	pickedRock = rock
	pickedRockMarker = createMarker(rockCoords[pickedRock][2],rockCoords[pickedRock][3],rockCoords[pickedRock][4], "checkpoint", 7, 255, 0, 0, 255)
	addEventHandler("onClientMarkerHit", pickedRockMarker, addRockToDozer)
	pickedRockBlip = createBlip(rockCoords[pickedRock][2],rockCoords[pickedRock][3],rockCoords[pickedRock][4], 0, 4, 255, 0, 0, 255, 10)
end
addEvent("setClientPickedRock", true)
addEventHandler("setClientPickedRock", localPlayer, setPickedRockForClient)

function addRockToDozer(hitPlayer)
	if hitPlayer == localPlayer then
		local drivenVehicle = getPedOccupiedVehicle(hitPlayer)
		if getElementModel(drivenVehicle) == dozerID then
			if drivenVehicle == dozer then
				triggerServerEvent("serverAddRockToDozer", localPlayer, pickedRock, dozer)
				setElementData(dozer, "rockcollecting:hasrock", true)
				destroyElement(pickedRockMarker)
				pickedRockMarker = nil
				destroyElement(pickedRockBlip)
				pickedRockBlip = nil
				pickedDeliveryRoute = math.random(1,2)
				deliverRockMarker = createMarker(deliveryPoints[pickedDeliveryRoute][1],deliveryPoints[pickedDeliveryRoute][2],deliveryPoints[pickedDeliveryRoute][3],"checkpoint", 4, 255, 0, 0, 255)
				addEventHandler("onClientMarkerHit", deliverRockMarker, deliverRock)
				deliverRockBlip = createBlip(deliveryPoints[pickedDeliveryRoute][1],deliveryPoints[pickedDeliveryRoute][2],deliveryPoints[pickedDeliveryRoute][3], 0, 4, 255, 0, 0, 255, 10)
			else
				outputChatBox("You need to be in a bulldozer to start working as a rock collector.")
			end
		else
			outputChatBox("You're not in a bulldozer or aren't driving one.")
		end
	end
end

function deliverRock(hitPlayer)
	if hitPlayer == localPlayer then
		local drivenVehicle = getPedOccupiedVehicle(hitPlayer)
		if getElementModel(drivenVehicle) == dozerID then
			if drivenVehicle == dozer then
				if getElementData(dozer, "rockcollecting:hasrock") == true then
					triggerServerEvent("serverDeliverRock", localPlayer, pickedRock)
					setElementData(dozer, "rockcollecting:hasrock", false)
					destroyElement(deliverRockMarker)
					deliverRockMarker = nil
					destroyElement(deliverRockBlip)
					deliverRockBlip = nil
					pickedDeliveryRoute = nil
					pickedRock = nil
				else
					outputChatBox("You don't have a rock to deliver!")
				end
			else
				outputChatBox("You have to be in the bulldozer you started to work with!")
			end
		else
			outputChatBox("You're not in a bulldozer!")
		end
	end
end