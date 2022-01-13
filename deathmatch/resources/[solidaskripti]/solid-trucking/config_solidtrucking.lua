scriptOwner = "Solid"

-- ### IMPORTANT NOTE! The script DOES NOT spawn any trucks. You need to give your players the trucks some other way. Via owlgaming commands/shops, or through your own.

payPerMeter = 1.5 -- $ per meter
illegalBonus = 15 -- % increase if illegal shipment
donatorBonus = 20 -- % increase if player has donator perk
trucks = {[515]=true, [514]=true} -- Truck id's
trailers = {[584]=true,[435]=true,[450]=true} -- Trailer id's
owlGamingDonatorPerkID = 44 -- PerkID of donator item that a player can buy to get more bonuses. If you don't have any, set this to 9999999
timeTillTrailerGetsDeleted = 600000 -- Time (in miliseconds) till script automatically deletes trailers that haven't been delivered.
policeFactionID = 1 -- ID of police faction in owlgaming gamemode.
truckingBlipPath = "blips/trucking-blip.png" -- File path for custom blip. YOU NEED THE CustomBlips resource for this to not throw errors!



deliveryPoints = { --ID, "Loading spot", x1, y1, z1, "Delivery point", x2, y2, z2, illegal (true/false), "illegal load contents (string | Leave empty string if not illegal)"
    {1,"Los Santos warehouse", 2200.775, -2234.703, 13.547, "Angel Pine wood works", -1996.534, -2424.312, 30.625, false,""},
    {2,"Los Santos airport", 1993.948, -2315.095, 13.547, "San Fierro chemical factory", -1016.353, -654.535, 32.008, false,""},
    {3,"San Fierro autoparts", -1824.151, 41.353, 15.123, "Los Santos car part shop", 1908.814, -1861.949, 13.563, false,""},
    {4,"Los Santos oil refinery", 2484.325, -2113.073, 13.547, "RS Haul Gas Station", -86.82, -1190.5, 1.75, false,""},
    {5,"Suspecious garages", 2031.848, -1288.106, 20.948, "Church", 1444.139, 754.613, 10.82, true, "vairākus mazus bērnus."},
    {6,"Las Venturas quarry", 623.056, 863.057, -42.953, "Los Santos port", 2796.042, -2400.849, 13.632, false,""},
    {7,"Las Venturas oil refinery", 274.128, 1374.625, 10.586, "Idlewood Gas Station", 1922.205, -1792.562, 13.383, false,""},
    {8,"Blueberry farm", -79.829, -5.604, 3.109, "Las Payasadas restoraunt", -223.05, 2601.429, 62.703, false,""},
    {9,"Dillimore farm", 1069.465, -312.408, 73.992, "Idlewood Pizzastacks", 2128.2, -1807.52, 13.553, false,""},
    {10,"Dillimore warehouse", 807.516, -603.859, 16.336, "East Beach houses", 2810.493, -1183.048, 25.301, true,"zagtas auto detaļas."},
    {11,"Las Venturas warehouse", 1724.927, 726.6, 10.82, "San Fierro logistics center", -535.852, -484.91, 25.523, false,""},
    {12,"Blueberry logistics center", -113.025, -328.277, 1.43, "Las Venturas railway warehouse", 2834.903, 912.372, 10.75, false,""},
    {13,"Las Venturas weapon factory", 2353.051, 2772.433, 10.82, "Los Santos ammunation", 1425.323, -1327.857, 13.569, true,"vairākas kastes ar nelegāliem ieročiem."},
    {14,"Las Venturas logistikas centrs", 1624.49, 2338.272, 10.82, "East Los Santos veikals", 2473.484, -1549.753, 24.004, false, ""}, 
    {15,"Los Santos Scrap facility", 2650.221, -2126.05, 13.549, "San Fierro metalworks", -1870.727, -1726.692, 21.75, false, ""},
    {16,"BlueBerry food warehouse", -15.473, -282.125, 5.43, "San Fierro supermarket", -2466.073, 786.091, 35.172, false, ""},
    {17,"Abandoned Airport", 405.114, 2487.581, 16.484, "Los Santos metalworks", 2199.114, -2657.819, 13.547, false, ""},
    {18,"Los Santos oil refinery", 2460.842, -2109.88, 13.547, "El Quebrados gas station", -1309.644, 2702.458, 50.062, false, ""},
    {19,"Los Santos oil refinery", 2490.625, -2085.162, 13.547, "San Fierro gas station", -2417.465, 953.592, 45.297, false, ""},
    {20,"Empty garage", 2081.82, -2008.551, 13.547, "Torenos house", -703.103, 955.633, 12.386, true, "vairākus konteinerus pilnus ar valdības dokumentiem."},
    {21,"Unity electronics warehouse", 1647.875, -1834.578, 13.549, "Big Ear", -346.535, 1527.429, 75.357, false, ""},
    {22,"Las Venturas factory", 1049.171, 2090.091, 10.82, "Diks sounds", 2310.746, 85.935, 26.481, false, ""},
    {23,"Snake farm",-26.534, 2339.385, 24.141, "House in the woods", 2365.478, -653.077, 127.762, true, "pudeles pilnas ar zaļu škidrumu. ((Čūsku inde))"},
    {24,"Truths farm", -1102.399, -1648.612, 76.367, "Jizzy's club", -2624.407, 1434.855, 7.102, true, "vairākus melnus iepakojumus. Viss traileris smirdētu pēc marihuānas."},
    {25,"BlueBerry containers", 369.269, -94.408, 1.369, "Fort Carson ammunation", -308.3984375, 831.0517578125, 13.194695472717, true,"vairākas kastes ar ieročiem."},
    {26,"Sprunk factory", 1340.87, 285.078, 19.561, "Caligula Casino", 2154.494, 1676.022, 10.688, false, ""},
    {27,"BlueBerry warehouses", 64.377, -269.767, 1.578, "El Quebrados hospital", -1522.402, 2533.905, 55.688, false, ""}, 
    {28,"Angel Pine garages", -2094.7412109375, -2241.708984375, 30.65567779541, "Xoomer", 220.9, 24.625, 2.578, true, "nelegālas auto detaļas."},
    {29,"69 shop", 24.75390625, -2636.9189453125, 40.417175292969, "BaySide garages", -2431.493, 2296.167, 4.984, true, "vairākas koka mucas, kas aizpildītas līdz lūpai ar alkaholu."}
}