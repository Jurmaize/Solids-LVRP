function rentJolt(scooter)
	local playerScooter = getPedOccupiedVehicle(client)
	if playerScooter and getElementModel(playerScooter) == scooterModelID and playerScooter == scooter then
		if exports.global:hasMoney(client, rentCost) then
			exports.global:takeMoney(client, rentCost)
			setElementData(playerScooter, "solidJolt:rented", true)
			setTimer(stopRent, rentTime, 1, playerScooter, client)
		else
			outputChatBox("Tev nepietiek naudas, lai izīrētu šo skūteri!", client)
		end
	end
end
addEvent("rentJolt", true)
addEventHandler("rentJolt", root, rentJolt)

function stopRent(scooter, playerWhoRented)
	triggerEvent("vehicle:engine:stop", root, scooter)
	triggerClientEvent(playerWhoRented, "disableEngineAfterRent",playerWhoRented)
	setElementData(scooter, "solidJolt:rented", false)
	outputChatBox("Tavam īrētajam skūterim ir beidzies laiks!", playerWhoRented)
end

function stopRentJoltEngine(scooter)
	triggerEvent("vehicle:engine:stop", root, scooter)
end
addEvent("stopRentJoltEngine", true)
addEventHandler("stopRentJoltEngine", root, stopRentJoltEngine)