job = 0
localPlayer = getLocalPlayer()

function playerSpawn()
	local logged = getElementData(localPlayer, "loggedin")

	if (logged==1) then
		job = tonumber(getElementData(localPlayer, "job"))
		if (job==1) then -- TRUCKER
			exports["job-system-trucker"]:displayTruckerJob()
		else
			exports["job-system-trucker"]:resetTruckerJob()
		end
		
		if (job==2) then -- TAXI
			displayTaxiJob()
		else
			resetTaxiJob()
		end
		
		if (job==3) then -- BUS
			displayBusJob()
		else
			resetBusJob()
		end
	end
end
addEventHandler("onClientPlayerSpawn", localPlayer, 
	function()
		setTimer(playerSpawn, 1000, 1)
	end
)

function quitJob(job)
	if (job==1) then -- TRUCKER JOB
		exports["job-system-trucker"]:resetTruckerJob()
		outputChatBox("Tu esi pametis darbu, kā preču pievadātājs.", 0, 255, 0)
	elseif (job==2) then -- TAXI JOB
		resetTaxiJob()
		outputChatBox("Tu esi pametis darbu, kā taksists.", 0, 255, 0)
	elseif (job==3) then -- BUS JOB
		resetBusJob()
		outputChatBox("Tu esi pametis darbu, kā autobusa šoferis.", 0, 255, 0)
	elseif (job==4) then -- CITY MAINTENANCE
		outputChatBox("Tu esi pametis darbu, kā pilsētas uzturētājs.", 0, 255, 0)
		triggerServerEvent("cancelCityMaintenance", localPlayer)
	elseif (job==5) then -- MECHANIC
		outputChatBox("Tu esi pametis darbu, kā mehāniķis.", 0, 255, 0)
	elseif (job==6) then -- LOCKSMITH
		outputChatBox("Tu esi pametis darbu, kā atslēdznieks.", 0, 255, 0)
	elseif (job==7) then -- TĀLBRAUCĒJS
        outputChatBox("Tu esi pametis darbu, kā tālbraucējs.", 0, 255, 0) -- New addition for Solids Trucking job. - Solid 2/12/2021
    end
end
addEvent("quitJob", true)
addEventHandler("quitJob", getLocalPlayer(), quitJob)
