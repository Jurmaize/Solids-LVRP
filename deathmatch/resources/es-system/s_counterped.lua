addEvent("lses:ped:start", true)
function lsesPedStart(pedName)
	exports['global']:sendLocalText(client, pedName.." saka: Labdien, kā varētu Jums palīdzēt šodien?", 255, 255, 255, 10)
end
addEventHandler("lses:ped:start", getRootElement(), lsesPedStart)

addEvent("lses:ped:help", true)
function lsesPedHelp(pedName)
	exports['global']:sendLocalText(client, pedName.." saka: Patiešām? Vienu brītiņu!", 255, 255, 255, 10)
	exports['global']:sendLocalText(client, pedName.." [RADIO]: Kādam vajag palīgā slimnīcas reģistratūrā!", 255, 255, 255, 10)
	for key, value in ipairs( exports.factions:getPlayersInFaction(2) ) do
		outputChatBox("[RADIO] Šis ir dispičeris, mums ir incidents, beidzu.", value, 0, 183, 239)
		outputChatBox("[RADIO] Situācija: Kādam nepieciešama palīdzība!, beidu.  ((" .. getPlayerName(client):gsub("_"," ") .. "))", value, 0, 183, 239)
		outputChatBox("[RADIO] Atrašanās vieta: Los Santos Glābšanas Dienesta reģistratūrā, beidzu.", value, 0, 183, 239)
	end
end
addEventHandler("lses:ped:help", getRootElement(), lsesPedHelp)

addEvent("lses:ped:appointment", true)
function lsesPedAppointment(pedName)
	exports['global']:sendLocalText(client, pedName.." saka: Es paziņošu, kam varēšu, lūdzu piesēdiet.", 255, 255, 255, 10)
	for key, value in ipairs( exports.factions:getPlayersInFaction(2) ) do
		outputChatBox("[RADIO] Reģistratūra šeit, mums ir kāds ieradies uz apmeklējumu, beidzu. ((" .. getPlayerName(client):gsub("_"," ") .. "))", value, 0, 183, 239)
		outputChatBox("[RADIO] Atrašanās vieta: Los Santos Glābšanas Dienesta reģistratūrā, beidzu.", value, 0, 183, 239)
	end
end
addEventHandler("lses:ped:appointment", getRootElement(), lsesPedAppointment)

function pedOutputChat(ped, chat, text, theClient, language)
	if not ped then return end
	if not client then client = theClient end
	if not client then return end
	if not tonumber(language) then language = 1 end
	if chat == "me" then
		local name = getElementData(ped, "name") or exports.global:getPlayerName(ped)
		local message = tostring(text)
		exports.global:sendLocalText(client, " *"..string.gsub(name, "_", " ")..( message:sub(1, 1) == "'" and "" or " ")..message, 255, 51, 102)
	elseif chat == "hospitalpa" then
		local name = getElementData(ped, "name") or exports.global:getPlayerName(ped)
		local message = tostring(text)
		exports['chat-system']:radio(ped, -5, message, chat)
	else
		exports['chat-system']:localIC(ped, tostring(text), language)
	end
end
addEvent("lses:ped:outputchat", true)
addEventHandler("lses:ped:outputchat", getResourceRootElement(), pedOutputChat)