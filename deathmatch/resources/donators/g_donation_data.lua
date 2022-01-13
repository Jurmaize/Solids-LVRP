-- Chooseable phone numbers
function checkValidNumber(number, specialPhone)
	if type(number) ~= "number" then
		return false, "Nederīgs nummurs"
	end
	
	if number ~= math.ceil(number) then
		return false, "Nederīgs nummurs"
	end
	
	if specialPhone then
		if number < 10000 then
			return false, "Nummurs ir pārāk īss"
		end
	else
		if number < 100000 then
			return false, "Nummurs ir pārāk īss"
		end
	end
	
	if number > 999999999 then
		return false, "Nummurs ir pārāk liels"
	end
	
	if not specialPhone then
		-- enforce at least two different digits
		local str = tostring(number)
		local first = str:sub(1,1)
		for i = 2, #str do
			if str:sub(i, i) ~= first then
				return true
			end
		end
		return false, "Nummuram nepieciešami divi dažādi cipari"
	end
	
	return true
end


function checkValidUsername(username)
	if not username or username == "" then
		return false, "Lūdzu ievadiet jauno lietotāju."
	elseif string.len(username) < 3 then
		return false, "Lietotājam jābūt vismaz 3 burtus garam."
	elseif string.match(username,"%W") then
		return false, "\"!@#$\"%'^&*()\" simboli nav atļauti."
	end
	return true, "Izskatās labi :)!"
end

function hasPlayerPerk(targetPlayer, perkID)
	if not isElement( targetPlayer ) then
		return false
	end
	
	if not tonumber(perkID) then
		return false
	end
	
	perkID = tonumber(perkID)
	
	if perkID == 1 and exports.global:isStaffOnDuty(targetPlayer) then
		return true, getElementData(targetPlayer, "pmblocked")
	end
	
	local perkTable = getElementData(targetPlayer, "donation-system:perks")
	if not (perkTable) then
		return false
	end
	
	if (perkTable[perkID] == nil) then
		return false
	end

	
	return true, perkTable[perkID]
end


