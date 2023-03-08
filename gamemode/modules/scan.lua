MODULE.Name = "Scan"
MODULE.Author = "CreamCheese"

local tag = "BaseWars.Scan"
local PLAYER = debug.getregistry().Player

if SERVER then
    util.AddNetworkString(tag)
end

function MODULE:HandleNetMessage(len, ply)
    local me = ply
    local target = net.ReadEntity()
    countRaidables = 0
    value = 0

    for _, ent in ipairs(ents.GetAll()) do
        if ent:CPPIGetOwner() == target and ent.IsValidRaidable then
            countRaidables = countRaidables + 1
            if (ent.Base == "bw_base_moneyprinter" or ent:GetClass() == "bw_base_moneyprinter") then
                value = value + ent.CurrentValue
            else
                value = value + ent.Price
            end
        end
    end

    self:Scan(me, target)
end

net.Receive(tag, Curry(MODULE.HandleNetMessage))

function MODULE:Scan(ply, target)
    if not target or not target:IsPlayer() then
        ErrorNoHalt("ScanStart, invalid target.")
        debug.Trace()

        return
    end

    if CLIENT then
        if not LocalPlayer():GetNW2Bool("BaseWars_HasRadar") then return end
        net.Start(tag)
        net.WriteEntity(target)
        net.SendToServer()
        return
    end

    if ply == target then
        ply:Notify(BaseWars.LANG.CantScanSelf, BASEWARS_NOTIFICATION_RAID)

        return
    end

    if ply:InFaction() and not target:InFaction() then
        ply:Notify(BaseWars.LANG.ScanTargNoFac, BASEWARS_NOTIFICATION_RAID)

        return
    end

    if target:InFaction() and not ply:InFaction() then
        ply:Notify(BaseWars.LANG.ScanSelfNoFac, BASEWARS_NOTIFICATION_RAID)

        return
    end

    if IsFaction and target:InFaction(ply:GetFaction()) then
        ply:Notify(BaseWars.LANG.CantScanSelf, BASEWARS_NOTIFICATION_RAID)

        return
    end

    IsFaction = ply:InFaction()
    local Ret, Msg
    Ret, Msg = self:CheckScannable(ply, true, IsFaction)

    if not Ret then
        ply:Notify(string.format(BaseWars.LANG.ScanSelfUnraidable, Msg or "UNKNOWN!"), BASEWARS_NOTIFICATION_RAID)

        return
    end

    Ret, Msg = self:CheckScannable(target, false, IsFaction)

    if not Ret then
        ply:Notify(string.format(BaseWars.LANG.ScanTargetUnraidable, Msg or "UNKNOWN!"), BASEWARS_NOTIFICATION_RAID)

        return
    end

    Participant1 = ply
    Participant2 = target
    P1Faction = Participant1:GetFaction()
    P2Faction = Participant2:GetFaction()
    local Table = BaseWars.Factions.FactionTable
    local Faction = Table[P1Faction]

    if Faction then
        Faction.__ScanCoolDown = 0
    else
        ply.__ScanCoolDown = 0
    end

    ScanCooldown = BaseWars.Config.Scan.CoolDownTime
    local Faction2 = Table[P2Faction]

    if Faction2 then
        Faction2.__ScanCoolDown = CurTime() + ScanCooldown
    else
        target.__ScanCoolDown = CurTime() + ScanCooldown
    end

    BaseWars.Util_Player:NotificationAll(string.format(BaseWars.LANG.ScanStart, ply:Nick(), target:Nick()), BASEWARS_NOTIFICATION_RAID)
    ply:Notify(string.format(BaseWars.LANG.ScanResult, target:Nick(), countRaidables, BaseWars.NumberFormat(value)), BASEWARS_NOTIFICATION_RAID)
    EmitSound(Sound("buttons/blip1.wav"), target:GetPos(), target:EntIndex())
    timer.Create("scanSound", 0.5,2, function()
        EmitSound(Sound("buttons/blip1.wav"), target:GetPos(), target:EntIndex())
    end)
end

PLAYER.StartScan = Curry(MODULE.Scan)

function MODULE:CheckScannable(ply, nocool, fac)
    local Table = BaseWars.Factions.FactionTable
    local Faction = Table[ply:GetFaction()]

    if not nocool then
        local Cool = CurTime() - (Faction and Faction.__ScanCoolDown or ply.__ScanCoolDown or 0)
        local Left = math.floor(BaseWars.Config.Scan.CoolDownTime - Cool)
        if Cool < BaseWars.Config.Scan.CoolDownTime then return false, BaseWars.LANG.ScanOnCoolDown .. " (" .. Left .. " " .. BaseWars.LANG.Seconds .. " " .. BaseWars.LANG.Remaining .. ")" end
    end

    return true
end

PLAYER.Scannable = Curry(MODULE.CheckScannable)