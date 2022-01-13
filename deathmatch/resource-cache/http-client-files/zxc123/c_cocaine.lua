local isGUImade = false
local imageBase = nil

function openBarrelGUI(barrelObject)
	if not isGUImade then
		isGUImade = true

		local cocaLeafAmount = getElementData(barrelObject, "soliddrugs:cocaleaves")
		local isMixed = getElementData(barrelObject, "soliddrugs:cocamixed")
		local hasCement = getElementData(barrelObject, "soliddrugs:cementpowder")
		local hasWater = getElementData(barrelObject, "soliddrugs:water")
		local hasPetrol = getElementData(barrelObject, "soliddrugs:petrol")
		local hasAcid = getElementData(barrelObject, "soliddrugs:sulfuricacid")
		local readyToHarvest = getElementData(barrelObject, "soliddrugs:readytoharvest")

		local x = 0.3
		local y = 0.05
		local width = 0.35
		local heigth = 0.85
		imageBase = guiCreateStaticImage(x,y,width,heigth,"images/barrel1.png", true)

		if cocaLeafAmount < cocaLeavesNeededToMakeCocaine then
			x = 0.35
			y = 0.15
			width = 0.3
			height = 0.25
			guiCreateStaticImage(x,y,width,height,"images/cocaleaves.png", true, imageBase)

			x = 0.4
			y = 0.45
			width = 0.25
			height = 0.04
			local addLeavesButton = guiCreateButton(x, y, width, height, "Pievienot Coca Lapas", true, imageBase)
			addEventHandler("onClientGUIClick", addLeavesButton, function() triggerServerEvent("doCocaineAction", localPlayer, 1, barrelObject) end, false)
		elseif not isMixed then
			x = 0.35
			y = 0.15
			width = 0.35
			height = 0.25
			guiCreateStaticImage(x,y,width,height,"images/crushedleaves.png", true, imageBase)

			x = 0.4
			y = 0.45
			width = 0.25
			height = 0.04
			local crushLeavesButton = guiCreateButton(x, y, width, height, "Sasmalcināt Coca Lapas", true, imageBase)
			addEventHandler("onClientGUIClick", crushLeavesButton, function() triggerServerEvent("doCocaineAction", localPlayer, 2, barrelObject) end, false)
		elseif not hasCement then
			x = 0.35
			y = 0.15
			width = 0.35
			height = 0.37
			guiCreateStaticImage(x,y,width,height,"images/cement.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local addCementButton = guiCreateButton(x, y, width, height, "Piebērt cementu", true, imageBase)
			addEventHandler("onClientGUIClick", addCementButton, function() triggerServerEvent("doCocaineAction", localPlayer, 3, barrelObject) end, false)
		elseif not hasWater then
			x = 0.42
			y = 0.15
			width = 0.18
			height = 0.37
			guiCreateStaticImage(x,y,width,height,"images/water.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local addWaterButton = guiCreateButton(x, y, width, height, "Pieliet ūdeni", true, imageBase)
			addEventHandler("onClientGUIClick", addWaterButton, function() triggerServerEvent("doCocaineAction", localPlayer, 4, barrelObject) end, false)
		elseif not hasPetrol then
			x = 0.38
			y = 0.2
			width = 0.3
			height = 0.3
			guiCreateStaticImage(x,y,width,height,"images/gas.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local addWaterButton = guiCreateButton(x, y, width, height, "Pieliet benzīnu", true, imageBase)
			addEventHandler("onClientGUIClick", addWaterButton, function() triggerServerEvent("doCocaineAction", localPlayer, 5, barrelObject) end, false)
		elseif not hasAcid then
			x = 0.38
			y = 0.18
			width = 0.3
			height = 0.35
			guiCreateStaticImage(x,y,width,height,"images/sulfuric.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local addWaterButton = guiCreateButton(x, y, width, height, "Pieliet sērskābi", true, imageBase)
			addEventHandler("onClientGUIClick", addWaterButton, function() triggerServerEvent("doCocaineAction", localPlayer, 6, barrelObject) end, false)
		else
			x = 0.38
			y = 0.18
			width = 0.3
			height = 0.35
			guiCreateStaticImage(x,y,width,height,"images/harvest.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local addWaterButton = guiCreateButton(x, y, width, height, "Izkasīt gatavo kokaīnu", true, imageBase)
			addEventHandler("onClientGUIClick", addWaterButton, function() triggerServerEvent("doCocaineAction", localPlayer, 7, barrelObject) end, false)
		end

		x = 0.45
		y = 0.9
		width = 0.15
		height = 0.04
		local closeCocaineWindowButton = guiCreateButton(x, y, width, height, "Aizvērt", true, imageBase)
		addEventHandler("onClientGUIClick", closeCocaineWindowButton, closeCocaineWindow, false)


	end
end
addEvent("openBarrelGUI", true)
addEventHandler("openBarrelGUI", localPlayer, openBarrelGUI)

function closeCocaineWindow(button, state) -- Close button on cocaine GUI
	if button == "left" and state == "up" then
		if imageBase then
			destroyElement(imageBase)
			imageBase = nil
			showCursor(false)
			isGUImade = false
		end
	end
end

function restartGUI(barrelObject) -- Used to restart GUI. For example when a player adds a ingredient
	if imageBase then
		destroyElement(imageBase)
		showCursor(false)
		isGUImade = false
		openBarrelGUI(barrelObject)
	end
end
addEvent("restartCocaineWindow",true)
addEventHandler("restartCocaineWindow", localPlayer, restartGUI)