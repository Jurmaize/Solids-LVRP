--[[
 * ***********************************************************************************************************************
 * Copyright (c) 2015 OwlGaming Community - All Rights Reserved
 * All rights reserved. This program and the accompanying materials are private property belongs to OwlGaming Community
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * ***********************************************************************************************************************
 ]]
 
screenWidth, screenHeight = guiGetScreenSize()
local localPlayer = getLocalPlayer()
local iconW, iconH = 34, 64
local actualIconSizeW, actualIconSizeW = 34, 64
local fontToolTip = "clear" --dxCreateFont ( ":resources/panel_tooltip.ttf" , 12)
local tooltip_background_color = tocolor( 0, 0, 0, 180 )
local tooltip_text_color = tocolor( 255, 255, 255, 255 )
last_tick = 0

--MAXIME / CHECK IF MOUSE IS WITHIN A DX BOX
function isInBox( x, y, xmin, xmax, ymin, ymax )
	--outputDebugString(tostring(x)..", "..tostring(y)..", "..tostring(xmin)..", "..tostring(xmax)..", "..tostring(ymin)..", "..tostring(ymax))
	return x >= xmin and x <= xmax and y >= ymin and y <= ymax --and not getElementData(localPlayer, "phoneRingingShowing")
end
--MAXIME / SHOW TOOLTIP AT CURSOR POSITION
function tooltip( x, y, text, text2 )
	text = tostring( text )
	if text2 then
		text2 = tostring( text2 )
	end
	
	if text == text2 then
		text2 = nil
	end
	
	local width = dxGetTextWidth( text, 1, fontToolTip ) + 20
	if text2 then
		width = math.max( width, dxGetTextWidth( text2, 1, fontToolTip ) + 20 )
		text = text .. "\n" .. text2
	end
	local height = 10 * ( text2 and 5 or 3 )
	x = math.max( 10, math.min( x, screenWidth - width - 10 ) )
	y = math.max( 10, math.min( y, screenHeight - height - 10 ) ) + iconH/3
	
	dxDrawRectangle( x, y, width, height, tooltip_background_color, true )
	dxDrawText( text, x, y, x + width, y + height, tooltip_text_color, 1, fontToolTip, "center", "center", false, false, true )
end

function drawHUD()
	if not isPlayerMapVisible() and getElementData(localPlayer, "loggedin") == 1 then
		local ax, ay = screenWidth - iconW, getElementData(localPlayer, "annHeight") or 0
		local bx, by = screenWidth - iconW, screenHeight - iconH + 4
		local cursorX, cursorY, cwX, cwY, cwZ = getCursorPosition()
		local tooltips = {}
		local tooltips_bottom = {}
		local isBike = false
		
		--THIS IS TO LET THE FORUMS PM CHECKER KNOW WHERE TO DISPLAY
		setElementData(localPlayer, "hud:whereToDisplayY", ay, false)

		-- TOGGLE HUD 
		if getElementData( localPlayer,"hide_hud" ) ~= "0" then
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/tagmode.png")
			table.insert(tooltips, "settings:hud:tagmode:newstyle:on")
			ax = ax - iconW
		else
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/tagmode.png", 0, 0, 0, disabled_item(100))
			table.insert(tooltips, "settings:hud:tagmode:newstyle:off")
			ax = ax - iconW
		end

		if isActive() then
			--GOLDEN NAMETAG 
			if getElementData(localPlayer, "donation:nametag") then -- Golden nametag
				if getElementData(localPlayer, "nametag_on") then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png")
					table.insert(tooltips, "nametag_on")
					ax = ax - iconW
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "nametag_off")
					ax = ax - iconW
				end
			else
				if getElementData(localPlayer, "donation:lifeTimeNameTag") then
					if getElementData(localPlayer, "lifeTimeNameTag_on") then
						dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png")
						table.insert(tooltips, "lifeTimeNameTag_on")
						ax = ax - iconW
					else
						dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips, "lifeTimeNameTag_off")
						ax = ax - iconW
					end
				end
			end
			
			-- ADMIN TAG 
			local isAdmin = exports.integration:isPlayerTrialAdmin(localPlayer)
			local isUAT = exports.integration:isPlayerLeadAdmin(localPlayer)
			if isUAT then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/uat_on.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/uat_on.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ax = ax - iconW
			elseif isAdmin then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/adm_on.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/adm_on.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ax = ax - iconW
			end
			
			-- GM TAG 
			local isGM = exports.integration:isPlayerSupporter(localPlayer)
			if isGM then
				if getElementData( localPlayer,"duty_supporter" ) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/gm.png")
					table.insert(tooltips, "gmonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/gm.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "gmoffduty")
				end
				ax = ax - iconW
			end
			
			-- REPORT PANEL TAG 
			if (isGM or isAdmin)then
				if getElementData( localPlayer,"report_panel_mod" ) == "1" then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/reportpanel_on.png")
					table.insert(tooltips, "report_panel_mod:1")
				elseif getElementData( localPlayer,"report_panel_mod" ) == "2" then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/reportpanel_on.png")
					table.insert(tooltips, "report_panel_mod:2")
				elseif getElementData( localPlayer,"report_panel_mod" ) == "3" then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/reportpanel_on.png")
					table.insert(tooltips, "report_panel_mod:3")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/reportpanel_on.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "report_panel_mod:0")
				end
				ax = ax - iconW
			end
			
			
			-- TOGGLE PMS 
			local hasTogPM, togPMState = exports.donators:hasPlayerPerk(localPlayer, 1)
			if hasTogPM then
				if tonumber(togPMState) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togpm.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:togpm:off")
					ax = ax - iconW
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togpm.png")
					table.insert(tooltips, "settings:hud:togpm:on")
					ax = ax - iconW
				end
			end
			
			-- TOGGLE DON CHAT 
			local hasTogDon, togDonState = exports.donators:hasPlayerPerk(localPlayer, 10)
			if hasTogDon then
				if tonumber(togDonState) ~= 0 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togdon.png")
					table.insert(tooltips, "settings:hud:togdon:on")
					ax = ax - iconW
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togdon.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:togdon:off")
					ax = ax - iconW
				end
			end
			
		
			-- WALKING STYLE
			if not getElementData( localPlayer, 'old_walkstyle' ) then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/walkingstyle.png")
				table.insert(tooltips, "settings:hud:walkingstyle")
				ax = ax - iconW
			end
			
			-- HEAD TURNING STYLE
			if getElementData( localPlayer,"head_turning" ) == "1" then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/head_turning.png")
				table.insert(tooltips, "settings:hud:head_turning:1")
				ax = ax - iconW
			elseif getElementData( localPlayer,"head_turning" ) == "2" then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/head_turning.png")
				table.insert(tooltips, "settings:hud:head_turning:2")
				ax = ax - iconW
			else
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/head_turning.png", 0, 0, 0, disabled_item(100))
				table.insert(tooltips, "settings:hud:head_turning:0")
				ax = ax - iconW
			end
			
			-- toggle hidden scoreboard 
			local hasHidSco, hidScoState = exports.donators:hasPlayerPerk(localPlayer, 12)
			if hasHidSco then
				if tonumber(hidScoState) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/hidden_scoreboard.png")
					table.insert(tooltips, "settings:hud:hidden_scoreboard:on")
					ax = ax - iconW
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/hidden_scoreboard.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:hidden_scoreboard:off")
					ax = ax - iconW
				end
			end
			
			-- toggle hidden username 
			local hasHidUser, hidUser = exports.donators:hasPlayerPerk(localPlayer, 9)
			if hasHidUser then
				if tonumber(hidUser) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/hide_username.png")
					table.insert(tooltips, "settings:hud:hidden_username:on")
					ax = ax - iconW
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/hide_username.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:hidden_username:off")
					ax = ax - iconW
				end
			end
			
			-- TOGGLE ADVERTS 
			local hasTogAd, togAdState = exports.donators:hasPlayerPerk(localPlayer, 2)
			if hasTogAd then
				if tonumber(togAdState) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togad.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:togad:off")
					ax = ax - iconW
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togad.png")
					table.insert(tooltips, "settings:hud:togad:on")
					ax = ax - iconW
				end
			end
			
			--[[ARMOUR 
			local armour = getPedArmor( localPlayer )
			if armour > 0 then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/armour.png")
				ax = ax - iconW
				table.insert(tooltips, "armour")
			end]]
			
			--[[MASKS 
			for key, value in pairs(masks) do
				if getElementData(localPlayer, value[1]) then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/" .. value[1] .. ".png")
					ax = ax - iconW
					table.insert(tooltips, "mask")
				end
			end]]
			
			--[[BADGE 
			local _, _, _, badge = getBadgeColor(localPlayer)
			if badge then
				if badge == 122 or badge == 123 or badge == 124 or badge == 125 or badge == 135 or badge == 136 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/bandana.png")
					table.insert(tooltips, badge)
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/badge" .. tostring(badge) .. ".png")
					if badge == 2 then
						table.insert(tooltips, "pdduty")
					else
						table.insert(tooltips, "jobduty")
					end
				end
				ax = ax - iconW
			end]]
			
			if getElementData(localPlayer, "restrain") == 1 then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/handcuffs.png")
				ax = ax - iconW
				table.insert(tooltips, "handcuffs")
			end

			if getElementData(localPlayer, "blindfold") == 1 then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/blindfold.png")
				ax = ax - iconW
				table.insert(tooltips, "blindfold")
			end
								
			if exports['realism']:isLocalPlayerSmoking() then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/cigarette.png")
				ax = ax - iconW
				table.insert(tooltips, "cigarette")
			end
			
			--DEAGLE MODE 
			if not isIn or getTickCount()-10000 >= last_tick then
				isIn = exports.factions:isInFactionType(localPlayer, 2) 
				last_tick = getTickCount()
			end
			if (getPedWeapon(localPlayer) == 24) and (getPedTotalAmmo(localPlayer) > 0) and isIn then
				local deagleMode = getElementData(localPlayer, "deaglemode")
				if (deagleMode == 0) then -- tazer
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/dtazer.png")
				elseif (deagleMode == 1) then-- lethal
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/dglock.png")
				elseif (deagleMode == 2) then-- radar
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/dradar.png")
				end
				ax = ax - iconW
				table.insert(tooltips, {"deaglemode", deagleMode})
			end
			
			if (getPedWeapon(localPlayer)==31) or (getPedWeapon(localPlayer)==30) or (getPedWeapon(localPlayer)==29) or (getPedWeapon(localPlayer)==28) or (getPedWeapon(localPlayer)==32) and (getPedTotalAmmo(localPlayer) > 0) then
	            local fireMode = getElementData(localPlayer, "firemode")
	            if (fireMode == 0) then -- auto
	                dxDrawImage(ax,ay,iconH,iconH,"images/hud/auto.png")
	                table.insert(tooltips, "firemode:auto")
	            elseif (fireMode == 1) then-- semi-auto
	                dxDrawImage(ax,ay,iconH,iconH,"images/hud/semiauto.png")
	                table.insert(tooltips, "firemode:semi")
	            end
	            ax = ax - iconW
	        end
			
			--SHOTGUN MODE 
			--[[if (getPedWeapon(localPlayer) == 25) and (getPedTotalAmmo(localPlayer) > 0) then
				local shotgunMode = getElementData(localPlayer, "shotgunmode")
				if shotgunMode == 0 then -- bean bag
					dxDrawImage(ax,ay,iconW,iconW,"images/hud/shotbean2.png")
				elseif shotgunMode == 1 then -- lethal
					dxDrawImage(ax,ay,iconW,iconW,"images/hud/shotlethal2.png")
				end
				ax = ax - iconW
				table.insert(tooltips, {"shotgunmode", shotgunMode } )
			end]]
			

			-- hud icons for traditional - without showing local player names
			if getElementData(localPlayer, "settings_hud_style") ~= "1" then
				-- see the nametags file for definition
				local _, icons = getPlayerIcons('', localPlayer, true)
				for k = #icons, 1, -1 do
					local v = icons[k]
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/" .. v .. ".png")

					ax = ax - iconW
					table.insert(tooltips, v)
				end
			end

			-- Offline pm 
			--dxDrawImage(ax,ay,iconH,iconH,"images/hud/opm.png")
			--table.insert(tooltips, "settings:hud:opm")
			--ax = ax - iconW

			-- ads 
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/ads.png")
			table.insert(tooltips, "settings:hud:ads")
			ax = ax - iconW
		
			local armor = getPedArmor( localPlayer )
			if armor > 0 then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/armour2.png", 0, 0, 0, disabled_item(255/100*armor))
				ax = ax - iconW
				table.insert(tooltips, "armour") 
			end	
			
			--HEATH 
			local health = getElementHealth( localPlayer )
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/health2.png", 0, 0, 0, disabled_item(255/100*health))
			ax = ax - iconW
			table.insert(tooltips, "health")
			ax = ax - iconW
			
			if #tooltips > 0 then
				setElementData(localPlayer, "hud:showingSomeIconsOnTopLeft", 40, false)
			else
				setElementData(localPlayer, "hud:showingSomeIconsOnTopLeft", 0, false)
			end
			
			--THIS IS TO LET THE FORUMS PM CHECKER KNOW WHERE TO DISPLAY
			setElementData(localPlayer, "hud:whereToDisplay", ax, false)
			

			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if theVehicle then
				local vehType = getVehicleType(theVehicle)
				-- TOGGLE MODE / BOTTOM 
				if exports.vehicle:hasVehicleEngine(theVehicle) then
					if getVehicleEngineState(theVehicle) then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/engine.png")
						table.insert(tooltips_bottom, "settings:hud:engine:on")
						bx = bx - iconW
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/engine.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "settings:hud:engine:off")
						bx = bx - iconW
					end
				end

				if getElementData(theVehicle, "handbrake") == 0 then
					if vehType == "Boat" then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/boathandbrake.png", 0, 0, 0, disabled_item(100))
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/handbrake.png", 0, 0, 0, disabled_item(100))
					end
					table.insert(tooltips_bottom, "settings:hud:handbrake:off")
					bx = bx - iconW
				else
					if vehType == "Boat" then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/boathandbrake.png", 0, 0, 0)
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/handbrake.png", 0, 0, 0)
					end
					table.insert(tooltips_bottom, "settings:hud:handbrake:on")
					bx = bx - iconW
				end

				if exports.vehicle:hasVehicleLights(theVehicle) then
					local light_state = getElementData(theVehicle, "lights") or 0
					if light_state > 0 then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/headlights_"..light_state..".png")
						table.insert(tooltips_bottom, "settings:hud:headlights:"..light_state)
						bx = bx - iconW
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/headlights_1.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "settings:hud:headlights:0")
						bx = bx - iconW
					end
				end

				--BELT 
				if (getVehicleType(theVehicle) ~= "BMX" and getVehicleType(theVehicle) ~= "Bike") then
					if getElementData(localPlayer, "seatbelt") and getPedOccupiedVehicle(localPlayer) then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/seatbelt.png")
						table.insert(tooltips_bottom, "belt:on")
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/seatbelt.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "belt:off")
					end
					bx = bx - iconW

					--WINDOWS
					if (getElementData(theVehicle, "vehicle:windowstat") == 1) then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/window2.png")
						table.insert(tooltips_bottom, "windowstat:down")
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/window.png")
						table.insert(tooltips_bottom, "windowstat:up")
					end
					bx = bx - iconW

					--Lock 
					if isVehicleLocked(theVehicle) then
						dxDrawImage(bx,by,iconH,iconH,"images/hud/carlock.png")
						table.insert(tooltips_bottom, "hud:carlock:on")
					else
						dxDrawImage(bx,by,iconH,iconH,"images/hud/carlock.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "hud:carlock:off")
					end
					bx = bx - iconW
					isBike = false
				else
					isBike = true
				end

				
				--CC 
				if exports["realism"]:isCcEnabled() then
					dxDrawImage(bx,by,iconH,iconH,"images/hud/cc.png")
					table.insert(tooltips_bottom, "cc:on")
				else
					dxDrawImage(bx,by,iconH,iconH,"images/hud/cc.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips_bottom, "cc:off")
				end
				bx = bx - iconW
				
				if getElementData( localPlayer,"speedo" ) == "1" then
					dxDrawImage(bx,by,iconH,iconH,"images/hud/speedo.png")
					table.insert(tooltips_bottom, "settings:hud:speedo:kmh")
					bx = bx - iconW
				elseif getElementData( localPlayer,"speedo" ) == "2" then
					dxDrawImage(bx,by,iconH,iconH,"images/hud/speedo.png")
					table.insert(tooltips_bottom, "settings:hud:speedo:mph")
					bx = bx - iconW
				else 
					dxDrawImage(bx,by,iconH,iconH,"images/hud/speedo.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips_bottom, "settings:hud:speedo:off")
					bx = bx - iconW
				end

				-- TOGGLE AUTOPARK / BOTTOM 
				if getElementData( localPlayer,"autopark" ) == "1" then
					dxDrawImage(bx,by,iconH,iconH,"images/hud/autopark.png")
					table.insert(tooltips_bottom, "settings:hud:autopark:on")
					bx = bx - iconW
				else
					dxDrawImage(bx,by,iconH,iconH,"images/hud/autopark.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips_bottom, "settings:hud:autopark:off")
					bx = bx - iconW
				end

				-- MDC for LEO/ BOTTOM 
				if exports.mdc:hasMDCPermissions() then --PD and HP
					dxDrawImage(bx,by,iconH,iconH,"images/hud/mdc.png")
					table.insert(tooltips_bottom, "settings:hud:mdc")
					bx = bx - iconW
				end
			end
		end

		--SHOWING TOOLTIP + ACTIONS ON CLIENT CLICK 
		if isCursorShowing() then
			ax, ay = screenWidth, getElementData(localPlayer, "annHeight") or 0
			bx, by = screenWidth, screenHeight - iconH + 4
			cursorX, cursorY = cursorX * screenWidth, cursorY * screenHeight
			
			for i = 1, #tooltips do
				ax = ax - iconW
				if isInBox( cursorX, cursorY, ax, ax + iconW, ay, ay + iconH/2 ) then
					--ADMIN DUTY 
					if tooltips[i] == "adminonduty" then
						tooltip( cursorX, cursorY, "Admina darbs ir uzsākts.", "Uzspied, lai beigtu palīdzēt lowakiem")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_admin", 0)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "adminoffduty" then
						tooltip( cursorX, cursorY, "Admina darbs nav uzsākts.", "Uzspied, lai palīdzētu lowakiem")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_admin", 1)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					--GM DUTY 
					elseif tooltips[i] == "gmonduty" then
						tooltip( cursorX, cursorY, "GM pienākumi ir ieslēgti.", "Uzspied, lai beigtu darbu")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_supporter", 0)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "gmoffduty" then
						tooltip( cursorX, cursorY, "GM pienākumi ir izslēgti.", "Uzspied, lai uzsāktu darbu")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_supporter", 1)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					--GOLDEN NAMETAGE 
					elseif tooltips[i] == "nametag_on" then
						tooltip( cursorX, cursorY, "Zelta vārds ir ieslēgts", "Bonusa beigas: "..(getElementData(localPlayer, "donation:nametag:expiredate") or "Updating.."))
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "nametag_off" then
						tooltip( cursorX, cursorY, "Zelta vārds ir izslēgts", "Bonusa beigas: "..(getElementData(localPlayer, "donation:nametag:expiredate") or "Updating.."))
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "lifeTimeNameTag_on" then
						tooltip( cursorX, cursorY, "Golden Nametag is ON", "Expiration date: Never")
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "lifeTimeNameTag_off" then
						tooltip( cursorX, cursorY, "Zelta vārds ir izslēgts", "Bonusa beigas: Nekad")
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer)
							playToggleSound()
						end
					-- BADGE 
					elseif tooltips[i] == "pdduty" then
						tooltip( cursorX, cursorY, "PD darbs ir uzsākts.", "Uzspied, lai beigtu savus pienākumus.")
						if justClicked then
							triggerServerEvent("item-system:toggleBadge", localPlayer, localPlayer, exports['item-system']:getBadges(), 64 , "Test")
							playToggleSound()
						end
					elseif tooltips[i] == "jobduty" then
						tooltip( cursorX, cursorY, "Darba ID ir uzlikts")
						if justClicked then
							triggerServerEvent("item-system:toggleBadge", localPlayer, localPlayer, exports['item-system']:getBadges(), 64 , "Test")
							playToggleSound()
						end
					--BANDANA 
					elseif tooltips[i] == 122 or tooltips[i] == 123 or tooltips[i] == 124 or tooltips[i] == 125 or tooltips[i] == 135 or tooltips[i] == 136 then
						tooltip( cursorX, cursorY, "Bandana ir uzlikta.", "Uzspied, lai noņemtu.")
						if justClicked then
							triggerServerEvent("item-system:toggleBadge", localPlayer, localPlayer, exports['item-system']:getBadges(), tooltips[i] , "Test")
							playToggleSound()
						end
					--REPORT PANEL 
					elseif tooltips[i] == "report_panel_mod:0" then
						tooltip( cursorX, cursorY, "Report Panel Mode - OFF", "Click to turn on.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "1")
							playToggleSound()
						end
					elseif tooltips[i] == "report_panel_mod:1" then
						tooltip( cursorX, cursorY, "Report Panel Mode - 1", "Click to switch.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "2")
							playToggleSound()
						end
					elseif tooltips[i] == "report_panel_mod:2" then
						tooltip( cursorX, cursorY, "Report Panel Mode - 2", "Click to switch.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "3")
							playToggleSound()
						end
					elseif tooltips[i] == "report_panel_mod:3" then
						tooltip( cursorX, cursorY, "Report Panel Mode - 3", "Click to turn OFF.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "0")
							playToggleSound()
						end
					--HP 
					elseif tooltips[i] == "health" then
						tooltip( cursorX, cursorY, "Dzīvības: "..math.floor(getElementHealth(localPlayer)) .. "%")
						if justClicked then
							--setElementData( localPlayer,"report_panel_mod", true )
							--playToggleSound()
						end
					-- Armor
					elseif tooltips[i] == "armour" then
						tooltip( cursorX, cursorY, "Armour: "..math.floor(getPedArmor(localPlayer)) .. "%")		
					--STYLE 
					elseif tooltips[i] == "settings:hud:tagmode:newstyle:on" then
						tooltip( cursorX, cursorY, "HUDs ir ieslēgts.", "Uzspied, lai paslēptu.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "hide_hud", "0")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:tagmode:newstyle:off" then
						tooltip( cursorX, cursorY, "HUDs ir izslēgts.", "Uzspied, lai parādītu.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "hide_hud", "1")
							playToggleSound()
						end
					--WALKING STYLE 
					elseif tooltips[i] == "settings:hud:walkingstyle" then
						tooltip( cursorX, cursorY, "Iešanas stils: "..getPedWalkingStyle(localPlayer), "Uzspeid, lai izmainītu.")
						if justClicked then
							triggerServerEvent("realism:switchWalkingStyle", localPlayer)
							playToggleSound()
						end
					--AUTOPARK 
					elseif tooltips[i] == "settings:hud:autopark:on" then
						tooltip( cursorX, cursorY, "Automātiskais auto respawnošanās punkts ir ieslēgts.", "Uzspied, lai izslēgtu.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "0")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:autopark:off" then
						tooltip( cursorX, cursorY, "Automātiskais auto respawnošanās punkts ir izslēgts.", "Uzspied, lai ieslēgtu.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "1")
							playToggleSound()
						end
					-- DEAGLEMODE 
					elseif tooltips[i][1] == "deaglemode" then
						local mode = tooltips[i][2]
						if mode == 0 then
							tooltip( cursorX, cursorY, "Taze mode", "Uzspied, lai ieslēgtu letālo režīmu")
						elseif mode == 1 then
							tooltip( cursorX, cursorY, "Lethal mode", "Uzspied, lai ieslēgtu radara režīmu")
						elseif mode == 2 or mode == 1 then
							tooltip( cursorX, cursorY, "Radar mode", "Uzspied, lai ieslēgtu elektrošoka režīmu")
						end
						if justClicked then
							exports["pd-system"]:switchMode()
							playToggleSound()
						end
					-- SHOTGUN 
					elseif tooltips[i][1] == "shotgunmode" then
						local mode = tooltips[i][2]
						--local team = getPlayerTeam(localPlayer)
						if mode == 0 then
							tooltip( cursorX, cursorY, "Beanbag mode", "Uzspied, lai ieliktu ieroci letālajā režīmā")
						elseif mode == 1 then
							tooltip( cursorX, cursorY, "Lethal mode", "Uzspied, lai ieliktu ieroci NEletālajā režīmā")
						end
						if justClicked then
							exports["pd-system"]:switchMode()
							playToggleSound()
						end
					-- HEAD TURNING 
					elseif tooltips[i] == "settings:hud:head_turning:0" then
						tooltip( cursorX, cursorY, "Galvas griešana ir izslēgta", "Uzspied, lai to ieslēgtu.")
						if justClicked then
							triggerEvent("accounts:settings:updateCharacterSettings", localPlayer, "head_turning", "1")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:head_turning:1" then
						tooltip( cursorX, cursorY, "Galves griešana ir ieslēgta, tu skaties uz blakus esošām lietām.", "Uzspied, lai izslēgtu.")
						if justClicked then
							triggerEvent("accounts:settings:updateCharacterSettings", localPlayer, "head_turning", "2")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:head_turning:2" then
						tooltip( cursorX, cursorY, "Looking at where the camera points at.", "Click to switch mode.")
						if justClicked then
							triggerEvent("accounts:settings:updateCharacterSettings", localPlayer, "head_turning", "0")
							playToggleSound()
						end
					--TOGAD 
					elseif tooltips[i] == "settings:hud:togad:on" then
						tooltip( cursorX, cursorY, "Advert is Enabled", "Click to toggle OFF.")
						if justClicked then
							triggerServerEvent("chat:togad", localPlayer,localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:togad:off" then
						tooltip( cursorX, cursorY, "Advert is Disabled", "Click to toggle ON.")
						if justClicked then
							triggerServerEvent("chat:togad", localPlayer,localPlayer)
							playToggleSound()
						end
					--TOGPM 
					elseif tooltips[i] == "settings:hud:togpm:on" then
						tooltip( cursorX, cursorY, "Privātās ziņas ir ieslēgtas.", "Uzspied, lai ignorētu privātās ziņas.")
						if justClicked then
							triggerServerEvent("chat:togpm", localPlayer,localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:togpm:off" then
						tooltip( cursorX, cursorY, "Privātās ziņas ir izslēgtas.", "Uzspied, lai saņemtu privātās ziņas.")
						if justClicked then
							triggerServerEvent("chat:togpm", localPlayer,localPlayer)
							playToggleSound()
						end
					--TOGDON 
					elseif tooltips[i] == "settings:hud:togdon:on" then
						tooltip( cursorX, cursorY, "Ziedotāju čats ir ieslēgts", "Uzspied, lai ignorētu ziedotāju ziņas.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 10, 0)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:togdon:off" then
						tooltip( cursorX, cursorY, "Ziedotāju čats ir izslēgts", "Uzspied, lai saņemtu ziedotāju ziņas.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 10, 1)
							playToggleSound()
						end
					--tog hidden from scoreboard 
					elseif tooltips[i] == "settings:hud:hidden_scoreboard:on" then
						tooltip( cursorX, cursorY, "Tu esi paslēpts no spēlētāju tabulas.", "Uzspied, lai parādītu sevi.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 12, 0)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:hidden_scoreboard:off" then
						tooltip( cursorX, cursorY, "Tu esi redzams spēlētāju tabulā.", "Uzspied, lai nerādītu sevi.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 12, 1)
							playToggleSound()
						end
					--tog hidden username 
					elseif tooltips[i] == "settings:hud:hidden_username:on" then
						tooltip( cursorX, cursorY, "Tavs lietotājvārds ir neredzams.", "Uzspied, lai to parādītu.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 9, 0)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:hidden_username:off" then
						tooltip( cursorX, cursorY, "Tavs lietotājvārds ir redzams.", "Uzspied, lai paslēptu.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 9, 1)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:opm" then
						tooltip( cursorX, cursorY, "Sūtīt ziņu, spēlētājām, kas nav ienācis..", "Uzspied, lai nosūtītu vai raksti /opm [UCP] [ziņa]")
						if justClicked then
							executeCommandHandler("opm")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:ads" then
						tooltip( cursorX, cursorY, "Izveido sludinājumu.", "Uzspied, lai izveidotu vai raksti /ads")
						if justClicked then
							executeCommandHandler('ads')
							playToggleSound()
						end
					elseif tooltips[i] == "firemode:auto" then
						tooltip( cursorX, cursorY, "Ieroča šaušanas tips: Full-auto", "Uzspied, lai nomainītu, vai arī spied 'N'")
						if justClicked then
							triggerEvent("weapon:firemode_switchFireMode", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "firemode:semi" then
						tooltip( cursorX, cursorY, "Ieroča šaušanas tips: Semi-auto", "Uzspied, lai nomainītu, vai arī spied 'N'")
						if justClicked then
							triggerEvent("weapon:firemode_switchFireMode", localPlayer)
							playToggleSound()
						end
					elseif justClicked then
						outputDebugString('Tu uzspiedi ' .. tooltips[i])
					end
				end
			end

			for i = 1, #tooltips_bottom do
				bx = bx - iconW
				if isInBox( cursorX, cursorY, bx, bx + iconW, by, by + iconH/2 ) then
					--AUTOPARK / BOTTOM 
					
					if tooltips_bottom[i] == "settings:hud:engine:on" then
						tooltip( cursorX, cursorY, "Dzinējs - Ieslēgts", "'J' vai /engine")
						if justClicked then
							triggerEvent( 'vehicle:toggleEngine', localPlayer )
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:engine:off" then
						tooltip( cursorX, cursorY, "Dzinējs - Izslēgts", "'J' vai /engine")
						if justClicked then
							triggerEvent( 'vehicle:toggleEngine', localPlayer )
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "settings:hud:handbrake:on" then
						if isBike then
							tooltip( cursorX, cursorY, "Ķepa - nolaista", "'G' vai /kickstand")
						else
							tooltip( cursorX, cursorY, "Rokasbremze - nolaista", "'G' vai /handbrake")
						end
						if justClicked then
							exports['realism']:doHandbrake()
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:handbrake:off" then
						if isBike then
							tooltip( cursorX, cursorY, "Ķepa - pacelta", "'G' vai /kickstand")
						else
							tooltip( cursorX, cursorY, "Rokasbremze - pacelta", "'G' vai /handbrake")
						end
						if justClicked then
							exports['realism']:doHandbrake()
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:headlights:0" then
						tooltip( cursorX, cursorY, "Gaismas - izslēgtas", "'L' vai /lights")
						if justClicked then
							triggerServerEvent('togLightsVehicle', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:headlights:1" then
						tooltip( cursorX, cursorY, "Gaismas - Ieslēgts", "'L' vai /lights")
						if justClicked then
							triggerServerEvent('togLightsVehicle', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:headlights:2" then
						tooltip( cursorX, cursorY, "Gaismas - Ieslēgts", "'L' vai /lights")
						if justClicked then
							triggerServerEvent('togLightsVehicle', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "hud:carlock:on" then
						tooltip( cursorX, cursorY, "Durvis ir AIZSLĒGTAS", "'K' vai /lock")
						if justClicked then
							triggerServerEvent('togLockVehicle', localPlayer, localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "hud:carlock:off" then
						tooltip( cursorX, cursorY, "Durvis ir ATSLĒGTAS", "'K' vai /lock")
						if justClicked then
							triggerServerEvent('togLockVehicle', localPlayer, localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "settings:hud:speedo:off" then
						tooltip( cursorX, cursorY, "Spidometrs - Izslēgts", " ")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "speedo", "1")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:speedo:kmh" then
						tooltip( cursorX, cursorY, "Spidometrs - KM/H", " ")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "speedo", "2")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:speedo:mph" then
						tooltip( cursorX, cursorY, "Spidometrs - MP/H", " ")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "speedo", "0")
							playToggleSound()
						end
					-- seatbelt
					elseif tooltips_bottom[i] == 'belt:on' then
						tooltip( cursorX, cursorY, 'Tu esi piesprādzējies.', "'Z' vai /belt")
						if justClicked then
							triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == 'belt:off' then
						tooltip( cursorX, cursorY, 'Tu neesi piesprādzējies.', "'Z' vai /belt")
						if justClicked then
							triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
							playToggleSound()
						end
					--Window state
					elseif tooltips_bottom[i] == 'windowstat:up' then
						tooltip( cursorX, cursorY, 'Tavi logi ir augšā.', "'X' vai /togwindow")
						if justClicked then
							triggerServerEvent('vehicle:togWindow', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == 'windowstat:down' then
						tooltip( cursorX, cursorY, 'Tavi logi ir nolaisti.', "'X' vai /togwindow")
						if justClicked then
							triggerServerEvent('vehicle:togWindow', localPlayer)
							playToggleSound()
						end
					--CC state
					elseif tooltips_bottom[i] == 'cc:on' then
						tooltip( cursorX, cursorY, 'Kruīza kontrole ir ieslēgta.', "'C' vai /cc")
						if justClicked then
							triggerEvent('realism:togCc', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == 'cc:off' then
						tooltip( cursorX, cursorY, 'Kruīza kontrole ir izslēgta.', "'C' vai /cc")
						if justClicked then
							triggerEvent('realism:togCc', localPlayer)
							playToggleSound()
						end
					-- auto park
					elseif tooltips_bottom[i] == "settings:hud:autopark:on" then
						tooltip( cursorX, cursorY, "Auto spawnpoint saglabāšana (automātiskā) ir ieslēgta", "Uzspied, lai izslēgtu.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "0")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:autopark:off" then
						tooltip( cursorX, cursorY, "Auto spawnpoint saglabāšana (automātiskā) ir izslēgta", "Uzspied, lai ieslēgtu.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "1")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:mdc" then
						tooltip( cursorX, cursorY, "Mobils Digitālais Dators", "Uzspied, lai atvērtu.")
						if justClicked then
							triggerEvent("mdc:loginW", localPlayer)
							playToggleSound()
						end
					end
				end
			end
		end
	end
	justClicked = false
end
addEventHandler("onClientRender", getRootElement(), drawHUD)

function playToggleSound()
	playSound(":resources/toggle.mp3")
end

--[[
addCommandHandler( "togglehud",
	function( )
		active = not active
		if active then
			outputChatBox( "HUD is now on.", 0, 255, 0 )
			triggerEvent( "item:updateclient", localPlayer )
		else
			outputChatBox( "HUD is now off.", 255, 0, 0 )
			setPlayerHudComponentVisible( 'radar', false )
		end
	end
)
]]

function isActive()
	return getElementData(localPlayer, "hide_hud") ~= "0"
end

--TO DETECT CLICK ON DX BOX 
addEventHandler( "onClientClick", root,
	function( button, state )
		if button == "left" and state == "up" then
			justClicked = true
		end
	end
)

function disabled_item(value)
	return tocolor(value,value,value)
end

local function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  for st,sp in function() return string.find(str,div,pos,true) end do
	table.insert(arr,string.sub(str,pos,st-1))
	pos = sp + 1
  end
  table.insert(arr,string.sub(str,pos))
  return arr
end

function bindSomeHotKey()
	bindKey("z", "down", function()
		if getElementData(localPlayer, "vehicle_hotkey") == "0" then 
			return false
		end
		triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
	end) 

	bindKey("x", "down", function() 
		if getElementData(localPlayer, "vehicle_hotkey") == "0" then 
			return false
		end
		triggerServerEvent('vehicle:togWindow', localPlayer)
	end)
end
addEventHandler("onClientResourceStart", resourceRoot, bindSomeHotKey)

--[[
--lalt+Mouse2 to toggle cursor 
local holdingShift = nil
function togMouse(button, press)
	if button == "lalt" then
		if press then
			holdingShift = true
		else
			holdingShift = nil
		end
	end
end
addEventHandler("onClientKey", root, togMouse)
function togMouse2 ( button, press)
    if button == "mouse2" and press and holdingShift then
        showCursor ( not isCursorShowing() )        
        cancelEvent()          
    end
end
addEventHandler("onClientKey", root, togMouse2)
]]

function fpsFunction( command, limit ) -- First define the function
  if limit and tonumber(limit) and tonumber(limit) >= 25 and tonumber(limit) <=60 then 
  	limit = tonumber(limit)
    -- If the player has permission to set FPS limit and limit is submitted...
    if setFPSLimit ( limit ) then -- Set the fps. 
    	outputChatBox("Your FPS has been limited to: "..limit..".")
    end
else
	outputChatBox("SYNTAX: /"..command.." [25~60] - Limit your own FPS.")
  end
end 
addCommandHandler ( "limitfps", fpsFunction ) -- Attach the setfps command to fpsFunction function.