local isGUImade = false
local imageBase = nil

function openHeroinBarrelGUI(barrelObject)
	if not isGUImade then
		isGUImade = true

		local poppyAmount = getElementData(barrelObject, "soliddrugs:poppies")
		local isWatered = getElementData(barrelObject, "soliddrugs:water")
		local hasCoughSyrup = getElementData(barrelObject, "soliddrugs:coughsyrup")
		local hasAspirin = getElementData(barrelObject, "soliddrugs:aspirin:crushed")
		local hasRustRemover = getElementData(barrelObject, "soliddrugs:rust")
		local readyToHarvest = getElementData(barrelObject, "soliddrugs:readytoharvest")

		local x = 0.3
		local y = 0.05
		local width = 0.35
		local heigth = 0.85
		imageBase = dgsCreateImage(x,y,width,heigth,"images/barrel1.png", true)

		if poppyAmount < poppiesNeededToMakeHeroin then
			x = 0.38
			y = 0.15
			width = 0.3
			height = 0.25
			dgsCreateImage(x,y,width,height,"images/poppy.png", true, imageBase)

			x = 0.4
			y = 0.45
			width = 0.25
			height = 0.04
			local addPoppiesButton = dgsCreateButton(x, y, width, height, "Pievienot Magoņu galviņu", true, imageBase)
			addEventHandler("onDgsMouseClickUp", addPoppiesButton, function() triggerServerEvent("doHeroinAction", localPlayer, 1, barrelObject) end, false)
		elseif not isWatered then
			x = 0.42
			y = 0.15
			width = 0.18
			height = 0.37
			dgsCreateImage(x,y,width,height,"images/water.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local waterButton = dgsCreateButton(x, y, width, height, "Pievienot šķidrumu", true, imageBase)
			addEventHandler("onDgsMouseClickUp", waterButton, function() triggerServerEvent("doHeroinAction", localPlayer, 2, barrelObject) end, false)
		elseif not hasCoughSyrup then
			x = 0.30
			y = 0.15
			width = 0.45
			height = 0.37
			dgsCreateImage(x,y,width,height,"images/cough_syrup.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local syrupButton = dgsCreateButton(x, y, width, height, "Pieliet klepu sīrupu", true, imageBase)
			addEventHandler("onDgsMouseClickUp", syrupButton, function() triggerServerEvent("doHeroinAction", localPlayer, 3, barrelObject) end, false)
		elseif not hasAspirin then
			x = 0.35
			y = 0.15
			width = 0.40
			height = 0.37
			dgsCreateImage(x,y,width,height,"images/aspirin_crushed.png", true, imageBase)

			x = 0.4
			y = 0.48
			width = 0.25
			height = 0.04
			local aspirinButton = dgsCreateButton(x, y, width, height, "Piebērt aspirīnu", true, imageBase)
			addEventHandler("onDgsMouseClickUp", aspirinButton, function() triggerServerEvent("doHeroinAction", localPlayer, 4, barrelObject) end, false)
		elseif not hasRustRemover then
			x = 0.38
			y = 0.2
			width = 0.3
			height = 0.3
			dgsCreateImage(x,y,width,height,"images/rust_remover.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local rustRemoverButton = dgsCreateButton(x, y, width, height, "Pieliet rūsas noņēmēju", true, imageBase)
			addEventHandler("onDgsMouseClickUp", rustRemoverButton, function() triggerServerEvent("doHeroinAction", localPlayer, 5, barrelObject) end, false)
		else
			x = 0.38
			y = 0.18
			width = 0.3
			height = 0.35
			dgsCreateImage(x,y,width,height,"images/harvest.png", true, imageBase)

			x = 0.4
			y = 0.55
			width = 0.25
			height = 0.04
			local harvestButton = dgsCreateButton(x, y, width, height, "Izkasīt gatavo heroīnu", true, imageBase)
			addEventHandler("onDgsMouseClickUp", harvestButton, function() triggerServerEvent("doHeroinAction", localPlayer, 6, barrelObject) end, false)
		end

		x = 0.45
		y = 0.9
		width = 0.15
		height = 0.04
		local closeHeroinWindowButton = dgsCreateButton(x, y, width, height, "Aizvērt", true, imageBase)
		addEventHandler("onDgsMouseClickUp", closeHeroinWindowButton, closeHeroinWindow, false)
		
	end
end
addEvent("openHeroinBarrelGUI", true)
addEventHandler("openHeroinBarrelGUI", localPlayer, openHeroinBarrelGUI)

function closeHeroinWindow(button, state) -- Close button on cocaine GUI
	if button == "left" and state == "up" then
		if imageBase then
			destroyElement(imageBase)
			imageBase = nil
			showCursor(false)
			isGUImade = false
		end
	end
end

function restartHeroinGUI(barrelObject) -- Used to restart GUI. For example when a player adds a ingredient
	if imageBase then
		destroyElement(imageBase)
		showCursor(false)
		isGUImade = false
		openHeroinBarrelGUI(barrelObject)
	end
end
addEvent("restartHeroinWindow",true)
addEventHandler("restartHeroinWindow", localPlayer, restartHeroinGUI)