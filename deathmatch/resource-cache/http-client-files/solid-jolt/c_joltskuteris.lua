loadstring(exports.dgs:dgsImportFunction())() -- loading DGS

local isGUImade = false
local joltWindow = nil
local joltimg = nil

local function enterJolt(theVehicle)
	if getElementModel(theVehicle) == scooterModelID then
		if getElementData(theVehicle,"owner") == -2 then
			outputChatBox("This is a Jolt rentable scooter!")
			outputChatBox("Write /jolt to find out more about renting a scooter!")
		end
		if getElementData(theVehicle,"solidJolt:rented") == false then
			triggerServerEvent("stopRentJoltEngine", localPlayer, theVehicle)

			function playerPressedKey(button, press)
			    if (press) then 
			        if button == "j" then 
			            cancelEvent()
			        end
			    end
			end
			addEventHandler("onClientKey", root, playerPressedKey)

		end
	end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterJolt)

function disableEngineAfterRent()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle and getElementModel(vehicle) == scooterModelID then
		function playerPressedKey(button, press)
		    if (press) then 
		        if button == "j" then 
		            cancelEvent()
		        end
		    end
		end
		addEventHandler("onClientKey", root, playerPressedKey)
	end
end
addEvent("disableEngineAfterRent", true)
addEventHandler("disableEngineAfterRent", localPlayer, disableEngineAfterRent)

function exitJolt(theVehicle)
	if getElementModel(theVehicle) == scooterModelID then
		removeEventHandler("onClientKey", root, playerPressedKey)
	end
end
addEventHandler("onClientPlayerVehicleExit", localPlayer, exitJolt)

function joltMenu()
	local scooter = getPedOccupiedVehicle(localPlayer)
	if scooter and getElementModel(scooter) == scooterModelID then
		if getElementData(scooter, "owner") == -2 then
			if not isGUImade then
				isGUImade = true
				local isRented = getElementData(scooter, "solidJolt:rented")

				joltWindow = dgsCreateWindow(0.4,0.4,0.2,0.4,"", true, 0, 0) -- Add background image stuff
				dgsWindowSetCloseButtonEnabled(joltWindow, false)

				joltimg = dgsCreateImage(0.34,0.174,0.3,0.3, "images/jolt.png", true)
				dgsSetProperty(joltimg,"changeOrder", false)

				dgsCreateLabel(0, 0.2, 1, 0.1, "Rent Time: "..tostring(rentTime/1000).." minutes.", true, joltWindow, 0xFFFFFFFF, 2, 2, nil, nil, nil, "center")
				dgsCreateLabel(0, 0.3, 1, 0.1, "Rent price: $"..tostring(rentCost), true, joltWindow, 0xFFFFFFFF, 2, 2, nil, nil, nil, "center")

				if isRented then
					dgsCreateImage(0,0.6,1,0.13, "images/izirets.png", true, joltWindow)
				else
					dgsCreateImage(0,0.6,1,0.13, "images/navizirets.png", true, joltWindow)
				end

				local rentButton = dgsCreateButton(0.02,0.77,0.96,0.1,"Rent", true, joltWindow)
				addEventHandler("onDgsMouseClickUp", rentButton, function() triggerServerEvent("rentJolt", localPlayer, scooter) removeEventHandler("onClientKey", root, playerPressedKey) windowClosed() end, false)
			
				local closeButton = dgsCreateButton(0.02,0.88,0.96,0.1,"Close", true, joltWindow)
				addEventHandler("onDgsMouseClickUp", closeButton, function() dgsCloseWindow(joltWindow) destroyElement(joltimg) joltWindow = nil isGUImade = false end, false)
			end
		else
			outputChatBox("You're not sitting in a Jolt scooter!")
		end
	else
		outputChatBox("You're not sitting in a Jolt scooter!")
	end
end
addCommandHandler("jolt", joltMenu, true)

function windowClosed()
	dgsCloseWindow(joltWindow)
	destroyElement(joltimg)
	joltimg = nil
	joltWindow = nil
	isGUImade = false
end