local spawnX, spawnY, spawnZ = 1959.55, -1714.46, 10
function joinHandler()
	spawnPlayer(source, spawnX, spawnY, spawnZ)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox("Welcome to My Server", source)
end
addEventHandler("onPlayerJoin", getRootElement(), joinHandler)

function createVehicleForPlayer(thePlayer, command, vehicleModel)
	local x,y,z = getElementPosition(thePlayer) -- get the position of the player
	x = x + 5 -- add 5 units to the x position
	local createdVehicle = createVehicle(tonumber(vehicleModel),x,y,z)
	-- check if the return value was ''false''
	if (createdVehicle == false) then
		-- if so, output a message to the chatbox, but only to this player.
		outputChatBox("Failed to create vehicle.",thePlayer)
	end
end
addCommandHandler("createvehicle", createVehicleForPlayer)