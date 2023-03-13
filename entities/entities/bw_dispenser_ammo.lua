AddCSLuaFile()
ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
ENT.PrintName = "Ammo Dispenser"
ENT.Author = "Q2F2"
ENT.Model = "models/props_lab/reciever_cart.mdl"
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
	local PlyGun = ply:GetActiveWeapon()
	if not BaseWars.Ents:Valid(PlyGun) then return end
	local Pammo = PlyGun:GetPrimaryAmmoType()
	local Sammo = PlyGun:GetSecondaryAmmoType()
	if not Pammo then return end
	ply:GiveAmmo(50, Pammo)
	ply:GiveAmmo(1, Sammo)
	self:EmitSound(self.Sound, 100, 60)
end