AddCSLuaFile()
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Health Kit"
ENT.Model = "models/items/healthkit.mdl"
ENT.HealAmount = 25
ENT.Level = 1

if SERVER then
    function ENT:Initialize()
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:AddEffects(EF_ITEM_BLINK)
        self:PhysicsInit( SOLID_VPHYSICS )
        self:PhysWake()
        self:Activate()
        self:SetUseType(SIMPLE_USE)
    end

    function ENT:Use(activator, caller, useType, value)
        local owner = BaseWars.Ents:ValidOwner(self)
        local currentHealth = activator:Health()
        if owner:GetLevel() >= 1000 then
            self.HealAmount = 75
            self.Level = 3
        elseif owner:GetLevel() >= 120 then
            self.HealAmount = 50
            self.Level = 2
        end
        activator:SetHealth(math.Clamp(currentHealth + self.HealAmount, 0, 100))
        activator:Notify(string.format(BaseWars.LANG.UseMedkit, self.Level), BASEWARS_NOTIFICATION_GENRL)
        self:Remove()
    end
end