local addonName, addon = ...
LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceConsole-3.0')

local bb = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
local categories = bb:GetModule('Categories')

-- deepcopy from http://lua-users.org/wiki/CopyTable
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

categories:RegisterCategoryFunction("ItemDumper", function (data)

  if C_TooltipInfo and C_TooltipInfo.GetOwnedItemByID then
    -- append tooltip data we'll use for filtering
    data["TooltipInfo"] = C_TooltipInfo.GetOwnedItemByID(data.itemInfo.itemID)
  end

  -- add everything to debugging table for later inspection
  bbidDB[data.itemInfo.itemID] = deepcopy(data)

  return nil
end)

function addon:OnInitialize()
  -- reset table after each login
  bbidDB = {}
end
