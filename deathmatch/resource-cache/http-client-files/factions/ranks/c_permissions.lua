local mem_permissions = {
	[1] = 	{"add_member",			"Uzaicināt biedru"},
	[2] = 	{"del_member",			"Izmest biedrus"},
	[3] = 	{"modify_ranks",		"Rediģēt rangus, atļaujas un algas"},
	[4] = 	{"modify_faction_note",	"Rediģēt frakcijas nosaukumu"},
	[5] = 	{"modify_factionl_note","Rediģēt frakcijas līdera piezīmi"},
	[6] = 	{"respawn_vehs",		"Atjaunot frakcijas auto"},
	[7] = 	{"change_member_rank",	"Paaugstināt/Pazemināt biedrus"},
	[8] = 	{"manage_interiors",	"Rediģet frakciajs interjerus"},
	[9] = 	{"manage_finance",		"Rediģēt frakcijas finanses"},
	[10] = 	{"toggle_chat",			"Ieslēgt/izslēgt frakcijas čatu"},
	[11] = 	{"modify_leader_note",	"Rediģēt līdera piezīmi"},
	[12] =  {"edit_motd", 			"Rediģēt dienas ziņu"},
	[13] = 	{"use_fl",				"Iespēja lietot /fl"},
	[14] = 	{"use_hq",				"Iespēja lietot /hq"},
	[15] = 	{"make_ads", 			"Veidot frakcijas sludinājumus"},
	[16] = 	{"modify_duty_settings","Rediģēt Duty"}, 	-- 16 and above are perms that do not exist for ALL factions
	[17] = 	{"set_member_duty",		"Uzlikt biedru Dutijus"}, 		-- If you add something you'll have to edit 'getFactionPermissions'
	[18] = 	{"see_towstats",		"Redzēt towstats"},
	}

-- Get Permissions
------------------->>
function hasMemberPermissionTo(player, fID, action)
	if (not player or not action or not fID) then return false end
	if (not isElement(player) or getElementType(player) ~= "player" or type(action) ~= "string") then return false end
	local fID = tonumber(fID)
	local rankID = 0
	local faction = getElementData(player, "faction")
	for i,v in pairs(faction) do
		if i == fID then
			rankID = tonumber(v.rank)
		end	
	end	
	local perm = factionRanks[rankID]["permissions"] or "" 
	if perm ~= true then 
		local perProfile = split(perm, ",")
		for i,v in ipairs(perProfile) do
			v = tonumber(v)
			if (mem_permissions[v][1] == action) then
				return true
			end
		end
	end	
	return false
end


-- Get Default Permissions
--------------------------->>

function getDefaultPermissionSet(permissions)
	if (not permissions or type(permissions) ~= "string") then return false end
	
	local permTable = {}
	if (permissions == "*") then		-- Founder/Leader Permissions
		for i=1,#mem_permissions do
			table.insert(permTable, i)
		end
		return permTable
	elseif (permissions == "New Member") then
		return {}
	end
end

