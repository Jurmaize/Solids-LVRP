loadstring(exports.dgs:dgsImportFunction())()-- load functions

local isGUImade = false
local baseWindow = nil

addEventHandler("onClientResourceStart", root, function(res) if res == getThisResource() then drawStaffInfo() end end)

function drawStaffInfo()
	if not isGUImade then
		isGUImade = true

		local x = 0
		local y = 0.9
		local width = 1
		local height = 0.03
		baseWindow = dgsCreateWindow(x,y,width,height,"", true) -- Background for all staff roles
		dgsSetProperty(baseWindow,"sizable",false)
		dgsSetProperty(baseWindow,"titleHeight",0)
		dgsSetProperty(baseWindow,"movable",false)
		dgsWindowSetCloseButtonEnabled(baseWindow,false)

		local x = 0.01
		local y = 0.25
		dgsCreateLabel(x,y,width,height, staffRanks[1]..": "..staff[staffRanks[1]], true, baseWindow)

		local x = 0.045
		local y = 0.25
		dgsCreateLabel(x,y,width,height, staffRanks[2]..": "..staff[staffRanks[2]], true, baseWindow)

		local x = 0.075
		local y = 0.25
		dgsCreateLabel(x,y,width,height, staffRanks[3]..": "..staff[staffRanks[3]], true, baseWindow)

		local x = 0.105
		local y = 0.25
		dgsCreateLabel(x,y,width,height, staffRanks[4]..": "..staff[staffRanks[4]], true, baseWindow)

		local x = 0.13
		local y = 0.25
		dgsCreateLabel(x,y,width,height, staffRanks[5]..": "..staff[staffRanks[5]], true, baseWindow)
	end
end