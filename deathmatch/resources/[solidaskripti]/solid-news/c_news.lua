loadstring(exports.dgs:dgsImportFunction())() -- loading DGS

local isGUImade = false
local newsBase = nil

function newsGUI(hitPlayer)
	if hitPlayer == localPlayer then
		if not isGUImade then
			isGUImade = true
			showCursor(true)

			newsBase = dgsCreateWindow(0.25,0.25, 0.5, 0.5, "Ziņu izvēlne", true)
			addEventHandler("onDgsWindowClose", newsBase, function() newsBase = nil isGUImade = false showCursor(false) end)

			dgsCreateImage(0.05, 0.2, 0.4, 0.4, "images/lszd.png", true, newsBase)
			dgsCreateImage(0.45, 0.12, 0.5, 0.4, "images/playhard.png", true, newsBase)

			local lszdButton = dgsCreateButton(0.15, 0.6, 0.2, 0.1, "Iegādāties LSZD laikrakstu\n Cena: $"..paperPrices[300], true, newsBase)
			addEventHandler("onDgsMouseUp", lszdButton, function() triggerServerEvent("solidnews:buyNewsPaper", localPlayer, 1) end, false)
			local serverNewsButton = dgsCreateButton(0.6, 0.6, 0.2, 0.1, "Iegādāties PlayHard laikrakstu\n Cena: $"..paperPrices[301], true, newsBase)
			addEventHandler("onDgsMouseUp", serverNewsButton,  function() triggerServerEvent("solidnews:buyNewsPaper", localPlayer, 2) end, false)

		end
	end
end

function createClientSideStuff(results) -- Gets triggered from server side to create marker, 3d DGS image and add event handler that triggers upon player entry to open GUI.
	for index, value in pairs(results) do
		local newsStand = createObject( value.newsstandmodel, value.locx,value.locy,value.locz, 0, 0, value.rotz+180)
		local mx,my,mz = getPositionFromElementOffset(newsStand, 0, 0.7, -0.5)
		local newsMarker = createMarker(mx,my,mz, "cylinder", 1, 252, 144, 3, 100)
		local threeDImage = dgsCreate3DImage(mx,my,mz+1,"images/news.png")
		dgsSetProperty(threeDImage, "imageSize", {15,15})
		dgsSetProperty(threeDImage, "maxDistance", 15)
		dgsSetProperty(threeDImage, "fadeDistance", 5)
		addEventHandler("onClientMarkerHit", newsMarker, newsGUI)
	end
end
addEvent("solidnews:createClientSideStuff", true)
addEventHandler("solidnews:createClientSideStuff", localPlayer, createClientSideStuff)

addEventHandler("onClientResourceStart", root, function() triggerServerEvent("solidnews:newClientRequestUpdate", localPlayer) end) -- Update client on client resource load.

function checkLinks(newsType) -- (1) LSZD     (2) Server news
	if newsType == 1 then
		requestBrowserDomains({lszdLink}, false, openNewsBrowserLSZD)
	elseif newsType == 2 then
		requestBrowserDomains({serverNewsLink}, false, openNewsBrowserServer)
	end
end
addEvent("solidnews:openBrowser", true)
addEventHandler("solidnews:openBrowser", localPlayer, checkLinks)

function openNewsBrowserLSZD(wasAccepted, new_domains)
	local browserBase = dgsCreateWindow(0.25,0.25, 0.5, 0.5, "Ziņas", true)
	addEventHandler("onDgsWindowClose", browserBase, function() showCursor(false) end)
	local webBrowser = dgsCreateBrowser(0,0,1,1,true, browserBase)

	addEventHandler("onClientBrowserCreated", webBrowser, function()
		loadBrowserURL(webBrowser, lszdLink)
	end)
end

function openNewsBrowserServer(wasAccepted, new_domains)
	if wasAccepted then
		outputChatBox("The link was accepted")
	end

	local browserBase = dgsCreateWindow(0.25,0.25, 0.5, 0.5, "Ziņas", true)
	addEventHandler("onDgsWindowClose", browserBase, function() showCursor(false) end)
	local webBrowser = dgsCreateBrowser(0,0,1,1,true, browserBase)

	addEventHandler("onClientBrowserResourceBlocked", webBrowser, function(url, domain, reason)
		outputChatBox("1."..tostring(url).."  2."..tostring(domain).."  3."..tostring(reason).."\n")
	end)

	addEventHandler("onClientBrowserCreated", webBrowser, function()
		loadBrowserURL(webBrowser, "https://www.youtube.com/") -- serverNewsLink
	end)

end

----------------Helper functions from wiki
function getPositionFromElementOffset(element,offX,offY,offZ) -- https://wiki.multitheftauto.com/wiki/GetElementMatrix
    local m = getElementMatrix ( element )  -- Get the matrix
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
    return x, y, z                               -- Return the transformed point
end