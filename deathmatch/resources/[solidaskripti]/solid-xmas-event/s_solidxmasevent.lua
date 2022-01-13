local didSomeFuckerStealThisScript = false
local isVehicleAlreadySpawned = false
local activeXmasSpawnID = nil
local xmasVehicle = nil

function scriptStart()
	local xml = xmlLoadFile("meta.xml", true)
    local xml2 = xmlFindChild( xml, "info", 0)
    local scriptAuthor = xmlNodeGetAttribute(xml2, "author")
    if scriptAuthor == "Solid" then
    elseif scriptOwner == "Solid" then
    else
        didSomeFuckerStealThisScript = true
    end
    if not isVehicleAlreadySpawned then
        xmasVehicleTimer()
    end
end
addEventHandler("onResourceStart", root, scriptStart)

function spawnNewXmasVehicle()
    outputChatBox("chekoju, vai autins jau eksiste", root)
    if not isVehicleAlreadySpawned then
        activeXmasSpawnID = tonumber(math.random(1,#xmasVehicleSpawnPoints))
        outputChatBox ( "#FF0000Ho! #FFFFFFHo! #FF0000Ho! #FFFFFFMūsu dārgais, resnais, Gopņik' #FF0000vecītis #FFFFFFir papisis savus kaujas ratus! #FF0000Esiet tik labi un atgādājiet viņam tos atpakaļ! #FFFFFFViens no tiem pēdejo reiz bija manīts netālu no: "..tostring(xmasVehicleSpawnPoints[activeXmasSpawnID][1]), root, 255, 255, 255, true )
        xmasVehicle = createVehicle(xmasVehicleIds[math.random(1,2)], xmasVehicleSpawnPoints[activeXmasSpawnID][2], xmasVehicleSpawnPoints[activeXmasSpawnID][3], xmasVehicleSpawnPoints[activeXmasSpawnID][4], xmasVehicleSpawnPoints[activeXmasSpawnID][5], xmasVehicleSpawnPoints[activeXmasSpawnID][6], xmasVehicleSpawnPoints[activeXmasSpawnID][7])
        isVehicleAlreadySpawned = true
        setElementData(xmasVehicle,"fuel", 100)
        triggerClientEvent(getRootElement(), "setXmasVehicle", getRootElement(), xmasVehicle)
    end
end

function xmasVehicleTimer()
    setTimer(spawnNewXmasVehicle, timeIntervalBetweenCarSpawns, 0)
end

function deliveredXmasVehicle(characterID, accountID)
    if xmasVehicle then
        destroyElement(xmasVehicle)
        isVehicleAlreadySpawned = false
        xmasVehicle = nil
    end
    local dbCharacterID = nil


    local getPlayerDBCharacter = dbQuery(exports.mysql:getConn("core"), "SELECT characterid FROM solid_xmas_event WHERE characterid='"..exports.mysql:escape_string(characterID).."' AND accountid='"..exports.mysql:escape_string(accountID).."'")
    

    local result = dbPoll(getPlayerDBCharacter,-1)
    for index, data in ipairs(result) do
        for key, value in pairs(data) do
            dbCharacterID = tostring(value)
        end
    end
    dbFree(getPlayerDBCharacter)
    local updateOrInsert = nil
    if tostring(dbCharacterID) == tostring(characterID) then
        updateOrInsert = dbQuery(exports.mysql:getConn("core"), "UPDATE solid_xmas_event SET deliveredvehs = deliveredvehs + 1 WHERE characterid='"..exports.mysql:escape_string(characterID).."'")
    else
        local characterName = getPlayerName(client)
        updateOrInsert = dbQuery(exports.mysql:getConn("core"), "INSERT INTO solid_xmas_event (accountid,charactername,characterid,deliveredvehs) VALUES ('"..exports.mysql:escape_string(accountID).."','"..exports.mysql:escape_string(characterName).."','"..exports.mysql:escape_string(characterID).."','1')")
    end
    dbFree(updateOrInsert)




end
addEvent("onXmasVehicleDelivery", true)
addEventHandler("onXmasVehicleDelivery", resourceRoot, deliveredXmasVehicle)

function returnLastVehicleLocation()
    outputChatBox ( "#FFFFFFZajebal jau tu! #FF0000Beidz dzert alkoholu Ziemassvētkos! #FFFFFFEs jau teicu, ka nesen manīts netālu no: "..tostring(xmasVehicleSpawnPoints[activeXmasSpawnID][1]), client, 255, 255, 255, true )
end
addEvent("onCheckLastLocation", true)
addEventHandler("onCheckLastLocation", resourceRoot, returnLastVehicleLocation)