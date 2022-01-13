local thisResourceElement = getResourceRootElement(getThisResource())
function loadBlips()
--[[
	for i = 1, #shops do
		local blip = shops[i].blippoint
		createBlip(blip[1], blip[2], blip[3], 56, 2, 0, 255, 0, 255, 0, 300)
	end
]]
    local blip = shops[1].blippoint
    exports.customblips:createCustomBlip(blip[1], blip[2], 20, 20, "blips/1.png", 300)
    blip = shops[2].blippoint
    exports.customblips:createCustomBlip(blip[1], blip[2], 20, 20, "blips/2.png", 300)
    blip = shops[3].blippoint
    exports.customblips:createCustomBlip(blip[1], blip[2], 20, 20, "blips/3.png", 300)
    blip = shops[4].blippoint
    exports.customblips:createCustomBlip(blip[1], blip[2], 20, 20, "blips/4.png", 300)
    blip = shops[5].blippoint
    exports.customblips:createCustomBlip(blip[1], blip[2], 20, 20, "blips/5.png", 300)
    blip = shops[6].blippoint
    exports.customblips:createCustomBlip(blip[1], blip[2], 20, 20, "blips/6.png", 300)
end


function loadBlipsAfterTimer()
    setTimer(loadBlips, 5000, 1)
end
addEventHandler("onClientResourceStart", thisResourceElement, loadBlipsAfterTimer)