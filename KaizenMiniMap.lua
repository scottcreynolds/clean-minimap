--[[
	KaizenMiniMap
--]]

local showWorldMapButton = false
local showZoomButtons = false
local showCalendar = true
local showTracking = true
local showCompass = false
local showZoneText = true
local showZoneTextFlair = false
	
local f = CreateFrame("frame")
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)
f:RegisterEvent("ADDON_LOADED")

function f:ADDON_LOADED(event, addon)
	if addon:lower() ~= "kaizenminimap" then return end

	--refactor to functional
	if (showZoneTextFlair) then
		MinimapBorderTop:Show()
	else
		MinimapBorderTop:Hide()
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
	
	if (showCompass) then
		MinimapCompassRing:Show()
	else
		MinimapCompassTexture:Hide()
	end
end