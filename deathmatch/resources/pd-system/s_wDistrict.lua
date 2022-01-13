addEvent("weaponDistrict:doDistrict", true)

function weaponDistrict_doDistrict(name)
	exports["chat-system"]:districtIC(client, _, "Tu dzirdētu vairākus skaļus " .. name .. " šāvienus, kas atbalsojās visā apkārtnē.")
end

addEventHandler("weaponDistrict:doDistrict", root, weaponDistrict_doDistrict)