--[[
	KaizenMinimap
	
	author: scottcreynolds (loganvi of illidan-US)
	
	highly opinionated mod about what a clean minimap looks like.
	if your opinions differ from mine, feel free to change this.
	
--]]

local showWorldMapButton = false	--World Map Button
local showZoomButtons = false		--Zoom In/Out (note  you won't be able to change zoom)
local showCalendar = true			--Calendar Button
local showTracking = true			--Tracking button
local showZoneText = true           --Text at top of minimap
local showZoneTextBorder = false    --This is the box around the text at the top of the minimap
	
local f = CreateFrame("frame")
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)
f:RegisterEvent("ADDON_LOADED")

function f:ADDON_LOADED(event, addon)
	if addon:lower() ~= "kaizenminimap" then return end
	SetMinimapOptions()
end

function SetMinimapOptions()
	
	if (showZoneTextBorder) then
		MinimapBorderTop:SetAlpha(100)
	else
		--change alpha rather than hiding the texture - some mods that move bliz UI elements rely on
		--this to be shown for positioning, so we blend it out but leave it there
		MinimapBorderTop:SetAlpha(0)
	end

	if (showZoneText) then
		MinimapZoneText:Show()
	else
		MinimapZoneText:Hide()
	end

	if (showWorldMapButton) then
		MiniMapWorldMapButton:Show()
	else
		MiniMapWorldMapButton:Hide()
	end

	if (showTracking) then
		MiniMapTracking:Show()
	else
		MiniMapTracking:Hide()
	end

	if (showCalendar) then
		GameTimeFrame:Show()
	else
		GameTimeFrame:Hide()
	end

	if (showZoomButtons) then
		MinimapZoomIn:Show()
		MinimapZoomOut:Show()
	else
		MinimapZoomIn:Hide()
		MinimapZoomOut:Hide()
	end
end