scriptOwner = "Solid"
xmasVehicleIds = {422, 542}
xmasVehicleCheck = {[422]=true, [542]=true}
timeIntervalBetweenCarSpawns = 10000 -- Miliseconds
xmasDeliverX, xmasDeliverY, xmasDeliverZ = 1479.557, -1697.799, 14.047

xmasVehicleSpawnPoints = -- Near what?(String), x, y, z, modelID, 
{
    {"Laba vieta #1", 2087.05078125, -1752.9375, 13.404863357544, -0, 0, 89.702},
    {"Laba vieta #2", 2087.05078125, -1752.9375, 13.404863357544, -0, 0, 89.702}
}



--[[ DATABASE TABLE FOR THE SCRIPT!
-- Table structure for table `solid_xmas_event`
--

CREATE TABLE `solid_xmas_event` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `charactername` varchar(255) NOT NULL,
  `characterid` int(11) NOT NULL,
  `deliveredvehs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `solid_xmas_event`
--
ALTER TABLE `solid_xmas_event`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `solid_xmas_event`
--
ALTER TABLE `solid_xmas_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
]]