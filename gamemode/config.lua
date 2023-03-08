BASEWARS_CHOSEN_LANGUAGE = "ENGLISH"

BaseWars.Config = {
	Forums 		= "http://steamcommunity.com/groups/100acrebb/discussions",
	SteamGroup 	= "http://steamcommunity.com/groups/100acrebb",

	Ents = {
		Electronics = {
			Explode		= true,
			WaterProof	= true,
		},
		SpawnPoint = {
			Offset 		= Vector(0, 0, 16),
		},
	},

	Drugs = {
		DoubleJump = {
			JumpHeight 	= Vector(0, 0, 320),
			Duration	= 120,
		},
		Steroid = {
			Walk 		= 180 * 2,
			Run 		= 300 * 2,
			Duration	= 120,
		},
		Regen = {
			Duration 	= 30,
		},
		Adrenaline = {
			Mult		= 1.5,
			Duration	= 120,
		},
		PainKiller = {
			Mult 		= .675,
			Duration	= 80,
		},
		Rage = {
			Mult 		= 1.2,
			Duration	= 120,
		},
		Shield = {

		},
		Antidote = {

		},
		CookTime	= 60 * 2,
	},

	Notifications = {
		LinesAmount = 11,
		Width		= 582,
		BackColor	= Color(30, 30, 30, 140),
		OpenTime	= 10,
	},

	Raid = {
		Time 			= 60 * 6,
		CoolDownTime	= 60 * 5,
		NeededPrinters	= 1,
	},

	Scan = {
		CoolDownTime	= 60
	},

	AFK  = {
		Time 	= 300,
	},

	HUD = {
		EntFont = "TargetID",
		EntFont2 = "BudgetLabel",
		EntW	= 175,
		EntH	= 25,
	},

	Rules = {
		IsHTML 	= false,
		HTML	= "http://www.hexahedronic.org/faq.html",
	},

	Adverts = {
		Time = 60 * 5,
	},

	SpawnWeps = {
		"weapon_physcannon",
		"hands",
	},

	WeaponDropBlacklist = {
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["hands"] = true,
		["gmod_tool"] = true,
		["gmod_camera"] = true,
	},

	PhysgunBlockClasses = {
		["bw_spawnpoint"] = true,
	},

	BlockedTools = {
		["dynamite"] = true,
		["duplicator"] = true,
		["motor"] = true,
		["emitter"] = true,
		["lamp"] = true,
		["balloon"] = true,
		["hoverball"] = true,
		["thruster"] = true,
		["paint"] = true,
		["edgeglow"] = true,
		["wire_expression2"] = true,
		["wire_cpu"] = true,
		["wire_gpu"] = true,
		["wire_spu"] = true,
		["wire_lamp"] = true,
		["wire_light"] = true,
		["wire_7seg"] = true,
		["wire_hudindicator"] = true,
		["wire_indicator"] = true,
		["wire_pixel"] = true,
		["wire_holoemitter"] = true,
		["wire_hologrid"] = true,
		["wire_cam"] = true,
		["wire_colorer"] = true,
		["wire_fx_emitter"] = true,
		["wire_gpulib_switcher"] = true,
		["wire_trail"] = true,
		["wire_waypoint"] = true,
		["wire_eyepod"] = true,
		["wire_vehicle"] = true,
		["wire_exit_point"] = true,
		["wire_explosive"] = true,
		["wire_simple_explosive"] = true,
		["wire_igniter"] = true,
		["wire_spawner"] = true,
		["wire_teleporter"] = true,
		["wire_turret"] = true,
		["wire_door"] = true,
		["wire_door_controller"] = true,
		["wire_hsholoemitter"] = true,
		["wire_painter"] = true,
		["wire_field_device"] = true,
		["wire_user"] = true,
	},

	ModelBlacklist = {
		["models/props_vehicles/tanker001a.mdl"] = true,
		["models/props_vehicles/apc001.mdl"] = true,
		["models/props_combine/combinetower001.mdl"] = true,
		["models/cranes/crane_frame.mdl"] = true,
		["models/items/item_item_crate.mdl"] = true,
		["models/props/cs_militia/silo_01.mdl"] = true,
		["models/props/cs_office/microwave.mdl"] = true,
		["models/props/de_train/biohazardtank.mdl"] = true,
		["models/props_buildings/building_002a.mdl"] = true,
		["models/props_buildings/collapsedbuilding01a.mdl"] = true,
		["models/props_buildings/project_building01.mdl"] = true,
		["models/props_buildings/row_church_fullscale.mdl"] = true,
		["models/props_c17/consolebox01a.mdl"] = true,
		["models/props_c17/oildrum001_explosive.mdl"] = true,
		["models/props_c17/paper01.mdl"] = true,
		["models/props_c17/trappropeller_engine.mdl"] = true,
		["models/props_canal/canal_bridge01.mdl"] = true,
		["models/props_canal/canal_bridge02.mdl"] = true,
		["models/props_canal/canal_bridge03a.mdl"] = true,
		["models/props_canal/canal_bridge03b.mdl"] = true,
		["models/props_combine/combine_citadel001.mdl"] = true,
		["models/props_combine/combine_mine01.mdl"] = true,
		["models/props_combine/combinetrain01.mdl"] = true,
		["models/props_combine/combinetrain02a.mdl"] = true,
		["models/props_combine/combinetrain02b.mdl"] = true,
		["models/props_combine/prison01.mdl"] = true,
		["models/props_combine/prison01c.mdl"] = true,
		["models/props_industrial/bridge.mdl"] = true,
		["models/props_junk/garbage_takeoutcarton001a.mdl"] = true,
		["models/props_junk/gascan001a.mdl"] = true,
		["models/props_junk/glassjug01.mdl"] = true,
		["models/props_junk/trashdumpster02.mdl"] = true,
		["models/props_phx/amraam.mdl"] = true,
		["models/props_phx/ball.mdl"] = true,
		["models/props_phx/cannonball.mdl"] = true,
		["models/props_phx/huge/evildisc_corp.mdl"] = true,
		["models/props_phx/misc/flakshell_big.mdl"] = true,
		["models/props_phx/misc/potato_launcher_explosive.mdl"] = true,
		["models/props_phx/mk-82.mdl"] = true,
		["models/props_phx/oildrum001_explosive.mdl"] = true,
		["models/props_phx/torpedo.mdl"] = true,
		["models/props_phx/ww2bomb.mdl"] = true,
		["models/props_wasteland/cargo_container01.mdl"] = true,
		["models/props_wasteland/cargo_container01.mdl"] = true,
		["models/props_wasteland/cargo_container01b.mdl"] = true,
		["models/props_wasteland/cargo_container01c.mdl"] = true,
		["models/props_wasteland/depot.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_left_4.mdl"] = true,
		["models/props_junk/propane_tank001a.mdl"] = true,
		["models/props_c17/fountain_01.mdl"] = true,
		["models/props_trainstation/train003.mdl"] = true,
		["models/props_foliage/tree_poplar_01.mdl"] = true,
		["models/mechanics/solid_steel/i_beam2_32.mdl"] = true,
		["models/props_c17/furnituredrawer001a_chunk06.mdl"] = true,
		["models/mechanics/solid_steel/i_beam2_32.mdl"] = true,
		["models/props_phx/mechanics/slider2.mdl"] = true,
		["models/props_phx/gears/rack70.mdl"] = true,
		["models/mechanics/gears2/pinion_80t1.mdl"] = true,
		["models/nova/airboat_seat.mdl"] = true,
		["models/mechanics/robotics/a4.mdl"] = true,
		["models/mechanics/roboticslarge/claw_hub_8.mdl"] = true,
		["models/perftest/loader_static.mdl"] = true,
		["models/mechanics/robotics/e4.mdl"] = true,
		["models/mechanics/roboticslarge/e4.mdl"] = true,
		["models/perftest/rocksground01b.mdl"] = true,
		["models/mechanics/roboticslarge/g4.mdl"] = true,
		["models/mechanics/roboticslarge/e4.mdl"] = true,
		["models/mechanics/roboticslarge/j4.mdl"] = true,
		["models/props_animated_breakable/smokestack.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_01.mdl"] = true,
		["models/xqm/rails/slope_down_90.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_02.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_03.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_04.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_05.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_06.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_07.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_08.mdl"] = true,
		["models/xqm/coastertrack/special_full_loop_3.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_09.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_10.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_right_4.mdl"] = true,
		["models/props_buildings/collapsedbuilding01awall.mdl"] = true,
		["models/props_buildings/collapsedbuilding02a.mdl"] = true,
		["models/props_buildings/collapsedbuilding02b.mdl"] = true,
		["models/xqm/coastertrack/special_half_corkscrew_right_4.mdl"] = true,
		["models/props_buildings/collapsedbuilding02c.mdl"] = true,
		["models/props_buildings/project_destroyedbuildings01.mdl"] = true,
		["models/props_buildings/project_building03_skybox.mdl"] = true,
		["models/props_buildings/project_building03.mdl"] = true,
		["models/props_buildings/project_building02_skybox.mdl"] = true,
		["models/props_buildings/project_building02.mdl"] = true,
		["models/props_buildings/project_building01_skybox.mdl"] = true,
		["models/props_buildings/factory_skybox001a.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_right_3.mdl"] = true,
		["models/props_buildings/row_res_1_fullscale.mdl"] = true,
		["models/props_buildings/watertower_002a.mdl"] = true,
		["models/props_buildings/watertower_001c.mdl"] = true,
		["models/props_buildings/watertower_001a.mdl"] = true,
		["models/props_buildings/short_building001a.mdl"] = true,
		["models/props_buildings/row_res_2_fullscale.mdl"] = true,
		["models/props_buildings/row_res_2_ascend_fullscale.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_left_2.mdl"] = true,
		["models/props_canal/generator01.mdl"] = true,
		["models/props_canal/generator02.mdl"] = true,
		["models/props_canal/locks_large.mdl"] = true,
		["models/props_canal/locks_large_b.mdl"] = true,
		["models/props_canal/locks_small.mdl"] = true,
		["models/props_canal/locks_small_b.mdl"] = true,
		["models/xqm/coastertrack/special_half_corkscrew_right_4.mdl"] = true,
		["models/props_canal/canal_bars001.mdl"] = true,
		["models/props_trainstation\train003.mdl"] = true,
		["models/props_canal/canal_bridge04.mdl"] = true,
		["models/props_canal/pipe_bracket001.mdl"] = true,
		["models/props_canal/canal_bridge_railing_lamps.mdl"] = true,
		["models/props_canal/canal_bridge_railing02.mdl"] = true,
		["models/props_canal/canal_bridge_railing01.mdl"] = true,
		["models/xqm/coastertrack/special_half_corkscrew_right_3.mdl"] = true,
		["models/props_canal/winch01.mdl"] = true,
		["models/props_canal/rock_riverbed01c.mdl"] = true,
		["models/props_canal/rock_riverbed01d.mdl"] = true,
		["models/props_canal/rock_riverbed02a.mdl"] = true,
		["models/props_canal/rock_riverbed02b.mdl"] = true,
		["models/props_canal/winch02c.mdl"] = true,
		["models/props_canal/winch02d.mdl"] = true,
		["models/props_canal/rock_riverbed01b.mdl"] = true,
		["models/props_canal/refinery_04.mdl"] = true,
		["models/props_canal/refinery_05.mdl"] = true,
		["models/xqm/rails/twist_90_left.mdl"] = true,
		["models/props_canal/canal_bars001.mdl"] = true,
		["models/props_canal/bridge_pillar02.mdl"] = true,
		["models/xqm/rails/loop_right.mdl"] = true,
		["models/props_citizen_tech/windmill_blade002a.mdl"] = true,
		["models/props_citizen_tech/till001a_base01.mdl"] = true,
		["models/props_citizen_tech/steamengine001a.mdl"] = true,
		["models/props_citizen_tech/guillotine001a_base01.mdl"] = true,
		["models/props_citizen_tech/firetrap_gashose01c.mdl"] = true,
		["models/props_citizen_tech/firetrap_gashose01b.mdl"] = true,
		["models/props_citizen_tech/firetrap_button01a.mdl"] = true,
		["models/props_citizen_tech/windmill_blade004a.mdl"] = true,
		["models/props_phx/misc/potato_launcher_chamber.mdl"] = true,
		["models/props_combine/combine_train02a.mdl"] = true,
	},

	NPC = {
		FadeOut = 400,
	},

	AntiRDM = {
		HurtTime 		= 80,
		RDMSecondsAdd 	= 3,
		KarmaSecondPer 	= 4,
		KarmaLoss 		= -2,
		KarmaGlowLevel 	= 65,
	},

	PayDayBase 			= 1000,
	PayDayMin			= 500,
	PayDayDivisor		= 1000,
	PayDayRate 			= 60 * 3,
	PayDayRandom		= 1000,

	StartMoney 			= 20000,

	CustomChat			= false,
	ExtraStuff			= true,
	CleanProps			= false, -- Finds all physics props on the map and removes them when all the entities are frist initialized (AKA: When the map first loads).

	AllowFriendlyFire	= false,

	DefaultWalk			= 180,
	DefaultRun			= 300,

	DefaultLimit		= 3,
	SpawnOffset			= Vector(0, 0, 40),

	UniversalPropConstant = 5,
	DestroyReturn 		= 0.8,

	RestrictProps 		= false,

	DispenserTime		= 0.5,

	LevelSettings = {

		BuyWeapons = 2,

	},

}

BaseWars.NPCTable = {

	/*["basewars_bangclaw_v1"] = {

		[1] = {

			-- 0x2c272b38
			Pos = Vector(-1006, -1441, 74),
			-- 0x2c272b60
			Ang = Angle(0, 135, 0),

		},

	},

	["rp_downtown_v4c_v2"] = {

		[1] = {
			Pos = Vector(338, -1137, -193),
			Ang = Angle(0, 135, 0),
		},

	},

	["rp_bangclaw"] = {

		[1] = {
			Pos = Vector(-1006, -1441, 75),
			Ang = Angle(0, 135, 0),
		},

		[2] = {
			Pos = Vector(2055, -2289, 75),
			Ang = Angle(0, 141, 0),
		},

		[3] = {
			Pos = Vector(1315, 2129, 147),
			Ang = Angle(0, -133, 0),
		},

		[4] = {
			Pos = Vector(3619, 364, 75),
			Ang = Angle(0, -145, 0),
		},

		[5] = {
			Pos = Vector(51, -1924, 75),
			Ang = Angle(0, -141, 0),
		},

		[6] = {
			Pos = Vector(712, -90, 74),
			Ang = Angle(0, 87, 0),
		},

	},*/

}

local NiceGreen = Color(100, 250, 125)
local NiceBlue = Color(100, 125, 250)
local Grey = Color(200, 200, 200)

BaseWars.AdvertTbl = {

	{Grey, "Welcome to ", NiceGreen, "Aussie BaseWars", Grey, "! I'm a relatively new lua coder, so please give suggestions be patient! :)"},

}

if aowl and GLib and not ulx then
	BaseWars.AdvertTbl[#BaseWars.AdvertTbl+1] = {Grey, "You are playing on the ", NiceBlue, "OFFICAL", Grey, " HexaHedronic BaseWars server! (bw_copyright)"}
	BaseWars.AdvertTbl[#BaseWars.AdvertTbl+1] = {Grey, "This server is powered by ", NiceBlue, "aowl", Grey, " and ", NiceGreen, "GCompute", Grey, "."}
end


BaseWars.Config.RulesTbl = {
	"1. Do not base with someone unless you are in a faction with them.",
	"2. Do not propblock OTHER peoples bases (You CAN block your own).",
	"3. Do not attempt to circumvent Anti-RandomRaid or similar systems.",
	"4. You must base in A SINGLE CONTINOUS SPACE. NO multi-basing!",
}

BaseWars.Config.Help = {

	["What is this server?"] = {

		"This is the Hexahedronic BaseWars server.",
		"It runs a custom version of basewars!",
		"",
		"BaseWars is a gamemode about making money and raiding.",
		"It also contains cool guns and ways to defend your base!",

	},

	["What are the controls?"] = {

		"To spawn printers and other entities you can open the spawnmenu by holding [Q] or your binding for it,",
		"From here you can select the [Entities] sub-category of the [BaseWars] tab. (NOT THE ENTITIES TAB!)",
		"",
		"To Raid or Create a Faction you can press [F3] to open the [Main Menu]. From here you can select [Factions],",
		"[Raids], [Rules] and in the future the [Store] and your [Equipment Inventory]!",

	},

	["How do I make a base?"] = {

		"Firstly find an area in the map which is secure, and you would be happy defending,",
		"Then use some props from spawnmenu sub-categories to secure the entrances,",
		"Finally use the [Fading Door] tool to make yourself a secure way in and out.",
		"",
		"After you have secured the area, you can buy Printers and Generators from the [BaseWars] tab."

	},

	["How do I raid?"] = {

		"To raid you and your TARGET must both have GOLD or HIGHER printer-types.",
		"",
		"If you are raidable, press F3, then select the [Raids] tab, followed by clicking on your TARGET's name.",
		"Watch the [Notifications] in the top left to see if they are raidable, if they were, then a raid will",
		"have started, if not, it will tell you why not.",
		"",
		"Once a raid has started you can destroy any props your enemy owns, along with electronics! But be careful!",
		"They can counter raid you while it is on-going!",

	},

	["Are there any rules?"] = {

		"Yes, press F3 then select the [Rules] tab!",

	},

	["Do items require power?"] = {

		"Items do not require electricity to run. Originally, this gamemode did provide generators.",
		"However, we turned it off as it seemed more of a hassle, and took away freedom on the size of bases."

	},

	["What about RDM (Killing people randomly)?"] = {

		"RDM is ALLOWED. Do not complain and instead if you so desire seek your own revenge.",
		"In the future the [Karma] system will punish mass RDMers with longer respawns and other debuffs.",

	},

	["How do I upgrade my printers?"] = {

		"All you need to do is look at them and type /upg",
		"You can bind \"basewars upgrade\" to a key to do it automaticly!",

	},

	["How do I sell my printers?"] = {

		"All you need to do is look at them and type /sell",
		"You can bind \"basewars sell\" to a key to do it automaticly!",

	},

	["How do I level up?"] = {

		"To level up you have to do different things like",
		"buy printers, raid and collect from money from printers."

	},

	["What does a higher level earn me?"] = {

		"When you level up, you unlock new items.",
		"They are usually more powerful or more efficient than the older version."

	},

	["What is the 'E Use/Collect Money' thingy?"] = {

		"It shows you what can you do with that entity.",
		"If you don't like it, you can disable it by typing",
		"'interactions_enabled 0' into your console.",

	},

	["How do I access my weapons that I've picked up?"] = {

		"To access your inventory, press F3 and go to the inventory tab.",
		"From there, you left click to equip, right click to drop.",
		"If you want to move an item from your hands to your inventory, type /inv",
		"And yes, your inventory is saved across server restarts and disconnects!"

	}
}

BaseWars.Config.DrugHelp = {
	["What does the Regen drug do?"] = {

		"Regen does exactly what it says on the tin!",
		"You will regenerate HP (and armor) for 30 seconds.",

	},

	["What does the Steroid drug do?"] = {

		"Steroid increases your move speed!",
		"You will move 2x faster for 2 minutes.",

	},

	["What does the Adrenaline drug do?"] = {

		"Adrenaline increases your maximum health!",
		"Your max health will be increased by 50% for 2 minutes.",

	},

	["What does the DoubleJump drug do?"] = {

		"Do you really need a explanation for that?",
		"You can jump once more in air.",

	},

	["What does the PainKiller drug do?"] = {

		"Painkillers will help your survive longer in a fight.",
		"You will experience 30% less damage.",

	},

	["What does the Shield drug do?"] = {

		"Shield will help you when you need it the most.",
		"You will be survive one killing blow.",

	},

	["What does the Rage drug do?"] = {

		"Rage will help you fight other players!",
		"You will deal 20% more damage for 2 minutes",

	},
}

BaseWars.Config.CommandsHelp = {
  ["Upgrade Items"] = {
    "Everyone loves a little efficiency.",
    "Look at your printer and use one of these.",
    "",
    "/upg        /upgrade        /upgr",
	"",
	"Or use the BaseWars Upgrade tool in the Q menu."

  },

  ["Sell Items"] = {
    "Didn't mean to buy that? Want to get rid of it? Need some your money back?.",
    "Look at your item and use one of these.",
    "",
    "/sell        /destroy        /remove",
	"",
	"Or use the BaseWars Sell tool in the Q menu."

  },


  ["Drop Weapons"] = {
    "Sometimes the noobs need a little extra defense.",
    "",
    "/dw        /dropweapon        /dropwep",


  },

  /*["Private Message"] = {
    "Psst...",
    "",
    "/tell (playername)        /msg (playername)",

  },*/

  /*["Give Money to Player"] = {
    "Share the wealth!",
    "",
    "/givemoney (playername)        /pay (playername)        /moneygive (playername)",


  },*/

  ["Place a Bounty"] = {
    "Need someone gone, but too lazy and rich? We have just the thing for you.",
    "",
    "/bounty  (playername)        /place (playername)        /placebounty (playername)",


  },
}

local WEAPONS = {}

-- https://steamcommunity.com/sharedfiles/filedetails/?id=349050451
-- https://steamcommunity.com/sharedfiles/filedetails/?id=358608166
-- https://steamcommunity.com/sharedfiles/filedetails/?id=359830105

BaseWars.SpawnList = {}
BaseWars.SpawnList.Models = {}
BaseWars.SpawnList.Models.Entities = {}
BaseWars.SpawnList.Models.Loadout = {}
BaseWars.SpawnList.Models.Fun = {}

BaseWars.SpawnList.Models.Loadout["Ammo"] = {

	["Ammo Crate"] 		= BaseWars.GSL{Model = "models/items/arc9/ammo_middle_box.mdl", Price = 5000, ClassName = "arc9_ammo_big", Level = 10},

}

BaseWars.SpawnList.Models.Loadout["Melee Weapons - T1"] = {

	["Crowbar"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_crowbar.mdl", Price = 1000, ClassName = "weapon_crowbar", Level = 0},
	["CT Knife"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_knife_ct.mdl", Price = 10000, ClassName = "arc9_go_knife_ct", Level = 3},
	["T Knife"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_knife_t.mdl", Price = 10000, ClassName = "arc9_go_knife_t", Level = 3}

}


BaseWars.SpawnList.Models.Loadout["Pistols - T1"] = {

	["Beretta"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_elite.mdl", Price = 20000, ClassName = "arc9_go_elite_single", Level = 10},
	["Five Seven"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_fiveseven.mdl", Price = 25000, ClassName = "arc9_go_fiveseven", Level = 12},
	["Glock-18"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_glock18.mdl", Price = 22500, ClassName = "arc9_go_glock", Level = 10},
	["P2000"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_usp.mdl", Price = 20000, ClassName = "arc9_go_p2000", Level = 10},
	["P250"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_p228.mdl", Price = 30000, ClassName = "arc9_go_p250", Level = 15},
	["USP-S"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_usp.mdl", Price = 27500, ClassName = "arc9_go_usp", Level = 15},
	["R8 Revolver"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_deagle.mdl", Price = 35000, ClassName = "arc9_go_r8", Level = 15},
	["CZ-75"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_fiveseven.mdl", Price = 40000, ClassName = "arc9_go_cz75", Level = 25},
	["TEC-9"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_fiveseven.mdl", Price = 35000, ClassName = "arc9_go_tec9", Level = 15},
	["Deagle"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_deagle.mdl", Price = 50000, ClassName = "arc9_go_deagle", Level = 20},

}

BaseWars.SpawnList.Models.Loadout["Pistols - T2"] = {

	["Dual Beretta"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_elite.mdl", Price = 50000, ClassName = "arc9_go_elite", Level = 25},
	["Dual Five Seven"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/c_akimbo_usp.mdl", Price = 60000, ClassName = "arc9_go_akimbo_fiveseven", Level = 27},
	["Dual Glock-18"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/c_akimbo_usp.mdl", Price = 55000, ClassName = "arc9_go_akimbo_glock", Level = 25},
	["Dual P2000"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_elite.mdl", Price = 50000, ClassName = "arc9_go_akimbo_p2000", Level = 25},
	["Dual P250"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/c_akimbo_usp.mdl", Price = 70000, ClassName = "arc9_go_akimbo_p250", Level = 30},
	["Dual USP"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/c_akimbo_usp.mdl", Price = 65000, ClassName = "arc9_go_akimbo_usp", Level = 30},
	["Dual R8 Revolver"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/c_akimbo_usp.mdl", Price = 80000, ClassName = "arc9_go_akimbo_r8", Level = 30},
	--["Dual CZ-75"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/c_akimbo_usp.mdl", Price = 90000, ClassName = "arc9_go_akimbo_cz75", Level = 40},
	["Dual Deagle"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_elite.mdl", Price = 110000, ClassName = "arc9_go_akimbo_deagle", Level = 30}

}

BaseWars.SpawnList.Models.Loadout["SMGs - T1"] = {

	["MAC-10"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_mac10.mdl", Price = 100000, ClassName = "arc9_go_mac10", Level = 30},
	["MP5"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_mp5.mdl", Price = 125000, ClassName = "arc9_go_mp5", Level = 31},
	["MP5-SD"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_mp5.mdl", Price = 125000, ClassName = "arc9_go_mp5sd", Level = 32},
	["MP7"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_tmp.mdl", Price = 130000, ClassName = "arc9_go_mp7", Level = 33},
	["MP9"]		 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_tmp.mdl", Price = 130000, ClassName = "arc9_go_mp9", Level = 33},
	--["Dual MP9"]			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_elite.mdl", Price = 200000, ClassName = "arc9_go_akimbo_mp9", Level = 40},
	["P90"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_p90.mdl", Price = 140000, ClassName = "arc9_go_p90", Level = 35},
	["PP-Bizon"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_tmp.mdl", Price = 110000, ClassName = "arc9_go_bizon", Level = 34},
	["UMP"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_ump45.mdl", Price = 135000, ClassName = "arc9_go_ump", Level = 35}

}

BaseWars.SpawnList.Models.Loadout["Shotguns - T1"] = {

	["Benelli M3 Super 90"] = BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 100000, ClassName = "arc9_go_m3", Level = 35},
	["Dual Sawed-Off"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_akimbo_sawnoff.mdl", Price = 200000, ClassName = "arc9_go_akimbo_sawnoff", Level = 40},
	["MAG-7"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 150000, ClassName = "arc9_go_mag7", Level = 36},
	["Nova"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 125000, ClassName = "arc9_go_nova", Level = 35},
	["Sawed-Off"]		 	= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 125000, ClassName = "arc9_go_sawedoff", Level = 36},
	["XM1014"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 200000, ClassName = "arc9_go_xm1014", Level = 38},

}

BaseWars.SpawnList.Models.Loadout["Assault Rifles - T1"] = {

	["AK-47"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_ak47.mdl", Price = 200000, ClassName = "arc9_go_ak47", Level = 50},
	["AUG"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_aug.mdl", Price = 275000, ClassName = "arc9_go_aug", Level = 45},
	["Famas"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_m4a1.mdl", Price = 200000, ClassName = "arc9_go_famas", Level = 40},
	["Galil"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 250000, ClassName = "arc9_go_galil", Level = 55},
	["Galil AR"]		 	= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 250000, ClassName = "arc9_go_galilar", Level = 55},
	["M4A1-S"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_m4a1.mdl", Price = 225000, ClassName = "arc9_go_m4a1", Level = 60},
	["M4A4"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_m4a1.mdl", Price = 225000, ClassName = "arc9_go_m4a4", Level = 60},
	["SCAR-17"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_rif_scar.mdl", Price = 250000, ClassName = "arc9_go_scar17", Level = 65},
	["SIG556"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_sg552.mdl", Price = 275000, ClassName = "arc9_go_sg556", Level = 45},

}

BaseWars.SpawnList.Models.Loadout["LMGs - T1"] = {

	["M249"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_mach_m249para.mdl", Price = 500000, ClassName = "arc9_go_m249", Level = 100},
	["Negev"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_mach_m249para.mdl", Price = 500000, ClassName = "arc9_go_negev", Level = 100},

}

BaseWars.SpawnList.Models.Loadout["Sniper Rifles - T1"] = {

	["AWP"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_awp.mdl", Price = 1000000, ClassName = "arc9_go_awp", Level = 225},
	["G3SG1"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_g3sg1.mdl", Price = 1000000, ClassName = "arc9_go_g1sg3", Level = 250},
	["SCAR-20"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_g3sg1.mdl", Price = 1000000, ClassName = "arc9_go_scar20", Level = 250},
	["Scout"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_scout.mdl", Price = 800000, ClassName = "arc9_go_scout", Level = 200},
	["SSG08"]		 	= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_scout.mdl", Price = 800000, ClassName = "arc9_go_ssg08", Level = 200},

}

BaseWars.SpawnList.Models.Loadout["Throwables - T1"] = {

	["Flash Bang"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_eq_flashbang.mdl", Price = 50000, ClassName = "arc9_go_nade_flashbang", Level = 50},
	["Frag Grenade"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_eq_fraggrenade.mdl", Price = 50000, ClassName = "arc9_go_nade_frag", Level = 60},
	["Incendiary Grenade"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_eq_incendiary.mdl", Price = 50000, ClassName = "arc9_go_nade_incendiary", Level = 80},
	["Molotov"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_eq_molotov.mdl", Price = 50000, ClassName = "arc9_go_nade_molotov", Level = 80},
	["Smoke Grenade"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_eq_smoke_grenade.mdl", Price = 50000, ClassName = "arc9_go_nade_smoke", Level = 40},
	["Sonar Nade"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/csgo/w_eq_sensor_grenade.mdl", Price = 500000, ClassName = "arc9_go_nade_sonar", Level = 200},

}

BaseWars.SpawnList.Models.Loadout["Utility - T1"] = {

	["Heal Gun"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_physics.mdl", Price = 100000, ClassName = "weapon_health", Level = 15},
	["Radar"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_motion_tracker.mdl", Price = 100000, ClassName = "weapon_radar", Level = 15},
	["C4"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_c4.mdl" , Price = 100000, ClassName = "bw_weapon_c4", Level = 60},
	["EMP Bomb"]				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_slam.mdl" , Price = 100000, ClassName = "bw_cracker", Level = 50},
	["Blowtorch"]				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_irifle.mdl" , Price = 200000, ClassName = "bw_blowtorch", Level = 50},
	--["Frag"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_grenade.mdl", Price = 45000, ClassName = "weapon_frag", Level = 20},
	--["Gas grenade"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_eq_flashbang_thrown.mdl", Price = 150000, ClassName = "bw_gasnade", Level = 50},

}



/*BaseWars.SpawnList.Models.Entities["Generators (T1)"] = {

	["Solar Panel"]					= BaseWars.GSL{Model = "models/props_lab/miniteleport.mdl", Price = 1500, ClassName = "bw_gen_solar"},
	["Coal Fired Generator"]		= BaseWars.GSL{Model = "models/props_wasteland/laundry_washer003.mdl", Price = 20000, ClassName = "bw_gen_coalfired", Level = 3},
	["Fission Reactor"]				= BaseWars.GSL{Model = "models/props/de_nuke/equipment1.mdl", Price = 75000, ClassName = "bw_gen_fission", Level = 5},
	["Fusion Reactor"]				= BaseWars.GSL{Model = "models/xqm/hydcontrolbox.mdl", Price = 300000, ClassName = "bw_gen_fusion", Level = 10},

}*/

BaseWars.SpawnList.Models.Entities["Dispensers (T1)"] = {

	--["Vending Machine"]				= BaseWars.GSL{Model = "models/props_interiors/VendingMachineSoda01a.mdl", Price = 20000, ClassName = "bw_vendingmachine", Limit = 1},
	["Ammo Dispenser"]				= BaseWars.GSL{Model = "models/props_lab/reciever_cart.mdl", Price = 55000, ClassName = "bw_dispenser_ammo", Limit = 2},
	["Armour Dispenser"]			= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 35000, ClassName = "bw_dispenser_armor", Limit = 2},
	["Printer-Paper Refiller"]		= BaseWars.GSL{Model = "models/props_lab/plotter.mdl", Price = 550000, ClassName = "bw_dispenser_paper", Limit = 1, Level = 8},
	["Heath Dispenser"]				= BaseWars.GSL{Model = "models/props_combine/health_charger001.mdl", Price = 50000, ClassName = "bw_dispenser_health", Limit = 2},

}

BaseWars.SpawnList.Models.Entities["Structures (T1)"] = {

	-- T1
	["Spawnpoint"]					= BaseWars.GSL{Model = "models/props_trainstation/trainstation_clock001.mdl", Price = 15000, ClassName = "bw_spawnpoint", UseSpawnFunc = true, Level = 30},
	["Drug Lab"]					= BaseWars.GSL{Model = "models/props_lab/crematorcase.mdl", Price = 35000, ClassName = "bw_druglab", Level = 30},
	["Money Drawer"]				= BaseWars.GSL{Model = "models/props_c17/FurnitureDrawer001a.mdl", Price = 100000, ClassName = "bw_moneydrawer", Level = 15, Limit = 1},

}

BaseWars.SpawnList.Models.Entities["Structures (T2)"] = {

	-- T2
	["Radar"]						= BaseWars.GSL{Model = "models/props_rooftop/roof_dish001.mdl", Price = 5000000, ClassName = "bw_radar",  Limit = 1, Level = 60},

}

BaseWars.SpawnList.Models.Entities["Defense (T1)"] = {

	-- T1
	["Ballistic Turret"] 			= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 80000, ClassName = "bw_turret_ballistic", Limit = 4, Level = 20},
	["Laser Turret"] 				= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 120000, ClassName = "bw_turret_laser", Limit = 1, Level = 30},
}

BaseWars.SpawnList.Models.Entities["Defense (T2)"] = {

	-- T2
	["Tesla Coil"]					= BaseWars.GSL{Model = "models/props_c17/substation_transformer01d.mdl", Price = 5000000, ClassName = "bw_tesla", Limit = 1, Level = 30},
	["Jammer"]					= BaseWars.GSL{Model = "models/props_lab/reciever01b.mdl", Price = 3000000, ClassName = "bw_base_jammer", Limit = 4, Level = 150},
}

BaseWars.SpawnList.Models.Entities["Consumables (T1)"] = {

	["Repair Kit"]					= BaseWars.GSL{Model = "models/Items/car_battery01.mdl", Price = 2500, ClassName = "bw_repairkit", UseSpawnFunc = true},
	["Armour Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 22500, ClassName = "bw_entityarmor", UseSpawnFunc = true},
	["Capacity Kit"]				= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 100000, ClassName = "bw_printercap", UseSpawnFunc = true},
	--["Battery Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 80000, ClassName = "bw_battery", UseSpawnFunc = true},
	["Printer Paper"]				= BaseWars.GSL{Model = "models/props_junk/garbage_newspaper001a.mdl", Price = 2000, ClassName = "bw_printerpaper", UseSpawnFunc = true},

}

BaseWars.SpawnList.Models.Entities["Printers (T1)"] = {

	-- T1
	["Basic Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 5000, ClassName = "bw_base_moneyprinter"},
	["Copper Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 18000, ClassName = "bw_printer_copper", Level = 10},
	["Silver Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 24000, ClassName = "bw_printer_silver", Level = 20},
	["Gold Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 30000, ClassName = "bw_printer_gold", Level = 30},
	["Platinum Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 36000, ClassName = "bw_printer_platinum", Level = 40},
	["Diamond Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 42000, ClassName = "bw_printer_diamond", Level = 50},
	["Nuclear Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 48000, ClassName = "bw_printer_nuclear", Level = 60},

}

BaseWars.SpawnList.Models.Entities["Printers (T2)"] = {

	-- T2
	["Mobius Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 54000, ClassName = "bw_printer_mobius", Level = 80},
	["Dark Matter Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 60000, ClassName = "bw_printer_darkmatter", Level = 100},
	["Red Matter Printer"]    		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 66000, ClassName = "bw_printer_redmatter", Level = 120},
	["Monolith Printer"]      		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 72000, ClassName = "bw_printer_monolith", Level = 140},
	["Quantum Printer"]       		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 78000, ClassName = "bw_printer_quantum", Level = 160},
	["Spacetime Printer"]       		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 84000, ClassName = "bw_printer_spacetime", Level = 180},
	["Universe Printer"]       		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 90000, ClassName = "bw_printer_universe", Level = 200},

}

BaseWars.SpawnList.Models.Fun["Media"] = {

	["Big Screen TV"]				= BaseWars.GSL{Model = "models/gmod_tower/suitetv_large.mdl", Price = 25000, ClassName = "mediaplayer_tv", Level = 10},

}

BaseWars.SpawnList.Models.Fun["Piano"] = {

	["Piano"]				= BaseWars.GSL{Model = "models/fishy/furniture/piano.mdl", Price = 25000, ClassName = "gmt_instrument_piano", Level = 10},
	
}

BaseWars.SpawnList.Models.Fun["Synthesizer"] = {

	["Synthesizer"]						= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer", Level = 10},
	["Synthesizer Accordion"]			= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_accordion", Level = 11},
	["Synthesizer Electric Guitar"]		= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_electric_guitar", Level = 12},
	["Synthesizer Guitar"]				= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_guitar", Level = 13},
	["Synthesizer Harp"]				= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_harp", Level = 14},
	["Synthesizer Organ"]				= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_organ", Level = 15},
	["Synthesizer Piano"]				= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_piano", Level = 16},
	["Synthesizer Saxophone"]			= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_sax", Level = 17},
	["Synthesizer Violin"]				= BaseWars.GSL{Model = "models/tnf/synth.mdl", Price = 25000, ClassName = "synthesizer_violin", Level = 18},
	
}

BaseWars.SpawnList.Models.Loadout["Drugs"] = {

	["DoubleJump"] 					= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "DoubleJump"},
	["Regen"] 						= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "Regen"},
	["PainKiller"] 					= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "PainKiller"},
	["Steroid"] 					= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "Steroid"},
	["Adrenaline"] 					= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "Adrenaline"},
	["Rage"] 						= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "Rage"},
	["Shield"] 						= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "Shield"},
	["Antidote"]					= BaseWars.GSL{Drug = true, Price = 1000000, ClassName = "Antidote"},

}