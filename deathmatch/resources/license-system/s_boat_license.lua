function giveBoatLicense(usingGC)
	if usingGC then
		local perk = exports.donators:getPerks(22)
		local success, reason = exports.donators:takeGC(client, perk[2])
		if success then
			exports.donators:addPurchaseHistory(client, perk[1], -perk[2])
		else
			exports.hud:sendBottomNotification(client, "CSDD", "Diemžēl mēs nevarējām noņemt GC no Jūsu konta. Iemesls: "..reason.."." )
			return false
		end
	end	
	
	dbExec(exports.mysql:getConn('mta'), "UPDATE characters SET boat_license='1' WHERE id = ?", getElementData(client, 'dbid'))
	exports.anticheat:changeProtectedElementDataEx(client, "license.boat", 1)
	exports.hud:sendBottomNotification(client, "CSDD", "Apsveicam! Jūs esat licenzēts kuģu kapitāns!" )
	exports.global:giveItem(client, 155, getPlayerName(client):gsub("_"," "))
	executeCommandHandler("stats", client, getPlayerName(client))
end
addEvent("acceptBoatLicense", true)
addEventHandler("acceptBoatLicense", getRootElement(), giveBoatLicense)