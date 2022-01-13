localPlayer = getLocalPlayer()
function carshop_showInfo(carPrice, taxPrice)
	local isOverlayDisabled = getElementData(localPlayer, "hud:isOverlayDisabled")
	if isOverlayDisabled then
		outputChatBox("")
		outputChatBox("Car Dealership")
		outputChatBox("   - Zīmols: "..(getElementData(source, "brand") or getVehicleNameFromModel( getElementModel( source ) )) )
		outputChatBox("   - Modelis: "..(getElementData(source, "maximemodel") or getVehicleNameFromModel( getElementModel( source ) )) )
		outputChatBox("   - Gads: "..(getElementData(source, "year") or "2015") )

		if getVehicleType(source) ~= 'BMX' then
			outputChatBox("   - Odometrs: "..exports.global:formatMoney(getElementData(source, 'odometer') or 0) .. " miles"  )
		end
		outputChatBox("   - Cena: $"..exports.global:formatMoney(carPrice)  )
		outputChatBox("   - Nodoklis: $"..exports.global:formatMoney(taxPrice)  )
		outputChatBox("   (( MTA Modelis: "..getVehicleNameFromModel( getElementModel( source ) ).."))"  )
		outputChatBox("Nospied F vai Enter, lai iegādātos transportlīdzekli.")
	else
		local content = {}
		table.insert(content, { getCarShopNicename(getElementData(source, "carshop")) , false, false, false, false, false, false, "title"} )
		table.insert(content, {" " } )
		table.insert(content, {"   - Zīmols: "..(getElementData(source, "brand") or getVehicleNameFromModel( getElementModel( source ) )) } )
		table.insert(content, {"   - Modelis: "..(getElementData(source, "maximemodel") or getVehicleNameFromModel( getElementModel( source ) ))} )
		table.insert(content, {"   - Gads: "..(getElementData(source, "year") or "2015")} )
		if getVehicleType(source) ~= 'BMX' then
			table.insert(content, {"   - Odometrs: "..exports.global:formatMoney(getElementData(source, 'odometer') or 0) .. " miles"})
		end
		table.insert(content, {"   - Cena: $"..exports.global:formatMoney(carPrice)  } )
		table.insert(content, {"   - Nodoklis: $"..exports.global:formatMoney(taxPrice) } )
		table.insert(content, {"   (( MTA Modelis: "..getVehicleNameFromModel( getElementModel( source ) ).."))" } )
		table.insert(content, {"Nospied F vai Enter, lai iegādātos transportlīdzekli." } )
		exports.hud:sendTopRightNotification( content, localPlayer, 240)
	end
end
addEvent("carshop:showInfo", true)
addEventHandler("carshop:showInfo", getRootElement(), carshop_showInfo)

local gui, theVehicle = {}
function carshop_buyCar(carPrice, cashEnabled, bankEnabled)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return false
	end

	if gui["_root"] then
		return
	end

	setElementData(getLocalPlayer(), "exclusiveGUI", true, false)

	theVehicle = source

	guiSetInputEnabled(true)
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 350, 190
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	gui["_root"] = guiCreateStaticImage(left, top, windowWidth, windowHeight, ":resources/window_body.png", false)
	--guiWindowSetSizable(gui["_root"], false)

	gui["lblText1"] = guiCreateLabel(20, 25, windowWidth-40, 16, "Tu taisies pirkt sekojošo auto:", false, gui["_root"])
	gui["lblVehicleName"] = guiCreateLabel(20, 45+5, windowWidth-40, 13, exports.global:getVehicleName(source) , false, gui["_root"])
	guiSetFont(gui["lblVehicleName"], "default-bold-small")
	gui["lblVehicleCost"] = guiCreateLabel(20, 45+15+5, windowWidth-40, 13, "Cena: $"..exports.global:formatMoney(carPrice), false, gui["_root"])
	guiSetFont(gui["lblVehicleCost"], "default-bold-small")
	gui["lblText2"] = guiCreateLabel(20, 45+15*2, windowWidth-40, 70, "Nospiežot sekojošās pogas, jūs piekrītat, ka naudas atgriezšana nav iespējama. Paldies, ka izvēlējāties mūs!", false, gui["_root"])
	guiLabelSetHorizontalAlign(gui["lblText2"], "left", true)
	guiLabelSetVerticalAlign(gui["lblText2"], "center", true)

	gui["btnCash"] = guiCreateButton(10, 140, 105, 41, "Maksāt skaidrā", false, gui["_root"])
	addEventHandler("onClientGUIClick", gui["btnCash"], carshop_buyCar_click, false)
	guiSetEnabled(gui["btnCash"], cashEnabled)
	if exports.global:hasItem(localPlayer, 263) and carPrice <= 35000 then
		guiSetText(gui["btnCash"], "Izmantot tokenu")
		guiSetEnabled(gui["btnCash"], true)
	end

	gui["btnBank"] = guiCreateButton(120, 140, 105, 41, "Maksāt ar banku", false, gui["_root"])
	addEventHandler("onClientGUIClick", gui["btnBank"], carshop_buyCar_click, false)
	guiSetEnabled(gui["btnBank"], bankEnabled)

	gui["btnCancel"] = guiCreateButton(232, 140, 105, 41, "Atcelt", false, gui["_root"])
	addEventHandler("onClientGUIClick", gui["btnCancel"], carshop_buyCar_close, false)
end
addEvent("carshop:buyCar", true)
addEventHandler("carshop:buyCar", getRootElement(), carshop_buyCar)

function carshop_buyCar_click()
	if exports.global:hasSpaceForItem(getLocalPlayer(), 3, 1) then
		local sourcestr = "cash"
		if (source == gui["btnBank"]) then
			sourcestr = "bank"
		elseif guiGetText(gui["btnCash"]) == "Redeem Token" then
			sourcestr = "token"
		end
		triggerServerEvent("carshop:buyCar", theVehicle, sourcestr)
	else
		outputChatBox("Tev nav vietas kabatās atslēgai!", 0, 255, 0)
	end
	carshop_buyCar_close()
end


function carshop_buyCar_close()
	if gui["_root"] then
		destroyElement(gui["_root"])
		gui = { }
	end
	guiSetInputEnabled(false)
	setElementData(getLocalPlayer(), "exclusiveGUI", false, false)
end
--PREVENT ABUSER TO CHANGE CHAR
addEventHandler ( "account:changingchar", getRootElement(), carshop_buyCar_close )
addEventHandler("onClientChangeChar", getRootElement(), carshop_buyCar_close)

function cleanUp()
	setElementData(getLocalPlayer(), "exclusiveGUI", false, false)
end
addEventHandler("onClientResourceStart", resourceRoot, cleanUp)
