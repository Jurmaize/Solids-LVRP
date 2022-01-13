function tryLuck(thePlayer, commandName , pa1, pa2)
	local p1, p2, p3 = nil
	p1 = tonumber(pa1)
	p2 = tonumber(pa2)
	if pa1 == nil and pa2 == nil and pa3 == nil then
		exports.global:sendLocalText(thePlayer, "((OOC Veiksme)) "..getPlayerName(thePlayer):gsub("_", " ").." meiģina savu veiksmi no 1 līdz 100 un iegūst "..math.random(100)..".", 255, 51, 102, 30, {}, true)
	elseif pa1 ~= nil and p1 ~= nil and pa2 == nil then
		exports.global:sendLocalText(thePlayer, "((OOC Veiksme)) "..getPlayerName(thePlayer):gsub("_", " ").." meiģina savu veiksmi no 1 līdz "..p1.." un iegūst "..math.random(p1)..".", 255, 51, 102, 30, {}, true)
	else
		outputChatBox("SYNTAX: /" .. commandName.."                  - Iegūsti ciparu uz dullo no 1 līdz 100", thePlayer, 255, 194, 14)
		outputChatBox("SYNTAX: /" .. commandName.." [max]         - Iegūsti ciparu uz dullo no 1 līdz [max]", thePlayer, 255, 194, 14)
	end
end
addCommandHandler("luck", tryLuck)

function tryChance(thePlayer, commandName , pa1, pa2)
	local p1, p2, p3 = nil
	p1 = tonumber(pa1)
	p2 = tonumber(pa2)
	if pa1 ~= nil then 
		if pa2 == nil and p1 ~= nil then
			if p1 <= 100 and p1 >=0 then
				if math.random(100) >= p1 then
					exports.global:sendLocalText(thePlayer, "((OOC Iespēja ar "..p1.."%)) "..getPlayerName(thePlayer):gsub("_", " ").." meiģinājums neizdevās.", 255, 51, 102, 30, {}, true)
				else
					exports.global:sendLocalText(thePlayer, "((OOC Iespēja ar "..p1.."%)) "..getPlayerName(thePlayer):gsub("_", " ").." meiģinājums izdevās.", 255, 51, 102, 30, {}, true)
				end
			else
				outputChatBox("Iespējai jābūt no 0 līdz 100%.", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("SYNTAX: /" .. commandName.." [0-100%]                 - Iespēja, ka tev izdosies ar procentiem [0-100%]", thePlayer, 255, 194, 14)
		end
	else
		outputChatBox("SYNTAX: /" .. commandName.." [0-100%]                 - Iespēja, ka tev izdosies ar procentiem [0-100%]", thePlayer, 255, 194, 14)
	end
end
addCommandHandler("chance", tryChance)

function oocCoin(thePlayer)
	if  math.random( 1, 2 ) == 2 then
		exports.global:sendLocalText(thePlayer, " ((OOC Monēta)) " .. getPlayerName(thePlayer):gsub("_", " ") .. " uzmet monētu, tā nokrīt uz ģerboņa.", 255, 51, 102)
	else
		exports.global:sendLocalText(thePlayer, " ((OOC Monēta)) " .. getPlayerName(thePlayer):gsub("_", " ") .. " uzmet monētu, tā nokrit uz cipara.", 255, 51, 102)
	end
end
addCommandHandler("flipcoin", oocCoin)