ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Jammer"
ENT.Author = "Lighterchu"
ENT.Category = "Jammer"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "t1price")
	self:NetworkVar("Entity", 0, "t1owning_ent")
	self:NetworkVar("Int", 1, "jamount") -- Amount
	
end


if SERVER then 
    AddCSLuaFile()
    function ENT:Initialize()
        self:SetModel("models/hunter/blocks/cube05x05x025.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetColor( Color(100,0,0) )
        self:SetMaterial("models/debug/debugwhite", false)
        self:SetHealth(10)
    
        local phys = self:GetPhysicsObject()
        phys:Wake()
    end
    function ENT:ArmedColor(toggle) 
        print(toggle)
        if(toggle) then 
            self:SetColor(Color(0,255,0))
            shouldOccur = true
        else
            self:SetColor( Color(100,0,0) )
            shouldOccur = false
        end 
    end
    
    
    function ENT:ActiveJammer(toggle)
        self:ArmedColor(toggle)
    end 
    
    
    
    function ENT:Use(activator, caller)
        local delay = 2
        if not self.timer or CurTime() > self.timer then -- check if the timer is not set or has expired
            self.timer = CurTime() + delay -- set the timer to expire in delay seconds
            toggle = not toggle -- invert the value of toggle
            active = toggle -- set active to the new value of toggle
            self:ActiveJammer(toggle)
            self:SetNetworkedBool("ActiveStats", active)
        end
    end
    
    
    function ENT:OnTakeDamage(dmg)
        self:Remove()
    end
    
    function ENT:Destruct()
    
    end
    
    function ENT:Think()
    
        
    end
    
    function ENT:OnRemove()
        if self.sound then
            self.sound:Stop()
        end
    end

else 

    surface.CreateFont("jammer_font", {font = "Arial",size = 24,weight = 600,blursize = 0,scanlines = 0,antialias = false});


    function ENT:Initialize()
        self:DrawShadow(true)
        local titleAcive = "off"
    end


    function ENT:Draw()
        self:DrawModel()

        local pos = self:GetPos()
        local ang = self:GetAngles()
        local height = 120
        local width = 285
    
        cam.Start3D2D(pos + ang:Up() * 6, ang,0.1)
            self:Heading(120)
            self:ActiveStats(0)
            self:BottomHeading(80)
        cam.End3D2D()
    end
    function ENT:Heading(y) 
        draw.RoundedBox(0, -120, -y, 240, 40, Color(150,150,150))
        draw.SimpleText("Jammer", "jammer_font", -1,-y + 20, Color(100,50,30), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function ENT:BottomHeading(y)
        draw.RoundedBox(0, -120, y, 240, 40, Color(150,150,150))
        draw.SimpleText("Owner", "jammer_font", -10, y + 20, Color(100,50,30), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end 


    function ENT:ActiveStats(y)
        local activeStats = self:GetNetworkedBool( "ActiveStats" )
        if(activeStats)then 
            titleAcive = "on"
        else 
            titleAcive = "off"
        end 
        draw.RoundedBox(0, -120, y, 240, 40, Color(150,150,150))
        draw.SimpleText(titleAcive, "jammer_font", -10, y + 20, Color(100,50,30), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    
    end 


end 