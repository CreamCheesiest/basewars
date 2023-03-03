

SWEP.PrintName				= "Tracker"
SWEP.Base = "weapon_base"


SWEP.Author					= "Lighterchu"
SWEP.Purpose				= ""

SWEP.Spawnable				= true
SWEP.UseHands				= true
SWEP.DrawAmmo				= false

SWEP.ViewModel				= "models/weapons/c_motion_tracker.mdl"
SWEP.WorldModel				= "models/weapons/w_motion_tracker.mdl"


SWEP.ViewModelFOV			= 75
SWEP.Slot					= 0
SWEP.SlotPos				= 5

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"


if SERVER then
    AddCSLuaFile("cl_init.lua")
    resource.AddSingleFile( 'models/c_motion_tracker.mdl' )
    resource.AddSingleFile( 'models/w_motion_tracker.mdl' )
end


--[[ Apache License --
	Copyright 2015-2017 Wheatley
	 
	Licensed under the Apache License, Version 2.0 (the 'License'); you may not use this file except
	in compliance with the License. You may obtain a copy of the License at
	 
	http://www.apache.org/licenses/LICENSE-2.0
	 
	Unless required by applicable law or agreed to in writing, software distributed under the License
	is distributed on an 'AS IS' BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
	or implied. See the License for the specific language governing permissions and limitations under
	the License.
	 
	The right to upload this project to the Steam Workshop (which is operated by Valve Corporation)
	is reserved by the original copyright holder, regardless of any modifications made to the code,
	resources or related content. The original copyright holder is not affiliated with Valve Corporation
	in any way, nor claims to be so.
]]
local sv_aimt_maxrange = CreateConVar( 'sv_aimt_maxrange', '2000', { FCVAR_REPLICATED, FCVAR_ARCHIVE } )


net.Receive( 'GAMEMODE_MOTIONTRACKER_ADDFAKE', function()
	local start, dest, time = net.ReadVector(), net.ReadVector(), net.ReadFloat()
	table.insert( faketargets, { pos = start, vel = Vector( 0, 0, 500 ), mv = { dst = dest, len = time, perc = 0 }, lt = CurTime() + time } )
end )
function SWEP:Initialize()
end

function SWEP:PrimaryAttack()
    
end

function SWEP:SecondaryAttack()
end

function SWEP:Deploy()
	self:EmitSound( 'weapons/motiontracker_turnon01.wav' )
	return true
end

function SWEP:Holster()
	self:EmitSound( 'weapons/motiontracker_turnoff01.wav' )
	return true
end


