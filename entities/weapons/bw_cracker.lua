AddCSLuaFile()
SWEP.PrintName = "EMP Bomb"
SWEP.Slot = 5
SWEP.SlotPos = 3
SWEP.Spawnable = true
SWEP.ViewModel = Model("models/weapons/c_slam.mdl")
SWEP.WorldModel = Model("models/weapons/w_slam.mdl")
SWEP.ViewModelFOV = 54
SWEP.UseHands = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:Initialize()
	self:SetHoldType("slam")
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	local tr = util.TraceLine({
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 128,
		filter = self.Owner
	})

	if not tr.Hit then return end
	local ent = tr.Entity

	if not ent:IsPlayer() and not ent:IsNPC() then
		local p = ent
		local ent = ents.Create("bw_cracker_ent")
		local pos = tr.HitPos + tr.HitNormal * 2
		local ang = tr.HitNormal:Angle()
		ang:RotateAroundAxis(ang:Right(), -90)
		ang:RotateAroundAxis(ang:Up(), 180)
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:Spawn()
		ent:Activate()
		ent.Owner = self.Owner
		ent:Plant(not p:IsWorld() and p, ent.Owner)
		self:Remove()
	end

	self:SetNextPrimaryFire(CurTime() + 1)
end

function SWEP:SecondaryAttack()
end