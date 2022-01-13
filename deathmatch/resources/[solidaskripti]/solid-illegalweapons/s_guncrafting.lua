function findOven(playerSource)
	local closestObject = getNearestObject(playerSource, 10)
	local closestObjectModelID = getElementModel(closestObject)
	if closestObjectModelID == ovenModelID then
		if exports.global:hasItem(closestObject, ironOreItemID, 1) then
			if exports.global:hasSpaceForItem(closestObject, processedIronItemID, 1) then
				outputChatBox("Cooking started!",playerSource)
				checkIfMoreOreInOven(closestObject, playerSource)
			else
				outputChatBox("There's not enough room in the oven for the cooked items!")
			end
		else
			outputChatBox("There are no rocks in the oven!",playerSource)
		end
	else
		outputChatBox("You're not near any oven!",playerSource)
	end
end
addCommandHandler("cookore", findOven, false, true)


function cookIronOre(ovenElement, playerSource)
	exports.global:takeItem(ovenElement, ironOreItemID, 1)
	exports.global:giveItem(ovenElement, processedIronItemID, 1)
	checkIfMoreOreInOven(ovenElement, playerSource)
end

function checkIfMoreOreInOven(ovenElement,playerSource)
	if exports.global:hasItem(ovenElement, ironOreItemID, 1) then
		setTimer(cookIronOre, cookTimePerKG, 1, ovenElement, playerSource)
	else
		outputChatBox("Cooking done!", playerSource)
	end
end

function getNearestObject(player,distance)
	local lastMinDis = distance-0.0001
	local nearestObject = false
	local px,py,pz = getElementPosition(player)
	local pint = getElementInterior(player)
	local pdim = getElementDimension(player)

	for _,v in pairs(getElementsByType("object")) do
		local vint,vdim = getElementInterior(v),getElementDimension(v)
		if vint == pint and vdim == pdim then
			local vx,vy,vz = getElementPosition(v)
			local dis = getDistanceBetweenPoints3D(px,py,pz,vx,vy,vz)
			if dis < distance then
				if dis < lastMinDis then 
					lastMinDis = dis
					nearestObject = v
				end
			end
		end
	end
	return nearestObject
end


function startCrafting(playerSource)
	local closestObject = getNearestObject(playerSource, 10)
	local closestObjectModelID = getElementModel(closestObject)
	if closestObjectModelID == craftingTableModelID then
		triggerClientEvent(playerSource, "serverRequestOpenCrafting", playerSource)
	else
		outputChatBox("You're not near a workbench!",playerSource)
	end
end
addCommandHandler("craftweapons", startCrafting, false, true)


function craftItem(itemToCraft)
	if exports.factions:isInFactionType(client, 0) or exports.factions:isInFactionType(client, 1) then
		crafting[itemToCraft](client)
	else
		triggerClientEvent(client, "informClientCraftMessage", resourceRoot, 6)
	end
end
addEvent("serverCraftItem", true)
addEventHandler("serverCraftItem", root, craftItem)

crafting = {
	[metalBarrelID] = function(client) 
		if not exports.global:hasSpaceForItem(client, metalBarrelID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[metalBarrelID][1], 1) >= craftingRecipes[metalBarrelID][2] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, metalBarrelID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, metalBarrelID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[metalBarrelID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[metalBarrelID][1], 1)
						end
						exports.global:giveItem(client, metalBarrelID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[metalBarrelID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[metalSheetID] = function(client) 
		if not exports.global:hasSpaceForItem(client, metalSheetID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[metalSheetID][1], 1) >= craftingRecipes[metalSheetID][2] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, metalSheetID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, metalSheetID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[metalSheetID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[metalSheetID][1], 1)
						end
						exports.global:giveItem(client, metalSheetID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[metalSheetID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[sharpMetalID] = function(client) 
		if not exports.global:hasSpaceForItem(client, sharpMetalID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[sharpMetalID][1], 1) >= craftingRecipes[sharpMetalID][2] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, sharpMetalID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, sharpMetalID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[sharpMetalID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[sharpMetalID][1], 1)
						end
						exports.global:giveItem(client, sharpMetalID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[sharpMetalID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[weaponBarrelID] = function(client) 
		if not exports.global:hasSpaceForItem(client, weaponBarrelID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[weaponBarrelID][1], 1) >= craftingRecipes[weaponBarrelID][2] and exports["item-system"]:countItems(client, craftingRecipes[weaponBarrelID][3], 1) >= craftingRecipes[weaponBarrelID][4] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, weaponBarrelID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, weaponBarrelID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[weaponBarrelID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[weaponBarrelID][1], 1)
						end
						for i = 1, craftingRecipes[weaponBarrelID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[weaponBarrelID][3], 1)
						end
						exports.global:giveItem(client, weaponBarrelID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[weaponBarrelID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[magazineID] = function(client) 
		if not exports.global:hasSpaceForItem(client, magazineID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[magazineID][1], 1) >= craftingRecipes[magazineID][2] and exports["item-system"]:countItems(client, craftingRecipes[magazineID][3], 1) >= craftingRecipes[magazineID][4] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, magazineID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, magazineID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[magazineID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[magazineID][1], 1)
						end
						for i = 1, craftingRecipes[magazineID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[magazineID][3], 1)
						end
						exports.global:giveItem(client, magazineID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[magazineID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[firingPinID] = function(client) 
		if not exports.global:hasSpaceForItem(client, firingPinID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[firingPinID][1], 1) >= craftingRecipes[firingPinID][2] and exports["item-system"]:countItems(client, craftingRecipes[firingPinID][3], 1) >= craftingRecipes[firingPinID][4] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, firingPinID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, firingPinID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[firingPinID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[firingPinID][1], 1)
						end
						for i = 1, craftingRecipes[firingPinID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[firingPinID][3], 1)
						end
						exports.global:giveItem(client, firingPinID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[firingPinID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[pistolHandleID] = function(client) 
		if not exports.global:hasSpaceForItem(client, pistolHandleID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[pistolHandleID][1], 1) >= craftingRecipes[pistolHandleID][2] and exports["item-system"]:countItems(client, craftingRecipes[pistolHandleID][3], 1) >= craftingRecipes[pistolHandleID][4] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, pistolHandleID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, pistolHandleID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[pistolHandleID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[pistolHandleID][1], 1)
						end
						for i = 1, craftingRecipes[pistolHandleID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[pistolHandleID][3], 1)
						end
						exports.global:giveItem(client, pistolHandleID, 1)
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[pistolHandleID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[coltID] = function(client) 
		if not exports.global:hasSpaceForItem(client, coltID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[coltID][1], 1) >= craftingRecipes[coltID][2] and exports["item-system"]:countItems(client, craftingRecipes[coltID][3], 1) >= craftingRecipes[coltID][4] and exports["item-system"]:countItems(client, craftingRecipes[coltID][5], 1) >= craftingRecipes[coltID][6] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, coltID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, coltID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[coltID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[coltID][1], 1)
						end
						for i = 1, craftingRecipes[coltID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[coltID][3], 1)
						end
						for i = 1, craftingRecipes[coltID][6], 1 do
							exports.global:takeItem(client, craftingRecipes[coltID][5], 1)
						end
						local adminDBID = tonumber(1)
						local playerDBID = tonumber(getElementData(client, "account:character:id"))
						local quantity = 1
						local count = 0
						local fails = 0
						local allSerials = ""
						local give, error = ""
						for variable = 1, quantity, 1 do
							local mySerial = exports.global:createWeaponSerial( 1, adminDBID, playerDBID)
							give, error = exports.global:giveItem(client, 115, coltID..":"..mySerial..":"..getWeaponNameFromID(coltID)..":0")
							if give then
								exports.logs:dbLog(client, 4, client, "GIVEWEAPON "..getWeaponNameFromID(coltID).." "..tostring(mySerial))
								if count == 0 then
									allSerials = mySerial
								else
									allSerials = allSerials.."', '"..mySerial
								end
								count = count + 1
							else
								fails = fails + 1
							end
						end
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[coltID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[deagleID] = function(client) 
		if not exports.global:hasSpaceForItem(client, deagleID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[deagleID][1], 1) >= craftingRecipes[deagleID][2] and exports["item-system"]:countItems(client, craftingRecipes[deagleID][3], 1) >= craftingRecipes[deagleID][4] and exports["item-system"]:countItems(client, craftingRecipes[deagleID][5], 1) >= craftingRecipes[deagleID][6] and exports["item-system"]:countItems(client, craftingRecipes[deagleID][7], 1) >= craftingRecipes[deagleID][8] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, deagleID)
				toggleAllControls(client, false, true, true)
				setTimer(function()
					if not exports.global:hasSpaceForItem(client, deagleID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[deagleID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[deagleID][1], 1)
						end
						for i = 1, craftingRecipes[deagleID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[deagleID][3], 1)
						end
						for i = 1, craftingRecipes[deagleID][6], 1 do
							exports.global:takeItem(client, craftingRecipes[deagleID][5], 1)
						end
						for i = 1, craftingRecipes[deagleID][8], 1 do
							exports.global:takeItem(client, craftingRecipes[deagleID][7], 1)
						end
						local adminDBID = tonumber(1)
						local playerDBID = tonumber(getElementData(client, "account:character:id"))
						local quantity = 1
						local count = 0
						local fails = 0
						local allSerials = ""
						local give, error = ""
						for variable = 1, quantity, 1 do
							local mySerial = exports.global:createWeaponSerial( 1, adminDBID, playerDBID)
							give, error = exports.global:giveItem(client, 115, deagleID..":"..mySerial..":"..getWeaponNameFromID(deagleID)..":0")
							if give then
								exports.logs:dbLog(client, 4, client, "GIVEWEAPON "..getWeaponNameFromID(deagleID).." "..tostring(mySerial))
								if count == 0 then
									allSerials = mySerial
								else
									allSerials = allSerials.."', '"..mySerial
								end
								count = count + 1
							else
								fails = fails + 1
							end
						end
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[deagleID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[shotgunID] = function(client) 
		if not exports.global:hasSpaceForItem(client, shotgunID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[shotgunID][1], 1) >= craftingRecipes[shotgunID][2] and exports["item-system"]:countItems(client, craftingRecipes[shotgunID][3], 1) >= craftingRecipes[shotgunID][4] and exports["item-system"]:countItems(client, craftingRecipes[shotgunID][5], 1) >= craftingRecipes[shotgunID][6] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, shotgunID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, shotgunID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[shotgunID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[shotgunID][1], 1)
						end
						for i = 1, craftingRecipes[shotgunID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[shotgunID][3], 1)
						end
						for i = 1, craftingRecipes[shotgunID][6], 1 do
							exports.global:takeItem(client, craftingRecipes[shotgunID][5], 1)
						end
						local adminDBID = tonumber(1)
						local playerDBID = tonumber(getElementData(client, "account:character:id"))
						local quantity = 1
						local count = 0
						local fails = 0
						local allSerials = ""
						local give, error = ""
						for variable = 1, quantity, 1 do
							local mySerial = exports.global:createWeaponSerial( 1, adminDBID, playerDBID)
							give, error = exports.global:giveItem(client, 115, shotgunID..":"..mySerial..":"..getWeaponNameFromID(shotgunID)..":0")
							if give then
								exports.logs:dbLog(client, 4, client, "GIVEWEAPON "..getWeaponNameFromID(shotgunID).." "..tostring(mySerial))
								if count == 0 then
									allSerials = mySerial
								else
									allSerials = allSerials.."', '"..mySerial
								end
								count = count + 1
							else
								fails = fails + 1
							end
						end
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[shotgunID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
	[uziID] = function(client) 
		if not exports.global:hasSpaceForItem(client, uziID, 1) then
			triggerClientEvent(client, "informClientCraftMessage", client, 1)
		else
			if exports["item-system"]:countItems(client, craftingRecipes[uziID][1], 1) >= craftingRecipes[uziID][2] and exports["item-system"]:countItems(client, craftingRecipes[uziID][3], 1) >= craftingRecipes[uziID][4] and exports["item-system"]:countItems(client, craftingRecipes[uziID][5], 1) >= craftingRecipes[uziID][6] then
				triggerClientEvent(client, "informClientCraftMessage", client, 2, uziID)
				toggleAllControls(client, false, true, true)
				setTimer(function() 
					if not exports.global:hasSpaceForItem(client, uziID, 1) then
						triggerClientEvent(client, "informClientCraftMessage", client, 1)
					else
						triggerClientEvent(client, "informClientCraftMessage", client, 3)
						for i = 1, craftingRecipes[uziID][2], 1 do
							exports.global:takeItem(client, craftingRecipes[uziID][1], 1)
						end
						for i = 1, craftingRecipes[uziID][4], 1 do
							exports.global:takeItem(client, craftingRecipes[uziID][3], 1)
						end
						for i = 1, craftingRecipes[uziID][6], 1 do
							exports.global:takeItem(client, craftingRecipes[uziID][5], 1)
						end
						local adminDBID = tonumber(1)
						local playerDBID = tonumber(getElementData(client, "account:character:id"))
						local quantity = 1
						local count = 0
						local fails = 0
						local allSerials = ""
						local give, error = ""
						for variable = 1, quantity, 1 do
							local mySerial = exports.global:createWeaponSerial( 1, adminDBID, playerDBID)
							give, error = exports.global:giveItem(client, 115, uziID..":"..mySerial..":"..getWeaponNameFromID(uziID)..":0")
							if give then
								exports.logs:dbLog(client, 4, client, "GIVEWEAPON "..getWeaponNameFromID(uziID).." "..tostring(mySerial))
								if count == 0 then
									allSerials = mySerial
								else
									allSerials = allSerials.."', '"..mySerial
								end
								count = count + 1
							else
								fails = fails + 1
							end
						end
					end
					toggleAllControls(client, true, true, true)
				end, craftingTimes[uziID], 1)
			else
				triggerClientEvent(client, "informClientCraftMessage", client, 4)
			end
		end
	end,
}