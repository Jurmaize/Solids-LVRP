loadstring(exports.dgs:dgsImportFunction())() -- loading DGS

local function enterBolt(theVehicle)
	if getElementModel(theVehicle) == scooterModelID then
		setElementData(theVehicle, "sveiki11111111111111111", "999999999999")
	end
end
addEventHandler("onClientPlayerVehicleEnter", localplayer, enterBolt)