ENT.Type = "anim"
ENT.Base = "bw_base_electronics"
ENT.PrintName = "Basic Jammer"
ENT.Author = "Lighterchu"
ENT.Category = "Jammer"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Model = "models/props_lab/reciever01b.mdl"
ENT.Active = false
ENT.CutOut = false
ENT.MaxLevel = 20
ENT.JammerRadius = 100
ENT.UpgradeCost = 2500
AddCSLuaFile()
local fontName = "BaseWars.MoneyPrinter"
local active = 'OFF'
local toggle = false
local Clamp = math.Clamp

function ENT:GSAT(slot, name, min, max)
	self:NetworkVar("Int", slot, name)

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
	self:GSAT(1, "Level", 0, "MaxLevel")
	self:GSAT(2, "CutOut", 0, "MaxCutOut")
	self:GSAT(3, "JammerRadius", 0, "MaxRadius")
	self:NetworkVar("Bool", 0, "Active")
end

if SERVER then
	function ENT:ActiveJammer(toggle)
	end

	function ENT:Init()
		self:SetHealth(self.PresetMaxHealth or 100)
		self:SetActive(false)
		self:SetJammerRadius(self.JammerRadius or 100)
		self.FontColor = color_white
		self.BackColor = color_black
		self:SetNWInt("UpgradeCost", self.UpgradeCost)
		self:SetLevel(1)
	end

	function ENT:SetUpgradeCost(val)
		self.UpgradeCost = val * self.UpgradeCost / 5000
		self:SetNWInt("UpgradeCost", val)
	end

	function ENT:Upgrade(ply)
		if ply then
			local lvl = self:GetLevel()
			local plyM = ply:GetMoney()
			local calcM = self:GetNWInt("UpgradeCost") * lvl

			if plyM < calcM then
				ply:Notify(BaseWars.LANG.UpgradeNoMoney, BASEWARS_NOTIFICATION_ERROR)

				return
			end

			if lvl >= self.MaxLevel then
				ply:Notify(BaseWars.LANG.UpgradeMaxLevel, BASEWARS_NOTIFICATION_ERROR)

				return
			end

			ply:TakeMoney(calcM)
			self.CurrentValue = (self.CurrentValue or 0) + calcM
			self:SetJammerRadius(100 + self:GetLevel() * 40)
		end

		self:AddLevel(1)
		self:EmitSound("ui/buttonclick.wav")
	end

	function ENT:BadlyDamaged()
		if self:Health() <= (self:GetMaxHealth() / 5) then
			toggle = false
			self:SetActive(false)
			active = "UNAVAILABLE"

			return true
		end
	end

	function ENT:Use(activator, caller)
		if self:BadlyDamaged() then return end
		local delay = 1

		-- check if the timer is not set or has expired
		if not self.timer or CurTime() > self.timer then
			self.timer = CurTime() + delay -- set the timer to expire in delay seconds
			self.Active = not self.Active
			self:SetActive(self.Active)
			self:SetJammerRadius(self.JammerRadius)
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
			self.StartingJammerColor = Vector(255, 0, 0)
			self.StartingJammerName = "Im From Wish.com"
			self.youngJammerColor = Vector(100, 255, 0)
			self.youngJammerName = "Young But Smart"
			self.NewGuyInTownJammerColor = Vector(50, math.random(0, 50), 255)
			self.NewGuyInTownJammerName = "New Guy In Town"
			self.ImTheManForTheJobJammerColor = Vector(100, math.random(100, 255), 255)
			self.ImTheManForTheJobJammerName = "Man For the Job"
			self.ElitJammerColor = Vector(math.random(0, 255), math.random(0, 255), math.random(0, 255))
			self.ElitJammerName = "IM GOD"
			self.JammerName = self.StartingJammerName
		end

		-- Define a unique identifier for the message
		function ENT:JammerRing(pos)
			local ColorOfLevel = self.StartingJammerColor
			local Lv = self:GetLevel()

			if Lv >= self.MaxLevel then
				self.JammerName = self.ElitJammerName
				ColorOfLevel = self.ElitJammerColor
				-- self.JammerRadius = 100 + self:GetLevel() * 10
				-- self:SetJammerRadius(self.JammerRadius)
			elseif Lv >= 15 then
				self.JammerName = self.ImTheManForTheJobJammerName
				ColorOfLevel = self.ImTheManForTheJobJammerColor
			elseif Lv >= 10 then
				-- self.JammerRadius = 250
				-- self:SetJammerRadius(self.JammerRadius)
				self.JammerName = self.NewGuyInTownJammerName
				ColorOfLevel = self.NewGuyInTownJammerColor
			elseif Lv >= 5 then
				-- self.JammerRadius = 200
				-- self:SetJammerRadius(self.JammerRadius)
				self.JammerName = self.youngJammerName
				ColorOfLevel = self.youngJammerColor
			else -- self.JammerRadius = 150 -- self:SetJammerRadius(self.JammerRadius)
				self.JammerName = self.StartingJammerName
				ColorOfLevel = self.StartingJammerColor
				-- self.JammerRadius = 100
				-- self:SetJammerRadius(self.JammerRadius)
			end

			local emitter = ParticleEmitter(pos) -- Particle emitter in this position

			-- Do 100 particles
			for i = 1, 100 do
				local part = emitter:Add("sprites/glow04_noz", pos) -- Create a new particle at pos

				if part then
					part:SetStartSize(1)
					part:SetEndSize(2)
					part:SetVelocity(Vector(math.sin(i), math.cos(i), 0) * 3000)
					part:SetStartAlpha(50)
					part:SetEndAlpha(100)
					part:SetDieTime(0.01)
					part:SetRoll(math.random(0, 360))
					part:SetRollDelta(math.random(-10, 10))
					part:SetColor(ColorOfLevel.x, ColorOfLevel.y, ColorOfLevel.z)
				end
			end

			emitter:Finish()
		end

		function ENT:DrawDisplay(pos, ang, scale)
			local p_pos = LocalPlayer():GetPos()
			local dist = self:GetPos():Distance(p_pos)
			local Lv = self:GetLevel()
			if dist > 130 then return end
			local w, h = 170 * 2, 136 * 2
			local inUse = 'ON'
			draw.RoundedBox(4, 0, 0, w, h, Pw and self.BackColor or color_black)

			if not self:GetActive() then
				draw.DrawText("JAMMER IS OFF", fontName .. ".Huge", w / 2, h / 2 - 32, Color(255, 0, 0), TEXT_ALIGN_CENTER)

				return
			end

			draw.DrawText(self.JammerName, fontName, w / 2, 4, self.FontColor, TEXT_ALIGN_CENTER)
			--active status
			surface.SetDrawColor(self.FontColor)
			surface.DrawLine(0, 30, w, 30) --draw.RoundedBox(0, 0, 30, w, 1, self.FontColor)
			draw.DrawText(inUse, fontName .. ".Big", w / 2, 32, self.FontColor, TEXT_ALIGN_CENTER)
			surface.DrawLine(0, 68, w, 68) --draw.RoundedBox(0, 0, 68, w, 1, self.FontColor)
			draw.DrawText("Level: " .. Lv, fontName .. ".Big", 5, 75, self.FontColor, TEXT_ALIGN_LEFT)
			surface.DrawLine(0, 110, w, 110) --draw.RoundedBox(0, 0, 30, w, 1, self.FontColor)
			local NextCost = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(self:GetLevel() * self:GetNWInt("UpgradeCost"))

			if self:GetLevel() >= self.MaxLevel then
				NextCost = "!Max Level!"
			end

			draw.DrawText("Next Upgrade: " .. NextCost, fontName .. ".MedBig", 5, 120, self.FontColor, TEXT_ALIGN_LEFT)
			surface.DrawLine(0, 110, w, 110) --draw.RoundedBox(0, 0, 30, w, 1, self.FontColor)
			local jammerPos = self:GetPos()
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