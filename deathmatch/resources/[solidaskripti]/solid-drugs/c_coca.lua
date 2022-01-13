function drawCocaGUI(cocaObject)
    if isGUImade then
        local cocaInformation = drugInfo[2]

        local humidity = getElementData(cocaObject, "soliddrugs:humidity")
        local growthStage = getElementData(cocaObject, "soliddrugs:growthstage")
        local isReadyToHarvest = getElementData(cocaObject, "soliddrugs:readytoharvest")

        dgsCreateImage(0.05,0.085, 0.35, 0.5, "images/cocaaugs.png", true, infoTab)

        local x = 0.22
        local y = 0.62
        local width = 0.2
        local height = 0.1
        dgsCreateLabel(x,y,width,height, "Coca augs ir "..tostring(growthStage).." stadijā.", true, infoTab)

        x = 0.75
        y = 0.1
        width = 0.15
        height = 0.23
        local humidityMinusTwentyPercent = cocaInformation[5] - cocaInformation[5] * 0.2
        if (humidity > humidityMinusTwentyPercent) and (humidity < cocaInformation[5]) then
            dgsCreateImage(x,y,width,height, "images/water1.png", true, infoTab)
        elseif (humidity > cocaInformation[6]) and (humidity < humidityMinusTwentyPercent) then
            dgsCreateImage(x,y,width,height, "images/water2.png", true, infoTab)
        elseif (humidity > humidityMinusTwentyPercent) and (humidity < cocaInformation[5]) then
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
                triggerServerEvent("waterDrug", localPlayer, cocaObject, 2)
        end, false)

        if isReadyToHarvest then
            x = 0.774
            y = 0.8
            width = 0.1
            height = 0.1
            local waterPlantButton = dgsCreateButton(x,y,width,height, "Novākt", true, infoTab)
            addEventHandler("onDgsMouseClickUp", waterPlantButton, function() 
                triggerServerEvent("harvestCoca", localPlayer, cocaObject)
            end, false)

            x = 0.75
            y = 0.55
            width = 0.12
            height = 0.22
            dgsCreateImage(x,y,width,height, "images/harvest.png", true, infoTab)
        end
    end
end