local fireModel = 2023
local isFireOn = false

local fireTable = {
		--  { x, y, z, "Location", "Incident description", "special or regular", carID(or blank) }
		{ 2116.5451660156, -1790.5614013672, 14.370749473572, "Los Santos, Idlewood Pizza Stack", "No šīs vienas mizkastes nāk dūmi, izskatās, ka te tūliņ kaut kas degs!", "regular" },
		{ 1892.892578125,-1800.7572021484, 15.758026123047, "Los Santos, IGS", "Te kaut kādi bērni spēlējās ar dezīti un sērkociņiem, viņi te kaut ko aizsvilināja!", "regular" },
		{ 1858.4833984375,-1454.541015625, 13.395030975342, "Los Santos, blakus skeitparkam", "Šis busiņš knapi izvairījās no riteņbraucēja un ietriecās sienā, viņam tas busiņš tagad dūmo! Lūdzu palīdziet!", "special", 414 },
		{ -76.41796875, -1593.662109375, 2.6171875, "Flint Krustojums, traileru parks LS Dienvid-Rietumi.", "No Traileru parka nāk dūmi...jums pipariem šito vajadzētu apskatīt!" },
		{ 1706.869140625,-546.01953125,35.386379241943, "Red County, Interstate 25", "Te viena lidmašīna tikko nolaidās uz šosejas, tās dzinējs kūp!", "regular", 513 },
		{ 2499.7451171875,-1670.771484375,13.348224639893, "Los Santos, Grove Street", "Šis kāpu bagijs tikko uzbrauca pa ielu un tad uzsprāga dzinējs, ir daudz melnu dūmu un var redzēt uguni!", "regular", 568 },
		{ 2713.423828125,-2049.33984375,13.4275598526, "Los Santos, Dienvidu Iela - Playa Del Seville, blakus Sun ielai", "Viena no mūsu kravas automašīnām tikko atstāja mūsu ķīmisko rūpnīcu un uzliesmoja, tajā ir dažas ķīmiskas vielas.. Brauciet ātri!", "special", 573 },
		{ 1873.32421875,-2497.193359375,13.5546875, "Los Santos Starptautiskā Lidosta, Skrejceļš A!", "Mums ir avārijas nosēšanās, lidmašīnas dzinējs nedarbojas, un dzinējs tūliņ aizdegsies! Mums nepieciešami ugunsdzēsēji tūlīt pat!", "regular", 577 },
		{  2295.1318359375, -1693.37109375, 13.517011642456, "Aleja aiz Ganton Sporta zāles!", "Daži cilvēki tikko izskrēja no starpielas. Es redzu dūmus!", "regular", 516 },
		{  1961.8642578125, -1955.6796875, 13.751493453979, "El Corona sliedes", "Viens no mūsu vilcieniem ir ziņojis par dūmu smaku, kas nāk no vilciena apakšas. Mēs vēlētos, lai kāds to pārbaudītu, pirms tas kļūst par kaut ko sliktāku.", "special", 538 },
		{  1021.109375, -1916.8505859375, 12.66853427887, "Tirgus uz dienvidiem no CSDD.", "Kāds apgāza BBQ un aizdedzināja kiosku, uguns nav milzīgs, bet mums nav ar ko to nodzēst!", "regular", },
		{  1303.5419921875, 173.9775390625, 20.4609375, "Montgomery Traileru Parks, Dienvidu puse.", "Daži bērni tikko aizdedzināja atkritumus, uguns izplatās uz kokiem!", "regular", },
		{  2161.294921875, -99.8544921875, 2.75, "Mazā pludmale, Rietumu puse - Palamino Creek.", "Kāds šķūnis deg. Diezgan liels.", "regular", },
		{  2352.0224609375, -650.1396484375, 128.0546875, "North Rock.", "Ugunsgrēks nogājis greizi, tas ir aizvairojies uz koka būdu.", "regular", },
		{  1874.126953125, -1313.33203125, 14.500373840332, "Būvlaukums, kas ir uz ziemeļiem no skeitparka", "Ugunsgrēks!", "regular", 524 },
		{ 595.06, -535.41, 17, "Dillimore, aiz policijas ēkas", "Dūmo mašīna, iespējams aizdegsies!", "regular", 401 },
		{ 658.0908, -439.372, 16, "Dillimore, atkritumu tvertnes aiz bāra uz ziemeļiem!", "Mēs cenšamies tās izdzēst, bet tas neizdodas!", "regular",},
		{ 2351.08984375, -653.4462890625, 128.0546875, "North Rock, būdiņa kalna galā!", "Es neesmu pārliecināts, bet ir vērts pārbaudīt! Tur padaudz dūmi nāk ārā no tās būdiņas!", "special", 410 },
		{ 2626.9677734375, -846.2607421875, 84.179885864258, "North Rock, blakus būdiņai kalnā!", "Koks tiko aizdegās, zajebal tā Kalifornijas saule!", "regular",},
		{ 2859.03515625, -598.166015625, 10.928389549255, "Interstate 425 Austrumos, blakus lielceļam.", "Smagi sasista mašīna, dūmo, blakus ir uguns! Pasteidzieties!", "regular", 420 },
		{ 392.51171875, -1924.5078125, 10.25, "Santa Monica Piestātne.", "Viena no koka ēkām ir aizdegusies!", "special",},
		{ -104.0712890625, -331.7822265625, 1.4296875, "Red county, blueberry noliktava.", "Nezinu, kas trāpija smagajam, bet es ticu, ka drīz no tā iznāks uguns! Es pārvadāju dīzeli!", "regular", 403 },
		{ 1368.8466796875, -291.900390625, 1.7080450057983, "Mulholland kanāls!", "Ūdensmocis tikko iepisa krastā un sāka dūmot!", "regular", 460 },
}

function loadthescript()
    outputDebugString("LeFire Script loaded ...")
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadthescript)

function fdfire()
    math.randomseed(getTickCount())
    local randomfire = math.random(1,#fireTable)
    local fX, fY, fZ = fireTable[randomfire][1],fireTable[randomfire][2],fireTable[randomfire][3]
            local playersOnFireTeam = exports.factions:getPlayersInFaction(2)
            for k, v in ipairs (playersOnFireTeam) do
                outputChatBox("[RADIO] Šis ir dispičeris. Mums ir ienācis anonīms zvans par milzus atgadījumu!",v,245, 40, 135)
				outputChatBox("[RADIO] Atgadījums ir, kā sekos: "..fireTable[randomfire][5],v,245, 40, 135)
                outputChatBox("[RADIO] Atrašanās vieta: "..fireTable[randomfire][4].." Lūdzu doties tur TŪLIŅ PAT! Mēs pievienojām marķieri Jūsu GPS.",v,245, 40, 135)
            end

            -- You can get table info like this below, i set the variable above to make it shorter to call from.
            --outputDebugString("x:"..fireTable[randomfire][1].." y:"..fireTable[randomfire][2].." z:"..fireTable[randomfire][3])
			if (fireTable[randomfire][7]) then
				local fireveh = createVehicle(fireTable[randomfire][7], fX, fY, fZ)
				setTimer( function ()
					destroyElement(fireveh)
				end, 1800000, 1)
				blowVehicle(fireveh)
			end
			if (fireTable[randomfire][6] == "special") then
				local fireElem1 = createObject(fireModel,fX+2,fY+2,fZ)
				setElementCollisionsEnabled(fireElem,false)
				local col1 = createColSphere(fX+2,fY+2,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem1)
					destroyElement(col1)
				end, 420000, 1)

				local fireElem2 = createObject(fireModel,fX+4,fY+4,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col2 = createColSphere(fX+4,fY+4,fZ+2,2)
				setTimer ( function ()
					destroyElement(fireElem2)
					destroyElement(col2)
				end, 420000, 1)

				local fireElem3 = createObject(fireModel,fX-2,fY-2,fZ)
				setElementCollisionsEnabled(fireElem,false)
				local col3 = createColSphere(fX-2,fY-2,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem3)
					destroyElement(col3)
				end, 420000, 1)

				local fireElem4 = createObject(fireModel,fX-4,fY-4,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col4 = createColSphere(fX-4,fY-4,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem4)
					destroyElement(col4)
				end, 420000, 1)

				local fireElem5 = createObject(fireModel,fX,fY-4,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col5 = createColSphere(fX,fY-4,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem5)
					destroyElement(col5)
				end, 420000, 1)

				local fireElem6 = createObject(fireModel,fX-4,fY,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col6 = createColSphere(fX-4,fY,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem6)
					destroyElement(col6)
				end, 420000, 1)
			end
            outputDebugString(fX.." "..fY.." "..fZ)
			-- Fire sync
			local fireElem = createObject(fireModel,fX,fY,fZ)
			setElementCollisionsEnabled(fireElem,false)
			local col = createColSphere(fX,fY,fZ+1,2)
			setTimer ( function ()
				destroyElement(fireElem)
				destroyElement(col)
			end, 420000, 1)


            triggerClientEvent("startTheFire", getRootElement(),fX,fY,fZ)
            local blip = createBlip(fX,fY,fZ, 43, 0, 0, 0, 255)
            setTimer ( function ()
                destroyElement(blip)
            end, 900000, 1)

			isFireOn = true
			setTimer ( function ()
				isFireOn = false
			end, 900000, 1)

			outputChatBox ("AdmCMD: Uguns, ko triggerojāt ir: ".. tostring(fireTable[randomfire][4]), thePlayer, 255, 0, 0) -- Solid 27/11/2021 (Added a little message for the admins so they know where the fire is.)
end

-- /randomfire - Start a random fire from the table
function randomfire (thePlayer)
	if ( exports.integration:isPlayerTrialAdmin ( thePlayer ) ) then
		outputDebugString(tostring(isFireOn))
		if (isFireOn) then
			outputChatBox ("AdmCMD: There is already a fire. Use /cancelfire or wait 30 minutes.", thePlayer,255,0,0)
		else
			fdfire(thePlayer)
			outputChatBox ("AdmCMD: You have random triggered a fire for FD!", thePlayer,255,0,0)
			outputChatBox ("AdmCMD: Type /cancelfire to cancel it!", thePlayer,255,0,0)
		end
	end
end
addCommandHandler("randomfire", randomfire)

-- /cancelfire - Stops the whole fire process (restarts the resource)
function cancelrandomfire (thePlayer)
	if ( exports.integration:isPlayerTrialAdmin ( thePlayer ) ) then
		outputDebugString(tostring(isFireOn))
		if (isFireOn) then
			local thisResource = getThisResource()
			outputChatBox ("AdmCMD: You have stopped the random fire for GD!", thePlayer,255,0,0)
			outputChatBox ("AdmCMD: It may take up to five minutes before it is fully cancelled.", thePlayer,255,0,0)
			restartResource(thisResource)
			isFireOn = false
		else
			outputChatBox ("AdmCMD: There is no fire started. Use /randomfire to start it.", thePlayer,255,0,0)
		end
	end
end
addCommandHandler("cancelfire", cancelrandomfire)
