
local takeDrug = {
	[0] = function(thePlayer, grams)
	
	end,
	[1] = function(thePlayer, grams) -- Jāsafixo weeds
		--exports.global:takeItem(thePlayer, cocaineItemID, grams)
		--giveHealthAfterDrugs(thePlayer, grams)
	end,
	[2] = function(thePlayer, grams)
		exports.global:takeItem(thePlayer, cocaineItemID, grams)				-- Dod armor, noņem itemu, vajag sačinīts effektus un negatīvos.
		giveHealthAfterDrugs(thePlayer, grams)
		giveArmorAfterDrugs(thePlayer, grams)
	end,
	[3] = function(thePlayer, grams)
		exports.global:takeItem(thePlayer, heroinItemID)
		giveArmorAfterDrugs(thePlayer, grams)
	end,
}

function consumeDrug(drugType, grams)
	takeDrug[drugType](client, grams)
end
addEvent("soliddrugs:consumedrug", true)
addEventHandler("soliddrugs:consumedrug", root, consumeDrug)

function giveHealthAfterDrugs(thePlayer, grams)					-- Give Health function
	local hpToGive = grams * hpDrugModifier
	local currentHealth = getElementHealth(thePlayer)
	local finalHealth = currentHealth + hpToGive
	if finalHealth > 100 then
		setElementHealth(thePlayer, 100)
	else
		setElementHealth(thePlayer,finalHealth)
	end

	outputChatBox("Iedevu hp", thePlayer)
end

function giveArmorAfterDrugs(thePlayer, grams)					-- Give Armor function
	local armorToGive = grams * armorDrugModifier
	local currentArmor = getPedArmor(thePlayer)
	local finalArmor = currentArmor + armorToGive
	if finalArmor > maxArmorFromDrugs then
		setPedArmor(thePlayer, maxArmorFromDrugs)
	else
		setPedArmor(thePlayer, finalArmor)
	end

	outputChatBox("Iedevu armor", thePlayer)
end

function takeHealthAfterDrugs(thePlayer, grams)
	local hpToTake = grams * hpDrugModifier
	local currentHealth = getElementHealth(thePlayer)
	local finalHealth = currentHealth - hpToTake
	if finalHealth > 100 then
		setElementHealth(thePlayer, 100)
	else
		setElementHealth(thePlayer,finalHealth)
	end

	outputChatBox("Iedevu hp", thePlayer)
end