local milisecondsToTurnOn = 0

function giveRockTakeMoney() -- Main function that checks if player has space for the item, if they do, takes money and gives the item.
	if not exports.global:hasSpaceForItem(client, ironOreItemID) then
        outputChatBox("You don't have enough space in your pockets!", person, 255, 100, 100)
        return
    end
    if rocksInRockPile <= 0 then
    	outputChatBox("There's no metal to buy!", client)
    	return
    end
    rocksInRockPile = rocksInRockPile - 1
    exports.global:giveItem(client, ironOreItemID, 1)
    exports.global:takeMoney(client, costPerKg)
end
addEvent("giveClientRockAndTakeMoney", true)
addEventHandler("giveClientRockAndTakeMoney", root, giveRockTakeMoney)

function turnOnIronPurchases(playerSource, commandName, minutes) -- Senior admin or lead scripter command to turn on rock purchases. It also calls a client side update, so they can see it.
	if exports.integration:isPlayerSeniorAdmin(playerSource) or exports.integration:isPlayerLeadScripter(playerSource) then
		if not minutes then
			outputChatBox("Write the command like this: /ironon (minutes).")
		else
			triggerClientEvent(getElementsByType("player"), "allowedToBuyUpdate", resourceRoot, true)
			allowedToBuy = true
			milisecondsToTurnOn = minutes * 60000 -- Converts minutes to miliseconds for the setTimer function.
			setTimer(turnOff, milisecondsToTurnOn, 1)
			outputChatBox("You set the time to: "..tostring(minutes).." minutes.", playerSource)
			outputDebugString("The quarry has been set to sell stuff for ".. tostring(minutes) .. " minutes.", 3, 0, 0, 255)
		end
	else
		outputChatBox("Only senior admins and lead scripters or higher can execute this script!")
	end
end
addCommandHandler("ironon", turnOnIronPurchases, false, true)

function turnOff() -- Turns off the purchases after time has past.
	outputDebugString("The quarry rock purchases have been turned on!", 3, 0, 0, 255)
	triggerClientEvent(getElementsByType("player"), "allowedToBuyUpdate", resourceRoot, false)
	allowedToBuy = false
end

addCommandHandler("rockcount", function(playerSource) outputChatBox(tostring(rocksInRockPile), playerSource) end, false, false)