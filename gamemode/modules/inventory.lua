MODULE.Name = "Inventory"
MODULE.Author = "CreamCheese"
MODULE.Inventory = {}
local tag = "BaseWars.Inventory"
local tag_escaped = "basewars_inventory"
local PLAYER = debug.getregistry().Player

function MODULE:__INIT()
end

local function isPlayer(ply)
	return IsValid(ply) and ply:IsPlayer()
end

function MODULE:GetInv(ply)
	if SERVER then
		local dirName = self:InitInv(ply)
		local inv = util.JSONToTable(file.Read(tag_escaped .. "/" .. dirName .. "/inventory.txt", "DATA"))

		return inv
	end
end

PLAYER.GetInv = Curry(MODULE.GetInv)

function MODULE:SendInvToClient(ply, inv)
	net.Start(tag)
	net.WriteString(inv)
	net.Send(ply)
end

if SERVER then
	util.AddNetworkString(tag)
	util.AddNetworkString(tag .. ".Client")

	function MODULE:InitInv(ply)
		local dirName = isPlayer(ply) and ply:SteamID64() or (isstring(ply) and ply or nil)

		if not file.IsDir(tag_escaped .. "/" .. dirName, "DATA") then
			file.CreateDir(tag_escaped .. "/" .. dirName)
		end

		if not file.Exists(tag_escaped .. "/" .. dirName .. "/inventory.txt", "DATA") then
			file.Write(tag_escaped .. "/" .. dirName .. "/inventory.txt", util.TableToJSON({}, true))
		end

		file.Write(tag_escaped .. "/" .. dirName .. "/player.txt", ply:Name())

		return dirName
	end

	PLAYER.InitInv = Curry(MODULE.InitInv)

	for k, v in next, player.GetAll() do
		MODULE:InitInv(v)
	end

	function MODULE:SaveInv(ply, inv)
		local dirName = self:InitInv(ply)
		local newinv = util.TableToJSON(inv, true)
		file.Write(tag_escaped .. "/" .. dirName .. "/inventory.txt", newinv)
		self:SendInvToClient(ply, newinv)
	end

	PLAYER.SaveInv = Curry(MODULE.SaveInv)

	function MODULE:AddToInv(ply, weap)
		local inv = self:GetInv(ply)

		if #inv > BaseWars.Config.Inventory.InventorySize then
			ply:Notify(BaseWars.LANG.FullInventory, BASEWARS_NOTIFICATION_ERROR)

			return
		end

		table.insert(inv, {
			printname = weap:GetPrintName(),
			classname = weap:GetClass(),
			worldmodel = weap:GetWeaponWorldModel()
		})

		ply:Notify(string.format(BaseWars.LANG.AddToInventory, weap:GetPrintName()), BASEWARS_NOTIFICATION_GENRL)
		self:SaveInv(ply, inv)
	end

	function MODULE:RemoveFromInv(ply, classname)
		local inv = self:GetInv(ply)

		for i, weapon in ipairs(inv) do
			if weapon.classname == classname then
				table.remove(inv, i)
				break
			end
		end

		self:SaveInv(ply, inv)
	end

	PLAYER.AddToInv = Curry(MODULE.AddToInv)

	hook.Add("PlayerCanPickupWeapon", "InventoryAdd", function(ply, weap)
		local contains = false
		if not weap:IsValid() then return end

		for blweapon, bool in pairs(BaseWars.Config.WeaponDropBlacklist) do
			if weap:GetClass() == blweapon then
				contains = true
			end
		end

		if not contains and not isLeftClicked then
			BaseWars.Inventory:AddToInv(ply, weap)

			return false
		elseif not contains and isLeftClicked then
			isLeftClicked = false

			return true
		end
	end)

	hook.Add("PlayerInitialSpawn", tag .. ".Load", function(ply, transition)
		local inv = util.TableToJSON(ply:GetInv())
		BaseWars.Inventory:SendInvToClient(ply, inv)
	end)

	function MODULE:ValidateData(class, model, printname, ply)
		if class and model and printname and ply then
			return true
		else
			return false
		end
	end

	function MODULE:hasItem(ply, item)
		local inv = ply:GetInv()

		for k, v in pairs(inv) do
			if v["classname"] == item then return true end
		end

		return false
	end

	PLAYER.hasItem = Curry(MODULE.hasItem)

	net.Receive(tag .. ".Client", function(len, ply)
		local Class = net.ReadString()
		local Model = net.ReadString()
		local printname = net.ReadString()
		isLeftClicked = net.ReadBool()

		if not BaseWars.Inventory:ValidateData(Class, Model, printname, ply) then
			print("Unvalidated data being sent from " .. tostring(ply))

			return
		end

		if not ply:hasItem(Class) then
			print(ply:SteamID() .. " is potentially attempting to abuse the inventory system by giving themselves a weapon they do not have!")

			return
		end

		if isLeftClicked then
			for _, w in pairs(ply:GetWeapons()) do
				if w:GetClass() == Class then
					isLeftClicked = false
					BaseWars.Inventory:SendInvToClient(ply, util.TableToJSON(ply:GetInv()))
					ply:Notify(string.format(BaseWars.LANG.AlreadyOwns), BASEWARS_NOTIFICATION_ERROR)

					return
				end
			end

			ply:Give(Class)
			local wep = ply:GetWeapon(Class)
			ply:RemoveAmmo(180, wep:GetPrimaryAmmoType())
			BaseWars.Inventory:RemoveFromInv(ply, Class)
			isLeftClicked = false

			return
		end

		tr = {}
		tr.start = ply:EyePos()
		tr.endpos = tr.start + ply:GetAimVector() * 85
		tr.filter = ply
		tr = util.TraceLine(tr)
		local SpawnPos = tr.HitPos + BaseWars.Config.SpawnOffset
		local SpawnAng = Angle(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
		local Ent = ents.Create("bw_weapon")
		Ent.WeaponClass = Class
		Ent.Model = Model
		Ent:SetNW2String("wepClassName", Ent.WeaponClass)
		Ent:SetPos(SpawnPos)
		Ent:SetAngles(SpawnAng)
		Ent:Spawn()
		Ent:Activate()
		BaseWars.Inventory:RemoveFromInv(ply, Class)
	end)

	BaseWars.Commands.AddCommand({"inv"}, function(ply)
		local weap = ply:GetActiveWeapon()
		local Class = weap:GetClass()
		if BaseWars.Config.WeaponDropBlacklist[Class] then return false end
		ply:StripWeapon(weap:GetClass())
		BaseWars.Inventory:AddToInv(ply, weap)
	end, false)
end