-- IMPORTANT
-- =========
-- Set this to your file name without the ".lua" on the end
-- Sandbox tools use the filename for storing information and translations
local FileName = "basewars_upgrade"
TOOL.Category = "BaseWars Tools"
TOOL.Name = "#tool." .. FileName .. ".name"

if CLIENT then
	language.Add("tool." .. FileName .. ".name", "Upgrade Tool")
	language.Add("tool." .. FileName .. ".desc", "Left click to upgrade printer.")
	language.Add("tool." .. FileName .. ".0", "Left click to upgrade printer one level. Right click to max upgrade printer.")
end

local dist = 200 ^ 2

local function Upgradable(ply, ent)
	local Eyes = ply:EyePos()
	local Class = ent:GetClass()

	return BaseWars.Ents:Valid(ent) and Eyes:DistToSqr(ent:GetPos()) < dist and ent.Upgrade
end

function TOOL:LeftClick(trace)
	local Ent = trace.Entity
	local ply = self:GetOwner()
	if not Upgradable(ply, Ent) then return false end
	Ent:Upgrade(ply)

	return true
end

function TOOL:RightClick(trace)
	local Ent = trace.Entity
	local ply = self:GetOwner()
	if not Upgradable(ply, Ent) then return false end

	self:CanUpgradeAgain(trace)

	return true
end

function TOOL:CanUpgradeAgain(trace)
	local Ent = trace.Entity
	local ply = self:GetOwner()
	local currentlvl = Ent:GetLevel()
	if Ent:GetNWInt("UpgradeCost") * currentlvl < ply:GetMoney() and currentlvl < 20 then
		Ent:Upgrade(ply)
		if currentlvl < 20 then
			timer.Simple(0.05, function()
				self:CanUpgradeAgain(trace)
			end)
		end
	end
end

function TOOL:Reload(trace)
end

-- This function/hook is called every frame on client and every tick on the server
function TOOL:Think()
end

-- This controls the part of the UI which shows options for this tool
function TOOL.BuildCPanel(panel)
	panel:AddControl("Header", {
		Text = "#tool." .. FileName .. ".name",
		Description = "#tool." .. FileName .. ".desc"
	})
end