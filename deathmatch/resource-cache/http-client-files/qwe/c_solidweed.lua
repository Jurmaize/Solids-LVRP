-- All ground material ID's where it's allowed to plant weed in.
local allowedToPlant = {6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 20, 80, 81, 82, 115, 116, 117, 118, 119, 120, 121, 122, 125, 146,
147, 148, 149, 150, 151, 152, 153, 160, 19, 22, 24,25,26,27,40,83,84,87,88,110,123,124,126,128,129,130,132,133,145, 23, 41, 111, 112, 113, 114}

function drawWeedGUI(weedObject)
    if isGUImade then
        
        local humidity = getElementData(weedObject, "solidweed:humidity")
        local growthStage = getElementData(weedObject, "solidweed:growthstage")
        local isReadyToHarvest = getElementData(weedObject, "solidweed:readytoharvest")

        guiCreateStaticImage(0.05,0.085, 0.45, 0.6, "images/weed"..growthStage..".png", true, infoTab)

        local x = 0.22
        local y = 0.62
        local width = 0.2
        local height = 0.1
        guiCreateLabel(x,y,width,height, "Marihuāna ir "..tostring(growthStage).." stadijā.", true, infoTab)

        x = 0.75
        y = 0.1
        width = 0.15
        height = 0.23
        local humidityMinusTwentyPercent = maxHumidity - maxHumidity * 0.2
        if (humidity > humidityMinusTwentyPercent) and (humidity < maxHumidity) then
            guiCreateStaticImage(x,y,width,height, "images/water1.png", true, infoTab)
        elseif (humidity > minHumidityForGrowth) and (humidity < humidityMinusTwentyPercent) then
            guiCreateStaticImage(x,y,width,height, "images/water2.png", true, infoTab)
        elseif (humidity > humidityMinusTwentyPercent) and (humidity < maxHumidity) then
            guiCreateStaticImage(x,y,width,height, "images/water3.png", true, infoTab)
        else
            guiCreateStaticImage(x,y,width,height, "images/water4.png", true, infoTab)
        end

        x = 0.774
        y = 0.35
        width = 0.1
        height = 0.1
        local waterPlantButton = guiCreateButton(x,y,width,height, "Aplaistīt augu", true, infoTab)
        addEventHandler("onClientGUIClick", waterPlantButton, function() 
                triggerServerEvent("waterWeed", resourceRoot, weedObject)
        end, false)

        if isReadyToHarvest then
            x = 0.774
            y = 0.8
            width = 0.1
            height = 0.1
            local waterPlantButton = guiCreateButton(x,y,width,height, "Novākt", true, infoTab)
            addEventHandler("onClientGUIClick", waterPlantButton, function() 
                triggerServerEvent("harvestWeed", resourceRoot, weedObject)
            end, false)

            x = 0.75
            y = 0.55
            width = 0.12
            height = 0.22
            guiCreateStaticImage(x,y,width,height, "images/harvest.png", true, infoTab)
        end
        triggerEvent("hud:convertUI", localPlayer, baseWindow) -- Owl gaming built in event that quickly re-draws menus in a new style. Remove it if you don't have it.
    end
end

function removeInfoMsg(msg, windowToRemoveFrom)
    if windowToRemoveFrom then
        destroyElement(msg)
    end
end

function checkPlantingLocation(playerToCheck)
    local allowedToPlantHere = false

    local x, y, z = getPositionFromElementOffset(playerToCheck,0,1,0)
    local lowestZ = getGroundPosition(x,y,z) - 0.001 -- for processLineOfSight
    local hit, _, _, _, _, _, _, _, surface = processLineOfSight(x,y,z,x,y,lowestZ) -- This will get the material that the area is above.
    
    if hit then
        for i=1, #allowedToPlant do
            if allowedToPlant[i] == surface then
                allowedToPlantHere = true
                break
            end
        end
        if allowedToPlantHere then
            triggerServerEvent("testDistanceToNearestWeedPlant", resourceRoot, x, y, lowestZ-0.3)
        else
            outputChatBox("Vieta, kurā tu centies iestādīt marihuānu nav piemērota! Ieteicams meiģināt melnzemē, zālē utt.")
        end
    else
        outputChatBox("Kaut kas nogāja griezi! Paziņo šo skripterim ar kodu: SW:C:1") -- SW:C:1 Hit wasn't successful.
    end
end
addEvent("checkPlantingLocation", true)
addEventHandler("checkPlantingLocation", resourceRoot, checkPlantingLocation)