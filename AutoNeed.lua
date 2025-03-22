DEFAULT_CHAT_FRAME:AddMessage("Testing, testing", 1, 0, 1);
BMLoot = CreateFrame("Frame")
BMLoot:RegisterEvent("START_LOOT_ROLL") 
BMLoot:RegisterEvent("LOOT_BIND_CONFIRM")
BMLoot:RegisterEvent("ZONE_CHANGED_NEW_AREA")
BMLoot:SetScript("OnEvent", function()
    if event == "START_LOOT_ROLL" then
        local rollID, rollTime, rollItemLink, rollQuantity, rollPlayer = arg1, arg2, arg3, arg4, arg5
		local texture, name, count, quality = GetLootRollItemInfo(rollID)
		
		
		-- Autoloot Black morass
        if GetZoneText() == "The Black Morass" and (name == "Corrupted Sand") then
            RollOnLoot(rollID, 1)
			StaticPopup1Button1:Click()		
        end
		
		-- Autoloot ZG 
		if GetZoneText() == "Zul'Gurub" and ( string.find(name ,"Hakkari Bijou") or string.find(name ,"Coin") ) then
            RollOnLoot(rollID, 1)
			StaticPopup1Button1:Click()		
        end
		
		-- Autoloot Scourgestone
		if (GetZoneText() == "Stratholme" or GetZoneText() == "Scholomance") and name == "Corruptor's Scourgestone" then
            RollOnLoot(rollID, 1)
			StaticPopup1Button1:Click()		
        end
		
		
	elseif event == "ZONE_CHANGED_NEW_AREA" then
	
		if GetRealZoneText() == "The Black Morass" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corrupted Sands")
		end
		
		if GetRealZoneText() == "Zul'Gurub" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Coins and Bijous")
		end
		
		if (GetRealZoneText() == "Stratholme" or GetZoneText() == "Scholomance") then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corruptor's Scourgestones")
		end
	end
end)
