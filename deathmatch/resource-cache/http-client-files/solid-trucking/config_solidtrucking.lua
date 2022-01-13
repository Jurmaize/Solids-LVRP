scriptOwner = "Solid"

payPerMeter = 1.5 -- $ per meter
illegalBonus = 15 -- % increase if illegal shipment
donatorBonus = 20 -- % increase if player has donator perk
trucks = {[515]=true, [514]=true} -- Truck id's
trailers = {[584]=true,[435]=true,[450]=true} -- Trailer id's
truckSpawnSpots = { -- x,y,z,rot - Truck spawning locations if required
	{1930.225, -1609.578, 13.383, 91}
}
timeTillTrailerGetsDeleted = 600000 -- Time (in miliseconds) till script automatically deletes trailers that haven't been delivered.
policeFactionID = 1 -- ID of police faction in owlgaming gamemode.



deliveryPoints = { --ID, "Loading spot", x1, y1, z1, "Delivery point", x2, y2, z2, illegal (true/false), "illegal load contents (string | Leave empty string if not illegal)"
    {1,"Los Santos noliktava", 2200.775, -2234.703, 13.547, "Angel Pine gateris", -1996.534, -2424.312, 30.625, false,""},
    {2,"Los Santos lidostas angārs", 1993.948, -2315.095, 13.547, "San Fierro ķīmiskā fabrika", -1016.353, -654.535, 32.008, false,""},
    {3,"San Fierro autodetaļu fabrika", -1824.151, 41.353, 15.123, "Los Santos tūninga veikals", 1908.814, -1861.949, 13.563, false,""},
    {4,"Los Santos naftas pārstrāde", 2484.325, -2113.073, 13.547, "RS Haul benzīntanks", -86.82, -1190.5, 1.75, false,""},
    {5,"Aizdomīgas garāžas", 2031.848, -1288.106, 20.948, "Godīga Baznīca", 1444.139, 754.613, 10.82, true, "vairākus mazus bērnus."},
    {6,"Las Venturas raktuves", 623.056, 863.057, -42.953, "Los Santos osta", 2796.042, -2400.849, 13.632, false,""},
    {7,"Las Venturas naftas pārstrāde", 274.128, 1374.625, 10.586, "IGS", 1922.205, -1792.562, 13.383, false,""},
    {8,"Blueberry ferma", -79.829, -5.604, 3.109, "Las Payasadas ēstuve", -223.05, 2601.429, 62.703, false,""},
    {9,"Dillimore ferma", 1069.465, -312.408, 73.992, "Idlewood Pizzastacks", 2128.2, -1807.52, 13.553, false,""},
    {10,"Dillimore noliktava", 807.516, -603.859, 16.336, "East Beach mājas", 2810.493, -1183.048, 25.301, true,"zagtas auto detaļas."},
    {11,"Las Venturas noliktava", 1724.927, 726.6, 10.82, "San Fierro logistikas centrs", -535.852, -484.91, 25.523, false,""},
    {12,"Blueberry logistikas centrs", -113.025, -328.277, 1.43, "Las Venturas dzelzcela noliktava", 2834.903, 912.372, 10.75, false,""},
    {13,"Las Venturas ieroču fabrika", 2353.051, 2772.433, 10.82, "Los Santos ammunation", 1425.323, -1327.857, 13.569, true,"vairākas čupas ar nelegāliem ieročiem."},
    {14,"Las Venturas logistikas centrs", 1624.49, 2338.272, 10.82, "East Los Santos veikals", 2473.484, -1549.753, 24.004, false, ""}, 
    {15,"Los Santos tolmets", 2650.221, -2126.05, 13.549, "San Fierro metala fabrika", -1870.727, -1726.692, 21.75, false, ""},
    {16,"BlueBerry pārtikas noliktava", -15.473, -282.125, 5.43, "San Fierro lielveikals", -2466.073, 786.091, 35.172, false, ""},
    {17,"Veca lidosta", 405.114, 2487.581, 16.484, "Los Santos metālapstrāde", 2199.114, -2657.819, 13.547, false, ""},
    {18,"Los Santos naftas pārstrāde", 2460.842, -2109.88, 13.547, "El Quebrados benzīntanks", -1309.644, 2702.458, 50.062, false, ""},
    {19,"Los Santos naftas pārstrāde", 2490.625, -2085.162, 13.547, "San Fierro benzīntanks", -2417.465, 953.592, 45.297, false, ""},
    {20,"Tukša garāža", 2081.82, -2008.551, 13.547, "Toreno māja", -703.103, 955.633, 12.386, true, "vairākas kastes ar valdības dokumentiem."},
    {21,"Unity elektronoliktava", 1647.875, -1834.578, 13.549, "Lielā auss", -346.535, 1527.429, 75.357, false, ""},
    {22,"Las Venturas fabrika", 1049.171, 2090.091, 10.82, "Dika skaņas", 2310.746, 85.935, 26.481, false, ""},
    {23,"Čūsku ferma",-26.534, 2339.385, 24.141, "Māja meža vidū", 2365.478, -653.077, 127.762, true, "pudeles ar zaļu šķidrumu. ((čūsku inde))"},
    {24,"Patiesības ferma", -1102.399, -1648.612, 76.367, "Jizzy klubs", -2624.407, 1434.855, 7.102, true, "melnus iepakojumus. Viss traileris smirdētu pēc marihuānas."},
    {25,"BlueBerry konteineri", 369.269, -94.408, 1.369, "Fort Carson ieroču veikals", -308.3984375, 831.0517578125, 13.194695472717, true,"skaisti izkārtotus lielkalibra ieročus."},
    {26,"Sprunk fabrika", 1340.87, 285.078, 19.561, "Caligula Casino", 2154.494, 1676.022, 10.688, false, ""},
    {27,"BlueBerry noliktava", 64.377, -269.767, 1.578, "El Quebrados slimnīca", -1522.402, 2533.905, 55.688, false, ""}, 
    {28,"Angel Pine garāžas", -2094.7412109375, -2241.708984375, 30.65567779541, "Xoomer", 220.9, 24.625, 2.578, true, "San Andreas štatā aizliegtas auto detaļas."},
    {29,"69 veikals", 24.75390625, -2636.9189453125, 40.417175292969, "BaySide garāžas", -2431.493, 2296.167, 4.984, true, "vairākas mucas pilnu ar nelegāli ievestu alkoholu."}
}