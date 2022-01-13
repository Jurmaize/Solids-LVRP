function displayLoadedRes (startedResource)
	if startedResource == getThisResource() then
		getOnlineAdmins()
	end
end
addEventHandler ( "onResourceStart", root, displayLoadedRes )

function getOnlineAdmins()
	for k,v in ipairs ( getElementsByType("player") ) do
		local acc = getPlayerAccount(v)
		if acc and not isGuestAccount(acc) then
			local accName = getAccountName(acc)

			for i=0, #staffRanks do
				if isObjectInACLGroup("user."..accName,aclGetGroup(staffRanks[i])) then
					staff[staffRanks[i]] = staff[staffRanks[i]] + 1
				end
			end

		end
	end
end

addCommandHandler("admins",function(p)
	local Admins = getOnlineAdmins() -- the function will return 1 table
	if #Admins ~= 0 then -- if the admins table not empty then
		outputChatBox("Online Admins",p,255,0,0,true) 
		for k,v in ipairs ( Admins ) do -- loop the table
			outputChatBox("- "..getPlayerName(v),p,255,0,0,true) -- output the player name
		end
	else
		outputChatBox("There are no admins online", playerSource)
	end
end )