local localPlayer = getLocalPlayer()

guiIntroLabel1 = nil
guiIntroProceedButton = nil
guiIntroWindow = nil
guiQuestionLabel = nil
guiQuestionAnswer1Radio = nil
guiQuestionAnswer2Radio = nil
guiQuestionAnswer3Radio = nil
guiQuestionWindow = nil
guiFinalPassTextLabel = nil
guiFinalFailTextLabel = nil
guiFinalRegisterButton = nil
guiFinalCloseButton = nil
guiFinishWindow = nil

-- variable for the max number of possible questions
local NoQuestions = 10
local NoQuestionToAnswer = 7
local correctAnswers = 0
local passPercent = 80
		
selection = {}

-- functon makes the intro window for the quiz
function createlicenseTestIntroWindow()
	
	showCursor(true)
	
	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	guiIntroWindow = guiCreateWindow ( X , Y , Width , Height , "B Kategorijas Teorijas Eksāmens" , false )
	
	guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "banner.png", true, guiIntroWindow)
	
	guiIntroLabel1 = guiCreateLabel(0, 0.3,1, 0.5, [[Jums nāksies pildīt B Kategorijas Teorijas Eksāmenu. Šajā eksāmenā Jums ir jaatbild vismaz 80% pareizi, lai nokārtotu šo daļu.]], true, guiIntroWindow)
	
	guiLabelSetHorizontalAlign ( guiIntroLabel1, "center", true )
	guiSetFont ( guiIntroLabel1,"default-bold-small")
	
	guiIntroProceedButton = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Sākt" , true ,guiIntroWindow)
	
	addEventHandler ( "onClientGUIClick", guiIntroProceedButton,  function(button, state)
		if(button == "left" and state == "up") then
		
			-- start the quiz and hide the intro window
			startLicenceTest()
			guiSetVisible(guiIntroWindow, false)
		
		end
	end, false)
	
end


-- function create the question window
function createLicenseQuestionWindow(number)

	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	-- create the window
	guiQuestionWindow = guiCreateWindow ( X , Y , Width , Height , "Jautājums "..number.." no "..NoQuestionToAnswer , false )
	
	guiQuestionLabel = guiCreateLabel(0.1, 0.2, 0.9, 0.2, selection[number][1], true, guiQuestionWindow)
	guiSetFont ( guiQuestionLabel,"default-bold-small")
	guiLabelSetHorizontalAlign ( guiQuestionLabel, "left", true)
	
	
	if not(selection[number][2]== "nil") then
		guiQuestionAnswer1Radio = guiCreateRadioButton(0.1, 0.4, 0.9,0.1, selection[number][2], true,guiQuestionWindow)
	end
	
	if not(selection[number][3] == "nil") then
		guiQuestionAnswer2Radio = guiCreateRadioButton(0.1, 0.5, 0.9,0.1, selection[number][3], true,guiQuestionWindow)
	end
	
	if not(selection[number][4]== "nil") then
		guiQuestionAnswer3Radio = guiCreateRadioButton(0.1, 0.6, 0.9,0.1, selection[number][4], true,guiQuestionWindow)
	end
	
	-- if there are more questions to go, then create a "next question" button
	if(number < NoQuestionToAnswer) then
		guiQuestionNextButton = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Tālāk" , true ,guiQuestionWindow)
		
		addEventHandler ( "onClientGUIClick", guiQuestionNextButton,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1Radio)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2Radio)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3Radio)) then
					selectedAnswer = 3
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][5]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create a new window for the next question
					guiSetVisible(guiQuestionWindow, false)
					createLicenseQuestionWindow(number+1)
				end
			end
		end, false)
		
	else
		guiQuestionSumbitButton = guiCreateButton ( 0.4 , 0.75 , 0.3, 0.1 , "Iesniegt" , true ,guiQuestionWindow)
		
		-- handler for when the player clicks submit
		addEventHandler ( "onClientGUIClick", guiQuestionSumbitButton,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1Radio)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2Radio)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3Radio)) then
					selectedAnswer = 3
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer4Radio)) then
					selectedAnswer = 4
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][5]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create the finish window
					guiSetVisible(guiQuestionWindow, false)
					createTestFinishWindow()


				end
			end
		end, false)
	end
end


-- funciton create the window that tells the
function createTestFinishWindow()

	local score = math.floor((correctAnswers/NoQuestionToAnswer)*100)

	local screenwidth, screenheight = guiGetScreenSize ()
		
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
		
	-- create the window
	guiFinishWindow = guiCreateWindow ( X , Y , Width , Height , "Testa beigas.", false )
	
	if(score >= passPercent) then
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "pass.png", true, guiFinishWindow)
	
		guiFinalPassLabel = guiCreateLabel(0, 0.3, 1, 0.1, "Apsveicam! Jūs esat veiksmīgi nokārtojis teorijas eksāmenu!.", true, guiFinishWindow)
		guiSetFont ( guiFinalPassLabel,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalPassLabel, "center")
		guiLabelSetColor ( guiFinalPassLabel ,0, 255, 0 )
		
		guiFinalPassTextLabel = guiCreateLabel(0, 0.4, 1, 0.4, "Jūs ieguvāt "..score.."%, nepieciešamais daudzums ir "..passPercent.."%. Labi padarīts!" ,true, guiFinishWindow)
		guiLabelSetHorizontalAlign ( guiFinalPassTextLabel, "center", true)
		
		guiFinalRegisterButton = guiCreateButton ( 0.35 , 0.8 , 0.3, 0.1 , "Turpināt" , true ,guiFinishWindow)
		
		-- if the player has passed the quiz and clicks on register
		addEventHandler ( "onClientGUIClick", guiFinalRegisterButton,  function(button, state)
			if(button == "left" and state == "up") then
				-- set player date to say they have passed the theory.
				

				initiateDrivingTest()
				-- reset their correct answers
				correctAnswers = 0
				toggleAllControls ( true )
				--cleanup
				destroyElement(guiIntroLabel1)
				destroyElement(guiIntroProceedButton)
				destroyElement(guiIntroWindow)
				destroyElement(guiQuestionLabel)
				destroyElement(guiQuestionAnswer1Radio)
				destroyElement(guiQuestionAnswer2Radio)
				destroyElement(guiQuestionAnswer3Radio)
				destroyElement(guiQuestionWindow)
				destroyElement(guiFinalPassTextLabel)
				destroyElement(guiFinalRegisterButton)
				destroyElement(guiFinishWindow)
				guiIntroLabel1 = nil
				guiIntroProceedButton = nil
				guiIntroWindow = nil
				guiQuestionLabel = nil
				guiQuestionAnswer1Radio = nil
				guiQuestionAnswer2Radio = nil
				guiQuestionAnswer3Radio = nil
				guiQuestionWindow = nil
				guiFinalPassTextLabel = nil
				guiFinalRegisterButton = nil
				guiFinishWindow = nil
				
				correctAnswers = 0
				selection = {}
				
				showCursor(false)
			end
		end, false)
		
	else -- player has failed, 
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "fail.png", true, guiFinishWindow)
	
		guiFinalFailLabel = guiCreateLabel(0, 0.3, 1, 0.1, "Diemžēl, Jūs neesat nokārtojis teorijas eksāmenu.", true, guiFinishWindow)
		guiSetFont ( guiFinalFailLabel,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalFailLabel, "center")
		guiLabelSetColor ( guiFinalFailLabel ,255, 0, 0 )
		
		guiFinalFailTextLabel = guiCreateLabel(0, 0.4, 1, 0.4, "Jūs ieguvāt "..math.ceil(score).."%, bet nepieciešamais daudzums ir "..passPercent.."%." ,true, guiFinishWindow)
		guiLabelSetHorizontalAlign ( guiFinalFailTextLabel, "center", true)
		
		guiFinalCloseButton = guiCreateButton ( 0.2 , 0.8 , 0.25, 0.1 , "Aizvērt" , true ,guiFinishWindow)
		
		-- if player click the close button
		addEventHandler ( "onClientGUIClick", guiFinalCloseButton,  function(button, state)
			if(button == "left" and state == "up") then
				destroyElement(guiIntroLabel1)
				destroyElement(guiIntroProceedButton)
				destroyElement(guiIntroWindow)
				destroyElement(guiQuestionLabel)
				destroyElement(guiQuestionAnswer1Radio)
				destroyElement(guiQuestionAnswer2Radio)
				destroyElement(guiQuestionAnswer3Radio)
				destroyElement(guiQuestionWindow)
				destroyElement(guiFinalFailTextLabel)
				destroyElement(guiFinalCloseButton)
				destroyElement(guiFinishWindow)
				guiIntroLabel1 = nil
				guiIntroProceedButton = nil
				guiIntroWindow = nil
				guiQuestionLabel = nil
				guiQuestionAnswer1Radio = nil
				guiQuestionAnswer2Radio = nil
				guiQuestionAnswer3Radio = nil
				guiQuestionWindow = nil
				guiFinalFailTextLabel = nil
				guiFinalCloseButton = nil
				guiFinishWindow = nil
				
				selection = {}
				correctAnswers = 0
				
				showCursor(false)
			end
		end, false)
	end
	
end
 
 -- function starts the quiz
 function startLicenceTest()
 
	-- choose a random set of questions
	chooseTestQuestions()
	-- create the question window with question number 1
	createLicenseQuestionWindow(1)
 
 end
 
 
 -- functions chooses the questions to be used for the quiz
 function chooseTestQuestions()
 
	-- loop through selections and make each one a random question
	for i=1, 10 do
		-- pick a random number between 1 and the max number of questions
		local number = math.random(1, NoQuestions)
		
		-- check to see if the question has already been selected
		if(testQuestionAlreadyUsed(number)) then
			repeat -- if it has, keep changing the number until it hasn't
				number = math.random(1, NoQuestions)
			until (testQuestionAlreadyUsed(number) == false)
		end
		
		-- set the question to the random one
		selection[i] = questions[number]
	end
 end
 
 
 -- function returns true if the queston is already used
 function testQuestionAlreadyUsed(number)
 
	local same = 0
 
	-- loop through all the current selected questions
	for i, j in pairs(selection) do
		-- if a selected question is the same as the new question
		if(j[1] == questions[number][1]) then
			same = 1 -- set same to 1
		end
		
	end
	
	-- if same is 1, question already selected to return true
	if(same == 1) then
		return true
	else
		return false
	end
 end

---------------------------------------
------ Practical Driving Test ---------
---------------------------------------
 
testRoute = {
	{ 1092.20703125, -1759.1591796875, 13.023070335388 },	-- Start, DoL Parking 
	{ 1127.5478515625, -1743.1826171875, 13.3984375},
	{ 1162.8291015625, -1743.2626953125, 13.3984375},
	{ 1172.90234375, -1761.3369140625, 13.3984375},
    { 1173.970703125, -1822.205078125, 13.3984375},
    { 1156.787109375, -1849.853515625, 13.393046379089},
    { 1079.3720703125, -1850.80859375, 13.390082359314},
    { 1056.90625, -1825.771484375, 13.597303390503},
    { 987.724609375, -1784.2587890625, 14.070205688477},
    { 907.111328125, -1770.1005859375, 13.3828125},
    { 835.69921875, -1767.6875, 13.045307159424},
    { 812.3388671875, -1727.3662109375 ,13.3828125},
    { 812.40234375, -1687.2138671875, 13.3828125},
    { 765.9033203125, -1672.2958984375, 12.558557510376},
    { 668.900390625, -1671.1142578125, 13.485015869141},
    { 641.763671875, -1644.177734375, 15.066255569458},
    { 639.72265625, -1602.6875, 15.521681785583},
    { 600.8017578125, -1581.5888671875, 16.0078125},
    { 499.3798828125, -1583.1513671875, 16.784828186035},
    { 419.3212890625, -1583.2470703125, 26.117635726929},
    { 351.767578125, -1580.4775390625, 32.626388549805},
    { 352.4619140625, -1539.720703125, 33.287738800049},
    { 416.396484375, -1483.484375, 30.717283248901},
    { 413.4287109375, -1435.6064453125, 32.08194732666},
    { 404.4189453125, -1405.3818359375, 33.60767364502},
    { 488.6123046875, -1354.318359375, 17.214179992676},
    { 500.0595703125, -1321.224609375, 15.752361297607},
    { 456.025390625, -1305.751953125, 15.12486076355},
    { 349.306640625, -1372.310546875, 14.265229225159},
    { 238.7412109375, -1431.7109375, 13.289217948914},
    { 162.447265625, -1530.9560546875, 12.03649520874},
    { 126.3271484375, -1586.8837890625, 10.495286941528},
    { 119.0849609375, -1702.90625, 9.159460067749},
    { 239.3037109375, -1734.029296875, 4.017505645752},
    { 330.62109375, -1742.27734375, 4.4455370903015},
    { 360.5908203125, -1775.0634765625, 5.2739543914795},
    { 440.3505859375, -1774.9384765625, 5.3252673149109},
    { 461.404296875, -1733.38671875, 10.063726425171},
    { 513.5107421875, -1730.90625, 11.795787811279},
    { 641.625, -1750.40234375, 13.211541175842},
    { 862.541015625, -1786.29296875, 13.723181724548},
    { 1016.8984375, -1808.6689453125, 14.041917800903},
    { 1039.7138671875, -1757.185546875, 13.379341125488},
    { 1039.669921875, -1587.5, 13.3828125},
    { 1065.0947265625, -1422.1376953125, 13.403809547424},
    { 1060.38671875, -1301.96875, 13.565116882324},
    { 1080.98828125, -1283.220703125, 13.3828125},
    { 1192.876953125, -1282.6533203125, 13.317400932312},
    { 1329.19140625, -1283.228515625, 13.3828125},
    { 1339.9189453125, -1313.607421875, 13.401284217834},
    { 1334.74609375, -1461.7353515625, 13.3828125},
    { 1295.08984375, -1602.060546875, 13.3828125},
    { 1294.9765625, -1695.6748046875, 13.3828125},
    { 1264.833984375, -1709.650390625, 13.3828125},
    { 1188.3955078125, -1710.0634765625, 13.407536506653},
    { 1173.1474609375, -1732.615234375, 13.523118019104},
    { 1137.07421875, -1738.787109375, 13.481865882874},
	{ 1085.056640625, -1740.5791015625, 13.152918815613 },	-- DoL End road
}

testVehicle = { [410]=true } -- Mananas need to be spawned at the start point.
local vehicleIdUsedToStartTest = nil

local blip = nil
local marker = nil

function initiateDrivingTest()
	triggerServerEvent("theoryComplete", getLocalPlayer())
	local x, y, z = testRoute[1][1], testRoute[1][2], testRoute[1][3]
	blip = createBlip(x, y, z, 0, 2, 0, 255, 0, 255)
	marker = createMarker(x, y, z, "checkpoint", 4, 0, 255, 0, 150) -- start marker.
	addEventHandler("onClientMarkerHit", marker, startDrivingTest)
	
	outputChatBox("#FF9933Jūs tagad esat gatavs(-a) uzsākt eksāmena braukšanas daļu. Lūgums iekāpt CSDD mašīnā, lai uzsāktu pārbaudes maršrutu.", 255, 194, 14, true)
	
end

function startDrivingTest(element)
	if element == getLocalPlayer() then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		if not vehicle or not testVehicle[getElementModel(vehicle)] then
			outputChatBox("#FF9933Jums ir jaatrodas CSDD automašīnā, kamēr tiek veikta eksāmena braukšanas daļa.", 255, 0, 0, true ) -- Wrong car type.
		else
			destroyElement(blip)
			destroyElement(marker)
			
			setElementData(getLocalPlayer(), "drivingTest.marker", 2, false)
			vehicleIdUsedToStartTest = getElementData(vehicle, "dbid")

			local x1,y1,z1 = nil -- Setup the first checkpoint
			x1 = testRoute[2][1]
			y1 = testRoute[2][2]
			z1 = testRoute[2][3]
			setElementData(getLocalPlayer(), "drivingTest.checkmarkers", #testRoute, false)

			blip = createBlip(x1, y1 , z1, 0, 2, 255, 0, 255, 255)
			marker = createMarker( x1, y1,z1 , "checkpoint", 4, 255, 0, 255, 150)
				
			addEventHandler("onClientMarkerHit", marker, UpdateCheckpoints)
				
			outputChatBox("#FF9933Jums ir jāpabeidz maršruts bez automašīnas virsbūves sabojāšanas. Veiksmi! Brauciet uzmanīgi.", 255, 194, 14, true)
		end
	end
end

function UpdateCheckpoints(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		if not vehicle or not testVehicle[getElementModel(vehicle)] then
			outputChatBox("Jums ir jaatrodas CSDD automašīnā, kamēr tiek veikta eksāmena braukšanas daļa.", 255, 0, 0) -- Wrong car type.
		elseif getElementData(vehicle, "dbid") ~= vehicleIdUsedToStartTest then
			outputChatBox("Jūs nelietojat to auto ar ko uzsākāt braukšanas eksāmenu.", 255, 194, 14)
			outputChatBox("Jūs nenokārtojāt braukšanas eksāmenu.", 255, 0, 0)

			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
		else
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
				
			local m_number = getElementData(getLocalPlayer(), "drivingTest.marker")
			local max_number = getElementData(getLocalPlayer(), "drivingTest.checkmarkers")
			
			if (tonumber(max_number-1) == tonumber(m_number)) then -- if the next checkpoint is the final checkpoint.
				outputChatBox("#FF9933Noparkojiet auto #FF66CC CSDD stāvlaukumā, #FF9933lai pabeigtu braukšanas eksāmenu.", 255, 194, 14, true)
				
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
					
				local x2, y2, z2 = nil
				x2 = testRoute[newnumber][1]
				y2 = testRoute[newnumber][2]
				z2 = testRoute[newnumber][3]
				
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				
				addEventHandler("onClientMarkerHit", marker, EndTest)
			else
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
						
				local x2, y2, z2 = nil
				x2 = testRoute[newnumber][1]
				y2 = testRoute[newnumber][2]
				z2 = testRoute[newnumber][3]
						
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				addEventHandler("onClientMarkerHit", marker, UpdateCheckpoints)
			end
		end
	end
end

function EndTest(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		if not vehicle or not testVehicle[getElementModel(vehicle)] then
			outputChatBox("Jums ir jaatrodas CSDD automašīnā, kamēr tiek veikta eksāmena braukšanas daļa.", 255, 0, 0)
		else
			local vehicleHealth = getElementHealth ( vehicle )
			if getElementData(vehicle, "dbid") ~= vehicleIdUsedToStartTest then
				outputChatBox("Jūs nelietojat to auto ar ko uzsākāt braukšanas eksāmenu.", 255, 194, 14)
				outputChatBox("Jūs nenokārtojāt braukšanas eksāmenu.", 255, 0, 0)
			elseif (vehicleHealth >= 800) then
				----------
				-- PASS --
				----------
				outputChatBox("Pēc automašīnas pārskatīšanas, bojājumi netika atrasti.", 255, 194, 14)
				triggerServerEvent("acceptCarLicense", getLocalPlayer())
			else
				----------
				-- Fail --
				----------
				outputChatBox("Pēc automašīnas pārskatīšanas, ir viegli manāmi bojājumi.", 255, 194, 14)
				outputChatBox("You have failed the practical driving test.", 255, 0, 0)
			end
			
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
		end
	end
end
