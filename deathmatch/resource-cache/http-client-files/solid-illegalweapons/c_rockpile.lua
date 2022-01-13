local infoSymbol = nil
local isGUImade = false
local rockWindow = nil

loadstring(exports.dgs:dgsImportFunction())()-- loading in DGS functions

function stuffForClientStart() -- Creates I pickup symbol on client side resource start.
	infoSymbol = createPickup( infoSymbolSpawnLocation[1], infoSymbolSpawnLocation[2], infoSymbolSpawnLocation[3], 3, 1239)
	addEventHandler("onClientPickupHit", infoSymbol, hitInfoPickup)
end
addEventHandler("onClientResourceStart", root, stuffForClientStart)

function hitInfoPickup(thePlayer) -- Window when entering I pickup.
	if thePlayer == localPlayer then
		if not isPedInVehicle(thePlayer) then
			if not isGUImade then
				showCursor(true)
				local x = 0.35
				local y = 0.35
				local width = 0.3
				local height = 0.3

				rockWindow = dgsCreateWindow(x, y, width, height, "Unprocessed metal menu", true)
				dgsWindowSetCloseButtonEnabled(rockWindow, false)

				x = 0.02
				y = 0.12
				width = 1
				height = 0.2
				dgsCreateLabel(x,y,width,height, "Here, illegal organizations can buy metal by giving the worker a bribe.", true, rockWindow)

				x = 0.02
				y = 0.20
				width = 1
				height = 0.2
				dgsCreateLabel(x,y,width,height, "Price per Kg: $"..tostring(costPerKg), true, rockWindow)

				if allowedToBuy then
					x = 0.02
					y = 0.38
					width = 1
					height = 0.2
					local infoLabel = dgsCreateLabel(x,y,width,height, "The quarry worker will sell you rocks now, just give him a bribe!", true, rockWindow)
					dgsLabelSetColor(infoLabel, 0, 255, 0,255)
				else
					x = 0.02
					y = 0.38
					width = 1
					height = 0.2
					local infoLabel = dgsCreateLabel(x,y,width,height, "The quarry worker isn't ready to sell you any rocks.", true, rockWindow)
					dgsLabelSetColor(infoLabel, 255, 0, 0,255)
				end

				x = 0.35
				y = 0.6
				width = 0.3
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/285.png", true, rockWindow)

				x = 0.78
				y = 0.7
				width = 0.2
				height = 0.2
				local buyRocksButton = dgsCreateButton(x, y, width, height, "Buy unprocessed metal", true, rockWindow)
				addEventHandler("onDgsMouseClickUp", buyRocksButton, buyRocksClient, false)

				x = 0.02
				y = 0.7
				width = 0.2
				height = 0.2
				local closeRockMenuButton = dgsCreateButton(x, y, width, height, "Close", true, rockWindow)
				addEventHandler("onDgsMouseClickUp", closeRockMenuButton, closeRockmenuOnExitButton, false)

				isGUImade = true
			end
		else
			outputChatBox("You can't be in a car to open this menu!")
		end
	end
end

function buyRocksClient(button, state) -- Buy button function.
	if button == "left" and state == "up" then
		if allowedToBuy then
			local playerFaction = getElementData(localPlayer, "faction")
			if exports.factions:isInFactionType(localPlayer, 0) or exports.factions:isInFactionType(localPlayer, 1) then -- Need to be in Gang or Mafia type faction to use.
				triggerServerEvent("giveClientRockAndTakeMoney", localPlayer) -- Server side event to take money and give the player the items. :)
			else
				outputChatBox("You're not in a illegal organization.")
			end
		else
			outputChatBox("The quarry worker isn't ready to sell you anything. He'll get caught!")
		end
	end
end

function closeRockmenuOnExitButton(button, state) -- Close button.
	if button == "left" and state == "up" then
		if rockWindow then
			dgsCloseWindow(rockWindow)
			showCursor(false)
			isGUImade = false
		end
	end
end

function updateAllowedToBuy(bool) -- Client side update so the menu allows them to buy items when it's turned on.
	allowedToBuy = bool
end
addEvent("allowedToBuyUpdate", true)
addEventHandler("allowedToBuyUpdate", resourceRoot, updateAllowedToBuy)