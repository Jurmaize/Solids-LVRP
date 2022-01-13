
function clientTakeDrugs(drugType, amountInGrams)
	if not isPedDead(localPlayer) then
		currentGramCount = currentGramCount + amountInGrams
		if not drugTimer then
			local drugTimer = setTimer(function() currentGramCount = 0 end, timeTillDrugCounterResets, 1)
		else
			killTimer(drugTimer)
			local drugTimer = setTimer(function() currentGramCount = 0 end, timeTillDrugCounterResets, 1)
		end
		if currentGramCount > maxAmountOfGrams then
			outputChatBox("slikts effekts")
		else
			triggerServerEvent("soliddrugs:consumedrug", localPlayer, drugType, amountInGrams) -- Sakam servim, lai dod labos bonusiņus.
		end
	else
		outputChatBox("Tu nevari lietot narkotikas, kamēr esi miris!")
	end
end
addEvent("soliddrugs:clientTakeDrugs", true)
addEventHandler("soliddrugs:clientTakeDrugs", localPlayer, clientTakeDrugs)