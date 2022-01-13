local x, y		= guiGetScreenSize();
local h 		= 30;
local rot		= 80;
local exists 	= {};

local mods;

local function downloadMods()
	for i, v in ipairs (mods) do 
		local file = v.file;
		downloadFile (file);
	end
end	

function table.find (tbl, index, value)
	for i, v in pairs (tbl) do 
		if v[index] == value then 
			return i;
		end
	end
	return false;
end	

addEvent ("loader.request", true);
addEventHandler ("loader.request", root,
	function (tbl)
		if tbl then 
			mods = tbl;
			downloadMods();
		end
	end
);

addEventHandler ("onClientResourceStart", resourceRoot, 
	function ()
		triggerServerEvent ("loader.onload", localPlayer);
		addEventHandler ("onClientRender", root, drawLoader);
	end
);

addEventHandler ("onClientFileDownloadComplete", root,
	function (name, success)
		if ( source == resourceRoot ) then
			if success then
				local index = table.find (mods, "file", name);
				if index then 
					exists[name] = true;
					-- downloadFile (name);
					local model = mods[index].model;
					if name:find (".dff") then
						local dff = engineLoadDFF (name)
						engineReplaceModel (dff, model);
					elseif name:find (".txd") then 
						local txd = engineLoadTXD (name);
						engineImportTXD(txd, model);
					elseif name:find (".col") then 
						local col = engineLoadCOL (name);
						engineReplaceCOL (col, model);
					end	
					tick = getTickCount()+2000;
				end	
			end
		end
	end
);	

function drawLoader ()
	if not mods then return; end
	if next (mods) then
		rot = rot + 1;
		local count = 0;
		for _ in pairs (exists) do 
			count = count + 1;
		end
		
		local progress = " Tiek ielādēti modi (%"..math.ceil((count/#mods)*100)..")";
		
		if count == #mods then 
			if getTickCount() > tick then 
				removeEventHandler ("onClientRender", root, drawLoader);
				return;
			end	
		end
		
		local rx, ry, rw, rh = 0, y-h, x/10, h;
		addOutlines (rx+10, ry-425, rw+117, rh, tocolor (0, 0, 0, 200), 2.5);
		dxDrawRectangle(rx+10, ry-425, rw+117, rh, tocolor(0, 0, 0, 100), false);
		dxDrawText (progress, rx + 125, ry-850, rw, (y-h) + h, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center");
	end	
end

function addOutlines(x, y, width, height, lineColor, lineSize, postGUI)
    dxDrawLine(x - 1, (y - lineSize), x - 1, y + height + (lineSize - 1), lineColor, lineSize, postGUI); --left 
    dxDrawLine(x + width, (y) - 1, (x) - 1, (y) - 1, lineColor, lineSize, postGUI); -- top
    dxDrawLine((x) - 1, y + height, x + width, y + height, lineColor, lineSize, postGUI); -- bottom
    dxDrawLine(x + width, y - lineSize, x + width, y + height + (lineSize - 1), lineColor, lineSize, postGUI); -- right
end