g_items = {
	[1] = { "Hotdog", "Karsts un sulīgs hotdogs", 1, 2215, 205, 205, 0, 0.01, weight = 0.1 },
	[2] = { "Mobīlais telefons", "Skaists un jauns mobīlais telefons", 7, 330, 90, 90, 0, 0, weight = 0.3, metadata = { item_name = { type = 'string', rank = 'player' } } },
	[3] = { "Transportlīdzekļa atslēgas", "Transportlīdzekļa atslēgas.", 2, 1581, 270, 270, 0, 0, weight = 0.1, metadata = { key_name = { type = 'string', rank = 'player' } }, ooc_item_value = true },
	[4] = { "Mājas atslēgas", "Dzīvesvietas atslēgas.", 2, 1581, 270, 270, 0, 0, weight = 0.1, metadata = { key_name = { type = 'string', rank = 'player' } }, ooc_item_value = true },
	[5] = { "Biznesa atslēgas", "Biznesa īpašuma atslēgas.", 2, 1581, 270, 270, 0, 0, weight = 0.1, metadata = { key_name = { type = 'string', rank = 'player' } }, ooc_item_value = true },
	[6] = { "Rācija", "Melna rācija.", 7, 330, 90, 90, 0, -0.05, weight = 0.2 },
	[7] = { "Telefona grāmata", "Telefona grāmata ar personu telefonumuriem.", 5, 2824, 0, 0, 0, -0.01, weight = 2 },
	[8] = { "Sviestmaize", "Sulīga un garšīga sviestmaize ar sieru.", 1, 2355, 205, 205, 0, 0.06, weight = 0.3 },
	[9] = { "Limonāde", "Skārdene ar limonādi.", 1, 2647, 0, 0, 0, 0.12, weight = 0.2 },
	[10] = { "Metamais kauliņš", "Metamais kauliņs ar cipariem kātrā sānā.", 4, 1271, 0, 0, 0, 0.285, weight = 0.1 },
	[11] = { "Tako", "Sulīgs un gards meksikāņu tako.", 1, 2215, 205, 205, 0, 0.06, weight = 0.1 },
	[12] = { "Burgers", "Dubultais siera burgers ar bekonu.", 1, 2703, 265, 0, 0, 0.06, weight = 0.3 },
	[13] = { "Virtulis", "Lipīgs, salds virtulis.", 1, 2222, 0, 0, 0, 0.07, weight = 0.2 },
	[14] = { "Cepums", "Cepums ar šokolādes gabaliņiem.", 1, 2222, 0, 0, 0, 0.07, weight = 0.1 },
	[15] = { "Ūdens pudele", "Negāzēts ūdens pudelē.", 1, 1484, -15, 30, 0, 0.2, weight = 1 },
	[16] = { "Drēbes", "Tīras drēbes. (( Skin ID ##v ))", 6, 2386, 0, 0, 0, 0.1, weight = 1, metadata = { item_name = { type = 'string', rank = 'player', max_length = 50 } } },
	[17] = { "Rokas pulkstens", "Rokas pulkstens lai jebkurā brīdī uzzinātu laiku.", 6, 1271, 0, 0, 0, 0.285, weight = 0.1, metadata = { item_name = { type = 'string', rank = 'staff' } } },
	[18] = { "Pilsētas ceļvedis", "Mazs pilsētas ceļvedis.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[19] = { "MP3 Atskaņotājs", "Balts, jauns MP3 atskaņotājs.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 },
	[20] = { "Cīņas mākslas grāmata priekš muļķiem", "Grāmata kā iemācīties kauties.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[21] = { "Boksa grāmata priekš muļķiem", "Grāmata kā iemācīties boksu.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[22] = { "Kung Fu grāmata priekš muļķiem", "Grāmata kā iemācīties kung fu.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[23] = { "Ceļa kaušanās mākslas grāmata priekš muļķiem", "Grāmata kā iemācīties ceļa kaušanās stilu.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[24] = { "Satvēriena kaušanās mākslas grāmata priekš muļķiem", "Satvēriena kaušanās mākslas grāmata.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[25] = { "Elkoņa kaušanās mākslas grāmata muļķiem", "Elkoņa kaušanās grāmata.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[26] = { "Gāzes maska", "Melna gāzes maska lai neielpotu ķimiskās gāzes un pasargātu acis no abdulinošās granātas.", 6, 2386, 0, 0, 0, 0.1, weight = 0.5 },
	[27] = { "Abdulinošā granāta", "Maza abdulinošā granāta.", 4, 343, 0, 0, 0, 0.1, weight = 0.2 },
	[28] = { "Spīdošais elements", "Zaļš spīdošs elements.", 4, 343, 0, 0, 0, 0.1, weight = 0.2 },
	[29] = { "Durvju auns", "sarkans metāla durvju auns.", 4, 1587, 90, 0, 0, 0.05, weight = 3 },
	[30] = { "Cannabis Sativa", "Cannabis Sativa,kad samiksē ar citām narkotikām ir diezgan spēcīgs effekts.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[31] = { "Kokaīna alkaloīdi", "Kokaīna alkaloīdi, kad samiksē ar citām narkotikām ir diezgan spēcīgs effekts.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[32] = { "Sēnes skābe", "Sēnes skābes, kad samiksē ar citām narkotikām ir diezgan spēcīgs effekts.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[33] = { "Nepārstrādāts PCP", "Nepārstrādāts PCP, kad samiksē ar citām narkotikām ir diezgan spēcīgs effekts.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[34] = { "Kokaīns", "Pulverveida viela, kura rada enerģijas uzplauksnijumu.", 3, 1575, 0, 0, 0, 0, weight = 0.1 },
	[35] = { "Morfīns", "Tablete vai šķidrums kas rada lielu eiforiju pret sāpēm.", 3, 1578, 0, 0, 0, -0.02, weight = 0.1 },
	[36] = { "Ekstazijs", "Tabletes kas rada halucinācijas un eiforiju.", 3, 1576, 0, 0, 0, 0.07, weight = 0.1 },
	[37] = { "Heroīns", "Pulverveida vai škidra veida narkotikas kas rada palēlinājuma effektu un smagu eiforiju.", 3, 1579, 0, 0, 0, 0, weight = 0.1 },
	[38] = { "Marihuāna", "Zaļa, labas kvalitātes marihuāna.", 3, 3044, 0, 0, 0, 0.04, weight = 0.1 },
	[39] = { "Metamfetamīns", "Kristāla veida vielas kas rada ļoti stipru enerģijas uzplaukumu.", 3, 1580, 0, 0, 0, 0, weight = 0.1 },
	[40] = { "Epinefrīns (Adrenalīns)", "Epinefrīns kas veicina Adrenalīna hormonu asinīs.", 3, 1575, 0, 0, 0, -0.02, weight = 0.1 },
	[41] = { "LSD", "Lizergīnskābes dietilamīds, rada halucinācijas.", 3, 1576, 0, 0, 0, 0, weight = 0.1 },
	[42] = { "Sēnes", "Žāvētas halucigēnās sēnes.", 3, 1577, 0, 0, 0, 0, weight = 0.1 },
	[43] = { "PCP", "Fenciklidīna pulveris.", 3, 1578, 0, 0, 0, 0, weight = 0.1 },
	[44] = { "Ķīmiķus komplekts", "Mazs un parocīgs ķīmiķu komplekts.", 4, 1210, 90, 0, 0, 0.1, weight = 3 },
	[45] = { "Rokudzelži", "Metāla rokudzelži.", 4, 2386, 0, 0, 0, 0.1, weight = 0.4 },
	[46] = { "Virve", "Gara virve.", 4, 1271, 0, 0, 0, 0.285, weight = 0.3 },
	[47] = { "Rokudzelžu atslēgas", "Atslēgas lai atslēgtu rokudzelžus.", 4, 2386, 0, 0, 0, 0.1, weight = 0.05 },
	[48] = { "Mugursoma", "Mugursoma lai saliktu savas mantas tajā un varētu pārnēsāt.", 4, 3026, 270, 0, 0, 0, weight = 1 },
	[49] = { "Maksķere", "2 metrus gara karbona makšķere.", 4, 338, 80, 0, 0, -0.02, weight = 1.5 },
	[50] = { "Los Santos Lielceļu kods", "Los Santos Lielceļu kods.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[51] = { "Ķīmija 101",  "Rokasgrāmata ķīmijā.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[52] = { "Policista rokasgrāmata", "Rokasgrāmata policistiem.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[53] = { "Alkometrs", "Mazs melns alkometrs.", 4, 1271, 0, 0, 0, 0.285, weight = 0.2 },
	[54] = { "Lielā tumba", "Melna lielā tumba.", 7, 2226, 0, 0, 0, 0, weight = 3 },
	[55] = { "Biznesa karte", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[56] = { "Slēpošanas maska", "Maska slēpošanai.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 },
	[57] = { "Degvielas kanna", "Maza metāla degvielas kanna.", 4, 1650, 0, 0, 0, 0.30, weight = 1 }, -- would prolly to make sense to make it heavier if filled
	[58] = { "Ziebrand Alus", "Garšīgs alus, importēts no Holandes.", 1, 1520, 0, 0, 0, 0.15, weight = 1 },
	--[59] = { "Mudkip", "So i herd u liek mudkips? mabako's Favorite.", 1, 1579, 0, 0, 0, 0, weight = 0 },
	[60] = { "Seifs", "Seifs kurā glabāt vērtīgus priekšmetus.", 4, 2332, 0, 0, 0, 0, weight = 5 },
	[61] = { "Policijas bākugunis", "Policijas gaismas sirēnas, kuras vari uzlikt uz sava transporta.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 },
	[62] = { "Bastradov Vodka", "Priekš tava labākā drauga - Bastradov Vodka.", 1, 1512, 0, 0, 0, 0.25, weight = 1 },
	[63] = { "Skotu viskijs", "Labs skotu viskijs kas eksluzīvi taisīts no Haggis.", 1, 1512, 0, 0, 0, 0.25, weight = 1 },
	[64] = { "LSPD žetons", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[65] = { "LSFD žetons", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[66] = { "Acu aizsegs", "Melns acu aizsegs.", 6, 2386, 0, 0, 0, 0.1, weight = 0.1 },
	--[67] = { "GPS", "(( This item is currently disabled. ))", 6, 1210, 270, 0, 0, 0.1, weight = 0.8 },
	[68] = { "Loterijas biļete", " Los Santos Loterijas biļete.", 6, 2894, 0, 0, 0, -0.01, weight = 0.1 },
	[69] = { "Grāmata ar vārdu nozīmi", "Šeit parasti meklē vārdu nozīmes.", 5, 2824, 0, 0, 0, -0.01, weight = 1.5 },
	[70] = { "Pirmās palīdzības komplekts", "Glābj dzīvības. Var izmantot #v reizes.", 4, 1240, 90, 0, 0, 0.05, weight = function(v) return v/3 end },
	[71] = { "Piezīmjbloks", "Piezīmjbloks kurā pierakstīt savas domas. #v lapas palikušas. ((/writenote))", 4, 2894, 0, 0, 0, -0.01, weight = function(v) return v*0.01 end },
	[72] = { "Piezīme", "Piezīmē rakstīts: #v", 4, 2894, 0, 0, 0, 0.01, weight = 0.01 },
	[73] = { "Lifta pults", "Maza lifta pults.", 2, 364, 0, 0, 0, 0.05, weight = 0.3, metadata = { key_name = { type = 'string', rank = 'player' } }, ooc_item_value = true },
	--[74] = { "Bomba", "Kas gan var notikt kad šo izmanto?", 4, 363, 270, 0, 0, 0.05, weight = 2 },
	--[75] = { "Bombas Detonātors", "Maza sarkana podziņa.", 4, 364, 0, 0, 0, 0.05, weight = 100000 },
	[76] = { "Riot vairogs", "Smags riot vairogs.", 4, 1631, -90, 0, 0, 0.1, weight = 5 },
	[77] = { "Kāršu kava", "Kāršu kava lai uzspēlētu kādu spēli.", 4,2824, 0, 0, 0, -0.01, weight = 0.1 },
	[78] = { "San Andreas Pilota Sertifikāts", "Oficiāla pilota sertifikāts lai vadītu lidmašīnu un helikopteru.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[79] = { "Porno Ieraksts", "Porno video ieraksts, #v", 4,2824, 0, 0, 0, -0.01, weight = 0.2 },
	[80] = { "Generic Item", "#v", 4, 1271, 0, 0, 0, 0, weight = 1, newPickupMethod = true, metadata = {
			item_name = { type = 'string', rank = 'staff:once' }, model = { type = 'integer', rank = 'staff:once' }, scale = { type = 'string', rank = 'staff:once' },
			url = { type = 'string', rank = 'staff' }, texture = { type = 'string', rank = 'staff' }, weight = { type = 'string', rank = 'staff:once' },
		}
	}, --itemValue= name:model:scale:texUrl:texName --Do not use http:// in URL (since the : is divider), script will add http:// for this item.
	[81] = { "Ledusskapis", "Ledusskapis kurā uzglabāt ēdienus un dzērienus lai tos uzturētu vēsus.", 7, 2147, 0, 0, 0, 0, weight = 0.1, storage = true, capacity = 50, acceptItems = {[-1] = true} },
	[82] = { "Bureau of Traffic Services Identification", "This Bureau of Traffic Services Identification has been issued to #v.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[83] = { "Kafijas krūze", "Maza krūze kurā ir ielieta karsta kafija.", 1, 2647, 0, 0, 0, 0.12, weight = 0.25 },
	[84] = { "Escort 9500ci Radaru Detektors", "Paziņo, kad policija ir tuvumā.", 7, 330, 90, 90, 0, -0.05, weight = 1 },
	[85] = { "Policijas sirēnas", "Sirēnas, kuras uzlikt uz policistu auto.", 7, 330, 90, 90, 0, -0.05, weight = 0.2 },
	[86] = { "SAN ID karte", "#v.", 10, 330, 90, 90, 0, -0.05, weight = 0.3 },
	[87] = { "LS Valdības Žetons", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.5 },
	[88] = { "Bezvadu austiņa", "Maza bezvadu austiņa, ko var iespējams savienot ar rāciju.", 7, 1581, 270, 270, 0, 0, weight = 0.15 },
	[89] = { "Generic Food", "#v", 1, 2222, 0, 0, 0, 0.07, weight = 0.5, newPickupMethod = true },
	[90] = { "Motokrosa ķivere", "Ideāla priekš motokrosa.", 6, 2799, 0, 0, 0, 0.2, weight = 1.5, scale = 1, hideItemValue = true, metadata = { url = { type = 'string', rank = 'player', max_length = 50 } } },
	[91] = { "Olu piena punčš", "Ņam, ņam.", 1, 2647, 0, 0, 0, 0.1, weight = 0.5 }, --91
	[92] = { "Tītars", "Ņam, ņam.", 1, 2222, 0, 0, 0, 0.1, weight = 3.8 },
	[93] = { "Ziemassvētku pudiņš", "Ņam, ņam.", 1, 2222, 0, 0, 0, 0.1, weight = 0.4 },
	[94] = { "Ziemassvētku dāvana", "Es zinu, ka tu tādu vēlies.", 4, 1220, 0, 0, 0, 0.1, weight = 1 },
	[95] = { "Generic Drink", "#v", 1, 1455, 0, 0, 0, 0, weight = 0.5, newPickupMethod = true }, --[95] = { "Drink", "", 1, 1484, -15, 30, 0, 0.2, weight = 1 },
	[96] = { "Macbook Pro A1286 Core i7", "Augstas klases MacBook lai sērfotu internetā un rakstītu ēpastus.", 6, 2886, 0, 0, 180, 0.1, weight = function(v) return v == 1 and 0.2 or 1.5 end },
	[97] = { "LSFD Procedūru rokasgrāmata", "Los Santos Neatliekamās Palīdzības procedūru rokasgrāmata.", 5, 2824, 0, 0, 0, -0.01, weight = 0.5 },
	[98] = { "Garāžas pults", "Maza pults lai atvērtu un aizvērtu garāžas durvis.", 2, 364, 0, 0, 0, 0.05, weight = 0.3, metadata = { key_name = { type = 'string', rank = 'player' } }, ooc_item_value = true },
	[99] = { "Dažādu dārzeņu plate", "Veselīgam dzīvesveidam.", 1, 2355, 205, 205, 0, 0.06, weight = 0.4 },
	[100] = { "Mazā piena paciņa", "Stiprākiem kauliem!", 1, 2856, 0, 0, 0, 0, weight = 0.2 },
	[101] = { "Mazā suliņas paciņa", "Izslāpis?", 1, 2647, 0, 0, 0, 0.12, weight = 0.2 },
	[102] = { "Kāposts", "Vegāniem.", 1, 1271, 0, 0, 0, 0.1, weight = 0.4 },
	[103] = { "Plaukts", "Liels plaukts kur salikt mantas", 4, 3761, -0.15, 0, 85, 1.95, weight = 0.1, storage = true, capacity = 100 },
	[104] = { "Parocīgs TV", "Parocīgs TV priekš skatīšanās.", 6, 1518, 0, 0, 0, 0.29, weight = 1 },
	[105] = { "Cigarešu paciņa", "Paciņa ar #v cigaretēm iekšā.", 6, 3044 , 270, 0, 0, 0.1, weight = function(v) return 0.1 + v*0.03 end }, -- 105
	[106] = { "Cigarete", "Smēķēšanai, lai nobeigtu plaušas.", 6, 3044 , 270, 0, 0, 0.1, weight = 0.03 }, -- 106
	[107] = { "Škiltavas", "Dažādu priekšmetu aizdedzināšanai.", 6, 1210, 270, 0, 0, 0.1, weight = 0.05 }, -- 107
	[108] = { "Pankūka", "Taukaina pankūka, mmmm.....", 1, 2222, 0, 0, 0, 0.07, weight = 0.5 }, -- 108
	[109] = { "Auglis", "Veselīgam dzīvesveidam.", 1, 2222, 0, 0, 0, 0.07, weight = 0.35 }, -- 109
	[110] = { "Dārzenis", "Veselīgam dzīvesveidam!.", 1, 2222, 0, 0, 0, 0.07, weight = 0.35  }, -- 110
	[111] = { "Pārnēsajamais GPS", "Parocīgs un pārnēsājams GPS.", 6, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 111
	[112] = { "San Andreas Lielceļas Patruļas žetons", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, -- 142
	[113] = { "Paciņa ar spidošajiem elementiem", "Paciņa ar #v spīdošajiem elementiem iekšā.", 6, 1210, 270, 0, 0, 0.1, weight = function(v) return v * 0.2 end }, -- 113
	[114] = { "Transportlīdzekļa uzlabojums", "#v", 4, 1271, 0, 0, 0, 0.285, weight = 1.5 }, -- 114
	[115] = { "Ierocis", "#v ", 8, 2886, 270, 0, 1, 0.1, 2, weight = function( v )
																		local weaponID = tonumber( explode(":", v)[1] )
																		return weaponID and weaponweights[ weaponID ] or 1
																	end
	}, -- 115
	[116] = { "Patronu paciņa", "Patronu kastīte ar #v patronām iekšām.", 9, 2040, 0, 1, 0, 0.1, 3,
		weight = function( v )
			local packs = explode(":", v)
			local ammo_id = tonumber( packs[1] )
			local bullets = tonumber( packs[2] )
			if ammo_id and bullets then
				local ammunition = exports.weapon:getAmmo(ammo_id)
				return ammunition and exports.global:round(ammunition.bullet_weight*bullets, 3)
			end
			return 0.2
		end
	}, -- 2886 / 116
	[117] = { "Rampa", "Noderīgs lai piekrautu DFT-30s.", 4, 1210, 270, 1, 0, 0.1, 3, weight = 5 }, -- 117
	[118] = { "Robežu caurlaide", "Ieliec auto lai tevi automātiski izlaistu cauri robežkontrolei.", 6, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 118
	[119] = { "Sanitārais Andreas ID", "Sanitārais Andreas Identifikācijas Kartiņa.", 10, 1210, 270, 0, 0, 0.1, weight = 0.2 }, -- 119
	[120] = { "Niršanas ekipējums", "Ļauj tev nirt zem ūdens ilgāku laiku.", 6, 1271, 0, 0, 0, 0.285, weight = 4 }, --120
	[121] = { "Kaste ar priekšmetiem", "Diezgan liela kaste , kas ir pilna ar produktiem!", 4, 1271, 0, 0, 0, 0.285, weight = function(v) return tonumber(v) and tonumber(v) or 50 end }, --121
	[122] = { "Gaiši Zila Bandana", "Gaiši Zila lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 122
	[123] = { "Sarkana Bandana", "Sarkana lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 123
	[124] = { "Dzeltena Bandana", "Dzeltena lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 124
	[125] = { "Violeta Bandana", "Violeta lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 125
	[126] = { "Drošības josta", "Cieša, melna , ādas drošības josta ar daudz makstīm.", 4, 2386, 270, 0, 0, 0, weight = 1 }, -- 126
	[127] = { "LSIA Identifikācija", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --127
	[128] = { "Neizmantots Žetons", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --128 | ADD TTR FACTION BAGDE ITEM | 24.1.14
	[129] = { "Importa ID", "A Direct Imports ID.", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --129
	[130] = { "Transporta signalizācijas sistēma", "Signalizācija tavam auto.", 6, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 130
	[131] = { "LSCSD Žetons", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, -- 131
	[132] = { "Recepšu pudelīte", "Recepšu pudelīte ar recepšu zālēm iekšā.", 3, 1575, 0, 0, 0, 0.04, weight = 0.1 }, --132
	[133] = { "Autovadītāja tiesības - Automotive", "Los Santos braukšanas licenze.", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[134] = { "Nauda", "ASV valūta.", 10, 1212, 0, 0, 0, 0.04, weight = 0.3 }, -- 134
	[135] = { "Zila Bandana", "Zila lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 135
	[136] = { "Brūna Bandana", "Brūna lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 136
	[137] = { "Kobras kamera", "Kobras kamera, izmanto SWAT operācijās.", 7, 330, 90, 90, 0, -0.05, weight = 0.3 }, -- 137
	[138] = { "Iebūvētā lokators", "Ierīce ko izmanto Policijas operācijās.", 4, 1271, 0, 0, 0, 0.285, weight = 0.5 }, -- 138
	[139] = { "Transportlīdzekļa lokators", "Ierīce ar ko atrast transportlīdzekļa atrašanās vietu", 7, 1271, 0, 0, 0, 0.285, weight = 0.2 }, --139
	[140] = { "Oranžas bākugunis", "Oranžas bākugunis kuras var uzlikt uz auto.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 }, --140
	[141] = { "Megafons", "Megafons.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 }, --141
	[142] = { "Los Santos Taxi & Autobusu ID", "A Los Santos Taksistu & Autobusu Identifikācijas Kartiņa.", 10, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 142
	[143] = { "Mobīlo datu terminālis", "Mobīlo datu terminālis.", 7, 2886, 0, 0, 180, 0.1, weight = 0.1 }, -- 143
	[144] = { "Dzeltena bākuguns", "Dzeltena bākuguns kuru uzlikt uz auto.", 7, 2886, 270, 0, 0, 0.1, weight = 0.1 }, -- 144
	[145] = { "Lukturīts", "Baterija: #v%", 7, 15060, 0, 90, 0, 0.05, weight = 0.3 },
	[146] = { "Los Santos Tiesas Identifikācijas Kartiņa", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[147] = { "Tapetes", "Lai uzlabot interjera izskatu.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 }, --147
	[148] = { "Ieroču nēsāšanas licenze", "Licenze lai varētu legāli nēsāt ieroci.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[149] = { "Ieroča turēšana makstī licenze - LSPD", "Licenze lai varētu nēsāt ieroci makstī priekš LSPD.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[150] = { "Bankas karte", "Bankas karte ko var ielikt bankomātā lai izņemtu/ieliktu naudu bankas kontā.", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[151] = { "Lifta pults transportiem", "Bezvadu pults lai paceltu auto.", 2, 364, 0, 0, 0, 0.05, weight = 0.3 },
	[152] = { "San Andreas Identifikācijas Kartiņa", "Plastikāta ID karte.", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[153] = { "Vaditāja Licenze - Motocikliem", "Los Santos motocikla braukšanas licenze.", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[154] = { "Zvejošanas atļauja", "Los Santos zvejošanas atļauja", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[155] = { "Vadītāja licenze - Laivai", "Los Santos laivu vadītāja licenze.", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[156] = { "Los Santos Augstās tiesas ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[157] = { "Instrumentu kaste", "Sarkana , metāla instrumentu kaste ar instrumentiem tajā.", 4, 1271, 0, 0, 0, 0, weight = 0.5 },
	[158] = { "Zaļa Bandana", "Zaļa lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 158
	[159] = { "Sparta Inc. ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- 159 | Sparta Incorporated ID
	[160] = { "Portfelis", "Portfelis.", 6, 1210, 90, 0, 0, 0.1, weight = 0.4}, -- Exciter
	[161] = { "Fleming Arhitektūras ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- 161 | anumaz Fleming Architecture and Construction ID
	[162] = { "Bruņuveste", "Ložu necaurlaidīga veste.", 6, 3916, 90, 0, 0, 0.1, weight = 4}, -- Exciter
	[163] = { "Sporta soma", "Sporta soma lai pārnēsātu sporta mantas.", 6, 3915, 90, 0, 0, 0.2, weight = 0.4}, -- Exciter
	[164] = { "Medicīnas soma", "Soma ar advancētu medicīnas aprīkojumu.", 6, 3915, 0, 0, 0, 0.2, weight = 1, texture = {{":artifacts/textures/medicbag.png", "hoodyabase5"}} }, -- Exciter
	[165] = { "DVD", "Video disks.", 4, 2894, 0, 0, 0, -0.01, weight = 0.1 }, -- Exciter
	[166] = { "ClubTec VS1000", "Video Sistēma.", 4, 3388, 0, 0, 90, -0.01, weight = 5, scale = 0.6, preventSpawn = true, newPickupMethod = true }, -- Exciter
	[167] = { "Zelta rāmis", "Ieliec savu bildi iekšā un pieliec pie sienas.", 4, 2287, 0, 0, 0, 0, weight = 1, doubleSided = true, newPickupMethod = true }, -- Exciter
	[168] = { "Oranža Bandana", "Oranža lupata.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 },
	[169] = { "Digitālā interjera atslēga", "Drošāka nekā atslēgu sistēma , nav iespējams uzlauzt.", 6, 2922, 0, 0, 180, 0.2, weight = 0.5 }, --Maxime
	[170] = { "Taustiņkarte", "Novelc kartiņu #v", 2, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Exciter
	[171] = { "Baikeru ķivere", "Ideāla priekš baikeriem.", 6, 3911, 0, 0, 0, 0.2, weight = 1.5, scale = 1, hideItemValue = true, metadata = { url = { type = 'string', rank = 'player', max_length = 50 } } },
	[172] = { "Pilnas sejas ķivere", "Ideāla un droša priekš motocikliem", 6, 3917, 0, 0, 0, 0.2, weight = 1.5, scale = 1, hideItemValue = true, metadata = { url = { type = 'string', rank = 'player', max_length = 50 } } },
	[173] = { "CSDD Pārdošanas atļauja", "Dokuments lai kādam varētu pārdot savu transportu.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 }, -- Anumaz
	[174] = { "FAA Elektroniskā karte", "Elektroniskā karte kas parāda ceļus pa visu San Andreas.", 4, 1271, 0, 0, 0, -0.01, weight = 0.01 }, -- Anumaz
	[175] = { "Plakāts", "Izklaidējošs un informatīvs plakāts.", 4, 2717, 0, 0, 0, 0.7, weight = 0.01, hideItemValue = true }, -- Exciter
	[176] = { "Lielā tumba", "Liela melna tumba kas ir skaļa un basiem pilna.", 7, 2232, 0, 0, 0, 0.6, weight = 3 }, -- anumaz
	[177] = { "Remote Dispatch Device", "A remote dispatch device connected to Dispatch Center.", 7, 1581, 0, 0, 0, 0.6, weight = 0.01 }, -- anumaz
    [178] = { "Book", "#v", 5, 2824, 0, 0, 0, -0.1, weight = 0.1}, -- Chaos
    [179] = { "Mašīnas dekors", "Dekors ar ko izdokorēt savu auto.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 }, -- Exciter
    [180] = { "SAPT ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- Exciter
    [181] = { "Tinamie papīrīši", "Caurspīdigi tinamie papīrīši. Paciņa ietilpst #v papīriņi.", 4, 3044 , 270, 0, 0, 0.1, weight = function(v) return 0.1 + v*0.03 end },
    [182] = { "Uztīts džoints", "Uztīts džoints kas ir pilns ar svaigu marihuānu.", 4, 1485, 270, 0, 0, 0.1, weight = 0.03 },
    [183] = { "Viozy Klientu Karte", "Viozy Biznesa eksluzīvā klientu karte", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --  Chase
    [184] = { "HP Charcoal Window Film", "Viozy HP Charcoal Window Film ((50 /chance))", 4, 1271, 0, 0, 0, 0, weight = 0.6 }, -- Chase
    [185] = { "CXP70 Window Film", "Viozy CXP70 Window Film ((95 /chance))", 4, 1271, 0, 0, 0, 0, weight = 0.3 }, -- Chase
    [186] = { "Viozy Border Edge Cutter (Red Anodized)", "Border Edge Cutter for Tinting", 4, 1271, 0, 0, 0, 0, weight = 0.05 }, -- Chase
    [187] = { "Viozy Solar Spectrum Tranmission Meter", "Spectrum Meter for testing film before use", 7, 1271, 0, 0, 0, 0, weight = 2 }, -- Chase
    [188] = { "Viozy Tint Chek 2800", "Measures the Visible Light Transmission on any film/glass", 7, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [189] = { "Viozy Equalizer Heatwave Heat Gun", "Easy to use heat gun perfect for shrinking back windows", 7, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [190] = { "Viozy 36 Multi-Purpose Cutter Bucket", "Ideal for light cutting jobs while applying tint", 4, 1271, 0, 0, 0, 0, weight = 0.5 }, -- Chase
    [191] = { "Viozy Tint Demonstration Lamp", "Effectve presentation of tinted application", 7, 1271, 0, 0, 0, 0, weight = 0.5 }, -- Chase
    [192] = { "Viozy Triumph Angled Scraper", "6-inch Angled Scraper for applying tint", 4, 1271, 0, 0, 0, 0, weight = 0.3 }, -- Chase
    [193] = { "Viozy Performax 48oz Hand Sprayer", "Performax Hand Sprayer for tint application", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [194] = { "Viozy Vehicle Ignition - 2010 ((20 /chance))", "Vehicle Ignition made by Viozy for 2010", 4, 1271, 0, 0, 0, 0, weight = 1.5 }, -- Chase
    [195] = { "Viozy Vehicle Ignition - 2011 ((30 /chance))", "Vehicle Ignition made by Viozy for 2011", 4, 1271, 0, 0, 0, 0, weight = 1.3 }, -- Chase
    [196] = { "Viozy Vehicle Ignition - 2012 ((40 /chance))", "Vehicle Ignition made by Viozy for 2012", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [197] = { "Viozy Vehicle Ignition - 2013 ((50 /chance))", "Vehicle Ignition made by Viozy for 2013", 4, 1271, 0, 0, 0, 0, weight = 0.8 }, -- Chase
    [198] = { "Viozy Vehicle Ignition - 2014 ((70 /chance))", "Vehicle Ignition made by Viozy for 2014", 4, 1271, 0, 0, 0, 0, weight = 0.6 }, -- Chase
    [199] = { "Viozy Vehicle Ignition - 2015 ((90 /chance))", "Vehicle Ignition made by Viozy for 2015", 4, 1271, 0, 0, 0, 0, weight = 0.4 }, -- Chase
    --[200] = { "Viozy Vehicle Ignition - 2016", "Vehicle Ignition not yet in production", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase (not to be used)
    --[201] = { "Viozy Vehicle Ignition - 2017", "Vehicle Ignition not yet in production", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase (not to be used)
    --[202] = { "Viozy Vehicle Ignition - 2018", "Vehicle Ignition not yet in production", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase (not to be used)
    [203] = { "Viozy Hidden Vehicle Tracker 315 Pro ((Undetectable))", "GPS HVT 315 Pro, easy installation ((and undetectable)), by Viozy", 7, 1271, 0, 0, 0, 0, weight = 3 }, -- Chase
    [204] = { "Viozy Hidden Vehicle Tracker 272 Micro ((30 /chance))", "GPS HVT 272 Micro, easy installation ((30 /chance to be found)), by Viozy", 7, 1271, 0, 0, 0, 0, weight = 0.5 }, -- Chase
    [205] = { "Viozy HVT 358 Portable Spark Nano 4.0 ((50 /chance))", "GPS HVT 358 Spark Nano 4.0 Portable ((50 /chance to be found)), by Viozy", 7, 1271, 0, 0, 0, 0, weight = 0.2 }, -- Chase
	--[206] = { "Kviešu sēklas", "Sēklas ar potencionālu", 7, 1271, 0, 0, 0, 0, weight = 0.1 }, -- Chaos
	--[207] = { "Miežu sēklas", "Sēklas ar potencionālu", 7, 1271, 0, 0, 0, 0, weight = 0.1 }, -- Chaos
	--[208] = { "Auzu sēkla", "Sēklas ar potencionālu", 7, 1271, 0, 0, 0, 0, weight = 0.1 }, -- Chaos
	[209] = { "FLU Device", "An eletronical device by Firearms Licensing Unit", 7, 1271, 0, 0, 0, 0, weight = 0.1}, -- anumaz
	[210] = { "Ziemassvētku Coca-Cola ", "Pudele kolas , ziemassvētku tematikā.", 1, 2880, 180, 0, 0, 0, weight = 0.2}, -- Exciter
	[211] = { "Ziemassvētku loterijas biļete", "No Santa Klausa.", 10, 1581, 270, 270, 0, 0, weight = 0.1, preventSpawn = true}, -- Exciter
	[212] = { "Ziemas riepas", "Ziemas riepas ar radzēm!", 4, 1098, 0, 0, 0, 0, weight = 1}, -- Exciter
	[213] = { "Pinnekjott", "Exciter's christmas favourite.", 1, 2215, 205, 205, 0, 0.06, weight = 0.1, preventSpawn = true}, -- Exciter
	[214] = { "Generic Drug", "#v", 3, 1576, 0, 0, 0, 0.07, weight = 0.1}, -- Chaos
	[215] = { "Concealed Carry Weapon License - SAHP", "A firearm permit which allows the concealment of a firearm, issued by SAHP.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[216] = { "Tier 3 Weaponry License - SAN ANDREAS", "A firearm permit which allows the handling of Tier 3 weaponry, issued by the ATF bureau.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[217] = { "Beeper", "An eletronical beeper used on specific frequencies.", 7, 1271, 0, 0, 0, 0, weight = 0.1}, -- anumaz, currently used for lsfd /alarm
	[219] = { "Bieza bruņuveste (TYPE2)", "Neieraugāma un ložu necaurlaidīga.", 6, 1581, 270, 270, 0, 0, weight = 2 },
	[220] = { "Kevlara bruņuveste (TYPE3)", "Pamanāma un laba kvalitāte.", 6, 1581, 270, 270, 0, 0, weight = 2 },
	[221] = { "Kevlar High End bruņuveste(TYPE4)", "Militārās klases bruņuveste.", 6, 1581, 270, 270, 0, 0, weight = 2 },
	[222] = { "SACMA ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- Chaos
	[223] = { "Storage Generic", "#v", 4, 3761, -0.15, 0, 85, 0.2, weight = 2, storage = true, capacity = 10 }, -- Chaos --value= Name:ModelID:Capacity
	[224] = { "Kreks", "Akmeņveidīga substance, uzpīpējot rada lielo eiforiju.", 3, 1575, 0, 0, 0, 0, weight = 0.1 },
	[225] = { "Ketamīns", "Pulverveida substance , iešņaucot rada enerģijas uzplūdumu un eiforiju.", 3, 1576, 0, 0, 0, 0, weight = 0.1 },
	[226] = { "Oksikodons", "Ļoti spēcīga pretsāpju narkotika .", 3, 1576, 0, 0, 0, 0, weight = 0.1 },
	[227] = { "Rohypnol", "A pill like substance, often crushed into powder; also known as the 'Date-rape' drug. Users often experience loss of muscle control, confusion, drowsiness and amnesia.", 3, 1576, 0, 0, 0, 0, weight = 0.1 },
	[228] = { "Xanax", "Antidepresants, var izraisīt paranoju.", 3, 1576, 0, 0, 0, 0, weight = 0.1 },
	[229] = { "JGC ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, --Exciter
	[230] = { "RPMF Incorporated ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, --Exciter
	[231] = { "Shipping Container", "A large freight container.", 4, 2934, 0, 0, 0, 1.44, weight = 0.1, hideItemValue = true, storage = true, capacity = 200 }, --Exciter --preventSpawn = true --value= registration;textureSides;textureDoors
	[232] = { "Automašīnas akumulatora lādētājs", "Vari ātri uzlādēt tavu automašīnas akumulātoru.", 7, 2040, 0, 1, 0, 0.1, 3, weight = 4.3 },
	[233] = { "DOC Badge", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[234] = { "USMCR ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[235] = { "Dinoco ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[236] = { "Nacionālā parka dienesta ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[237] = { "Melna Bandana", "Melna lupatiņa.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2}, -- George
	[238] = { "Pelēka Bandana", "Pelēka lupatiņa.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2}, -- George
	[239] = { "Balta Bandana", "Balta lupatiņa.", 6, 2386, 0, 0, 0, 0.1, weight = 0.1}, -- George
	[240] = { "Ziemassvētku cepure", "Ziemassvētku cepure.", 6, 954, 0, 0, 0, 0.1, weight = 0.1, preventSpawn = true}, -- Chaos
	--{ "Armor", "Kevlar-made armor.", 6, 373, 90, 90, 0, -0.05, weight = 1 }, -- 138
	--{ "Dufflebag", "LOL", 10, 2462, 0, 0, 0, 0.04, weight = 0.1 }, -- 135
	[241] = { "Sarkanās rozes apbedīšanas birojs ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[242] = { "Darba galds", "Galds uz ko var taisīt lietas.", 4, 936, 0, 0, 0, 0, weight = 4, storage = true, capacity = 20 }, --Exciter, factory system --preventSpawn = true
	[243] = { "Rūpnīcas mašīna", "Iekārta ar ko var ražot lietas.", 4, 14584, 0, 0, 0, 0, weight = 5, storage = true, capacity = 50 }, --Exciter, factory system --preventSpawn = true
	[244] = { "Cepeškrāsns", "Cepeškrāsns, ko var pielietot cepšanai.", 4, 2417, 0, 0, 0, 0, weight = 4, storage = true, capacity = 10 }, --Exciter, factory system --preventSpawn = true
	[245] = { "Legālās Korporācijas ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[246] = { "Los Santos bankas ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[247] = { "Astro korporācijas ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[248] = { "Projektora tālvadības pults", "Neliela tālvadības pults projektora vadīšanai ##v.", 2, 364, 0, 0, 0, 0.05, weight = 0.3, ooc_item_value = true },
	[249] = { "Rietumu risinājumu ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Unitts
	[250] = { "St John Ambulance ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[251] = { "Pizza Stack ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[252] = { "Izgāztuve", "Misene.", 4, 1344, 0, 0, 0, 0, weight = 4, hideItemValue = true, storage = true, capacity = 200 }, --Exciter
	[253] = { "Atkritumu tvertne", "Atkritumu tvertne.", 4, 1344, 270, 270, 0, 0, weight = 3, hideItemValue = true, storage = true, capacity = 50 }, --Exciter
	[254] = { "Metiens", "#vkg of litter.", 4, 1344, 270, 270, 0, 0, weight = function(v) return v end }, --Exciter --math.floor((v/50)*(10^2)+0.5)/(10^2)
	[255] = { "Atkritumi", "#vkg of waste.", 4, 1344, 270, 270, 0, 0, weight = function(v) return v end }, --Exciter
	[256] = { "Blu-Ray", "A video disc.", 4, 2894, 0, 0, 0, -0.01, weight = 0.1 }, --Exciter
	[257] = { "ClubTec VS2000", "Video System.", 4, 3388, 0, 0, 90, -0.01, weight = 6, preventSpawn = true, newPickupMethod = true, image = 166 }, --Exciter
	[258] = { "Lamborghini Automašīnas ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3, image = 129 }, --Exciter
	[259] = { "SL Incorporated ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3, image = 129 }, --Exciter
	[260] = { "Amonjaka pudele", "A bottle of ammonia.", 1, 1484, -15, 30, 0, 0.2, weight = 1 }, --Chaos
	[261] = { "Avārijas sirēna (Firetruck)", "Avārijas sirēna, ko ievietot automašīnā.", 7, 330, 90, 90, 0, -0.05, weight = 0.2, image = 85 }, -- Chaos
	[262] = { "Žetons (( Mājas Žetons ))", "Neliels plastmasas žetons. (( Izmantots, lai iegādātos jaunu māju ar vērtību < $40,000 vērtībā ))", 4, 2894, 0, 0, 0, -0.01, weight = 0.1 }, --Chaos
	[263] = { "Žetons (( Transportlīdzekļa žetons))", "A small plastic token. (( Lietots jauna transportlīdzekļa iegādei līdz < $35,000 vērtībā ))", 4, 2894, 0, 0, 0, -0.01, weight = 0.1 }, --Chaos
	[264] = { "VMAT ADS-B", "Airport ground vehicle tracking unit.", 6, 2886, 0, 0, 180, 0.1, weight = 0.9, preventSpawn = true }, --Exciter
	[265] = { "Saint Ernest Medicīnas centra darbinieka ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --Exciter
	[266] = { "SAAN personāla ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3, image = 129 },
	[267] = { "Citāts", "iestāžu izdota biļete.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 },
	[268] = { "sērfošanas dēlis", "Surfošanas dēlis.", 4, 2406, 0, 0, 0, 1.2, weight = 2 }, --Exciter
	[269] = { "Avārijas sirēna (Ambulance)", "Avārijas sirēna, ko ievietot automašīnā.", 7, 330, 90, 90, 0, -0.05, weight = 0.2, image = 85 }, -- Hurley
	[270] = { "Cimdi", "Cimdu pāris, ko varat velkāt.", 6, 2386, 0, 0, 0, 0.1, weight = 0.1, hideItemValue = true, metadata = { item_name = { type = 'string', rank = 'player', max_length = 50 } } }, -- Hurley
	[271] = { "Shell apvalks", "#v", 4, 2061, 90, 0, 0, 0, weight = 0.1, scale = 0.2 },
	[272] = { "Labradors", "#v", 4, 2351, 0, 0, 0, 0.9, weight = 5 }, -- (Dog) Yannick
	[273] = { "Vispārīgas zivis", "#v", 4, 1604, 0, 90, 0, 0.07, weight = 0.1, preventSpawn = true},
	[274] = { "Slidas", "Ideāli piemērots slidošanai uz ledus!", 6, 1852, 0, 0, 0, 1, weight = 0.1},
	[275] = { "Velosipēda slēdzene", "Velosipēda slēdzene.", 4, 1271, 0, 0, 0, 0, weight = 0.1}, -- SjoerdPSV
	[284] = { "ANPR Sistēma", "Automātiska numura zīmju atpazīšana.", 4, 367, 270, 270, 0, 0, weight = 0.1},
	[285] = { "Neapstrādāts Dzelzs", "Kilograms ar neapstrādātu dzelzi.", 4, 905, 0, 0, 0, 0, weight = 1, image = 285}, -- Solid 13/12/2021
	[286] = { "Dzelzs stienis", "Krāsnī cepts dzelzs stienis.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 286}, -- Solid 14/12/2021
	[287] = { "Metāla caurule", "Forša metāla caurule. Neuzmet nevienam to uz galvas!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 287}, -- Solid 14/12/2021
	[288] = { "Metāla plāksne", "Noderīga metāla plāksne. Ar to var taisīt lietas!.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 288}, -- Solid 14/12/2021
	[289] = { "Ass metāla gabals", "Nesagriez pirkstus!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 289}, -- Solid 14/12/2021
	[290] = { "Ieroča stobrs", "Pif paf, tikai iemācies salikt.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 290}, -- Solid 14/12/2021
	[291] = { "Aptvere", "Vajag vietu, kur iegrūst lodes.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 291}, -- Solid 14/12/2021
	[292] = { "Belznis", "Tā detaļa, kas uzsit pa patronu.", 4, 2891, 0, 0, 0, 0, weight = 1, image = 292}, -- Solid 14/12/2021
	[293] = { "Pistoļveida rokturis", "Satver cītīgi!", 4, 2891, 0, 0, 0, 0, weight = 1, image = 293}, -- Solid 14/12/2021
	[294] = { "Marihuānas sēkla", "Maza marihuānas auga sēkla. To var iesēt!", 4, 1279, 0, 0, 0, 0, weight = 0.1, image = 294}, -- Solid 16/12/2021
	[295] = { "Coca auga oga", "Coca auga oga. Iekš ogas ir sēkla, kuru var iestādīt!", 4, 1279, 0, 0, 0, 0, weight = 0.1, image = 295}, -- Solid 19/12/2021
	[296] = { "Coca auga lapas", "Coca auga lapas! Veicot noteiktas darbības šo var pārvērst par kokaīnu!", 4, 1279, 0, 0, 0, 0, weight = 0.1, image = 296}, -- Solid 19/12/2021
	[297] = { "Kokaīna taisīšanas muca", "Metāla muca, kurā var taisīt kokaīnu!", 4, 3632, 0, 0, 0, 0, weight = 1, image = 297}, -- Solid 26/12/2021
	[298] = { "Cementa pulveris", "Cementa pulveris. Noder būvniecībā un citur...", 4, 1279, 0, 0, 0, 0, weight = 1, image = 298}, -- Solid 26/12/2021
	[299] = { "Trubu tīrāmais līdzeklis", "Trubu tīrāmais līdzeklis uz sērskābes pamata.", 4, 1486, 0, 0, 0, 0, weight = 0.1, image = 299}, -- Solid 26/12/2021
	[300] = { "LSZD Laikraksts", "Los Santos Ziņu Dienesta laikraksts.", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 300}, -- Solid 01/01/2022
	[301] = { "Servera atjauninājumu laikraksts", "Laikraksts ar servera atjauninājumiem!", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 301}, -- Solid 01/01/2022
	[302] = { "Magoņu sēklas", "Magoņu sēklas, kuras var iesēt.", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 302}, -- Solid 11/01/2022
	[303] = { "Sulīga magones galviņa", "Magones galviņa, no kuras tek ārā piensula.", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 303}, -- Solid 11/01/2022
	[304] = { "Klepus sīrups", "Klepus sīrups, kas sastāv no vairākām ķimikālijām.", 4, 1486, 0, 0, 0, 0, weight = 0.1, image = 304}, -- Solid 11/01/2022
	[305] = { "Aspirīns (jeb Acetilsalicilskābe)", "Aspirīns, kas plaši pielietots medicīnā.", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 305}, -- Solid 11/01/2022
	[306] = { "Aspirīna pulveris", "Aspirīns, kas saspiests pulverī.", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 306}, -- Solid 11/01/2022
	[307] = { "Rūsas noņēmējs", "Ķimikālija ar ko noņem rūsu.", 4, 1220, 0, 0, 0, 0, weight = 0.1, image = 307}, -- Solid 11/01/2022
	[308] = { "Heroīna muca", "Muca, kurā var pagatavot heroīnu!", 4, 935, 0, 0, 0, 0, weight = 1, image = 308}, -- Solid 12/01/2022
}

	-- name, description, category, model, rx, ry, rz, zoffset, weight

	-- categories:
	-- 1 = Food & Drink
	-- 2 = Keys
	-- 3 = Drugs
	-- 4 = Other
	-- 5 = Books
	-- 6 = Clothing & Accessories
	-- 7 = Electronics
	-- 8 = guns
	-- 9 = bullets
	-- 10 = wallet

weaponmodels = {
	[1]=331, [2]=333, [3]=326, [4]=335, [5]=336, [6]=337, [7]=338, [8]=339, [9]=341,
	[15]=326, [22]=346, [23]=347, [24]=348, [25]=349, [26]=350, [27]=351, [28]=352,
	[29]=353, [32]=372, [30]=355, [31]=356, [33]=357, [34]=358, [35]=359, [36]=360,
	[37]=361, [38]=362, [16]=342, [17]=343, [18]=344, [39]=363, [41]=365, [42]=366,
	[43]=367, [10]=321, [11]=322, [12]=323, [14]=325, [44]=368, [45]=369, [46]=371,
	[40]=364, [100]=373
}

-- other melee weapons?
weaponweights = {
	[22] = 1.14, [23] = 1.24, [24] = 2, [25] = 3.1, [26] = 2.1, [27] = 4.2, [28] = 3.6, [29] = 2.640, [30] = 4.3, [31] = 2.68, [32] = 3.6, [33] = 4.0, [34] = 4.3
}

--
-- Vehicle upgrades as names
--
vehicleupgrades = {
	"Pro Spoiler", "Win Spoiler", "Drag Spoiler", "Alpha Spoiler", "Champ Scoop Hood",
	"Fury Scoop Hood", "Roof Scoop", "Right Sideskirt", "5x Nitro", "2x Nitro",
	"10x Nitro", "Race Scoop Hood", "Worx Scoop Hood", "Round Fog Lights", "Champ Spoiler",
	"Race Spoiler", "Worx Spoiler", "Left Sideskirt", "Upswept Exhaust", "Twin Exhaust",
	"Large Exhaust", "Medium Exhaust", "Small Exhaust", "Fury Spoiler", "Square Fog Lights",
	"Offroad Wheels", "Right Alien Sideskirt (Sultan)", "Left Alien Sideskirt (Sultan)",
	"Alien Exhaust (Sultan)", "X-Flow Exhaust (Sultan)", "Left X-Flow Sideskirt (Sultan)",
	"Right X-Flow Sideskirt (Sultan)", "Alien Roof Vent (Sultan)", "X-Flow Roof Vent (Sultan)",
	"Alien Exhaust (Elegy)", "X-Flow Roof Vent (Elegy)", "Right Alien Sideskirt (Elegy)",
	"X-Flow Exhaust (Elegy)", "Alien Roof Vent (Elegy)", "Left X-Flow Sideskirt (Elegy)",
	"Left Alien Sideskirt (Elegy)", "Right X-Flow Sideskirt (Elegy)", "Right Chrome Sideskirt (Broadway)",
	"Slamin Exhaust (Chrome)", "Chrome Exhaust (Broadway)", "X-Flow Exhaust (Flash)", "Alien Exhaust (Flash)",
	"Right Alien Sideskirt (Flash)", "Right X-Flow Sideskirt (Flash)", "Alien Spoiler (Flash)",
	"X-Flow Spoiler (Flash)", "Left Alien Sideskirt (Flash)", "Left X-Flow Sideskirt (Flash)",
	"X-Flow Roof (Flash)", "Alien Roof (Flash)", "Alien Roof (Stratum)", "Right Alien Sideskirt (Stratum)",
	"Right X-Flow Sideskirt (Stratum)", "Alien Spoiler (Stratum)", "X-Flow Exhaust (Stratum)",
	"X-Flow Spoiler (Stratum)", "X-Flow Roof (Stratum)", "Left Alien Sideskirt (Stratum)",
	"Left X-Flow Sideskirt (Stratum)", "Alien Exhaust (Stratum)", "Alien Exhaust (Jester)",
	"X-FLow Exhaust (Jester)", "Alien Roof (Jester)", "X-Flow Roof (Jester)", "Right Alien Sideskirt (Jester)",
	"Right X-Flow Sideskirt (Jester)", "Left Alien Sideskirt (Jester)", "Left X-Flow Sideskirt (Jester)",
	"Shadow Wheels", "Mega Wheels", "Rimshine Wheels", "Wires Wheels", "Classic Wheels", "Twist Wheels",
	"Cutter Wheels", "Switch Wheels", "Grove Wheels", "Import Wheels", "Dollar Wheels", "Trance Wheels",
	"Atomic Wheels", "Stereo System", "Hydraulics", "Alien Roof (Uranus)", "X-Flow Exhaust (Uranus)",
	"Right Alien Sideskirt (Uranus)", "X-Flow Roof (Uranus)", "Alien Exhaust (Uranus)",
	"Right X-Flow Sideskirt (Uranus)", "Left Alien Sideskirt (Uranus)", "Left X-Flow Sideskirt (Uranus)",
	"Ahab Wheels", "Virtual Wheels", "Access Wheels", "Left Chrome Sideskirt (Broadway)",
	"Chrome Grill (Remington)", "Left 'Chrome Flames' Sideskirt (Remington)",
	"Left 'Chrome Strip' Sideskirt (Savanna)", "Covertible (Blade)", "Chrome Exhaust (Blade)",
	"Slamin Exhaust (Blade)", "Right 'Chrome Arches' Sideskirt (Remington)",
	"Left 'Chrome Strip' Sideskirt (Blade)", "Right 'Chrome Strip' Sideskirt (Blade)",
	"Chrome Rear Bullbars (Slamvan)", "Slamin Rear Bullbars (Slamvan)", false, false, "Chrome Exhaust (Slamvan)",
	"Slamin Exhaust (Slamvan)", "Chrome Front Bullbars (Slamvan)", "Slamin Front Bullbars (Slamvan)",
	"Chrome Front Bumper (Slamvan)", "Right 'Chrome Trim' Sideskirt (Slamvan)",
	"Right 'Wheelcovers' Sideskirt (Slamvan)", "Left 'Chrome Trim' Sideskirt (Slamvan)",
	"Left 'Wheelcovers' Sideskirt (Slamvan)", "Right 'Chrome Flames' Sideskirt (Remington)",
	"Bullbar Chrome Bars (Remington)", "Left 'Chrome Arches' Sideskirt (Remington)", "Bullbar Chrome Lights (Remington)",
	"Chrome Exhaust (Remington)", "Slamin Exhaust (Remington)", "Vinyl Hardtop (Blade)", "Chrome Exhaust (Savanna)",
	"Hardtop (Savanna)", "Softtop (Savanna)", "Slamin Exhaust (Savanna)", "Right 'Chrome Strip' Sideskirt (Savanna)",
	"Right 'Chrome Strip' Sideskirt (Tornado)", "Slamin Exhaust (Tornado)", "Chrome Exhaust (Tornado)",
	"Left 'Chrome Strip' Sideskirt (Tornado)", "Alien Spoiler (Sultan)", "X-Flow Spoiler (Sultan)",
	"X-Flow Rear Bumper (Sultan)", "Alien Rear Bumper (Sultan)", "Left Oval Vents", "Right Oval Vents",
	"Left Square Vents", "Right Square Vents", "X-Flow Spoiler (Elegy)", "Alien Spoiler (Elegy)",
	"X-Flow Rear Bumper (Elegy)", "Alien Rear Bumper (Elegy)", "Alien Rear Bumper (Flash)",
	"X-Flow Rear Bumper (Flash)", "X-Flow Front Bumper (Flash)", "Alien Front Bumper (Flash)",
	"Alien Rear Bumper (Stratum)", "Alien Front Bumper (Stratum)", "X-Flow Rear Bumper (Stratum)",
	"X-Flow Front Bumper (Stratum)", "X-Flow Spoiler (Jester)", "Alien Rear Bumper (Jester)",
	"Alien Front Bumper (Jester)", "X-Flow Rear Bumper (Jester)", "Alien Spoiler (Jester)",
	"X-Flow Spoiler (Uranus)", "Alien Spoiler (Uranus)", "X-Flow Front Bumper (Uranus)",
	"Alien Front Bumper (Uranus)", "X-Flow Rear Bumper (Uranus)", "Alien Rear Bumper (Uranus)",
	"Alien Front Bumper (Sultan)", "X-Flow Front Bumper (Sultan)", "Alien Front Bumper (Elegy)",
	"X-Flow Front Bumper (Elegy)", "X-Flow Front Bumper (Jester)", "Chrome Front Bumper (Broadway)",
	"Slamin Front Bumper (Broadway)", "Chrome Rear Bumper (Broadway)", "Slamin Rear Bumper (Broadway)",
	"Slamin Rear Bumper (Remington)", "Chrome Front Bumper (Remington)", "Chrome Rear Bumper (Remington)",
	"Slamin Front Bumper (Blade)", "Chrome Front Bumper (Blade)", "Slamin Rear Bumper (Blade)",
	"Chrome Rear Bumper (Blade)", "Slamin Front Bumper (Remington)", "Slamin Rear Bumper (Savanna)",
	"Chrome Rear Bumper (Savanna)", "Slamin Front Bumper (Savanna)", "Chrome Front Bumper (Savanna)",
	"Slamin Front Bumper (Tornado)", "Chrome Front Bumper (Tornado)", "Chrome Rear Bumper (Tornado)",
	"Slamin Rear Bumper (Tornado)"
}

--
-- Badges
--

function getBadges( )
	return {
		-- [itemID] = {elementData, name, factionIDs, color, iconID} iconID 1 = ID, 2 = badge
		-- old faction badges that existed since being inscribed on stone tablets thousands of years ago
		[156]  = { "Superior Court of San Andreas ID", 		"a Superior Court of San Andreas ID",			{[50] = true},				 	 {0, 102, 255}, 2},
		[64]  = { "LSPD žetons", 		"a LSPD žetons",			{[1] = true},				 	{0,100,255, true},	2},
		--[112]  = { "SAHP badge", 		"a SAHP badge",			{[59] = true},				 	{222, 184, 135, true},	2}, -- Sheriff department
		[65]  = { "LSFD žetons", 		"a LSFD žetons", {[2] = true},	    {175, 50, 50},	1},
		[86]  = { "SAN žetons",		"an SAN ID",				{[20] = true},					{150,150,255},	1},
		[87]  = { "GOV žetons",		"a Government badge",		{[3] = true},					{0, 80, 0},	1},

		-- bandanas
		[122] = { "gaiši zila bandana", "gaiši zila bandana",				{[-1] = true},					{0,185,200},	122, bandana = true},
		[123] = { "sarkana bandana", "sarkana bandana",				{[-1] = true},					{190,0,0},	123, bandana = true},
		[124] = { "dzeltena bandana", "dzeltena bandana",				{[-1] = true},					{255,250,0},	124, bandana = true},
		[125] = { "violeta bandana", "violeta bandana",				{[-1] = true},					{220,0,255},	125, bandana = true},
		[135] = { "zila bandana", "zila bandana",				{[-1] = true},					{0,100,255},	135, bandana = true},
		[136] = { "brūna bandana", "brūna bandana",				{[-1] = true},					{125,63,50},	136, bandana = true},
		[158] = { "zaļa bandana", "zaļa bandana",				{[-1] = true},					{50,150,50},	158, bandana = true},
		[168] = { "oranžda bandana", "oranžda bandana",				{[-1] = true},					{210,105,30},	168, bandana = true},
		[237] = { "melna bandana", "melna bandana", {[-1] = true}, {0,0,0}, 215, bandana = true},
		[238] = { "pelēka bandana", "pelēka bandana", {[-1] = true}, {255,255,255}, 216, bandana = true},
		[239] = { "balta bandana", "balta bandana", {[-1] = true}, {100,100,100}, 217, bandana = true},

		-- newer faction badges
		[127] = { "LSIA Identification",		"a LSIA ID karte",	{[47] = true},	{255,140,0},	1},
		[82] = { "Bureau of Traffic Services ID", "An ID from the Bureau no Satiksmes dienstu biroja",	{[4] = true},	{255,136,0},	1}, --MAXIME | ADD TTR FACTION BAGDE ITEM | 24.1.14
		[159] = { "Sparta Inc. ID", "An ID from Sparta Inc.", {[212] = true},  {52, 152, 219}, 1}, -- anumaz, Cargo Group ID
		[180] = { "SAPT ID", "An ID from San Andreas Public Transport", {[64] = true},  {73, 136, 245}, 1}, -- Exciter
		[222] = { "LSMA ID", "an LSMA ID", {[130] = true}, {143, 52, 173}, 1},
		[229] = { "JGC ID", "a JGC ID", {[74] = true}, {178, 0, 0}, 1},
		[230] = { "RPMF Incorporated ID", "a RPMF Incorporated ID", {[78] = true}, {0, 69, 156}, 1},
		[233] = { "Department of Corrections ID Card", "DOC Badge", {[84] = true}, {11, 97, 11}, 2},
		[234] = { "United States Jūras korpusa ID Card", "USMCR ID", {[81] = true}, {41, 57, 8}, 2},
		[235] = { "Dinoco ID karte", "a Dinoco ID", {[147] = true}, {0, 240, 255}, 1},
		[236] = { "National Park Servisa ID karte", "National Park Serv. ID", {[86] = true}, {45, 74, 31}, 1},
		[241] = { "Asas vilkšanas ID", "a Sharp Towing ID", {[101] = true}, {189, 189, 189}, 1},
		[245] = { "Juridiskās korporācijas ID", "juridiskās korporācijas ID", {[99] = true}, {255, 127, 0}, 1},
		[246] = { "Los Santos bankas ID", "Los Sanots bankas ID", {[17] = true}, {144, 195, 212}, 1},
		[247] = { "Astro korporācija ID", "a Astro korporācijas ID", {[91] = true}, {173, 151, 64}, 1},
		--[131] = { "LSCSD badge", "Los Santos apgabala šerifa deparmenta žetons", {[1] = true, [142] = true}, {222, 184, 135, true},	2},
		[249] = { "Rietumu risinājumu ID", "a Western Solutions ID karte", {[159] = true}, {255,215,0}, 1},
		[250] = { "St John Ātrā palīdzības ID", "a St John Ambulances ID karte", {[134] = true}, {0, 171, 23}, 1},
		[251] = { "Pizza Stack ID", "a Pizza Stack ID karte", {[172] = true}, {255, 173, 51}, 1},
		[258] = { "Lamborghini Automašīnas ID", "a Lamborghini Automašīnas ID karte", {[93] = true}, {10, 10, 10}, 1},
		[259] = { "SL Incorporated ID", "a SL Incorporated ID karte", {[104] = true}, {66, 66, 66}, 1},
		[265] = { "Saint Ernest medicīnas centra personāla ID", "Sent Ernesta Medicīnas centra darbinieka personas apliecības ID", {[164] = true}, {255, 112, 229}, 1},
		[266] = { "SAAN personāla ID", "a San Andreas Action News ID karte", {[145] = true}, {255, 156, 51}, 1},
		[241] = { "Red Rose Apbedīšanas biroja ID", "Sarkanās Rozes apbedīšanas biroja ID karte", {[210] = true}, {255, 153, 153}, 1}
	}
end

-- badges/IDs should generally be in the wallet.
for k, v in pairs(getBadges()) do
	if not v[3][-1] and g_items[k][3] ~= 10 then
		outputDebugString('Badge/ID' .. k .. ' is not in wallet.')
	end
end

--
-- Mask Data
--
function getMasks( )
	return {
		-- [itemID] = { elementData, textWhenPuttingOn, textWhentakingOff, hideIdentity }
		[26]  = {"gāzmaska",			"pārvelk viņu seja melnu gāzmasku",	"noslidina viņiem no sejas melnu gāzesmasku",	true},
		[56]  = {"maska",			"uzvelk masku pār viņu seju",				"noslidina masku no sejas",				true},
		[90]  = {"ķivere",			"uzvlek #name virs viņu galvas",				"novelk #name nost no galvas",				false},
		[120] = {"akvalangs",			"uzvelk akvalangu",						"noņem akvalangu aprīkojumu",						true},
		[171] = {"bikerķivere",		"uzvelk #name galvā",				"novelk #name nost no galvas",				false},
		[172] = {"pilnasejasķivere",	"uzvelk #name galva",				"novlek #name nost no galvas",				true},
		[240] = {"Ziemassvētkucepure",	"uzvelk #name galva",				"novelk #name nost no galvas",				false},
	}
end

replacedModelsWithWrongCollisionCheck = { [3915] = true }
