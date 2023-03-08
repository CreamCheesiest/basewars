SWEP.PrintName = "Blowtorch"
SWEP.Author = "CreamCheese"

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.ViewModel = "models/weapons/c_irifle.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Ammo = "none"
SWEP.Primary.Automatic = true

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false

SWEP.VMSequenceFire = "fire"
SWEP.WMSequenceFire = "fire"
SWEP.UseHands = "true"

SWEP.Sound = {Sound("weapons/stunstick/spark1.wav"), Sound("weapons/stunstick/spark2.wav"), Sound("weapons/stunstick/spark3.wav")}

SWEP.Range = 100
SWEP.Damage = 50


function SWEP:Initialize()
    self:SetWeaponHoldType("ar2")
end

function SWEP:PrimaryAttack()
    local rand = math.Round(math.Rand(1,3))
    self:SetNextPrimaryFire(CurTime() + 0.1)

    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    owner:LagCompensation(true)
    local trace = owner:GetEyeTrace()
    owner:LagCompensation(false)

    if not IsValid(trace.Entity) then 
        self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
        self:GetOwner():SetAnimation(PLAYER_ATTACK1)
        self:EmitSound(self.Sound[rand])
        return
    end

    local dist = trace.StartPos:Distance(trace.HitPos)
    if dist > self.Range then return end

    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK) -- play the fire animation in first-person view
    self:GetOwner():SetAnimation(PLAYER_ATTACK1) -- play the fire animation in third-person view

    self:EmitSound(self.Sound[rand])

        local dmginfo = DamageInfo()
        dmginfo:SetDamageType(DMG_GENERIC)
        dmginfo:SetDamage(self.Damage)
        dmginfo:SetAttacker(owner)
        dmginfo:SetInflictor(self)
        dmginfo:SetDamageForce(owner:GetAimVector() * 1)

        if SERVER then
            if IsValid(trace.Entity) then
                trace.Entity:TakeDamageInfo(dmginfo)
            end
        end

        if IsValid(trace.Entity) then
            local effectData = EffectData()
            effectData:SetOrigin(trace.Entity:GetPos())
            effectData:SetNormal(Vector(0,0,0))
            util.Effect("ManhackSparks", effectData)
        end

end