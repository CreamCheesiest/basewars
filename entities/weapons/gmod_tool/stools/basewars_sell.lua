-- IMPORTANT
-- =========
-- Set this to your file name without the ".lua" on the end
-- Sandbox tools use the filename for storing information and translations
local FileName = "basewars_sell"
TOOL.Category = "BaseWars Tools"
TOOL.Name = "#tool." .. FileName .. ".name"

if CLIENT then
	language.Add("tool." .. FileName .. ".name", "Sell Tool")
	language.Add("tool." .. FileName .. ".desc", "Left click to sell entity.")
	language.Add("tool." .. FileName .. ".0", "Left click to sell.")
end

function TOOL:LeftClick(trace)
	local Ent = trace.Entity
	local ply = self:GetOwner()
	if not Ent.CurrentValue then return false end
	local Owner = BaseWars.Ents:ValidOwner(Ent)
	if Owner ~= ply then return false end
	if ply:InRaid() then return false end
	BaseWars.UTIL.PayOut(Ent, ply)
	Ent:Remove()

	return true
end

function TOOL:RightClick(trace)
end

function TOOL:Reload(trace)
end

-- This function/hook is called every frame on client and every tick on the server
function TOOL:Think()
end

-- This controls the part of the UI which shows options for this tool
function TOOL.BuildCPanel(panel)
end