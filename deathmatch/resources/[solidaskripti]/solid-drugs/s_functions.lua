------- Helper functions from the wiki.

function getPositionFromElementOffset(element,offX,offY,offZ) -- https://wiki.multitheftauto.com/wiki/GetElementMatrix
    local m = getElementMatrix ( element )  -- Get the matrix
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
    return x, y, z                               -- Return the transformed point
end

function getNearestObject(element,distance)
	local lastMinDis = distance-0.0001
	local nearestObject = false
	local px,py,pz = getElementPosition(element)
	local pint = getElementInterior(element)
	local pdim = getElementDimension(element)

	for _,v in pairs(getElementsByType("object")) do
		local vint,vdim = getElementInterior(v),getElementDimension(v)
		if vint == pint and vdim == pdim then
			local vx,vy,vz = getElementPosition(v)
			local dis = getDistanceBetweenPoints3D(px,py,pz,vx,vy,vz)
			if dis < distance then
				if dis < lastMinDis then 
					lastMinDis = dis
					nearestObject = v
				end
			end
		end
	end
	return nearestObject
end