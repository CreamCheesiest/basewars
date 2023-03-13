MODULE.Name = "Bounty"
MODULE.Author = "Trixter"
MODULE.BountyTable = {}
local tag = "BaseWars.Bounty"
local PLAYER = debug.getregistry().Player

function MODULE:__INIT()
	if __BASEWARS_BOUNTY_BACKUP then
		BaseWars.UTIL.Log("Detected bounty backup. ATTEMPTING TO RESTORE.")
		self.BountyTable = table.Copy(__BASEWARS_BOUNTY_BACKUP)
		__BASEWARS_BOUNTY_BACKUP = nil
	end
end

if SERVER then
	function MODULE:GetBountyTbl()
		if BaseWars.Bounty.BountyTable == nil then return end

		return BaseWars.Bounty.BountyTable
	end

	function MODULE:PlaceBounty(ply, who, amt)
		if not IsValid(ply) or not IsValid(who) then return false, BaseWars.LANG.InvalidPlayer end
		if who:GetMoney() < amt then return false, BaseWars.LANG.BountyNotEnoughMoney end
		local tbl = self:GetBountyTbl()
		ply:SetNW2Bool("hasBounty", true)
		ply:SetNW2Int("bounty", amt)
		who:TakeMoney(amt)
		tbl[ply:SteamID()] = amt
		PrintMessage(3, "Bounty of " .. BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(amt) .. " has been placed on " .. ply:Name())
		BaseWars.UTIL.Log("Players " .. ply:Name() .. " bounty was set to " .. BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(amt) .. ".")
	end

	PLAYER.PlaceBounty = Curry(MODULE.PlaceBounty)

	function MODULE:RemoveBounty(ply)
		local tbl = self:GetBountyTbl()
		tbl[ply:SteamID()] = nil
		ply:SetNWInt(tag, 0)
		ply:SetNW2Bool("hasBounty", false)
		PrintMessage(3, "Bounty on " .. ply:Name() .. " has been removed.")
		BaseWars.UTIL.Log("Players " .. ply:Name() .. " bounty was removed.")
	end

	PLAYER.RemoveBounty = Curry(MODULE.RemoveBounty)

	function MODULE:PlayerDeath(victim, inflictor, attacker)
		if not IsValid(victim) or not IsValid(attacker) or not victim:IsPlayer() or not attacker:IsPlayer() then return end
		if victim == attacker then return end
		local tbl = self:GetBountyTbl()
		local amt = tbl[victim:SteamID()]
		if not amt then return end
		victim:SetNW2Bool("hasBounty", false)
		attacker:GiveMoney(amt)
		tbl[victim:SteamID()] = nil
		PrintMessage(3, "Bounty on " .. victim:Name() .. " has been claimed by " .. attacker:Name() .. ".")
	end

	hook.Add("PlayerDeath", tag, Curry(MODULE.PlayerDeath))
end

function MODULE:GetBounty(ply)
	if SERVER then
		return self:GetBountyTbl()[ply:SteamID()]
	else
		return self:GetNW2Int(tag, 0)
	end
end

PLAYER.GetBounty = Curry(MODULE.GetBounty)

if CLIENT then
	local function DrawName(ply)
		if not IsValid(ply) then return end
		if ply == LocalPlayer() then return end -- Don't draw a name when the player is you
		if not ply:Alive() then return end -- Check if the player is alive

		for _, p in next, player.GetAll() do
			local Distance = LocalPlayer():GetPos():Distance(p:GetPos()) --Get the distance between you and the player

			--If the distance is less than 1000 units, it will draw the name
			if (Distance < 1000) and p:GetNW2Bool("hasBounty") then
				local offset = Vector(0, 0, 85)
				local ang = LocalPlayer():EyeAngles()
				local pos = p:GetPos() + offset + ang:Up()
				ang:RotateAroundAxis(ang:Forward(), 90)
				ang:RotateAroundAxis(ang:Right(), 90)
				render.SetMaterial(Material("icon16/exclamation.png"))
				render.DrawSprite(pos, 5, 5)
			end
		end
	end

	hook.Add("PostPlayerDraw", "DrawName", DrawName)
end