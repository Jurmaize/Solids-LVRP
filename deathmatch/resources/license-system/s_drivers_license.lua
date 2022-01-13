mysql = exports.mysql

function giveCarLicense(usingGC)
	if usingGC then
		local perk = exports.donators:getPerks(22)
		local success, reason = exports.donators:takeGC(client, perk[2])
		if success then
			exports.donators:addPurchaseHistory(client, perk[1], -perk[2])
		else
			exports.hud:sendBottomNotification(client, "CSDD", "Nespēja paņemt GC no Jūsu konta. Iemesls: "..reason.."." )
			return false
		end
	end
	
	local theVehicle = getPedOccupiedVehicle(client)
	exports.anticheat:changeProtectedElementDataEx(client, "realinvehicle", 0, false)
	removePedFromVehicle(client)
	if theVehicle then 
		respawnVehicle(theVehicle)
		exports.anticheat:changeProtectedElementDataEx(theVehicle, "handbrake", 1, false)
		setElementFrozen(theVehicle, true)
	end
	exports.anticheat:changeProtectedElementDataEx(client, "license.car", 1)
	dbExec(exports.mysql:getConn('mta'), "UPDATE characters SET car_license='1' WHERE id = ?", getElementData(client, 'dbid'))
	exports.hud:sendBottomNotification(client, "CSDD", "Apsveicam! Jūs esat veiksmīgi nokārtojis braukšanas eksāmenu!" )
	exports.global:giveItem(client, 133, getPlayerName(client):gsub("_"," "))
	executeCommandHandler("stats", client, getPlayerName(client))
end
addEvent("acceptCarLicense", true)
addEventHandler("acceptCarLicense", getRootElement(), giveCarLicense)

function passTheory( skipSQL )
	exports.anticheat:setEld( client, "license.car.cangetin", true, 'one' )
	exports.anticheat:setEld( client, "license.car", 3, 'one' ) -- Set data to "theory passed"
	if not skipSQL then
		dbExec( exports.mysql:getConn('mta'), "UPDATE characters SET car_license='3' WHERE id = ?", getElementData(client, 'dbid') )
	end
end
addEvent("theoryComplete", true)
addEventHandler("theoryComplete", getRootElement(), passTheory)

function checkDoLCars(player, seat)
	-- aka civilian previons
	if getElementData(source, "owner") == -2 and getElementData(source, "faction") == -1 and getElementModel(source) == 410 then
		if getElementData(player,"license.car") == 3 then
			if getElementData(player, "license.car.cangetin") then
				exports.hud:sendBottomNotification(player, "CSDD", "Jūs varat lietot 'J', lai iedarbinātu dzinēju un 'G', lai nolaistu rokasbremzi." )
				setVehicleLocked( source, false )
				setElementFrozen( source, false )
			else
				exports.hud:sendBottomNotification(player, "CSDD", "Šī automašīna ir domāta CSDD braukšanas eksāmenam. Lūdzu nolieciet teoriju iekš CSDD, lai vadītu šo auto." )
				cancelEvent()
			end
		elseif seat > 0 then
			exports.hud:sendBottomNotification(player, "CSDD", "Šī automašīna ir domāta CSDD braukšanas eksāmenam." )
			--cancelEvent()
		else
			exports.hud:sendBottomNotification(player, "CSDD", "Šī automašīna ir domāta CSDD braukšanas eksāmenam." )
			cancelEvent()
		end
	end
end
addEventHandler( "onVehicleStartEnter", getRootElement(), checkDoLCars)