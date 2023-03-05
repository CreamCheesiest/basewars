ENT.Type = "anim"
ENT.Base = "bw_base_electronics"
ENT.PrintName = "Jammer"
ENT.Author = "Lighterchu"
ENT.Category = "Jammer"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Model = "models/props_lab/reciever01b.mdl"
ENT.Active = false  

AddCSLuaFile()

local fontName = "BaseWars.MoneyPrinter"
local active = 'OFF'
local toggle = false




if SERVER then 

    util.AddNetworkString("JammerToggle")
    function ENT:ActiveJammer(toggle)
       
    end 
    
    function ENT:BadlyDamaged()
        if(self:Health() <= (self:GetMaxHealth() / 5)) then 
            toggle = false
            self:SetActive(false)
            active = "UNAVAILABLE"
            return true
        end
    end
    
    
    function ENT:Use(activator, caller)
        if(self:BadlyDamaged() ) then return end
        local delay = 1
        if not self.timer or CurTime() > self.timer then -- check if the timer is not set or has expired
            self.timer = CurTime() + delay -- set the timer to expire in delay seconds
            self.Active = not self.Active
            self:SetActive(self.Active)
        end
    end
    
else 

    surface.CreateFont(fontName, {

		font = "Roboto",
		size = 20,
		weight = 800,

	})

	surface.CreateFont(fontName .. ".Huge", {

		font = "Roboto",
		size = 64,
		weight = 800,

	})


	surface.CreateFont(fontName .. ".Big", {

		font = "Roboto",
		size = 32,
		weight = 800,

	})

	surface.CreateFont(fontName .. ".MedBig", {

		font = "Roboto",
		size = 24,
		weight = 800,

	})

	surface.CreateFont(fontName .. ".Med", {

		font = "Roboto",
		size = 18,
		weight = 800,

	})


  

    if CLIENT then

        function ENT:Initialize()
            self:DrawShadow(true)
            local titleAcive = "off"
            self.FontColor = color_white
        end

                -- Define a unique identifier for the message
        function ENT:JammerRing(pos)
            local emitter = ParticleEmitter( pos) -- Particle emitter in this position
            for i = 1, 180 do -- Do 100 particles
                local part = emitter:Add( "sprites/glow04_noz", pos ) -- Create a new particle at pos
                if ( part ) then
                    part:SetStartSize(1)
                    part:SetEndSize(3)
                    part:SetVelocity(Vector(math.sin(i), math.cos(i), 0) * 3000)
                    part:SetStartAlpha(255)
                    part:SetEndAlpha(255)
                    part:SetDieTime(0.01)
                    part:SetRoll(math.random(0, 360))
                    part:SetRollDelta(math.random(-10, 10))
                    part:SetColor(100,0,0)
                end
            end
            
            emitter:Finish()
        end
        function ENT:DrawDisplay(pos, ang, scale)
            
            local w, h = 170 * 2, 136 * 2
            local inUse = 'ON'
            
            draw.RoundedBox(4, 0, 0, w, h, Pw and self.BackColor or color_black)
            if !self:GetActive() then
                draw.DrawText("JAMMER IS OFF", fontName .. ".Huge", w / 2, h / 2 - 32, Color(255,0,0), TEXT_ALIGN_CENTER)
                
            return end
            draw.DrawText(self.PrintName, fontName, w / 2, 4, self.FontColor, TEXT_ALIGN_CENTER)
            --active status
             surface.SetDrawColor(self.FontColor)
             surface.DrawLine(0, 30, w, 30)--draw.RoundedBox(0, 0, 30, w, 1, self.FontColor)
             draw.DrawText(inUse, fontName .. ".Big",w/ 2, 32, self.FontColor, TEXT_ALIGN_CENTER)
             surface.DrawLine(0, 68, w, 68)--draw.RoundedBox(0, 0, 68, w, 1, self.FontColor)

        
            local jammerPos =  self:GetPos()
            self:JammerRing(jammerPos)
           
        end

        function ENT:Calc3D2DParams()

            local pos = self:GetPos()
            local ang = self:GetAngles()

            pos = pos + ang:Up() * 3.33
            pos = pos + ang:Forward() * -7.35
            pos = pos + ang:Right() * 8.42

            ang:RotateAroundAxis(ang:Up(), 90)

            return pos, ang, 0.1 / 2

        end
    end

    function ENT:Draw()
        self:DrawModel()
        local pos, ang, scale = self:Calc3D2DParams()

        if CLIENT then 
            cam.Start3D2D(pos, ang, scale)
				pcall(self.DrawDisplay, self, pos, ang, scale)
			cam.End3D2D()

        end
   end
end 