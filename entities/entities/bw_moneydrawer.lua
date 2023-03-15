local fontName = "BaseWars.MoneyDrawer"
ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
ENT.PrintName = "Money Drawer"
ENT.Model = "models/props_c17/FurnitureDrawer001a.mdl"
ENT.Skin = 0
ENT.IsElectronic = true
ENT.MoneyCollectionRadius = 600
ENT.CollectInterval = 11
ENT.Money = 0
ENT.Capacity = 2000000000
local Clamp = math.Clamp

function ENT:GSAT(slot, name, min, max)
	self:NetworkVar("Float", slot, name)

	local getVar = function(minMax)
		if self[minMax] and isfunction(self[minMax]) then return self[minMax](self) end
		if self[minMax] and isnumber(self[minMax]) then return self[minMax] end

		return minMax or 0
	end

	self["Add" .. name] = function(_, var)
		local Val = self["Get" .. name](self) + var

		if min and max then
			Val = Clamp(tonumber(Val) or 0, getVar(min), getVar(max))
		end

		self["Set" .. name](self, Val)
	end

	self["Take" .. name] = function(_, var)
		local Val = self["Get" .. name](self) - var

		if min and max then
			Val = Clamp(tonumber(Val) or 0, getVar(min), getVar(max))
		end

		self["Set" .. name](self, Val)
	end
end

function ENT:StableNetwork()
	self:GSAT(2, "Capacity")
	self:GSAT(3, "Money", 0, "GetCapacity")
end

function ENT:CollectMoney()
	local Ents = ents.FindInSphere(self:GetPos(), self.MoneyCollectionRadius)

	for _, v in next, Ents do
		if not v or not IsValid(v) or v == self then continue end
		if not v.IsPrinter then continue end
		local OwnerDrawer = BaseWars.Ents:ValidOwner(self)
		local OwnerPrinter = BaseWars.Ents:ValidOwner(v)
		if OwnerDrawer ~= OwnerPrinter then continue end
		v:DrawerTakeMoney(self)
	end
end

function ENT:SuckMoney(money)
	self:AddMoney(money)
end

if SERVER then
	AddCSLuaFile()

	function ENT:Init()
		self.time = CurTime()
		self.time_p = CurTime()
		self:SetCapacity(self.Capacity)
		self.FontColor = color_white
		self.BackColor = color_black
	end

	function ENT:Think()
		if CurTime() >= self.time + self.CollectInterval then
			self:CollectMoney()
			self.time = CurTime()
		end
	end

	function ENT:Use(activator, caller, usetype, value)
		if self.Disabled then return end

		if activator:IsPlayer() and caller:IsPlayer() and self:GetMoney() > 0 then
			self:PlayerTakeMoney(activator)
		end
	end

	function ENT:PlayerTakeMoney(ply)
		local money = self:GetMoney()
		local Res, Msg = hook.Run("BaseWars_PlayerCanEmptyPrinter", ply, self, money)

		if Res == false then
			if Msg then
				ply:Notify(Msg, BASEWARS_NOTIFICATION_ERROR)
			end

			return
		end

		self:TakeMoney(money)
		ply:GiveMoney(money)
		self:PlaySound(ply)
		hook.Run("BaseWars_PlayerEmptyPrinter", ply, self, money)
	end

	function ENT:PlaySound(ply)
		int = math.random(3)

		if int == 1 then
			ply:EmitSound("collect1.wav")
		elseif int == 2 then
			ply:EmitSound("collect2.wav")
		else
			ply:EmitSound("collect3.wav")
		end
	end
else
	function ENT:Initialize()
		if not self.FontColor then
			self.FontColor = color_white
		end

		if not self.BackColor then
			self.BackColor = color_black
		end
	end

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

	function ENT:DrawDisplay()
		local w, h = 216 * 2, 136 * 2
		-- local Cp = self:GetCapacity()
		local Mny = self:GetMoney()
		local text = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(Mny)
		draw.DrawText(text, fontName .. ".Huge", w / 2, h / 2, self.FontColor, TEXT_ALIGN_CENTER)
	end

	function ENT:Calc3D2DParams()
		local pos = self:GetPos()
		local ang = self:GetAngles()
		pos = pos + ang:Up() * 26
		pos = pos + ang:Forward() * 13
		pos = pos + ang:Right() * 27.5
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)

		return pos, ang, 0.25 / 2
	end

	function ENT:Draw()
		self:DrawModel()

		if CLIENT then
			local pos, ang, scale = self:Calc3D2DParams()
			cam.Start3D2D(pos, ang, scale)
			pcall(self.DrawDisplay, self, pos, ang, scale)
			cam.End3D2D()
		end
	end
end