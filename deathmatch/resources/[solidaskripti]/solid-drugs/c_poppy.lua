function drawPoppyGUI(poppyObject)
    if isGUImade then
        local poppyInformation = drugInfo[3]

        local humidity = getElementData(poppyObject, "soliddrugs:humidity")
        local growthStage = getElementData(poppyObject, "soliddrugs:growthstage")
        local isReadyToHarvest = getElementData(poppyObject, "soliddrugs:readytoharvest")

        dgsCreateImage(0.05,0.085, 0.45, 0.6, "images/poppy"..growthStage..".png", true, infoTab)

        local x = 0.22
        local y = 0.62
        local width = 0.2
        local height = 0.1
        dgsCreateLabel(x,y,width,height, "Poppy augs ir "..tostring(growthStage).." stadijā.", true, infoTab)

        x = 0.75
        y = 0.1
        width = 0.15
        height = 0.23
        local humidityMinusTwentyPercent = poppyInformation[5] - poppyInformation[5] * 0.2
        if (humidity > humidityMinusTwentyPercent) and (humidity < poppyInformation[5]) then
            dgsCreateImage(x,y,width,height, "images/water1.png", true, infoTab)
        elseif (humidity > poppyInformation[6]) and (humidity < humidityMinusTwentyPercent) then
            dgsCreateImage(x,y,width,height, "images/water2.png", true, infoTab)
        elseif (humidity > humidityMinusTwentyPercent) and (humidity < poppyInformation[5]) then
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
                triggerServerEvent("waterDrug", localPlayer, poppyObject, 3)
        end, false)

        if isReadyToHarvest then
            x = 0.774
            y = 0.8
            width = 0.1
            height = 0.1
            local waterPlantButton = dgsCreateButton(x,y,width,height, "Novākt", true, infoTab)
            addEventHandler("onDgsMouseClickUp", waterPlantButton, function() 
                triggerServerEvent("harvestPoppy", localPlayer, poppyObject)
            end, false)

            x = 0.75
            y = 0.55
            width = 0.12
            height = 0.22
            dgsCreateImage(x,y,width,height, "images/harvest.png", true, infoTab)
        end
    end
end