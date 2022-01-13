wEmployment, jobList, bAcceptJob, bCancel = nil

--[[
local jessie = createPed( 141, 1474.5302734375, -1936.638671875, 290.70001220703 )
setPedRotation( jessie, 0 )
setElementDimension( jessie, 9 )
setElementInterior( jessie , 1 )
setElementData( jessie, "talk", 1, false )
setElementData( jessie, "name", "Jessie Smith", false )
--setPedAnimation ( jessie, "INT_OFFICE", "OFF_Sit_Idle_Loop", -1, true, false, false )
setElementFrozen(jessie, true)
--]]

function showEmploymentWindow()

	triggerServerEvent("onEmploymentServer", getLocalPlayer())
	local width, height = 300, 400
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)

	wEmployment = guiCreateWindow(x, y, width, height, "Darbu dēlis", false)

	jobList = guiCreateGridList(0.05, 0.05, 0.9, 0.8, true, wEmployment)
	local column = guiGridListAddColumn(jobList, "Darbs", 0.9)

	-- TRUCKER
	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Preču piegādātājs", false, false)

	-- TAXI
	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Taksists", false, false)

	-- Tālbraucējs
    local row = guiGridListAddRow(jobList)
    guiGridListSetItemText(jobList, row, column, "Tālbraucējs", false, false)

	-- BUS --
	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Autobusa šoferis", false, false)

	-- CITY MAINTENACE
	if not exports.factions:isInFactionType(getLocalPlayer(), 2) then
		local rowmaintenance = guiGridListAddRow(jobList)
		guiGridListSetItemText(jobList, rowmaintenance, column, "Pilsētas uzturētājs", false, false)
	end

	-- MECHANIC
	--[[local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Mechanic", false, false)]] -- Disabled, added mechanic faction type

	-- LOCKSMITH
	--[[local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Locksmith", false, false)]]

	bAcceptJob = guiCreateButton(0.05, 0.85, 0.45, 0.1, "Pieņemt darbu", true, wEmployment)
	bCancel = guiCreateButton(0.5, 0.85, 0.45, 0.1, "Atcelt", true, wEmployment)

	showCursor(true)

	addEventHandler("onClientGUIClick", bAcceptJob, acceptJob)
	addEventHandler("onClientGUIDoubleClick", jobList, acceptJob)
	addEventHandler("onClientGUIClick", bCancel, cancelJob)
end
addEvent("onEmployment", true)
addEventHandler("onEmployment", getRootElement(), showEmploymentWindow)

function acceptJob(button, state)
	if (button=="left") then
		local row, col = guiGridListGetSelectedItem(jobList)
		local job = getElementData(getLocalPlayer(), "job")

		if (row==-1) or (col==-1) then
			outputChatBox("Lūdzu vispirms izvēlies darbu!", 255, 0, 0)
		elseif (job>0) then
			outputChatBox("Tu jau esi citas profesijas pārstāvis. Vispirms lieto /quitjob", 255, 0, 0)
		else
			local job = 0
			local jobtext = guiGridListGetItemText(jobList, guiGridListGetSelectedItem(jobList), 1)

			if ( jobtext=="Preču piegādātājs" or jobtext=="Taksists" or jobtext=="Autobusa šoferis" or jobtext=="Tālbraucējs" ) then  -- Driving job, requires the license
				local carlicense = getElementData(getLocalPlayer(), "license.car")
				if (carlicense~=1) then
					outputChatBox("Tev ir nepieciešamas B kategorijas tiesības, lai veiktu šo darbu.", 255, 0, 0)
					return
				end
			end

			if (jobtext=="Preču piegādātājs") then
				exports["job-system-trucker"]:displayTruckerJob()
				job = 1
			elseif (jobtext=="Taksists") then
				job = 2
				displayTaxiJob()
			elseif  (jobtext=="Autobusa šoferis") then
				job = 3
				displayBusJob()
			elseif (jobtext=="Pilsētas uzturētājs") then
				job = 4
			elseif (jobtext=="Mechanic") then
				displayMechanicJob()
				job = 5
			elseif (jobtext=="Locksmith") then
				displayLocksmithJob()
				job = 6
			elseif (jobtext=="Tālbraucējs") then
			    exports["solid-trucking"]:displayTruckerInfo() -- Added to give info about the trucking job. - Solid 2/12/2021
                job = 7
            end

			triggerServerEvent("acceptJob", getLocalPlayer(), job)

			destroyElement(jobList)
			destroyElement(bAcceptJob)
			destroyElement(bCancel)
			destroyElement(wEmployment)
			wEmployment, jobList, bAcceptJob, bCancel = nil, nil, nil, nil
			showCursor(false)
		end
	end
end

function cancelJob(button, state)
	if (source==bCancel) and (button=="left") then
		destroyElement(jobList)
		destroyElement(bAcceptJob)
		destroyElement(bCancel)
		destroyElement(wEmployment)
		wEmployment, jobList, bAcceptJob, bCancel = nil, nil, nil, nil
		showCursor(false)
	end
end
