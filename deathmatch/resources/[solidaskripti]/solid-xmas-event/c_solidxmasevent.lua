local xmasVehicleDeliveryBlip, xmasVehicleDeliveryMarker = nil
local xmasVehicle = nil

function setXmasVehicle(vehicleToSet)
	xmasVehicle = vehicleToSet
end
addEvent("setXmasVehicle", true)
addEventHandler("setXmasVehicle", getLocalPlayer(), setXmasVehicle)

function onXmasVehicleEnter(thePlayer, seat)
	if thePlayer == getLocalPlayer() then
		local playerVehicle = getPedOccupiedVehicle(localPlayer)
		if playerVehicle == xmasVehicle then
			outputChatBox("Tu esi atradis vienu no Gopņik' vecīša kaujas ratiem! Aizved to pie Pershing Square eglītes un iegūsti punktu!",204, 0, 0)
			xmasVehicleDeliveryMarker = createMarker(xmasDeliverX, xmasDeliverY, xmasDeliverZ, "checkpoint", 4, 255, 255, 255)
			addEventHandler("onClientMarkerHit", xmasVehicleDeliveryMarker, xmasVehicleMarkerHit)
			xmasVehicleDeliveryBlip = exports.customblips:createCustomBlip(xmasDeliverX, xmasDeliverY, 20, 20, "blips/christmastree.png", 9999)
		end
	end
end
addEventHandler("onClientVehicleEnter", root, onXmasVehicleEnter)

function xmasVehicleMarkerHit(thePlayer)
	if thePlayer == getLocalPlayer() then
		local playerVehicle = getPedOccupiedVehicle(localPlayer)
		if playerVehicle == xmasVehicle then
			triggerServerEvent("onXmasVehicleDelivery", resourceRoot, getElementData(thePlayer,"dbid"), getElementData(thePlayer,"account:id"))
			if xmasVehicleDeliveryMarker and xmasVehicleDeliveryBlip then
				destroyElement(xmasVehicleDeliveryMarker)
				exports.customblips:destroyCustomBlip(xmasVehicleDeliveryBlip)
				xmasvehicle = nil
			end
		end
	end
end

function checkLastLocation()
	triggerServerEvent("onCheckLastLocation", resourceRoot)
end
addCommandHandler("santacar", checkLastLocation, false)