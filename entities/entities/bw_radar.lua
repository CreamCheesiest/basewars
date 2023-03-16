ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
ENT.PrintName = "Radar Transmitter"
ENT.Model = "models/props_rooftop/roof_dish001.mdl"
ENT.PowerRequired = 0
ENT.PowerCapacity = 5000
ENT.AllwaysRaidable = true
ENT.Radius = 75
ENT.Active = false

if SERVER then
    AddCSLuaFile()
    util.AddNetworkString("PlayerInvisible")

    function ENT:isVisable()
        local players = player.GetAll()

        for _, ply in ipairs(players) do
           	if ply.invis then
                AdminInvisible = true
                ply:SetNW2Bool("isInvis", true)
            else
                AdminInvisible = false
                ply:SetNW2Bool("isInvis", false)
            end
        end
    end

    function ENT:SetMinimap(ply, bool)
        ply:SetNW2Bool("BaseWars_HasRadar", bool)
    end

    function ENT:ThinkFuncBypass()
        local Owner = BaseWars.Ents:ValidOwner(self)
		if Owner then
            self:SetMinimap(Owner, self:IsPowered())
        end
		self:isVisable()
    end

    function ENT:OnRemove()
        local Owner = BaseWars.Ents:ValidOwner(self)

        if Owner then
            self:SetMinimap(Owner, false)
        end
    end
end