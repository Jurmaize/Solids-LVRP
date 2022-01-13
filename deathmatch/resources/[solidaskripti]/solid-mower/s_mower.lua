function completePay(client)
	local rate = math.random(rateFrom, rateTo)
	exports.global:giveMoney(client, rate) 
end

function payMowerDriver()
	local seat = getPedOccupiedVehicleSeat(client)
	if not seat or seat ~= 0 then
		return
	else 
		completePay(client)
	end
end
addEvent("payMower",true)
addEventHandler("payMower", root, payMowerDriver)