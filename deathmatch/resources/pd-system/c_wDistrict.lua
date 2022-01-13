local shots = 0
local weapons = {
	[22] = "pistoles",
	--[23] = "pistol", Disabled cus silenced brah
	[24] = "pistoles",
	[25] = "bises",
	[26] = "bises",
	[27] = "bises",
	[28] = "ložmetēja",
	[29] = "ložmetēja",
	[32] = "ložmetēja",
	[30] = "triecienšautenes",
	[31] = "triecienšautenes",
	[33] = "bultskrūves šautene",
	[34] = "bultskrūves šautene",
	[35] = "BAZUKAS",
}

addEventHandler ( "onClientPlayerWeaponFire", localPlayer,
	function ( weapon )
		if weapons[weapon] then
			-- PAINTBALL
			if getElementData(localPlayer, "paintball") == 2 then
				return
			end
			-- ^^

			if weapon == 24 and getElementData(localPlayer, "deaglemode") == 0 then
				return
			else
				if shots < 1 then
					shots = shots + 1
				elseif shots >= 1 then
					if not isTimer ( shotTimer ) then
						shots = 0
						shotTimer = setTimer ( function ( ) end, 60000, 1 )
						
						triggerServerEvent ( "weaponDistrict:doDistrict", localPlayer, weapons[weapon] )
					end
				end
			end
		end
	end )