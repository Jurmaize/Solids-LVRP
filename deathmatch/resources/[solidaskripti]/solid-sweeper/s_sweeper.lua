function completePay(client)
	local rate = math.random(rateFrom, rateTo)
	exports.global:giveMoney(client, rate) 
end

function paySweeperDriver()
	local seat = getPedOccupiedVehicleSeat(client)
	if not seat or seat ~= 0 then
		return
	else 
		completePay(client)
	end
end
addEvent("paySweeper",true)
addEventHandler("paySweeper", root, paySweeperDriver)