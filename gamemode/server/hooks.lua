hook.Add("BaseWars_PlayerBuyEntity", "XPRewards", function(ply, ent)

	if ply:GetLevel() > 20 then return end

	local ent = BaseWars.Ents:Valid(ent)
	if not ent then return end

	local class = ent:GetClass()

	if class:match("bw_printer_") or class == "bw_base_moneyprinter" then

		local lvl = (ent.CurrentValue or 1000) / 1000
		ply:AddXP(55 * lvl)

	elseif class:match("bw_gen_") then

		ply:AddXP(125)

	elseif class == "bw_printerpaper" then

		ply:AddXP(25)

	end

end)

hook.Add("BaseWars_PlayerEmptyPrinter", "XPRewards", function(ply, ent, money)

	-- money = money / 2 -- Flat rate cut to levelling

	-- if (ply:GetLevel() >= 200) then
	-- 	ply:AddXP(math.max(0, money / 12))
	-- elseif (ply:GetLevel() >= 180) then
	-- 	ply:AddXP(math.max(0, money / 10))
	-- elseif (ply:GetLevel() >= 160) then
	-- 	ply:AddXP(math.max(0, money / 8))
	-- elseif (ply:GetLevel() >= 140) then
	-- 	ply:AddXP(math.max(0, money / 6))
	-- elseif (ply:GetLevel() >= 120) then
	-- 	ply:AddXP(math.max(0, money / 4))
	-- elseif (ply:GetLevel() >= 100) then
	-- 	ply:AddXP(math.max(0, money / 2))
	-- else
	-- 	ply:AddXP(math.max(0, money))
	-- end

	local lvl = ply:GetLevel()

	local function getDivisor(level)
		divisor = 24^(level / 20)
	end

	ply:AddXP(math.max(0, money / getDivisor(lvl)))

end)

hook.Add("BaseWars_PlayerUpgradePrinter", "XPRewards", function(ply, ent, money)

	ply:AddXP(math.max(0, money / 500))

end)

hook.Add( "PlayerInitialSpawn", "SpawnMessage", function( ply )
	for i,plys in ipairs(player.GetAll()) do
		plys:ChatPrint("Player " .. ply:Nick() .. " has spawned into the game")
	end
end)

hook.Add("PlayerDisconnected", "DisconnectMessage", function(ply)
	for i,plys in ipairs(player.GetAll()) do
		plys:ChatPrint("Player " .. ply:Nick() .. " has left the game")
	end
end)

timer.Create("BaseWars_KarmaRecover", 5 * 60, 0, function()

	for k, v in next, player.GetAll() do

		if v:GetKarma() < 0 then

			v:AddKarma(2)

		else

			v:AddKarma(1)

		end

	end

end)
