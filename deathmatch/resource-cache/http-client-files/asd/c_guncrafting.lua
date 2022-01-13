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

				craftingWindow = dgsCreateWindow(x, y, width, height, "Ieroču izstrādes izvēlne", true)
				dgsWindowSetCloseButtonEnabled(craftingWindow, false)

				x = 0.01
				y = 0
				width = 0.98
				height = 0.935
				tabPanel = dgsCreateTabPanel(x,y,width,height, true, craftingWindow)

				-- Individual tabs
				local infoTab = dgsCreateTab("Informācija", tabPanel)
				local partsTab = dgsCreateTab("Metāla detaļas", tabPanel)
				local gunPartsTab = dgsCreateTab("Ieroču detaļas",tabPanel)
				local gunsTab = dgsCreateTab("Ieroči",tabPanel)

				-- Info tab
				x = 0.02
				y = 0.03
				width = 1
				height = 0.2
				dgsCreateLabel(x,y,width,height, "Šī ir nelegālo ieroču izveides izvēlne. Šeit ir iespējams izveidot ieročus no detaļām, kuras jāizveido no dzelzs stieņiem!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "Dzelzs stieņus vispirms būs jāpārtaisa par metāla detaļām, tad ieroču detaļām un visbeidzot pašiem ieročiem!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "Lai, ko izveidotu, tev ir jābūt nepieciešamajām mantām iekš kabatas, tad jāiziet uz noteikto mantu un jānospiež pogu!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "Kad uzspiedīsiet veidot mantu, Jums jāgaida norādītās sekundes. Kamēr strādājat, Jūs nevarēsiet darīt neko citu!", true, infoTab)
				y = y + 0.05
				dgsCreateLabel(x,y,width,height, "Kad uzdevums būs pabeigts, tiks izvadīta apstiprinošā ziņa un jaunā manta būs ievietota Jūsu kabatā.", true, infoTab)
				if scriptAuthor ~= "Solid" then
					outputChatBox("This script is stolen!", root)
				end
				y = y + 0.07
				dgsCreateLabel(x,y,width,height, "Receptes:", true, infoTab)
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
				local buyPart1 = dgsCreateButton(x, y, width, height, "Izveidot Metāla Cauruli", true, partsTab)
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
				local buyPart2 = dgsCreateButton(x, y, width, height, "Izveidot Metāla Plāksni", true, partsTab)
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
				local buyPart3 = dgsCreateButton(x, y, width, height, "Izveidot Asu Metāla Gabalu", true, partsTab)
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
				local gunPart1 = dgsCreateButton(x, y, width, height, "Izveidot Ieroča Stobru", true, gunPartsTab)
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
				local gunPart2 = dgsCreateButton(x, y, width, height, "Izveidot Ieroča Aptveri", true, gunPartsTab)
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
				local gunPart3 = dgsCreateButton(x, y, width, height, "Izveidot Ieroča Belzni", true, gunPartsTab)
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
				local gunPart4 = dgsCreateButton(x, y, width, height, "Izveidot Pistoļveida Rokturi", true, gunPartsTab)
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
				local gun1 = dgsCreateButton(x, y, width, height, "Izveidot Koltu", true, gunsTab)
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
				local gun2 = dgsCreateButton(x, y, width, height, "Izveidot Deaglu", true, gunsTab)
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
				local gun3 = dgsCreateButton(x, y, width, height, "Izveidot Uzi", true, gunsTab)
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
				local gun4 = dgsCreateButton(x, y, width, height, "Izveidot Bisi", true, gunsTab)
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
				local closeCraftingMenuButton = dgsCreateButton(x, y, width, height, "Aizvērt", true, infoTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton, closeCraftingMenuOnExitButton, false)
				local closeCraftingMenuButton2 = dgsCreateButton(x, y, width, height, "Aizvērt", true, partsTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton2, closeCraftingMenuOnExitButton, false)
				local closeCraftingMenuButton3 = dgsCreateButton(x, y, width, height, "Aizvērt", true, gunPartsTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton3, closeCraftingMenuOnExitButton, false)
				local closeCraftingMenuButton4 = dgsCreateButton(x, y, width, height, "Aizvērt", true, gunsTab)
				addEventHandler("onDgsMouseClickUp", closeCraftingMenuButton4, closeCraftingMenuOnExitButton, false)

				isGUImade = true
			end
		else
			outputChatBox("Tu nedrīksti būt automašīnā! Izkāp un tad ienac foršajā simbolā.")
		end
end
addEvent("serverRequestOpenCrafting", true)
addEventHandler("serverRequestOpenCrafting", localPlayer, drawCraftingMenu)


--[[
triggerClientEvent messages to client to inform them on the GUI
1 - Not enough space.
2 - Work has begun and will take x seconds.
3 - Work has finished.
4 - Not enough materials.
5 - Already working.
6 - Not in gang or mafia
]]
function informClient(messageID, itemToCraft)
	if craftingWindow then
		local activeTab = dgsGetSelectedTab(tabPanel)
		local messages = {
			[1] = function()
				local msg = dgsCreateLabel(0.5,0.9,1,0.2, "Diemžēl iekš Jūsu kabatām nav pietiekami vietas!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[2] = function()
				if itemToCraft then
					isWorking = true
					local msg = dgsCreateLabel(0.5,0.9,1,0.2, "Darbs ir uzsākts! Taisīšanas laiks: "..tostring(craftingTimes[itemToCraft]/1000).. " sekundes.", true, activeTab)
					setTimer(removeInfoMsg, craftingTimes[itemToCraft], 1, msg, activeTab)
				end
			end,
			[3] = function()
				isWorking = false
				local msg = dgsCreateLabel(0.5,0.9,1,0.2, "Darbs pabeigts!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[4] = function()
				local msg = dgsCreateLabel(0.5,0.9,1,0.2, "Diemžēl Jums nepietiek materiālu, lai izveidotu šo mantu!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[5] = function()
				local msg = dgsCreateLabel(0.5,0.95,1,0.2, "Kāds darbs jau ir iesākts! Gaidiet, kamēr tas ir beidzies.", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
			[6] = function()
				local msg = dgsCreateLabel(0.5,0.95,1,0.2, "Tu neatrodies iekš nelegālās organizācijas!", true, activeTab)
				setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
			end,
		}
		messages[messageID]()
	end
end
addEvent("informClientMessage", true)
addEventHandler("informClientMessage", localPlayer, informClient)

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