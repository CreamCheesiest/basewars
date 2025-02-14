DeriveGamemode("sandbox")

local function IncludeCS(File)
	include(File)

	if SERVER then
		AddCSLuaFile(File)
	end
end

local function LoadFileCS(File)
	if CLIENT then
		include(File)
	else
		AddCSLuaFile(File)
	end
end

local function IncludeSV(file)
	if SERVER then
		include(file)
	end
end

do
	IncludeCS("shared.lua")
	IncludeCS("language.lua")
	IncludeCS("config.lua")
	IncludeCS("shared/spawnmenu.lua")
	IncludeCS("shared/cppi.lua")
	IncludeCS("shared/admin.lua")

	if BaseWars.Config.CustomChat then
		IncludeCS("shared/chitchat.lua")
	end

	IncludeCS("shared/utf8_extender.lua")

	if BaseWars.Config.ExtraStuff then
		IncludeCS("shared/playuhr.lua")
		IncludeCS("shared/customnick.lua")
		IncludeCS("shared/hostnamefix.lua")
	end

	if ulib or ulx then
		IncludeCS("integration/bw_admin_ulx.lua")
	end

	if aowl and not ulx then
		IncludeCS("shared/metastruct/anime.lua")
	end
end

do
	LoadFileCS("client/cl_bwmenu.lua")
	LoadFileCS("client/cl_npcmenu.lua")
	LoadFileCS("client/cl_druglab.lua")
	LoadFileCS("client/cl_interactions.lua")
	LoadFileCS("client/cl_minimap.lua")
	LoadFileCS("client/gui_cleanup.lua")

	if BaseWars.Config.CustomChat then
		LoadFileCS("client/qchat.lua")
	end

	if aowl and not ulx then
		LoadFileCS("shared/metastruct/markup.lua")
		LoadFileCS("shared/metastruct/expression.lua")
		LoadFileCS("shared/metastruct/ch.lua")
	end
end

do
	IncludeSV("server/commands.lua")
	IncludeSV("server/hooks.lua")
	IncludeSV("shared/resources.lua")
end