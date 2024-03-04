local addonName, addon = ...
LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceConsole-3.0')

local bb = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
local categories = bb:GetModule('Categories')

categories:RegisterCategoryFunction("ItemDumper", function (data)

  if C_TooltipInfo and C_TooltipInfo.GetItemByID then
    -- append tooltip data we'll use for filtering
    data["TooltipInfo"] = C_TooltipInfo.GetItemByID(data.itemInfo.itemID)
  end

  -- add everything to debugging table for later inspection
  bbidDB[data.itemInfo.itemName] = data

  return nil
end)

function addon:OnInitialize()
  if not bbidDB then
    bbidDB = {}
  end
  -- report in chat how big the table has gotten
  local originalCount = 0
  for _ in pairs(bbidDB) do originalCount = originalCount + 1 end
  addon:Print(addonName .. " previously knew about " .. tostring(originalCount) .. " items")
end
