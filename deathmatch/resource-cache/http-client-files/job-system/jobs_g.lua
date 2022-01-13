function getJobTitleFromID(jobID)
	if (tonumber(jobID)==1) then
		return "Preču piegādātājs"
	elseif (tonumber(jobID)==2) then
		return "Taksists"
	elseif  (tonumber(jobID)==3) then
		return "Autobusa šoferis"
	elseif (tonumber(jobID)==4) then
		return "Pilsētas uzturētājs"
	elseif (tonumber(jobID)==5) then
		return "Mechanic"
	elseif (tonumber(jobID)==6) then
		return "Locksmith"
	elseif (tonumber(jobID)==7) then
		return "Tālbraucējs"
	else
		return "Unemployed"
	end
end