gates = {
	--Airport, name, size, colSphere(x,y,z,radius), controlBox(x,y,z,rx,ry,rz), doorInside(x,y,z,int,dim), doorOutside(x,y,z), doorOpen, bridge, gateClosed
	{"Los Santos", "Gate C", "Large", {1566.3349609375, -2414.4658203125, 13.5546875, 20}, {1591.59998,-2425.30005,13.4,90,0,320}, {1601.6123046875,1616.783203125,15.37343788147,4,2373}, {1595.404296875,-2428.322265625,16.703125}, false, false, false},
	{"Los Santos", "Gate D", "Large", {1646.5224609375, -2415.0859375, 13.5546875, 20}, {1671.09998,-2425.3999,13.4,90,0,324.249}, {1601.6123046875,1616.783203125,15.37343788147,4,2376}, {1674.802734375,-2428.2724609375,16.703125}, false, false, false},
	{"Los Santos", "Gate E", "Large", {1726.12109375, -2419.552734375, 13.5546875, 20}, {1753.09998,-2425.3999,13.4,90,0,324.245}, {1601.6123046875,1616.783203125,15.37343788147,4,2379}, {1756.6884765625,-2428.291015625,16.703125}, false, false, false},
	{"Los Santos", "Gate F", "Large", {1886.2646484375, -2367.037109375, 13.5546875, 20}, {1885.30005,-2343.19995,13.4,90,0,54.245}, {1601.6123046875,1616.783203125,15.37343788147,4,2382}, {1888.212890625,-2339.6484375,16.703125}, false, false, false},
	{"Los Santos", "Gate G", "Large", {1880.2509765625, -2285.49609375, 13.546875, 20}, {1885.69995,-2258.69995,13.4,90,0,54.245}, {1601.6123046875,1616.783203125,15.37343788147,4,2386}, {1888.61328125,-2255.021484375,16.703125}, false, false, false},
	--[[
	{"San Fierro", "Gate C", "Medium", {-1470.5986328125, -194.28515625, 14.1484375, 20}, {-1460.09998,-216,14,90,0,166}, {-1451.9888916016, -190.7216796875, 18.605730056763,0,0}, {-1453.94921875, -190.16015625, 17.374486923218}, false, false, false},
	{"San Fierro", "Gate D", "Large", {-1370.482421875, -221.3330078125, 14.1484375, 20}, {-1416.40002,-232.10001,14,90,0,152.248}, {-1406.1607666016, -207.20858764648, 18.605730056763,0,0}, {-1404.0087890625, -208.037109375, 17.374486923218}, false, false, false},
	{"San Fierro", "Gate E", "Large", {-1336.0625, -257.138671875, 14.1484375, 20}, {-1347.09998,-301,14,90,0,112.243}, { -1323.0211181641, -291.57754516602, 18.605730056763,0,0}, {-1323.9306640625, -289.5205078125, 17.374486923218}, false, false, false},
	{"San Fierro", "Gate F", "Large", {-1298.927734375, -355.7373046875, 14.1484375, 20}, {-1331.19995,-344.89999,14,90,0,104.242}, {-1305.607421875, -336.51309204102, 18.605730056763,0,0}, {-1304.87890625, -338.7001953125, 17.374486923218}, false, false, false},
	--]]
}
shapes = {}
outsidePickup = {}
fuelSpots = {
	--colSphere(x,y,z,radius), pumpObject(model,x,y,z,rx,ry,rz), bool avgas, bool jet a-1
	{{1819,-2416.1999511719,13.60000038147,20}, {1676,1962.7,-2233.1,14.1,0,0,0}, true, true}, --LSIA
}
fuelShapes = {}