AddCSLuaFile()
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.Model = "models/weapons/w_slam.mdl"
ENT.ExplodeTime = 10
ENT.ExplodeRadius = 200
ENT.ShowTimer = true
ENT.Counter = 0
ENT.RealCounter = 0
ENT.DisableTime = 60
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

if SERVER then
    function ENT:Initialize()
        self:SetModel(self.Model)
        self:SetUseType(CONTINUOUS_USE)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetRenderMode(RENDERMODE_TRANSALPHA)
        self.CountingDown = false
        self.u = 0
    end

    function ENT:StartCountdown()
        self.CurTick = CurTime()
        self.Counter = self.ExplodeTime * 2
        self.RealCounter = self.ExplodeTime
        self.CountingDown = true
        self:SetNW2Bool("show", true)
    end

    function ENT:StopCountdown()
        self.CountingDown = nil
        self:SetNW2String("counter", "0")
        self:SetNW2Bool("show", false)
    end

    local beep = Sound("ambient/machines/keyboard_fast1_1second.wav")

    function ENT:Beep()
        self:EmitSound(beep, 75, 100, 0.25)
    end

    local plant = Sound("weapons/c4/c4_plant.wav")

    function ENT:Plant(ent, attacker)
        if ent then
            self:SetParent(ent)
        end
        self.Attacker = attacker
        self:SetMoveType(MOVETYPE_NONE)
        self:EmitSound(plant)
        self:StartCountdown()
    end

    local defuse = Sound("weapons/c4/c4_disarm.wav")

    function ENT:Defuse()
        self:EmitSound(defuse)
        self:StopCountdown()
        self.Defused = true
    end

    function ENT:FindTargets()
        local function EMP(ent, health, damage)
            -- check if the entity is still valid
            if IsValid(ent) then
                ent:SetHealth(health)
                ent:OnTakeDamage(damage)
                timer.Remove("empTimer" .. tostring(ent))
                ent.isEMPed = false
                ent.EMPDamage = 30
                ent.tempHealth = ent:Health()
            end
        end

        local maxRange = 200
        local p_pos = self:GetPos()

        for i, v in pairs(ents.FindInSphere(p_pos, maxRange)) do
            if
                (v.Base == "bw_base_electronics"
                or v.Base == "bw_base_moneyprinter"
                or v:GetClass() == "bw_base_jammer"
                or v.Base == "bw_base_turret")
                and BaseWars.PrinterCheck(v:CPPIGetOwner())
            then
                if not v.tempHealth then
                    v.tempHealth = v:Health() -- store the initial health of the entity
                end

                if not v.isEMPed then
                    v.isEMPed = true
                    v.tempHealth = v:Health()
                    v:SetHealth(1) -- set the entity's health to 0
                    damageTable = DamageInfo()
                    damageTable:SetDamage(30)
                    damageTable:SetAttacker(self.Attacker)
                    timer.Create("empTimer" .. tostring(v), self.DisableTime, 0, function()
                        EMP(v, v.tempHealth, damageTable)
                    end)
                else
                    timer.Adjust("empTimer" .. tostring(v), self.DisableTime, 0, function()
                        EMP(v, v.tempHealth, damageTable)
                    end)
                end
            end
        end
    end

    function ENT:HackedComplete()
        self:SetNW2Bool("show", false)
        self:FindTargets()
        self:EmitSound("weapons/stunstick/alyx_stunner1.wav")
        -- PrintTable(TargetsFound)
        SafeRemoveEntity(self)
        SafeRemoveEntityDelayed(env, 0.1)
    end

    function ENT:ExplodeEffects()
        local ef = EffectData()
        ef:SetOrigin(self:GetPos())
        util.Effect("Explosion", ef)
        util.Effect("Explosion", ef)
        self:EmitSound("weapons/c4/c4_explode1.wav")
        self:EmitSound("weapons/hegrenade/explode5.wav")
    end

    function ENT:StartUse()
    end

    function ENT:EndUse()
        self:SetNW2Int("defuseprogress", 0)
    end

    function ENT:AlphaDec()
        local al = self:GetColor().a
        al = al - 5

        if al <= 0 then
            SafeRemoveEntity(self)

            return
        end

        self:SetColor(ColorAlpha(self:GetColor(), al))
    end

    function ENT:Think()
        if self.ddd and self.ddd <= CurTime() then
            self:AlphaDec()
            self:NextThink(CurTime() + 0.01)

            return true
        end

        if self.ddd then return end

        if self.Defused then
            self:SetNW2String("counter", "0")
            self.ddd = CurTime() + 1

            return
        end

        self:SetNW2String("counter", tostring(math.ceil(self.RealCounter or 0)))

        if self.u > 0 then
            self:SetNW2Bool("using", true)
            self.u = self.u - 1

            if not self.used then
                self:StartUse()
                self.used = true
            end
        else
            self:SetNW2Bool("using", false)
            self.used = nil
            self:EndUse()
        end

        if self:GetNW2Int("defuseprogress", 0) >= 400 then
            local ply = self.defusor
            self:Defuse()

            return
        end

        if self.Hacked then
            self:HackedComplete()

            return
        end

        if self.CountingDown then
            if self.CurTick <= CurTime() - 1 then end

            if self.CurTick <= CurTime() - ((self.Counter > 10 and 1) or (self.Counter > 2 and 0.5) or 0.125) then
                if self.Counter > 10 then
                    self.RealCounter = self.RealCounter - 1
                elseif self.Counter > 2 then
                    self.RealCounter = self.RealCounter - 0.5
                else
                    self.RealCounter = self.RealCounter - 0.125
                end

                self.Counter = self.Counter - ((self.Counter > 10 and 2) or (self.Counter > 2 and 1) or 0.25)
                self:Beep()

                if self.Counter <= 0 then
                    self.Hacked = true
                end

                self.CurTick = CurTime()
            end
        end
    end

    function ENT:Use(activator, caller, ut, value)
        if activator:IsPlayer() then
            self.u = 2
            self:SetNW2Int("defuseprogress", self:GetNW2Int("defuseprogress", 0) + 1)
            self.defusor = activator
        end
    end
else
    function ENT:GetCounter()
        return tonumber(self:GetNW2String("counter", "0"))
    end

    hook.Add("HUDPaint", "BaseWars.Plant_Cracker", function()
        if not IsValid(LocalPlayer()) then return end

        for _, ent in pairs(ents.GetAll()) do
            if IsValid(ent) and (ent:GetClass() == "bw_cracker_ent" or ent.Base == "bw_cracker_ent") then
                local pos = ent:GetPos()
                if pos:Distance(LocalPlayer():GetPos()) > 80 then continue end
                local t = pos:ToScreen()
                local x, y = t.x, t.y
                local counter = ent:GetCounter()

                if not counter then
                    print"wat"

                    return
                end

                if counter == 0 then
                    draw.DrawText("DEFUSED", "ChatFont", x, y, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                    continue
                end

                local sec, min = counter % 60, math.floor(counter / 60)
                sec = sec < 10 and "0" .. sec or tostring(sec)
                min = min < 10 and "0" .. min or tostring(min)
                draw.DrawText(min .. ":" .. sec, "ChatFont", x, y, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                local defprogress = ent:GetNW2Int("defuseprogress")

                if defprogress > 0 then
                    local prog = math.Clamp(defprogress / 400, 0.01, 1)
                    local w, h = ScrW() / 12, 24
                    local wprog = math.max(w * prog, 4)
                    draw.RoundedBox(2, x - w / 2, y + 32, w, h, Color(100, 100, 100))
                    draw.RoundedBox(2, x - w / 2 + 2, y + 34, wprog - 4, h - 4, Color(170, 170, 170))
                    draw.DrawText("DEFUSING...", "ChatFont", x, y + 34, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                end
            end
        end
    end)
end