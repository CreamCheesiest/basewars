AddCSLuaFile()
ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
ENT.PrintName = "Health Dispenser"
ENT.Author = "Q2F2"
ENT.Model = "models/props_combine/health_charger001.mdl"
ENT.Sound = Sound("HL1/fvox/blip.wav")

function ENT:Init()
	self:SetModel(self.Model)
	self:SetHealth(500)
	self:SetUseType(CONTINUOUS_USE)
end

function ENT:CheckUsable()
	if self.Time and self.Time + BaseWars.Config.DispenserTime > CurTime() then return false end
end

function ENT:UseFunc(ply)
	if not BaseWars.Ents:ValidPlayer(ply) then return end
	self.Time = CurTime()
	local Health = ply:Health()
	if Health >= 100 then return end
	ply:SetHealth(Health + 10)
	self:EmitSound(self.Sound, 100, 60)

	if ply:Health() > 100 then
		ply:SetHealth(100)
	end
end