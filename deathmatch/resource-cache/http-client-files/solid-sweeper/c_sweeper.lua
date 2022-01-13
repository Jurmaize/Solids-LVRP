local currentCPType, marker_number = nil
local sweeperMarker, nextsweeperMarker = nil
local braucamaiscels = nil

function enterSweeper(vehicle, seat)
    local vehicle = getPedOccupiedVehicle(source)
    if seat == 0 and getElementModel(vehicle) == sweeperID then
        if not sweeperMarker then
            outputChatBox("Raksti /startsweeping, lai uzsāktu ielu tīrīšanu!")
        end
    end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterSweeper)

addEventHandler("onClientResourceStart", root,
    function (startedRes)
        exports.customblips:createCustomBlip(blipx,blipy, 20, 20, "blips/sweeper.png", 9999);
    end
);

function startSweeping()
    local vehicle = getPedOccupiedVehicle(localPlayer)
    if sweeperMarker then
        exports.hud:sendBottomNotification(localPlayer, "Ielas tīrītājs", "Jūs jau esat uzsācis ielas tīrīšanas darbu!")
    else
        if vehicle and getVehicleController(vehicle) == localPlayer and getElementModel(vehicle) == sweeperID then
            routeNr = math.random( 1, #markierisi )
            route = markierisi[routeNr]

            local x,y,z = StartX, StartY, StartZ
            currentCPType = 0
            sweeperMarker = createMarker(x, y, z, "checkpoint", 4, 255, 200, 0, 150)

            addEventHandler("onClientMarkerHit", sweeperMarker, updateSweeperCheckpointCheck)

            local nx, ny, nz = markierisi[routeNr][1][1], markierisi[routeNr][1][2], markierisi[routeNr][1][3]
            if (markierisi[routeNr][2][4]==true) then
                nextsweeperMarker = createMarker( nx, ny, nz, "checkpoint", 2.5, 255, 0, 0, 150)
            else
                nextsweeperMarker = createMarker( nx, ny, nz, "checkpoint", 2.5, 255, 200, 0, 150)
            end

            marker_number = 0
            exports.hud:sendBottomNotification(localPlayer, "Ielas tīrītājs", "Sekojiet marķieriem, lai notīrītu ielu!")
        else
            exports.hud:sendBottomNotification(localPlayer, "Ielas tīrītājs", "Tu nevari tīrīt ielu, bez ielu tīrītāja!")
        end
    end
end
addCommandHandler("startsweeping", startSweeping, false)

function updateSweeperCheckpointCheck(thePlayer)
    if thePlayer == localPlayer then
        local vehicle = getPedOccupiedVehicle(thePlayer)
        if vehicle and getElementModel(vehicle) == sweeperID then
            if currentCPType == 2 then
                checkEndOfLine()
            elseif currentCPType == 1 then
                triggerServerEvent("paySweeper", localPlayer, line, 0)
                updateSweeperCheckpoint()
            else
                updateSweeperCheckpoint()
            end
        else
            exports.hud:sendBottomNotification(localPlayer, "Ielas tīrītājs", "Jums ir jāatrodas ielas tīrīšanas auto, lai tīrītu ielas!")
        end
    end
end

function updateSweeperCheckpoint()
    local max_markers = #markierisi[routeNr]
    local jaunais_markieris = marker_number+1
    local nakosais_markieris = marker_number+2
    local x, y, z = nil
    local nx, ny, nz = nil

    x = markierisi[routeNr][jaunais_markieris][1]
    y = markierisi[routeNr][jaunais_markieris][2]
    z = markierisi[routeNr][jaunais_markieris][3]

    if (tonumber(max_markers-1) == tonumber(marker_number)) then
        setElementPosition(sweeperMarker, x, y, z)

        if (markierisi[routeNr][jaunais_markieris][4] == true) then
            currentCPType = 2
            setMarkerColor(sweeperMarker, 255, 0, 0, 150)
        else
            currentCPType = 2
        end

        nx, ny, nz = StartX, StartY, StartZ
        setElementPosition(nextsweeperMarker, nx, ny, nz)
        setMarkerColor(nextsweeperMarker, 255, 0, 0, 150)
        setMarkerIcon(nextsweeperMarker, "finish")
    else

        nx = markierisi[routeNr][nakosais_markieris][1]
        ny = markierisi[routeNr][nakosais_markieris][2]
        nz = markierisi[routeNr][nakosais_markieris][3]

        setElementPosition(sweeperMarker, x, y, z)
        setElementPosition(nextsweeperMarker, nx, ny, nz)

        if (markierisi[routeNr][jaunais_markieris][4] == true) then
            currentCPType = 1
            setMarkerColor(sweeperMarker, 255, 0, 0, 150)
        else
            setMarkerColor(sweeperMarker, 255, 200, 0, 150)
            currentCPType = 0
        end
        if (markierisi[routeNr][nakosais_markieris][4] == true) then
            setMarkerColor(nextsweeperMarker, 255, 0, 0, 150)
        else
            setMarkerColor(nextsweeperMarker, 255, 200, 0, 150)
        end
    end
    marker_number = marker_number+1
end

function checkEndOfLine()
    if nextsweeperMarker then
        destroyElement(nextsweeperMarker)
        nextsweeperMarker = nil
        local x,y,z = StartX, StartY, StartZ
        setElementPosition(sweeperMarker, x,y,z)
        setMarkerColor(sweeperMarker, 255, 0, 0, 150)
        setMarkerIcon(sweeperMarker,"Finish")
        currentCPType = 2
    else
        if sweeperMarker then
            destroyElement(sweeperMarker)
            sweeperMarker = nil
        end
        triggerServerEvent("paySweeper", localPlayer, line, 0)
        exports.hud:sendBottomNotification(localPlayer, "Ielas tīrītājs", "Iela ir notīrīta! Vari uzsākt jaunu maršrutu rakstot /startsweeping.")
        local braucamaiscels = nil
    end
end