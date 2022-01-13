local function createDBTable()
	dbExec(exports.mysql:getConn("core"), "CREATE TABLE IF NOT EXISTS `solid_news` (`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,`newsstandmodel` float NOT NULL DEFAULT 1288,`locx` float NOT NULL DEFAULT 0,`locy` float NOT NULL DEFAULT 0,`locz` float NOT NULL DEFAULT 0,`rotz` float NOT NULL DEFAULT 0) ENGINE=InnoDB DEFAULT CHARSET=utf8;")
end
addEventHandler("onResourceStart", resourceRoot, createDBTable)

function initialNewsStandSpawn(queryHandle, client) -- Callback for db query. Used to loop over and call news stand creation function. When resource is created!
	local results = dbPoll(queryHandle,0)
	triggerClientEvent( client, "solidnews:createClientSideStuff", client,results)
end

function getNewsForNewClient()
	dbQuery(initialNewsStandSpawn, {client}, exports.mysql:getConn("core"), "SELECT * FROM `solid_news`")
end
addEvent("solidnews:newClientRequestUpdate",true)
addEventHandler("solidnews:newClientRequestUpdate", root, getNewsForNewClient)

local function makeNewsSpot(playerSource) -- Admin command to make new news stands and add them to db.
	if exports.integration:isPlayerSeniorAdmin(playerSource) or exports.integration:isPlayerScripter(playerSource) then
		if isPedOnGround(playerSource) then -- TODO add checks if player is admin/scripter
			local paperx, papery, paperz = getPositionFromElementOffset(playerSource, 0, 1, -0.5)
			local rx, ry, rz = getElementRotation(playerSource)
			local newsStandModelToUse = newsStandModels[math.random(1,#newsStandModels)]
			dbExec(exports.mysql:getConn("core"), "INSERT INTO `solid_news` (newsstandmodel,locx,locy,locz,rotz) VALUES (?,?,?,?,?)", newsStandModelToUse, paperx, papery, paperz, rz)
			restartResource(getThisResource())
			outputDebugString("New news node created, resource restarted!", 3, 0, 255, 0)
		else
			outputChatBox("Lai izveidotu ziņu stendu, tev jāatrodas uz zemes!", playerSource)
		end
	else
		outputChatBox("Šo komandu var lietot tikai senior admini vai skripteri.", playerSource)
	end
end
addCommandHandler("makenewsspot",makeNewsSpot, false, true)

local function listAllNewsStands(playerSource)
	if exports.integration:isPlayerSeniorAdmin(playerSource) or exports.integration:isPlayerScripter(playerSource) then
		dbQuery(outputNewsInfo, {playerSource}, exports.mysql:getConn("core"), "SELECT * FROM `solid_news`")
	else
		outputChatBox("Šo komandu var lietot tikai senior admini vai skripteri.", playerSource)
	end
end
addCommandHandler("allnewsspots", listAllNewsStands, false, true)

function outputNewsInfo(queryHandle, playerSource)
	local results = dbPoll(queryHandle,0)
	for index, value in pairs(results) do
		outputChatBox("ID:"..tostring(value.id).." Model:"..tostring(value.newsstandmodel).." X:"..tostring(value.locx).." Y:"..tostring(value.locy).." Z:"..tostring(value.locz))
	end
end

local function removeNewsSpot(playerSource, commandName, idToDestroy)
	if exports.integration:isPlayerSeniorAdmin(playerSource) or exports.integration:isPlayerScripter(playerSource) then
		if idToDestroy then -- TODO add checks if player is admin/scripter
			dbExec(exports.mysql:getConn("core"), "DELETE FROM `solid_news` WHERE `id`=?",idToDestroy)
			outputChatBox("Ziņu punkts ar id: "..idToDestroy.." izdzēsts.",playerSource)
			restartResource(getThisResource())
			outputDebugString("News node removed, resource restarted!", 3, 0, 255, 0)
		else
			outputChatBox("Tev ir jānorāda id, kuru ziņu punktu vēlies izdzēst!", playerSource)
		end
	else
		outputChatBox("Šo komandu var lietot tikai senior admini vai skripteri.", playerSource)
	end
end
addCommandHandler("removenewsspot", removeNewsSpot, false, true)


function buyNewsPaper(typeOfPaper)
	-- typeOfPaper 1(LSZD) 2(server news)
	local newsItemID = paperItemID[typeOfPaper]
	if exports.global:hasSpaceForItem(client, newsItemID, 1) then
		if exports.global:hasMoney(client, paperPrices[newsItemID]) then
			exports.global:takeMoney(client, paperPrices[newsItemID])
			exports.global:giveItem(client, newsItemID, 1)
		else
			outputChatBox("Tev nepietiek naudas priekš šī laikraksta!", client)
		end
	else
		outputChatBox("Tev nepietiek vietas kabatās priekš šī laikraksta!", client)
	end
end
addEvent("solidnews:buyNewsPaper", true)
addEventHandler("solidnews:buyNewsPaper", root, buyNewsPaper)



----------------Helper functions from wiki
function getPositionFromElementOffset(element,offX,offY,offZ) -- https://wiki.multitheftauto.com/wiki/GetElementMatrix
    local m = getElementMatrix ( element )  -- Get the matrix
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
    return x, y, z                               -- Return the transformed point
end