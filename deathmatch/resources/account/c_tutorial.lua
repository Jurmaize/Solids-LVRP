local currentStage = 1
local FINAL_STAGE = 13
local TUTORIAL_STAGES = {
    [1] = {"Laipni Lūgti", "Laipni lūgti iekš PowerPlay! \n\nJūs esat veiksmīgi piereģistrējušies. Tālāk Jūs iziesiet mazu servera pamācību, lai saprastu, kā strādā šis lomuspēles serveris!", 1271.6337890625, -2037.69140625, 81.409843444824, 1125.6396484375, -2036.96484375, 69.880661010742},
    [2] = {"Īpašumi", "Los Santos piedāvā plašu klāstu ar īpašumiem, kurus var iegādāties, ieskaitot veikalus, mājas, biznesus un garāžas. Jauni personāži iegūst tokenu, ar kura palīdzību, tie var iegādāties jebkuru māju līdz $40'000 vērtībā, atļaujot Jums uzsākt savu lomuspēli kā jūs jau būtu Los Santos iedzīvotājs!\n", 2092.314453125, -1220.6669921875, 35.311351776123, 2108.9404296875, -1240.2802734375, 27.001424789429},
    [3] = {"Automašīnas", "Pilsētā vienmēr ir pieejama liela auto izvēle, par kuru rūpējas pilsētā strādājošie auto veikali. (Neskaitot auto, kurus tirgo spēlētāji): \n\n - Ocean Docks Auto Veikals (Standarta Auto) \n - Ocean Docks Kravas auto/Industriālais veikals (Industrālie Auto) \n - Jefferson Auto Veikals (Standarta Auto) \n - Santa Maria Beach Laivu Veikals (Laivas) \n - Grotti's Auto Veikals (Sporta Auto) \n - Idlewood Motociklu/Velosipēdu Veikals (Motocikli) \n\nJaunajiem spēlētājiem tiks piešķirti automašīnas tokens, līdzīgi kā māju tokens, šis tokens ļaus uzreiz iegādāties automašīnu, kuras vērtība ir līdz pat $35,000. Galvenais neaizmirstiet jaunajam auto uzlikt /park, lai automašīnu respawna gadījumā Jūsu auto netiktu dzēsts.", 2111.3681640625, -2116.8876953125, 21.02206993103, 2128.1513671875, -2138.896484375, 15.001725196838},
    [4] = {"CSDD", "Šeit CSDD (Ceļu Satiksmes Drošības Direkcija) var darīt vairākas lietas. Galvenais iemesls Jums šeit ierasties ir, lai iegūtu B kategorijas (vieglo automašīnu) tiesības, bet var arī iegūt citas tiesības, kā, piemēram, A kategorijai, kuģošanai un zvejošanai. \n\nNo CSDD arī var iegādāties reģistrācijas papīrus, kas atļauj Jums pārdot savu auto, kamēr tas atrodas iekš CSDD stāvlaukuma. (Automašīnas, kas iegādātas ar tokenu nav pārdodamas).", 1061.421875, -1752.6943359375, 25.57329750061, 1105.625, -1792.9228515625, 17.421173095703},
    [5] = {"Banka", "Šeit ir Los Santos Banka. Bankā var ievietot, izņemt, kā arī pārsūtīt naudu citiem spēlētājiem vai frakcijām. Bankā arī var slēgt līgumu, lai iegūtu bankomāta kartes!", 626.2001953125, -1207.552734375, 35.195793151855, 600.30859375, -1239.025390625, 20.625173568726},
    [6] = {"Bankomāti", "Jūs drīz vien manīsiet, ka apkārt Los Santos pilsētai ir padaudz bankomātu.\n\nŠos bankomātus var lietot uzvelkot virsū no inventorijas karti. Atšķirībā no kartes, kuras ieguvāt no bankas, Jūs varēsiet izņemt noteiktu daudzumu naudas no bankomāta.\n\nMēs piedāvājam trīs veidu kartes un tās ir: \n - Parastā bankomātu karte ($0 -> $10,000) \n - Premium bankomātu karte ($0 -> $50,000) \n - Sekseru bankomātu Karte (Bezgalīgs daudzums)\n\nKatrai bankomāta kartei ir sava cena, tās var redzēt pie bankas darbinieku.", 1106.2578125, -1792.5869140625, 19.298328399658, 1110.90625, -1790.431640625, 16.59375},
    [7] = {"Dome", "Šī skaistā vieta ir dome. Šeit Jūs varat iegūt visparastākos darbus, kas Jums palīdzēs tikt uz kājām finansiāli. To skaitā ir:\n- Pilsētas apsaimniekošana\n- Autobusa šoferis\n- Taksists\n- Preču piegādātājs\n\nVēlviens iesācēju darbs, kuru nevar uzsākt domē ir zvejošana. Lai uzsāktu zvejošanu ir nepieciešams iegādāties makšķeri no kāda 24/7 veikala, kā arī laivu no laivu veikala, tad var doties jūrā zvejot! Spēlētājiem, kas vēlas attēlot mehāniķa darbu ir jāsazinas ar administrāciju, lai to saņemtu, kā arī ir jābūt labam iekš-personāža iemeslam, kāpēc Jūs to vēlaties iegūt.", 1526.1279296875, -1712.4970703125, 25.736494064331, 1497.982421875, -1738.583984375, 18.620281219482},
    [8] = {"Taksisti un Autobusu šoferi", "Šeit ir pilsētas Unity stacija, kur mājo publiskais transports. \n\nŠeit Jūs atradīsiet autobusus un takšus, ko var pielietot domes darbos (Jums ir nepieciešams darbs pirms tos var lietot un tos drīkst pielietot tikai darbam). Nav atļauts lietot domes darba auto, kā personīgo transportu!", 1823.2099609375, -1912.7138671875, 30.250659942627, 1789.2900390625, -1910.4990234375, 19.221006393433},
    [9] = {"RSHaul", "Šeit ir RSHaul \n\nRSHaul preču piegādāšanā ir 5 līmeņi ar progresu, sākot ar maziem busiņiem līdz pat lielākiem komerciālajiem busiem. Kā RSHaul preču piegādātājs, tev ir uzdots uzdevums piegādāt preces uz punktiem, ko nosaka RSHaul kompānija, atšķirībā no katras piegādes, tev maksās savādāk. Šīs piegādes Jūs vedīsiet gan uz ieprogrammētām vietām, gan arī uz īstu spēlētāju veikaliem, tādēļ Jūsu piegādes reāli izmainīs servera ekonomiku, jo Jūs piegādāsiet inventāru spēlētāju veikaliem.", -104.125, -1119.65234375, 2.7560873031616, -79.01953125, -1117.978515625, 1.078125},
    [10] = {"Zvejošana", "Vai Tu vēlies kļūt par nākamo Māri Olti? \n\nLai sāktu zvejot, tev būs nepieciešama laiva un makšķere un dodies jūrā! Tu vari sākt zvejot, ja tev ir visi nepieciešami priekšmeti, ar komandu /startfishing. Jau pavisam drīz Tu pamanīsi, ka tev ir pieķērusies zivs. Kad cīņu ar zivi būsi beidzis, vari doties to pārdot kaislīgajam makšķerniekam Jānim, kurš atrodas Los Santos ēsmu veikalā tieši dokos.", 163.1201171875, -1903.20703125, 19.174238204956, 134.77734375, -1962.0517578125, 15.005571365356},
    [11] = {"Legālās frakcijas", "Pēc nelielas naudas pelnīšanas, Jūs varbūt būsiet ieinteresēts pievienoties vai pat uzsākt kādu legālo frakciju!\n\nParasti jau eksistējošu legālo frakciju dalībniekus var atrast PowerPlay diskordā. https://discord.gg/S5PDPdDeac ", 1513.9677734375, -1674.328125, 33.480712890625, 1552.08203125, -1675.1279296875, 17.445131301882},
    [12] = {"Nelegālās frakcijas", "Varbūt tavs personāžs ir ieinteresēts iekasēt nedaudz naudiņas vairāk tādos nelegālos veidos?\n\nTādā gadījumā varbūt Tev ir jāpiedalas nelegālā frakcijā! Nelegālās frakcijas ir atbildīgas par narkotikām, ieročiem un citu kontrabandu, kas nonāk uz Los Santos ielām. Dažādas frakcijas iegūst dažāda veida kontrabandu. Dažas nelegālās frakcijas strādā uz ielām un citas strādā aiz kadra, kur neviens tās neredz, atšķirībā, kā tu izveido un kādās aktivitātēs piedalās tavs personāžs, vari izlemt kādā frakcijā tas ietilpst. Tu vari apskatīt nelegālās frakcijas PowerPlay Diskordā! https://discord.gg/S5PDPdDeac", 2180.5078125, -1647.9208984375, 29.288076400757, 2140.115234375, -1625.4150390625, 15.865843772888},
    [13] = {"Sīkumi", "Lomuspēle ar frakcijām ir tik neierobežota, cik tava iztēle to ļauj. Tālāk droši dodies iepazīt šo pilsētu un satiec jaunus un amizantus cilvēkus. Tu noteikti sastapsies ar daudziem legāliem un arī nelegāliem scenārijiem. Galvenais, ļauj brīvību savai iztēlei! Veiksmi!", 1981.0166015625, -1349.6162109375, 61.649375915527, 1925.7919921875, -1400.3291015625, 34.439781188965}
}

function runTutorial()
    tutorialWindow = guiCreateWindow(0.78, 0.63, 0.21, 0.35, "", true)
    guiWindowSetMovable(tutorialWindow, false)
    guiWindowSetSizable(tutorialWindow, false)
    showCursor(true)
    fadeCamera(true, 2.5)

    tutorialLabel = guiCreateLabel(0.02, 0.08, 0.95, 0.77, "", true, tutorialWindow)
    guiSetFont(tutorialLabel, "clear-normal")
    guiLabelSetHorizontalAlign(tutorialLabel, "left", true)

    backButton = guiCreateButton(0.02, 0.87, 0.45, 0.10, "Atpakaļ", true, tutorialWindow)
    nextButton = guiCreateButton(0.52, 0.87, 0.45, 0.10, "Tālāk", true, tutorialWindow)

    setStage(1)
    addEventHandler("onClientGUIClick", tutorialWindow, buttonFunctionality)
end
addEvent("tutorial:run", true)
addEventHandler("tutorial:run", root, runTutorial)

function setStage(stage)
    if (stage > FINAL_STAGE) then 
        currentStage = -1
        fadeCamera(false)
        guiSetText(tutorialWindow, "Powerplay Pamācība - Pabeigta pamācība")
        guiSetText(tutorialLabel, "Tu esi pabeidzis pamācību, ko vēlies darīt tālāk?")
        guiSetText(nextButton, "Pabeigt pamācību")
    else
        guiSetText(tutorialWindow, "Powerplay Pamācība - " .. TUTORIAL_STAGES[stage][1])
        guiSetText(tutorialLabel, TUTORIAL_STAGES[stage][2])
        setCameraMatrix(TUTORIAL_STAGES[stage][3], TUTORIAL_STAGES[stage][4], TUTORIAL_STAGES[stage][5], TUTORIAL_STAGES[stage][6], TUTORIAL_STAGES[stage][7], TUTORIAL_STAGES[stage][8], 0, 90)
        
        if not guiGetVisible(tutorialWindow) then 
            guiSetVisible(tutorialWindow, true)
        end
    end
end

function buttonFunctionality(button, state)
    if (button == "left") and (source == backButton) then 
        if (currentStage == 1) then 
            return
        elseif (currentStage == -1) then 
            currentStage = FINAL_STAGE
            fadeClientScreen()
            guiSetText(nextButton, "Tālāk")
            setTimer(setStage, 1000, 1, currentStage)
        else
            currentStage = currentStage - 1
            fadeClientScreen()
            setTimer(setStage, 1000, 1, currentStage)
        end            
    elseif (button == "left") and (source == nextButton) then 
        if (currentStage == -1) then 
            removeEventHandler("onClientGUIClick", tutorialWindow, buttonFunctionality)
            destroyElement(tutorialWindow)   
            triggerServerEvent("accounts:tutorialFinished", resourceRoot)
        else
            currentStage = currentStage + 1
            fadeClientScreen()
            setTimer(setStage, 1000, 1, currentStage)
        end
    end
end

function fadeClientScreen()
    fadeCamera(false)
    setTimer(function()
        fadeCamera(true, 2.5)
    end, 1000, 1)
end
