--[[
All config values stored here for ease of use.
New jail system by: Chaos for OwlGaming
]]
pd_offline_jail = false -- PD Offline Jailing enabled or disabled. Reminder: Always enabled for admins.
pd_update_access = 59 -- Allows this faction ID to update/remove offline prisoners
hourLimit = 72 -- 0 is infinite, otherwise this is the max they can jail in hours
onlineRatio = 0.1 -- 10% of time entered is to be spent online
offlineRatio = 0.9 -- 90% of time entered is to be spent offline

gateDim = 880
gateInt = 3
objectID = 2930

speakerDimensions = { [812] = true, [851] = true, [857] = true, [861] = true, [862] = true, [880] = true, [881] = true, [882] = true }
speakerInt = 3
speakerOutX, speakerOutY, speakerOutZ = -1046.16015625, -723.65625, 32.0078125

-- Skins, ID = clothing:id
-- Male Skins
bMale = 305
bMaleID = 22638
wMale = 305
wMaleID = 22639
aMale = 305
aMaleID = 22639

-- Female Skins
bFemale = 69
bFemaleID = 22640
wFemale = 69
wFemaleID = 22641
aFemale = 69
aFemaleID = 22641


cells = {
-- [codeName] = x, y, z, int, dim, 1 = OnlineTimer - 0 = OfflineTimer, locationCode
    ["1A"] = { 227.48, 110.01, 999.01, 10, 1, type = 0, location = "Prison" },
    ["2A"] = { 223.55, 110.37, 999.01, 10, 1, type = 0, location = "Prison" },
    ["3A"] = { 219.55, 109.74, 999.01, 10, 1, type = 0, location = "Prison" },
    ["4A"] = { 215.16, 109.74, 999.01, 10, 10, type = 0, location = "Prison" },
}

arrestCols = {
    -- x, y, z, radius, int, dim
    ["Prison"] = {215.9658203125, 121.796875, 999.01623535156, 12, 10, 1}, -- Main prison  10 1 215.9658203125 121.796875 999.01623535156
}

releaseLocations = { -- This could probably be combined with above but ayy lmao? //Chaos
    -- x, y, z, int, dim
    ["Prison"] = {1543.82, -1674.89, 13.55, 0, 0}, -- Main prison
}

gates = {
  -- ["cell"] = { openx, openy, openz, openRx, openRy, openRz, closedx, closedy, closedz, closedRx, closedRy, closedRz }
    ["1A"] = { 1047.1, 1253.2, 1493, 0, 0, 0, 1047.1, 1254.9, 1493, 0, 0, 0 },
    ["2A"] = { 1047.1, 1244.7, 1493, 0, 0, 0, 1047.1, 1246.4, 1493, 0, 0, 0 },
    ["3A"] = { 1047.1, 1239.7, 1493, 0, 0, 0, 1047.1, 1241.4, 1493, 0, 0, 0 },
    ["4A"] = { 1047.1, 1234.7, 1493, 0, 0, 0, 1047.1, 1236.4, 1493, 0, 0, 0 },
}

local temp = {} -- Initialize Cols
for k, v in pairs( arrestCols ) do
  local sphere = createColSphere(v[1], v[2], v[3], v[4])
  setElementDimension(sphere, v[6])
  setElementInterior(sphere, v[5])
  setElementData(sphere, "location", k)
  temp[k] = sphere
end
arrestCols = temp
temp = nil

function isCloseTo( thePlayer, targetPlayer )
  if exports.integration:isPlayerTrialAdmin(thePlayer) then
    return true
  end

  if exports.factions:isPlayerInFaction(thePlayer, pd_update_access) then
    return true
  end

  if targetPlayer then
    local dx, dy, dz = getElementPosition(thePlayer)
    local dx1, dy1, dz1 = getElementPosition(targetPlayer)
    if getDistanceBetweenPoints3D(dx, dy, dz, dx1, dy1, dz1) < ( 30 ) then
      if getElementDimension(thePlayer) == getElementDimension(targetPlayer) then
        return true
      end
    end
  end
    return false
end

function isInArrestColshape( thePlayer )
    for k,v in pairs(arrestCols) do
        if isElementWithinColShape( thePlayer, v ) and (getElementDimension( thePlayer ) == getElementDimension( v )) then
            return k
        end
    end

    return false
end

function getCells( arrestLocation )
    local temp = {}
    for k,v in pairs(cells) do
        if v.location == arrestLocation then
            temp[k] = v
        end
    end
    return temp
end

function cleanMath(number)
    if type(number) == "boolean" then
        return
    end
    local currenttime = getRealTime()
    local currentTime = currenttime.timestamp
    local remainingtime = tonumber(number) - currentTime
    local hours = (remainingtime /3600)
    local days = math.floor(hours/24)
    local remaininghours = hours - days*24
    local hours = ("%.1f"):format(hours - days*24)

    if remainingtime<0 then
        return "Awaiting", "Release", tonumber(remainingtime)
    end

    if days>99 then
      return "Life", "Sentence", tonumber(remainingtime)
    end

    return days, hours, tonumber(remainingtime)
end
