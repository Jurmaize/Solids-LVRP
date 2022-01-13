local currentCPType, marker_number = nil
local mowMarker, nextmowMarker = nil
local braucamaiscels = nil

function enterMower(vehicle, seat)
    if seat == 0 and getElementModel(vehicle) == mowerID then
        if not mowMarker then
            outputChatBox("Raksti /startmow, lai uzsāktu darbu!")
        end
    end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterMower)

addEventHandler("onClientResourceStart", getRootElement(),
    function (startedRes)
        exports.customblips:createCustomBlip(StartX, StartY, 20, 20, customBlipPath, 9999) -- Customblip resource function! Remove and change to normal one if you don't have the resource!
    end
);

function startMowing()
    local vehicle = getPedOccupiedVehicle(localPlayer)
    if mowMarker then
        exports.hud:sendBottomNotification(localPlayer, "Zāles pļāvējs", "Tu jau esi uzsācis darbu!")
    else
        if vehicle and getVehicleController(vehicle) == localPlayer and getElementModel(vehicle) == mowerID then
            routeNr = math.random( 1, #markierisi )
            route = markierisi[routeNr]

            local x,y,z = StartX, StartY, StartZ
            currentCPType = 0
            mowMarker = createMarker(x, y, z, "checkpoint", 4, 255, 200, 0, 150)

            addEventHandler("onClientMarkerHit", mowMarker, updateMowCheckpointCheck)

            local nx, ny, nz = markierisi[routeNr][1][1], markierisi[routeNr][1][2], markierisi[routeNr][1][3]
            if (markierisi[routeNr][2][4]==true) then
                nextmowMarker = createMarker( nx, ny, nz, "checkpoint", 2.5, 255, 0, 0, 150)
            else
                nextmowMarker = createMarker( nx, ny, nz, "checkpoint", 2.5, 255, 200, 0, 150)
            end

            marker_number = 0
            exports.hud:sendBottomNotification(localPlayer, "Zāles pļāvējs", "Seko marķieriem, lai notīrītu ceļu!")
        else
            exports.hud:sendBottomNotification(localPlayer, "Zāles pļāvējs", "Tu nevari nopļaut zāli, bez pļāvēja!")
        end
    end
end
addCommandHandler("startmow", startMowing, false)

function updateMowCheckpointCheck(thePlayer)
    if thePlayer == localPlayer then
        local vehicle = getPedOccupiedVehicle(thePlayer)
        if vehicle and getElementModel(vehicle) == mowerID then
            if currentCPType == 2 then
                checkEndOfLine()
            elseif currentCPType == 1 then
                triggerServerEvent("payMower", localPlayer, line, 0)
                updateMowCheckpoint()
            else
                updateMowCheckpoint()
            end
        else
            exports.hud:sendBottomNotification(localPlayer, "Zāles pļāvējs", "Tev ir jābūt pļāvējā, lai pļautu zāli!")
        end
    end
end

function updateMowCheckpoint()
    local max_markers = #markierisi[routeNr]
    local jaunais_markieris = marker_number+1
    local nakosais_markieris = marker_number+2
    local x, y, z = nil
    local nx, ny, nz = nil

    x = markierisi[routeNr][jaunais_markieris][1]
    y = markierisi[routeNr][jaunais_markieris][2]
    z = markierisi[routeNr][jaunais_markieris][3]

    if (tonumber(max_markers-1) == tonumber(marker_number)) then
        setElementPosition(mowMarker, x, y, z)

        if (markierisi[routeNr][jaunais_markieris][4] == true) then
            currentCPType = 2
            setMarkerColor(mowMarker, 255, 0, 0, 150)
        else
            currentCPType = 2
        end

        nx, ny, nz = StartX, StartY, StartZ
        setElementPosition(nextmowMarker, nx, ny, nz)
        setMarkerColor(nextmowMarker, 255, 0, 0, 150)
        setMarkerIcon(nextmowMarker, "finish")
    else

        nx = markierisi[routeNr][nakosais_markieris][1]
        ny = markierisi[routeNr][nakosais_markieris][2]
        nz = markierisi[routeNr][nakosais_markieris][3]

        setElementPosition(mowMarker, x, y, z)
        setElementPosition(nextmowMarker, nx, ny, nz)

        if (markierisi[routeNr][jaunais_markieris][4] == true) then
            currentCPType = 1
            setMarkerColor(mowMarker, 255, 0, 0, 150)
        else
            setMarkerColor(mowMarker, 255, 200, 0, 150)
            currentCPType = 0
        end
        if (markierisi[routeNr][nakosais_markieris][4] == true) then
            setMarkerColor(nextmowMarker, 255, 0, 0, 150)
        else
            setMarkerColor(nextmowMarker, 255, 200, 0, 150)
        end
    end
    marker_number = marker_number+1
end

function checkEndOfLine()
    if nextmowMarker then
        destroyElement(nextmowMarker)
        nextmowMarker = nil
        local x,y,z = StartX, StartY, StartZ
        setElementPosition(mowMarker, x,y,z)
        setMarkerColor(mowMarker, 255, 0, 0, 150)
        setMarkerIcon(mowMarker,"Finish")
        currentCPType = 2
    else
        if mowMarker then
            destroyElement(mowMarker)
            mowMarker = nil
        end
        triggerServerEvent("payMower", localPlayer, line, 0)
        exports.hud:sendBottomNotification(localPlayer, "Zāles pļāvējs", "Zāle ir nopļauta! Tu vari uzsākt pļaušanu vēlreiz, rakstot /startmow")
        local braucamaiscels = nil
    end
end