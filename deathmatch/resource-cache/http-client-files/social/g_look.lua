local function checkLength( value )
	return value and #value >= 0 and #value <= 165
end

local allowedImageHosts = {
	["imgur.com"] = true,
}
local imageExtensions = {
	[".jpg"] = true,
	[".png"] = true,
	[".gif"] = true,
}
function verifyImageURL(url, notEmpty)
	if not notEmpty then
		if not url or url == "" then
			return true
		end
	end
	if string.find(url, "http://", 1, true) or string.find(url, "https://", 1, true) then
		local domain = url:match("[%w%.]*%.(%w+%.%w+)") or url:match("^%w+://([^/]+)")
		if allowedImageHosts[domain] then
			local _extensions = ""
			for extension, _ in pairs(imageExtensions) do
				if _extensions ~= "" then
					_extensions = _extensions..", "..extension
				else
					_extensions = extension
				end
				if string.find(url, extension, 1, true) then
					return true
				end
			end			
		end
	end
	return false
end

editables = {
	{ name = "Svars", index = "Svars", verify = function( v ) return tonumber( v ) and tonumber( v ) >= 30 and tonumber( v ) <= 200 end, instructions = "Ievadi Svaru kilogramos, no 30 līdz 200." },
	{ name = "Garums", index = "Garums", verify = function( v ) return tonumber( v ) and tonumber( v ) >= 70 and tonumber( v ) <= 220 end, instructions = "Ievadi garumu centimetros. No 70 līdz 220." },
	{ name = "Matu krāsa", index = 1, verify = checkLength },
	{ name = "Matu stils", index = 2, verify = checkLength },
	{ name = "Sejas izskats", index = 3, verify = checkLength },
	{ name = "Fiziskais izskats", index = 4, verify = checkLength },
	{ name = "Apģērbs", index = 5, verify = checkLength },
	{ name = "Aksesuāri", index = 6, verify = checkLength },
	{ name = "Attēls", index = 7, verify = verifyImageURL, instructions = "Ievadi imgur URL, kā izskatās tavs personāžs." }
}