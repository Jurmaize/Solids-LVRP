isGUImade = false
baseWindow = nil
tabPanel = nil
infoTab = nil

loadstring(exports.dgs:dgsImportFunction())() -- dgs

local createDrugMenu = { -- Should call a function that draws the rest of that SPECIFIC drugs menu.
	[1] = function (drugObject) drawWeedGUI(drugObject) end,
	[2] = function (drugObject) drawCocaGUI(drugObject) end,
}

function drawDrugGuiBase(drugTypeID, drugObject)
	if not isGUImade then
		isGUImade = true
		showCursor(true)
		
		local x = 0.23
		local y = 0.25
		local width = 0.55
		local height = 0.55
		baseWindow = guiCreateWindow(x, y, width, height, drugInfo[drugTypeID][3], true)

		x = 0.005
		y = 0.04
		width = 0.98
		height = 0.98
		tabPanel = guiCreateTabPanel(x,y,width,height, true, baseWindow)

		infoTab = guiCreateTab("Narkotikas", tabPanel)

		x = 0.01
		y = 0.88
		width = 0.15
		height = 0.1
		local closeBaseWindowButton = guiCreateButton(x, y, width, height, "Aizvērt", true, infoTab)
		addEventHandler("onClientGUIClick", closeBaseWindowButton, closeBaseWindow, false)

		createDrugMenu[drugTypeID](drugObject) -- Calling to switch statement at top to call the client side function to draw rest of the drug GUI.
	end
end
addEvent("drawClientDrugGUI",true)
addEventHandler("drawClientDrugGUI", localPlayer, drawDrugGuiBase)


function closeBaseWindow(button, state) -- Close button on drug base GUI
	if button == "left" and state == "up" then
		if baseWindow then
			destroyElement(baseWindow)
			baseWindow = nil
			showCursor(false)
			isGUImade = false
		end
	end
end

function destroyGUI() -- Used to remove the GUI completely. For example when a player harvests a weed plant.
	if baseWindow then
		destroyElement(baseWindow)
		showCursor(false)
		isGUImade = false
	end
end
addEvent("closeBaseWindowDrugs",true)
addEventHandler("closeBaseWindowDrugs", localPlayer, destroyGUI)

function restartGUI(drugTypeID, drugObject) -- Used to restart GUI. For example when a player waters a weed plant.
	if baseWindow then
		destroyElement(baseWindow)
		showCursor(false)
		isGUImade = false
		drawDrugGuiBase(drugTypeID, drugObject)
	end
end
addEvent("restartBaseWindowDrugs",true)
addEventHandler("restartBaseWindowDrugs", localPlayer, restartGUI)

function informClient(messageID) -- Should have all info messages that display on the bottom of the users drug GUI.
    if infoTab then
        local activeTab = guiGetSelectedTab(tabPanel)
        local messages = {
            [1] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Jūs aplējāt stādu!", true, activeTab)
                setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
            end,
            [2] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Jūms nav ar ko apliet stādu!", true, activeTab)
                setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
            end,
            [3] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Jūs atrodaties pārāk tālu, lai novāktu ražu!", true, activeTab)
                setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
            end,
            [4] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Tev nepietiek vietas kabatās!", true, activeTab)
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
    	if msg then
	        destroyElement(msg)
	    end
    end
end