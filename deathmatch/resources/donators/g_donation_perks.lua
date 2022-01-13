--[[
* ***********************************************************************************************************************
* Copyright (c) 2015 OwlGaming Community - All Rights Reserved
* All rights reserved. This program and the accompanying materials are private property belongs to OwlGaming Community
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
* ***********************************************************************************************************************
]]

donationPerks = { -- 1 eur = 100 GC
			[1] = { "Iespēja ieslēgt/izslēgt privātās ziņas", 																		50, 		7 },
			[2] = { "Iespēja ieslēgt/izslēgt reklāmas", 																			50, 		14 },
			[3] = { "Toggle-able news alerts", 																						50, 		-1 },
			[4] = { "+ $75 pie katras algas", 																				        100, 		7 },
			[5] = { "+ $175 pie katras algas",																				        250, 		7 },
			[6] = { "No phone bills", 																								50, 		0 },
			[7] = { "Free fuel", 																									50, 		0 },
			[8] = { "Discount card - 20% off in regular shops",																		50, 		0 },
			[9] = { "Dupont Premiums (+1 papildus drēbju slots)", 																    200, 		1 },
			[10] = { "Ziedotāju čats (/don)", 																	                    50, 		14 },
			[11] = { "Iespēja ieslēgt/izslēgt zelta vārdu", 																		100, 		7 },
			[12] = { "Iespēja paslēpt/parādīt sevi no spēlētāju saraksta", 															250, 		14 },
			[13] = { "Game Coins Dāvinājums", 																						35,         1 },
			[14] = { "Palielināt maksimālo interjeru skaitu", 																		100, 		1 },
			[15] = { "Palielināt maksimālo auto skaitu", 																			150,		1},
			[16] = { "Konta lietotājvārda maiņa", 																					250, 		1 },
			[17] = { "Pāris digitālu slēdženu priekš VIENA interjera",														        400,		1 },
			[18] = { "Telefons ar unikālu nummuru (6 cipari min, jābūt 2 dažādiem cipariem)",									    300,		1},
			[19] = { "Telefons ar unikālu nummuru (5 cipari min, vienalga, kādi cipari)",										    800,		1},
			[20] = { "Naudas/Mantu/Auto pārlikšana uz citu personāžu",															    750,		1},
			[21] = { "Custom interior for your interior",																			500,		-1},
			[22] = { "Instant driver's licenses & fishing permit",																	50,		    0},
			[23] = { "Personalizēts auto nummurs",																			        100,		1},
			[24] = { "Unikāls personāžu ekrāns (Grove St)",																            400,		1},
			[25] = { "Unikāls personāžu ekrāns (Star Tower)",																        550,		1},
			[26] = { "Unikāls personāžu ekrāns (Mount Chiliad)",															        450,		1},
			[27] = { "Automātiski atver jebkuru robežu 40m attālumā",														        200,		7},
			[28] = { "Jauna radio stacija ar tavām dziesmām, ko var dzirdēt jebkurš serverī",									    350,		30},
			[29] = { "Unikāli valstu rakstīšanas simboliņi",																		200,		-1},
			[30] = { "ATM Card - Premium, can be used to make transactions with a fair amount per day. (($50,000 per 5 hours))",	300,		0},
			[31] = { "ATM Card - Ultimate, can be used to make transactions with unlimited amount per day.",						1500,		0},
			[32] = { "Tūlītēji spēlētas 15 stundas (lietot, ja ir zem 15 šobrīd)",													150,		1},
			[33] = { "Cellphone private number",																					50,			-1},
			[34] = { "Instantly learn language",																					150,		0},
			[35] = { "Additional serial number in whitelist",																		150,		-1},
			[36] = { "Interior inactivity protection",																				15,		    -1},
			[37] = { "Offline private message",																						3,		    -1},
			[38] = { "Vehicle inactivity protection",																				15,		    -1},
			[39] = { "No vehicle taxes",																							300,	    -1},
			[40] = { "No interior taxes",																							200,	    -1},
			[41] = { "Free interior rentals",																						400,	     0},
			[42] = { "Papildus personāžu slots",																					100,		 1},
			[43] = { "Instant Dupont Manufacture",																					50,		     0},
			[44] = { "Tālbraucēja kepons (+20% pie kravu aizvešanas algas)",                                                        300,         14},

--					Title																											Points	Time
}

function getPerks(perkId)
	if not perkId or not tonumber(perkId) or not donationPerks[tonumber(perkId)] then
		return donationPerks
	else
		return donationPerks[tonumber(perkId)]
	end
end
