local gGrid = {}
local gLabel = {}
local gWindow = {}
local gButton = {}
local gColumn = {}
local gProgress = {}


gWindow["DownloadMod"] = guiCreateWindow(0.36, 0.35, 0.26, 0.33, "Mod-Download", true)
guiWindowSetMovable(gWindow["DownloadMod"], false)
guiWindowSetSizable(gWindow["DownloadMod"], false)

gButton["DownloadMod"] = guiCreateButton(0.63, 0.13, 0.29, 0.16, "Download", true, gWindow["DownloadMod"])
guiSetFont(gButton["DownloadMod"], "default-bold-small")
guiSetProperty(gButton["DownloadMod"], "NormalTextColour", "FFFEFEFE")
gGrid["DownloadMod"] = guiCreateGridList(0.02, 0.13, 0.55, 0.81, true, gWindow["DownloadMod"])
gColumn["DownloadName"] = guiGridListAddColumn(gGrid["DownloadMod"], "Name", 0.3)
gColumn["DownloadSize"] = guiGridListAddColumn(gGrid["DownloadMod"], "Size", 0.3)
gColumn["DownloadTXD"] = guiGridListAddColumn(gGrid["DownloadMod"], "TXD", 0.3)
gColumn["DownloadDFF"] = guiGridListAddColumn(gGrid["DownloadMod"], "DFF", 0.3)
gColumn["DownloadCOL"] = guiGridListAddColumn(gGrid["DownloadMod"], "COL", 0.3)
gColumn["DownloadTXD_ID"] = guiGridListAddColumn(gGrid["DownloadMod"], "TXD_ID", 0.3)
gColumn["DownloadDFF_ID"] = guiGridListAddColumn(gGrid["DownloadMod"], "DFF_ID", 0.3)
gColumn["DownloadCOL_ID"] = guiGridListAddColumn(gGrid["DownloadMod"], "COL_ID", 0.3)
gButton["Enable"] = guiCreateButton(0.63, 0.32, 0.29, 0.16, "Enable", true, gWindow["DownloadMod"])
guiSetFont(gButton["Enable"], "default-bold-small")
guiSetProperty(gButton["Enable"], "NormalTextColour", "FFFEFEFE")
gButton["Disable"] = guiCreateButton(0.63, 0.52, 0.29, 0.16, "Disable", true, gWindow["DownloadMod"])
guiSetFont(gButton["Disable"], "default-bold-small")
guiSetProperty(gButton["Disable"], "NormalTextColour", "FFFEFEFE")
gButton["Close"] = guiCreateButton(0.63, 0.71, 0.29, 0.16, "Close", true, gWindow["DownloadMod"])
guiSetFont(gButton["Close"], "default-bold-small")
guiSetProperty(gButton["Close"], "NormalTextColour", "FFFEFEFE")
guiSetVisible(gWindow["DownloadMod"], false)

function guiGridListGetSelectedItemText ( gridList, column )
    local item = guiGridListGetSelectedItem ( gridList )
 
    if item then
        return guiGridListGetItemText ( gridList, item, column or 1 )
    end
 
    return false
end

function downloadMod()
	if not guiGetVisible(gWindow["DownloadMod"]) then
		showCursor(true)
		guiSetVisible(gWindow["DownloadMod"], true)
		guiGridListClear(gGrid["DownloadMod"])
		triggerServerEvent('onLoadDownloadList', localPlayer, localPlayer)
	else
		showCursor(false)
		guiSetVisible(gWindow["DownloadMod"], false)
	end
end
bindKey("f4", "down", downloadMod)

function fillDownloadList(downloadList)
	for _, data in pairs(downloadList) do 
		local row = guiGridListAddRow(gGrid["DownloadMod"])
		local modSize = data[3] + data[5] + data[7]
		local txd, dff, col = data[8], data[9], data[10]
		local txd_id, dff_id, col_id = data[11], data[12], data[13]
		if not txd then txd = '-' end
		if not dff then dff = '-' end
		if not col then col = '-' end
		if not txd_id then txd_id = '-' end
		if not dff_id then dff_id = '-' end
		if not col_id then col_id = '-' end
		
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadName"], data[1], false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadSize"], modSize or 0, false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadTXD"], txd, false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadDFF"], dff, false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadCOL"], col, false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadTXD_ID"], txd_id, false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadDFF_ID"], dff_id, false, false)
		guiGridListSetItemText(gGrid["DownloadMod"], row, gColumn["DownloadCOL_ID"], col_id, false, false)
	end
end
addEvent('onLoadDownloadDraw', true)
addEventHandler('onLoadDownloadDraw', localPlayer, fillDownloadList)


gWindow["DownloadFile"] = guiCreateWindow(0.37, 0.87, 0.32, 0.12, "Download-Mod", true)
guiWindowSetSizable(gWindow["DownloadFile"], false)

gLabel["DownloadStatus"] = guiCreateLabel(0.13, 0.33, 0.77, 0.40, "Download Mod: 0%", true, gWindow["DownloadFile"])
guiSetFont(gLabel["DownloadStatus"], "default-bold-small")
guiLabelSetHorizontalAlign(gLabel["DownloadStatus"], "center", false)
guiLabelSetVerticalAlign(gLabel["DownloadStatus"], "center")
guiSetVisible(gWindow["DownloadFile"], false)
gProgress["DownloadStatus"] = guiCreateProgressBar(0.26, 0.78, 0.47, 0.10, true, gWindow["DownloadFile"])
guiSetVisible(gWindow["DownloadFile"], false)

function drawDownloadStatus(status, size)
	if(status ~= false)then
		local downloadSize = size
		local size = math.floor(size*status/100);
		if not guiGetVisible(gWindow["DownloadFile"]) then
			guiSetVisible(gWindow["DownloadFile"], true)
			guiSetText(gLabel["DownloadStatus"], "Download Mod: "..status.."% ("..sizeFormat(size).."/"..sizeFormat(downloadSize)..")")
		else
			guiSetText(gLabel["DownloadStatus"], "Download Mod: "..status.."% ("..sizeFormat(size).."/"..sizeFormat(downloadSize)..")")
			guiProgressBarSetProgress(gProgress["DownloadStatus"], status)
		end
	else
		guiSetVisible(gWindow["DownloadFile"], false)
	end
end
addEvent('drawModTransfer', true)
addEventHandler('drawModTransfer', root, drawDownloadStatus)

function downloadMod_File()
	local txd = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadTXD"])
	local dff = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadDFF"])
	local col = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadCOL"])
	
	triggerServerEvent('onDownloadMod', localPlayer, localPlayer, txd, dff, col)
end
addEventHandler('onClientGUIClick', gButton["DownloadMod"], downloadMod_File, false)


function downloadClose()
	showCursor(false)
	guiSetVisible(gWindow["DownloadMod"], false)
end
addEventHandler("onClientGUIClick", gButton["Close"], downloadClose, false)

function doDownloadFile(txdPath, dffPath, colPath, txdBytes, dffBytes, colBytes)
	local txdBytes = txdBytes
	local dffBytes = dffBytes
	local colBytes = colBytes
	
	if(txdBytes ~= false)then
		local file = fileCreate(txdPath)
		if(file)then
			fileWrite(file, txdBytes)
			fileClose(file)
		end
	end
	if(dffBytes ~= false)then
		local file = fileCreate(dffPath)
		if(file)then
			fileWrite(file, dffBytes)
			fileClose(file)
		end
	end
	if(colBytes ~= false)then
		local file = fileCreate(colPath)
		if(file)then
			fileWrite(file, colBytes)
			fileClose(file)
		end
	end
	drawDownloadStatus(false)
	outputChatBox("Download-Complete!", 0, 125, 0);
end
addEvent('onStartDownloadFile', true)
addEventHandler('onStartDownloadFile', root, doDownloadFile)


function doModActiv()
	local txd = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadTXD"])
	local dff = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadDFF"])
	local col = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadCOL"])
	local txd_id = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadTXD_ID"])
	local dff_id = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadDFF_ID"])
	local col_id = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadCOL_ID"])
	
	if(txd ~= '-')then
		if not fileExists(txd) then
			outputChatBox('Es fehlen Datein bitte klicke zuerst Download!', 125, 0, 0)
			return
		end
	end
	if(dff ~= '-')then
		if not fileExists(dff) then
			outputChatBox('Es fehlen Datein bitte klicke zuerst Download!', 125, 0, 0)
			return
		end
	end
	if(col ~= '-')then
		if not fileExists(col) then
			outputChatBox('Es fehlen Datein bitte klicke zuerst Download!', 125, 0, 0)
			return
		end
	end
	if(txd ~= '-' and txd_id ~= '-')then
		local txd = engineLoadTXD(txd)
		engineImportTXD(txd, txd_id)
	end
	if(dff ~= '-' and dff_id ~= '-')then
		local dff = engineLoadDFF(dff)
		engineReplaceModel(dff, dff_id)
	end
	if(col ~= '-' and col_id ~= '-')then
		local col = engineLoadCOL(col)
		engineReplaceCOL(col, col_id)
	end
	outputChatBox("Mod has been Enable!", 0, 125, 0)
end
addEventHandler('onClientGUIClick', gButton["Enable"], doModActiv, false)

function unloadMod()
	local txd = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadTXD"])
	local dff = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadDFF"])
	local col = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadCOL"])
	local txd_id = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadTXD_ID"])
	local dff_id = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadDFF_ID"])
	local col_id = guiGridListGetSelectedItemText(gGrid["DownloadMod"], gColumn["DownloadCOL_ID"])
	
	if(txd ~= '-' and txd_id ~= '-')then
		engineRestoreModel(txd_id)
	end
	if(dff ~= '-' and dff_id ~= '-')then
		engineRestoreModel(dff_id)
	end
	if(col ~= '-' and col_id ~= '-')then
		engineRestoreCOL(col_id)
	end
	outputChatBox("Mod has been Disable!", 125, 0, 0)
end
addEventHandler('onClientGUIClick', gButton["Disable"], unloadMod, false)




-- Von DKong 
function sizeFormat(size)
	local size = tostring(size)
	if size:len() >= 4 then		
		if size:len() >= 7 then
			if size:len() >= 9 then
				local returning = size:sub(1, size:len()-9)
				if returning:len() <= 1 then
					returning = returning.."."..size:sub(2, size:len()-7)
				end
				return returning.." GB";
			else				
				local returning = size:sub(1, size:len()-6)
				if returning:len() <= 1 then
					returning = returning.."."..size:sub(2, size:len()-4)
				end
				return returning.." MB";
			end
		else		
			local returning = size:sub(1, size:len()-3)
			if returning:len() <= 1 then
				returning = returning.."."..size:sub(2, size:len()-1)
			end
			return returning.." KB";
		end
	else
		return size.." B";
	end
end
