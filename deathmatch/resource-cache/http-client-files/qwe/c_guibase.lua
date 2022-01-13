isGUImade = false
baseWindow = nil
tabPanel = nil
infoTab = nil

--[[
1 - Weed

]]

local drugMenuType = {
	[1] = "Marihuānas izvēlne",
	[2] = "",
}

local createDrugMenu = {
	[1] = function (x) drawWeedGUI(x) end,
	[2] = function() end,
}

function drawDrugGuiBase(drugMenuTypeID, drugObject)
	if not isGUImade then
		isGUImade = true
		showCursor(true)
		local drugMenuTypeID = tonumber(drugMenuTypeID)
		
		local x = 0.23
		local y = 0.25
		local width = 0.55
		local height = 0.55

		baseWindow = guiCreateWindow(x, y, width, height, drugMenuType[tonumber(drugMenuTypeID)], true)

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

		createDrugMenu[drugMenuTypeID](drugObject)

		
	else -- Used for refreshing window if client does action in GUI.
		destroyElement(baseWindow)
		showCursor(false)
		isGUImade = false
		drawDrugGuiBase(drugMenuTypeID, drugObject)
	end
end
addEvent("drawClientDrugGUI",true)
addEventHandler("drawClientDrugGUI", resourceRoot, drawDrugGuiBase)


function closeBaseWindow(button, state) -- Close button on GUI
	if button == "left" and state == "up" then
		if baseWindow then
			destroyElement(baseWindow)
			showCursor(false)
			isGUImade = false
		end
	end
end

function destroyGUI() -- will be used when server asks to destroy GUI
	if baseWindow then
		destroyElement(baseWindow)
		showCursor(false)
		isGUImade = false
	end
end
addEvent("closeBaseWindowDrugs",true)
addEventHandler("closeBaseWindowDrugs", resourceRoot, destroyGUI)

function informClientWeed(messageID)
    if infoTab then
        local activeTab = guiGetSelectedTab(tabPanel)
        local messages = {
            [1] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Jūs aplējāt augu!", true, activeTab)
                setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
            end,
            [2] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Jūms nav ar ko apliet augu!", true, activeTab)
                setTimer(removeInfoMsg, 1000, 1, msg, activeTab)
            end,
            [3] = function()
                local msg = guiCreateLabel(0.5,0.9,1,0.2, "Jūs atrodaties pārāk tālu, lai novāktu augu!", true, activeTab)
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
addEvent("informClientWeedMessage", true)
addEventHandler("informClientWeedMessage", resourceRoot, informClientWeed)