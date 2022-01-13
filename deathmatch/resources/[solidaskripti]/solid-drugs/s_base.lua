local function triggerClientGuiForDrug(playerSource, commandName, drugType)
	if drugTypes[drugType] then
		local drugTypeID = drugTypes[drugType]
		local closestObject = getNearestObject(playerSource, 10)
		if getElementModel(closestObject) == drugInfo[drugTypeID][2] then
			triggerClientEvent( playerSource, "drawClientDrugGUI", playerSource, drugTypeID, closestObject)
		else
			outputChatBox("Tev tuvākais objekts nav šī veida narkotiku objekts! Lūdzu pieej klāt narkotikām tuvāk un meiģini vēlreiz!", playerSource)
		end
	else
		outputChatBox("Nederīgs narkotiku tips komandā! /checkdrug (weed/shrooms/cocaine)", playerSource)
	end
end
addCommandHandler("checkdrug", triggerClientGuiForDrug, false, true)