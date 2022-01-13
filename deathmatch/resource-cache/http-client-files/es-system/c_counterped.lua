local rosie = createPed(141, 294.5, 181.634765625, 1007.171875)
local lsesOptionMenu = nil
setPedRotation(rosie, 154.214)
setElementFrozen(rosie, true)
setElementDimension(rosie, 6)
setElementInterior(rosie, 3)
--setPedAnimation(rosie, "INT_OFFICE", "OFF_Sit_Idle_Loop", -1, true, false, false)
setElementData(rosie, "talk", 1, false)
setElementData(rosie, "name", "Rosie Jenkins", false)

local jacob = createPed(277, 1142.20703125, -1297.8173828125, 13.602794647217)
local lsesOptionMenu = nil
setPedRotation(jacob, 28.007)
setElementFrozen(jacob, true)
setElementDimension(jacob, 0)
setElementInterior(jacob, 0)
setElementData(jacob, "talk", 1, false)
setElementData(jacob, "name", "Jacob Greenaway", false)

function popupSFESPedMenu()
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return
	end
	if not lsesOptionMenu then
		local width, height = 150, 100
		local scrWidth, scrHeight = guiGetScreenSize()
		local x = scrWidth/2 - (width/2)
		local y = scrHeight/2 - (height/2)

		lsesOptionMenu = guiCreateWindow(x, y, width, height, "Kā varu palīdzēt?", false)

		bPhotos = guiCreateButton(0.05, 0.2, 0.87, 0.2, "Man vajag palīgā", true, lsesOptionMenu)
		addEventHandler("onClientGUIClick", bPhotos, helpButtonFunction, false)

		bAdvert = guiCreateButton(0.05, 0.5, 0.87, 0.2, "Pieraksts", true, lsesOptionMenu)
		addEventHandler("onClientGUIClick", bAdvert, appointmentButtonFunction, false)
		
		bSomethingElse = guiCreateButton(0.05, 0.8, 0.87, 0.2, "Neko.", true, lsesOptionMenu)
		addEventHandler("onClientGUIClick", bSomethingElse, otherButtonFunction, false)
		triggerServerEvent("lses:ped:start", getLocalPlayer(), getElementData(rosie, "name"))
		showCursor(true)
	end
end
addEvent("lses:popupPedMenu", true)
addEventHandler("lses:popupPedMenu", getRootElement(), popupSFESPedMenu)

function closeSFESPedMenu()
	destroyElement(lsesOptionMenu)
	lsesOptionMenu = nil
	showCursor(false)
end

function helpButtonFunction()
	closeSFESPedMenu()
	triggerServerEvent("lses:ped:help", getLocalPlayer(), getElementData(rosie, "name"))
end

function appointmentButtonFunction()
	closeSFESPedMenu()
	triggerServerEvent("lses:ped:appointment", getLocalPlayer(), getElementData(rosie, "name"))
end

function otherButtonFunction()
	closeSFESPedMenu()
end


local pedDialogWindow
local thePed
function pedDialog_hospital(ped)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return
	end
	thePed = ped
	local width, height = 500, 345
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "Hospital Front Desk", false)

	b1 = guiCreateButton(10, 30, width-20, 40, "Man vajag dakteri, šeit kāds mirst!", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1,
		function()
			endDialog()
			if thePed then
				triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Mēs nosūtām komandu uz šejieni tūliņ pat, lūdzu, esiet mierīgs.")
				setTimer(function()
						triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "hospitalpa", "Kritiska situācija reģistratūrā, Kritiska situācija reģistratūrā!")
					end, 3000, 1)
			end
		end, false)

	b2 = guiCreateButton(10, 75, width-20, 40, "Man ir vajadzīgs kāds, kas palīdz man vai draugam nokļūt neatliekamās palīdzības nodaļā.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b2,
		function()
			endDialog()
			if thePed then
				triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Mēs nosūtām komandu uz šejieni tūliņ pat, lūdzu, esiet mierīgs.")
				setTimer(function()
						triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "hospitalpa", "Dakteri, lūdzu, palīdziet pacientam uz neatliekamās palīdzības nodaļu.")
					end, 4000, 1)
			end
		end, false)

	b3 = guiCreateButton(10, 120, width-20, 40, "Esmu šeit uz ieplānotu tikšanos vai pārbaudi.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b3,
		function()
			endDialog()
			if thePed then
				triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Labi, es kādu nosūtu.")
				setTimer(function()
						triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "hospitalpa", "Dakteri, lūdzu, pacients ieradies uz pārbaudi vai pierakstu.")
					end, 5000, 1)
			end
		end, false)

	b4 = guiCreateButton(10, 165, width-20, 40, "Esmu šeit, lai redzētu draugu, kurš ilgstoši atrodas slimnīcā.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b4,
		function()
			endDialog()
			if thePed then
				triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Lūdzu dodaties pa trepēm lejā.")
			end
		end, false)

	b5 = guiCreateButton(10, 210, width-20, 40, "Esmu šeit, lai redzētu draugu, kurš atrodas neatliekamās palīdzības nodaļā vai ambulatorajā dienestā.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b5,
		function()
			endDialog()
			if thePed then
				triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Es nosūtu dakteri, lai palīdzētu jums. Lūdzu, ņemiet vērā, ka mums ir viena apmeklētāja politika.")
				setTimer(function()
						triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "hospitalpa", "Dakteri, lūdzu, palīdziet ātrās palīdzības vai ambulatoro pakalpojumu apmeklētājam.")
					end, 5000, 1)
			end
		end, false)

	b6 = guiCreateButton(10, 255, width-20, 40, "Man vienkārši jārunā ar darbinieku.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b6,
		function()
			endDialog()
			if thePed then
				triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Labi, es padošu ziņu.")
				setTimer(function()
						triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "hospitalpa", "Darbinieki, lūdzu, palīdziet apmeklētājam, kurš pieprasa personāla locekli.")
					end, 5000, 1)
			end
		end, false)

	b7 = guiCreateButton(10, 300, width-20, 40, "Uhm. Neko.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b7, pedDialog_hospital_noHelp, false)

	--showCursor(true)

	triggerServerEvent("airport:ped:outputchat", getResourceRootElement(), thePed, "local", "Welcome to the LSIA reception. Can I help you?")
end
addEvent("lses:ped:hospitalfrontdesk", true)
addEventHandler("lses:ped:hospitalfrontdesk", getRootElement(), pedDialog_hospital)

function endDialog()
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
		pedDialogWindow = nil
	end
end

function pedDialog_hospital_noHelp()
	endDialog()
	if thePed then
		triggerServerEvent("lses:ped:outputchat", getResourceRootElement(), thePed, "local", "Labi.")
	end
end