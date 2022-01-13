function cPayDay(faction, pay, profit, interest, donatormoney, tax, incomeTax, vtax, ptax, rent, totalInsFee, grossincome, Perc)
	local cPayDaySound = playSound("mission_accomplished.mp3")
	local bankmoney = getElementData(getLocalPlayer(), "bankmoney")
	local moneyonhand = getElementData(getLocalPlayer(), "money")
	local wealthCheck = moneyonhand + bankmoney
	setSoundVolume(cPayDaySound, 0.7)
	local info = {}
	-- output payslip
	--outputChatBox("-------------------------- PAY SLIP --------------------------", 255, 194, 14)
	table.insert(info, {"Paydays"})
	table.insert(info, {""})
	--table.insert(info, {""})
	-- state earnings/money from faction
	if not (faction) then
		if (pay + tax > 0) then
			--outputChatBox(, 255, 194, 14, true)
			table.insert(info, {"  Pabalsts: $" .. exports.global:formatMoney(pay+tax)})
		end
	else
		if (pay + tax > 0) then
			--outputChatBox(, 255, 194, 14, true)
			table.insert(info, {"  Alga: $" .. exports.global:formatMoney(pay+tax)})
		end
	end
	
	-- business profit
	if (profit > 0) then
		--outputChatBox(, 255, 194, 14, true)
		table.insert(info, {"  Biznesa peļņa: $" .. exports.global:formatMoney(profit)})
	end
	
	-- bank interest
	if (interest > 0) then
		--outputChatBox(,255, 194, 14, true)
		table.insert(info, {"  Bankas procenti: $" .. exports.global:formatMoney(interest) .. " (≈" ..("%.2f"):format(Perc) .. "%)"})
	end
	
	-- donator money (nonRP)
	if (donatormoney > 0) then
		--outputChatBox(, 255, 194, 14, true)
		table.insert(info, {"  Ziedotāja nauda: $" .. exports.global:formatMoney(donatormoney)})
	end
	
	-- Above all the + stuff
	-- Now the - stuff below
	
	-- income tax
	if (tax > 0) then
		--outputChatBox(, 255, 194, 14, true)
		table.insert(info, {"  Ienākuma nodoklis " .. (math.ceil(incomeTax*100)) .. "%: $" .. exports.global:formatMoney(tax)})
	end
	
	if (vtax > 0) then
		--outputChatBox(, 255, 194, 14, true)
		table.insert(info, {"  Auto nodokļi: $" .. exports.global:formatMoney(vtax)})
	end

	if (totalInsFee > 0) then
		table.insert(info, {"  Apdrošināšana: $" .. exports.global:formatMoney(totalInsFee)})
	end
	
	if (ptax > 0) then
		--outputChatBox(, 255, 194, 14, true )
		table.insert(info, {"  Īpašumu izmaksas: $" .. exports.global:formatMoney(ptax)})
	end
	
	if (rent > 0) then
		--outputChatBox(, 255, 194, 14, true)
		table.insert(info, {"  Dzīvokļa īre: $" .. exports.global:formatMoney(rent)})
	end
	
	--outputChatBox("------------------------------------------------------------------", 255, 194, 14)
	
	if grossincome == 0 then
		--outputChatBox(,255, 194, 14, true)
		table.insert(info, {"  Bruto ienākumi: $0"})
	elseif (grossincome > 0) then
		--outputChatBox(,255, 194, 14, true)
		--outputChatBox(, 255, 194, 14)
		table.insert(info, {"  Neto ienākumi: $" .. exports.global:formatMoney(grossincome)})
		table.insert(info, {"  Piezīme(s): Pārskaitīts uz jūsu bankas kontu."})
	else
		--outputChatBox(, 255, 194, 14, true)
		--outputChatBox(, 255, 194, 14)
		table.insert(info, {"  Neto ienākumi: $" .. exports.global:formatMoney(grossincome)})
		table.insert(info, {"  Piezīme(s): Pārskaitīts uz jūsu bankas kontu."})
	end
	
	
	if (pay + tax == 0) then
		if not (faction) then
			--outputChatBox(, 255, 0, 0)
			table.insert(info, {"  Valdībai nepietika nauda, lai izmaksātu Jums pabalstu."})
		else
			--outputChatBox(, 255, 0, 0)
			table.insert(info, {"  Jūsu darbadevējam nepietika nauda, lai Jums izmaksātu algu."})
		end
	end
	
	if (rent == -1) then
		--outputChatBox(, 255, 0, 0)
		table.insert(info, {"  Jūs tikāt izmests no sava dzīvokļa, jo nespējāt samaksāt īri."})
	end

	if (totalInsFee == -1) then
		table.insert(info, {"  Jums tika noņemta apdrošināšana, jo vairs nespējāt par to samaksāt."})
	end
	
	--outputChatBox("------------------------------------------------------------------", 255, 194, 14)
	-- end of output payslip
	if exports.hud:isActive() then
		triggerEvent("hudOverlay:drawOverlayTopRight", localPlayer, info ) 
	end
	triggerEvent("updateWaves", getLocalPlayer())

	-- trigger one event to run whatever functions anywhere that needs to be executed hourly
	triggerEvent('payday:run', resourceRoot)
end
addEvent("cPayDay", true)
addEventHandler("cPayDay", getRootElement(), cPayDay)

function startResource()
	addEvent('payday:run', true)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), startResource)