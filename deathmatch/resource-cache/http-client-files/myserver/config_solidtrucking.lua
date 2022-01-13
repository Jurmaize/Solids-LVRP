payPerMeter = 1.5 -- $ per meter
illegalBonus = 15 -- % increase if illegal shipment
trucks = {[515]=true, [514]=true} -- Truck id's
trailers = {[584]=true,[435]=true,[450]=true,[591]=true} -- Trailer id's
wantSpawnTrucks = false -- Do you want the script to spawn trucks
truckSpawnSpots = { -- x,y,z,rot - Truck spawning locations if required
	{1930.225, -1609.578, 13.383, 91}
}


deliveryPoints = { -- "Loading spot", x1, y1, z1, "Delivery point", x2, y2, z2, illegal (true/false)
	{1,"Los Santos ceļš",1887.127, -1610.722, 13.383, "Kaut kas citur", 1825.66, -1610.274, 13.38, false},
	{2,"Cits ceļš", 1825.66, -1610.274, 13.38, "Laba vieta kpc", 1816.684, -1694.058, 13.383, true}
}
