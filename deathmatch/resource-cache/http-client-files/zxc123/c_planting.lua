local serverDistanceCheckForDrugType = {
    [1] = function(x,y,lowestZ, drugTypeID) triggerServerEvent("testDistanceToNearestPlant", localPlayer, x, y, lowestZ, drugTypeID) end,
    [2] = function(x,y,lowestZ, drugTypeID) triggerServerEvent("testDistanceToNearestPlant", localPlayer, x, y, lowestZ, drugTypeID) end,
}

local function checkPlantingLocation(drugTypeID)
    local allowedToPlantHere = false

    local x, y, z = getPositionFromElementOffset(localPlayer,0,1,0)
    local lowestZ = getGroundPosition(x,y,z) - 0.001 -- for processLineOfSight
    local hit, _, _, _, _, _, _, _, surface = processLineOfSight(x,y,z,x,y,lowestZ) -- This will get the material that the area is above.
    
    if hit then
        local groundMaterials = drugInfo[drugTypeID][4]
        for i=1, #groundMaterials do
            if groundMaterials[i] == surface then
                allowedToPlantHere = true
                break
            end
        end
        if allowedToPlantHere then
            serverDistanceCheckForDrugType[drugTypeID](x,y,lowestZ-0.3, drugTypeID)
        else
            outputChatBox("Vieta, kurā tu centies iestādīt narkotiku nav piemērota! Meiģini citā vietā!")
        end
    else
        outputChatBox("Kaut kas nogāja griezi! Paziņo šo skripterim ar kodu: SW:C:1") -- SW:C:1 Hit wasn't successful.
    end
end
addEvent("checkPlantingLocation", true)
addEventHandler("checkPlantingLocation", localPlayer, checkPlantingLocation)