local isGUImade = false
local craftingWindow = nil
local isWorking = false
local tabPanel = nil

function drawCraftingMenu()
	if not isPedInVehicle(localPlayer) then
			if not isGUImade then
				showCursor(true)
				local x = 0.25
				local y = 0.25
				local width = 0.5
				local height = 0.5

				craftingWindow = dgsCreateWindow(x, y, width, height, "Weapon production menu", true)
				dgsWindowSetCloseButtonEnabled(craftingWindow, false)

				x = 0.01
				y = 0
				width = 0.98
				height = 0.935
				tabPanel = dgsCreateTabPanel(x,y,width,height, true, craftingWindow)

				-- Individual tabs
				local infoTab = dgsCreateTab("Information", tabPanel)
				local partsTab = dgsCreateTab("Metal parts", tabPanel)
				local gunPartsTab = dgsCreateTab("Weapon parts",tabPanel)
				local gunsTab = dgsCreateTab("Weapons",tabPanel)

				-- Info tab
				x = 0.02
				y = 0.03
				width = 1
				height = 0.2
				dgsCreateLabel(x,y,width,height, "This is the menu for creating illegal weapons. Here it is possible to create weapons from parts that must be made of iron bars!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "The iron bars will have to be remade first into metal parts, then into weapon parts and finally into the weapons themselves!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "To create what you need, you must have the necessary items in your pocket, then go to the specified item and press the button!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "When you press to create an item, you have to wait for the specified seconds. You won't be able to do anything else while you're working!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "When the task is completed, a confirmation message will be displayed and the new item will be placed in your pocket.", true, infoTab)
				y = y + 0.07
				dgsCreateLabel(x,y,width,height, "Recipes:", true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[1], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[2], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[3], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[4], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[5], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[6], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[7], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[8], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[9], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[10], true, infoTab)
				y = y + 0.04
				dgsCreateLabel(x,y,width,height, craftingInfo[11], true, infoTab)



				-- Parts tab
				x = 0
				y = 0.1
				width = 0.3
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/287.png", true, partsTab)
				x = 0.11
				y = 0.5
				width = 0.15
				height = 0.1
				local buyPart1 = dgsCreateButton(x, y, width, height, "Create metal tube", true, partsTab)
				addEventHandler("onDgsMouseClickUp", buyPart1, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, metalBarrelID)
					else
						informClient(5)
					end
				end, false)

				x = 0.3
				y = 0.1
				width = 0.25
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/288.png", true, partsTab)
				x = 0.38
				y = 0.5
				width = 0.15
				height = 0.1
				local buyPart2 = dgsCreateButton(x, y, width, height, "Create metal plate", true, partsTab)
				addEventHandler("onDgsMouseClickUp", buyPart2, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, metalSheetID)
					else
						informClient(5)
					end
				end, false)

				x = 0.6
				y = 0.1
				width = 0.18
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/289.png", true, partsTab)
				x = 0.65
				y = 0.5
				width = 0.17
				height = 0.1
				local buyPart3 = dgsCreateButton(x, y, width, height, "Create sharp metal piece", true, partsTab)
				addEventHandler("onDgsMouseClickUp", buyPart3, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, sharpMetalID)
					else
						informClient(5)
					end
				end, false)


				-- Gun Parts Tab

				x = 0.08
				y = 0.1
				width = 0.15
				height = 0.2
				dgsCreateImage(x,y,width,height,"images/290.png", true, gunPartsTab)
				x = 0.11
				y = 0.5
				width = 0.14
				height = 0.1
				local gunPart1 = dgsCreateButton(x, y, width, height, "Create weapon barrel", true, gunPartsTab)
				addEventHandler("onDgsMouseClickUp", gunPart1, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, weaponBarrelID)
					else
						informClient(5)
					end
				end, false)

				x = 0.3
				y = 0.1
				width = 0.25
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/291.png", true, gunPartsTab)
				x = 0.38
				y = 0.5
				width = 0.14
				height = 0.1
				local gunPart2 = dgsCreateButton(x, y, width, height, "Create weapon magazine", true, gunPartsTab)
				addEventHandler("onDgsMouseClickUp", gunPart2, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, magazineID)
					else
						informClient(5)
					end
				end, false)

				x = 0.8
				y = 0.1
				width = 0.18
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/292.png", true, gunPartsTab)
				x = 0.85
				y = 0.5
				width = 0.14
				height = 0.1
				local gunPart3 = dgsCreateButton(x, y, width, height, "Create weapon firing pin", true, gunPartsTab)
				addEventHandler("onDgsMouseClickUp", gunPart3, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, firingPinID)
					else
						informClient(5)
					end
				end, false)

				x = 0.6
				y = 0.1
				width = 0.13
				height = 0.2
				dgsCreateImage(x,y,width,height,"images/293.png", true, gunPartsTab)
				x = 0.62
				y = 0.5
				width = 0.16
				height = 0.1
				local gunPart4 = dgsCreateButton(x, y, width, height, "Create weapon handle", true, gunPartsTab)
				addEventHandler("onDgsMouseClickUp", gunPart4, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, pistolHandleID)
					else
						informClient(5)
					end
				end, false)


				-- Guns Tab

				x = 0.08
				y = 0.1
				width = 0.2
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/wep1.png", true, gunsTab)
				x = 0.11
				y = 0.5
				width = 0.1
				height = 0.1
				local gun1 = dgsCreateButton(x, y, width, height, "Create colt", true, gunsTab)
				addEventHandler("onDgsMouseClickUp", gun1, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, coltID)
					else
						informClient(5)
					end
				end, false)

				x = 0.3
				y = 0.1
				width = 0.2
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/wep2.png", true, gunsTab)
				x = 0.38
				y = 0.5
				width = 0.1
				height = 0.1
				local gun2 = dgsCreateButton(x, y, width, height, "Create deagle", true, gunsTab)
				addEventHandler("onDgsMouseClickUp", gun2, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, deagleID)
					else
						informClient(5)
					end
				end, false)

				x = 0.77
				y = 0.1
				width = 0.2
				height = 0.25
				dgsCreateImage(x,y,width,height,"images/wep3.png", true, gunsTab)
				x = 0.85
				y = 0.5
				width = 0.1
				height = 0.1
				local gun3 = dgsCreateButton(x, y, width, height, "Create uzi", true, gunsTab)
				addEventHandler("onDgsMouseClickUp", gun3, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, uziID)
					else
						informClient(5)
					end
				end, false)

				x = 0.55
				y = 0.1
				width = 0.2
				height = 0.3
				dgsCreateImage(x,y,width,height,"images/wep4.png", true, gunsTab)
				x = 0.6
				y = 0.5
				width = 0.1
				height = 0.1
				local gun4 = dgsCreateButton(x, y, width, height, "Create shotgun", true, gunsTab)
				addEventHandler("onDgsMouseClickUp", gun4, function()
					if not isWorking then
						triggerServerEvent("serverCraftItem", localPlayer, shotgunID)
					else
						informClient(5)
					end
				end, false)


				-- Close buttons for each tab
				x = 0.01
				y = 0.88
				width = 0.15
				height = 0.1
				local closeCraftingMenuButton = dgsCreateButton(x, y, width, height, "Close", true, infoTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton, closeCraftingMenuOnExitButton, false)
				local closeCraftingMenuButton2 = dgsCreateButton(x, y, width, height, "Close", true, partsTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton2, closeCraftingMenuOnExitButton, false)
				local closeCraftingMenuButton3 = dgsCreateButton(x, y, width, height, "Close", true, gunPartsTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton3, closeCraftingMenuOnExitButton, false)
				local closeCraftingMenuButton4 = dgsCreateButton(x, y, width, height, "Close", true, gunsTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton4, closeCraftingMenuOnExitButton, false)

				isGUImade = true
			end
		else
			outputChatBox("You can't be in a vehicle!")
		end
end
addEvent("serverRequestOpenCrafting", true)
addEventHandler("serverRequestOpenCrafting", localPlayer, drawCraftingMenu)


function informClient(messageID, itemToCraft)
	if craftingWindow then
		local activeTab = dgsGetSelectedTab(tabPanel)
		local messages = {
			[1] = function()
				local msg = dgsCreateLabel(0.5,0.9,1,0.2, "You don't have enough space in your pockets!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[2] = function()
				if itemToCraft then
					if isWorking then return end
					isWorking = true
					local msg = dgsCreateLabel(0.5,0.9,1,0.2, "Work has started! Time that it'll take: "..tostring(craftingTimes[itemToCraft]/1000).. " seconds.", true, activeTab)
					setTimer(removeInfoMsg, craftingTimes[itemToCraft], 1, msg, activeTab)
					local craftingProgress = dgsCreateProgressBar(0.17,0.88,0.3,0.1,true,activeTab)
					function removeProgress(craftingProgressBar)
						if isElement(craftingProgressBar) then
							destroyElement(craftingProgressBar)
						end
					end
					setTimer(removeProgress, craftingTimes[itemToCraft], 1, craftingProgress)
					dgsAnimTo(craftingProgress,"progress", 100, "Linear", craftingTimes[itemToCraft],0)
				end
			end,
			[3] = function()
				isWorking = false
				local msg = dgsCreateLabel(0.5,0.9,1,0.2, "Job done!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[4] = function()
				local msg = dgsCreateLabel(0.5,0.9,1,0.2, "You don't have enough materials to make this!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[5] = function()
				local msg = dgsCreateLabel(0.5,0.95,1,0.2, "You've already started working! Wait till it's done then start a new one.", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[6] = function()
				local msg = dgsCreateLabel(0.5,0.95,1,0.2, "You're not in a illegal faction!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
		}
		messages[messageID]()
	end
end
addEvent("informClientCraftMessage", true)
addEventHandler("informClientCraftMessage", localPlayer, informClient)

function removeInfoMsg(msg, windowToRemoveFrom)
	if windowToRemoveFrom then
		if isElement(msg) then
	        destroyElement(msg)
	    end
	end
end

function closeCraftingMenuOnExitButton(button, state) -- Close button.
	if button == "left" and state == "up" then
		if craftingWindow then
			if not isWorking then
				dgsCloseWindow(craftingWindow)
				craftingWindow = nil
				showCursor(false)
				isGUImade = false
			end
		end
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