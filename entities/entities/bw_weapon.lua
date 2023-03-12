AddCSLuaFile()
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Spawned Weapon"
ENT.Model = "models/weapons/w_smg1.mdl"
ENT.WeaponClass = "weapon_smg1"

-- Draw some 3D text
local function Draw3DText(pos, ang, scale, text)

    local ply = LocalPlayer()
    local view = ply:GetViewModel() or ply
    local dist = view:EyePos():Distance(pos)
    local distance = 300
    local dir = (pos - view:EyePos()):GetNormalized()
    local dot = view:EyeAngles():Forward():Dot(dir)
    if not (dot > math.cos(math.rad(ply:GetFOV() / 1.69)) and dist < distance) then return end
    scale = ScrW() * dist * 0.0000005
    cam.Start3D2D(pos, ang, scale)
    cam.IgnoreZ(true)
    -- Actually draw the text. Customize this to your liking.
    draw.DrawText(text, "BW.Menu.BigFont", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    cam.IgnoreZ(false)
    cam.End3D2D()
end

function ENT:Draw()
    -- Draw the model
    self:DrawModel()
    -- The text to display
    local tbl = weapons.Get(self:GetNW2String("wepClassName"))
    if not tbl then return end
    local text = tbl.PrintName
    -- The position. We use model bounds to make the text appear just above the model. Customize this to your liking.
    local mins, maxs = self:GetModelBounds()
    local pos = self:GetPos() + Vector(0, 0, maxs.z + 2)
    -- The angle
    local ang = EyeAngles()
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), 90)
    -- Draw front
    Draw3DText(pos, ang, 1, text)
end

if CLIENT then return end

function ENT:Initialize()
    self.BaseClass:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:PhysWake()
    self:Activate()
    self:SetUseType(SIMPLE_USE)
end

function ENT:Use(activator, caller, usetype, value)
    local Class = self.WeaponClass
    local Wep = activator:GetWeapon(Class)

    if BaseWars.Ents:Valid(Wep) then
        for _, w in pairs(activator:GetWeapons()) do
            if w:GetClass() == Class then
                BaseWars.Inventory:AddToInv(activator, Wep)
                self:Remove()

                return
            end
        end

        local Clip = Wep.Primary and Wep.Primary.DefaultClip
        activator:GiveAmmo(Clip or 30, Wep:GetPrimaryAmmoType())
    else
        activator:Give(Class)
    end

    self:Remove()
end