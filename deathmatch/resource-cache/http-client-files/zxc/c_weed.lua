function drawWeedGUI(weedObject)
    if isGUImade then
        local weedInformation = drugInfo[1]

        local humidity = getElementData(weedObject, "soliddrugs:humidity")
        local growthStage = getElementData(weedObject, "soliddrugs:growthstage")
        local isReadyToHarvest = getElementData(weedObject, "soliddrugs:readytoharvest")

        dgsCreateImage(0.05,0.085, 0.45, 0.6, "images/weed"..growthStage..".png", true, infoTab)

        local x = 0.22
        local y = 0.62
        local width = 0.2
        local height = 0.1
        dgsCreateLabel(x,y,width,height, "Marihuāna ir "..tostring(growthStage).." stadijā.", true, infoTab)

        x = 0.75
        y = 0.1
        width = 0.15
        height = 0.23
        local humidityMinusTwentyPercent = weedInformation[5] - weedInformation[5] * 0.2
        if (humidity > humidityMinusTwentyPercent) and (humidity < weedInformation[5]) then
            dgsCreateImage(x,y,width,height, "images/water1.png", true, infoTab)
        elseif (humidity > weedInformation[6]) and (humidity < humidityMinusTwentyPercent) then
            dgsCreateImage(x,y,width,height, "images/water2.png", true, infoTab)
        elseif (humidity > humidityMinusTwentyPercent) and (humidity < weedInformation[5]) then
            dgsCreateImage(x,y,width,height, "images/water3.png", true, infoTab)
        else
            dgsCreateImage(x,y,width,height, "images/water4.png", true, infoTab)
        end

        x = 0.774
        y = 0.35
        width = 0.1
        height = 0.1
        local waterPlantButton = dgsCreateButton(x,y,width,height, "Aplaistīt augu", true, infoTab)
        addEventHandler("onDgsMouseClickUp", waterPlantButton, function() 
                triggerServerEvent("waterDrug", localPlayer, weedObject, 1)
        end, false)

        if isReadyToHarvest then
            x = 0.774
            y = 0.8
            width = 0.1
            height = 0.1
            local waterPlantButton = dgsCreateButton(x,y,width,height, "Novākt", true, infoTab)
            addEventHandler("onDgsMouseClickUp", waterPlantButton, function() 
                triggerServerEvent("harvestWeed", localPlayer, weedObject)
            end, false)

            x = 0.75
            y = 0.55
            width = 0.12
            height = 0.22
            dgsCreateImage(x,y,width,height, "images/harvest.png", true, infoTab)
        end
        --triggerEvent("hud:convertUI", localPlayer, baseWindow) -- Owl gaming built in event that quickly re-draws menus in a new style. Remove it if you don't have it.
    end
end