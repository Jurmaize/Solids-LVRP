addEvent("computers:on", true)
addEventHandler("computers:on", root,
	function()
		triggerEvent("sendAme",  client, "ieslēdz datoru.")
	end
)
