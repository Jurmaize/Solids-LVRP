local markierisi = {
    {1897.011, -1169.386, 24.325,false},
    {1876.635, -1190.398, 22.501,false},
    {1865.375, -1211.661, 19.978,false},
    {1865.052, -1241.95, 14.601,false},
    {1893.697, -1243.254, 14.68,true},
    {1940.553, -1245.535, 18.783,false},
    {1958.19, -1230.323, 19.853,false},
    {1931.44, -1217.861, 20.052,false} -- 8
}

--[[{1902.617, -1230.279, 16.143,false},
    {1895.296, -1197.017, 21.259,true},
    {1912.057, -1167.028, 23.614,false},
    {1920.583, -1196.679, 20.24,false},
    {1941.216, -1178.217, 20.172,false},
    {1954.623, -1165.96, 20.617,false},
    {1933.68, -1150.086, 23.915,true},
    {1906.134, -1159.75, 24.068,false},
    {1987.263, -1164.559, 20.699,false},
    {2007.696, -1179.903, 20.335,false},
    {2014.943, -1215.524, 20.718,false},
    {1994.994, -1225.12, 20.341,false},
    {1993.142, -1243.16, 20.692,false},
    {2026.366, -1247.187, 23.545,false},
    {2048.01, -1243.292, 23.409,false},
    {2049.738, -1217.063, 23.461,false},
    {2032.275, -1201.1, 22.038,false},
    {2031.293, -1163.977, 22.163,false},
    {2050.517, -1148.623, 23.842,false},
    {2052.615, -1188.193, 23.747,false},
    {2051.302, -1225.267, 23.576,false},
    {2010.285, -1236.974, 21.918,false},
    {1938.026, -1233.72, 18.898,false},
    {1895.085, -1199.359, 20.844,false},
    {1889.776, -1160.948, 24.115,false}
    ]]

local currentCPType, marker_number = nil
local mowMarker, nextmowMarker = nil

function enterMower(thePlayer, seat)
    local vehicle = getPedOccupiedVehicle(getLocalPlayer())
    if seat == 0 and getElementModel(vehicle) == 572 then
        outputChatBox("Izmanto /startmow, lai uzsāktu pļaušanu.",255,255,255)
    end
end
addEventHandler("onClientVehicleEnter", getRootElement(), enterMower)

function cpcounter()
    outputChatBox("Cp: " .. currentCPType,255,255,255)
    outputChatBox("Marker number: " .. marker_number,255,255,255)
end
addCommandHandler("whatcp", cpcounter, false)

function startMowing()
    --local job = getElementData(getLocalPlayer(), "job")
    local vehicle = getPedOccupiedVehicle(getLocalPlayer())
    if vehicle and getVehicleController(vehicle) == getLocalPlayer() and getElementModel(vehicle) == 572 then

        local x,y,z = 1890.999, -1155.802, 24.224
        currentCPType = 0
        mowMarker = createMarker(x, y, z, "checkpoint", 4, 255, 200, 0, 150) -- start marker.

        addEventHandler("onClientMarkerHit", mowMarker, updateMowCheckpointCheck)

        local nx, ny, nz = markierisi[2][1], markierisi[2][2], markierisi[2][3]
        if (markierisi[2][4]==true) then
            nextmowMarker = createMarker( nx, ny, nz, "checkpoint", 2.5, 255, 0, 0, 150)
        else
            nextmowMarker = createMarker( nx, ny, nz, "checkpoint", 2.5, 255, 200, 0, 150) -- small yellow marker
        end

        marker_number = 0
        --exports.hud:sendBottomNotification(localPlayer, "Zemkopis", "Sekojiet marķeriem, lai nopļautu zāli!")
    else
        outputChatBox("Tu nēesi iekāpis pļāvējā!",255,255,255)
    end
end
addCommandHandler("startmow", startMowing, false)

function updateMowCheckpointCheck(thePlayer)
    if thePlayer == getLocalPlayer() then
        local vehicle = getPedOccupiedVehicle(thePlayer)
        if vehicle and getElementModel(vehicle) == 572 then
            if currentCPType == 3 then
                outputChatBox("Tu iebrauci sarkana cp: " .. currentCPType,255,255,255)
                -- pay player
                updateMowCheckpoint()
            elseif currentCPType == 2 then
                checkEndOfLine()
                outputChatBox("Tu iebrauci cp: " .. currentCPType,255,255,255)
            elseif currentCPType == 1 then
                 outputChatBox("Tu iebrauci sarkana cp: " .. currentCPType,255,255,255)
                 -- pay player
                updateMowCheckpoint()
            else
                updateMowCheckpoint()
                outputChatBox("Tu iebrauci dzeltanaja cp: " .. currentCPType,255,255,255)
            end
        else
            --exports.hud:sendBottomNotification(localPlayer, "Zemkopis", "Jums ir jāatrodas zāles pļāvējā, lai pļautu zāli!")
        end
    end
end

function updateMowCheckpoint()
    local max_markers = #markierisi
    local jaunais_markieris = marker_number+1 -- 5
    local nakosais_markieris = marker_number+2 -- 6
    local x, y, z = nil
    local nx, ny, nz = nil

    x = markierisi[jaunais_markieris][1]
    y = markierisi[jaunais_markieris][2]
    z = markierisi[jaunais_markieris][3]

    if (tonumber(max_markers-1) == tonumber(marker_number)) then
        setElementPosition(mowMarker, x, y, z)

        if (markierisi[jaunais_markieris][4] == true) then -- ja sarkanais markieris
            currentCPType = 2
            setMarkerColor(mowMarker, 255, 0, 0, 150)
        else -- parasts markieris
            currentCPType = 2
        end

        nx, ny, nz = 1890.999, -1155.802, 24.224 -- Depot start point
        setElementPosition(nextmowMarker, nx, ny, nz)
        setMarkerColor(nextmowMarker, 255, 0, 0, 150)
        setMarkerIcon(nextmowMarker, "finish")
    else

        nx = markierisi[nakosais_markieris][1]
        ny = markierisi[nakosais_markieris][2]
        nz = markierisi[nakosais_markieris][3]

        setElementPosition(mowMarker, x, y, z)
        setElementPosition(nextmowMarker, nx, ny, nz)

        if (markierisi[jaunais_markieris][4] == true) then -- ja sarkanais markieris
            currentCPType = 1
            setMarkerColor(mowMarker, 255, 0, 0, 150)
        else
            setMarkerColor(mowMarker, 255, 200, 0, 150)
            currentCPType = 0
        end
        if (markierisi[nakosais_markieris][4] == true) then -- ja sarkanais markieris
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
        local x,y,z = 1890.999, -1155.802, 24.224
        setElementPosition(mowMarker, x,y,z)
        setMarkerColor(mowMarker, 255, 0, 0, 150)
        setMarkerIcon(mowMarker,"Finish")
        currentCPType = 2
    else
        if mowMarker then
            destroyElement(mowMarker)
            mowMarker = nil
        end
        -- pay player
        --exports.hud:sendBottomNotification(localPlayer, "Zemkopis", "Zāle ir nopļauta! Vari sākt pļaut vēlreiz ar /startmow.")
    end
end