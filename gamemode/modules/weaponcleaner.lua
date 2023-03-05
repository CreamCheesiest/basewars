MODULE.Name = "WeaponCleaner"
MODULE.Author = "CreamCheese"
MODULE.Realm = 1
MODULE.Delay = 30 -- minutes

function MODULE:CleanAllWeapons()
    for _,ent in ipairs(ents.FindByClass("bw_weapon")) do
        ent:Remove()
    end
    for _,ply in pairs(player.GetAll()) do
        ply:Notify(BaseWars.LANG.ClearedWeapons, BASEWARS_NOTIFICATION_GENRL)
    end
end

function MODULE:NotifyPlayers()
    for _,ply in pairs(player.GetAll()) do
        ply:Notify(BaseWars.LANG.ClearingWeapons, BASEWARS_NOTIFICATION_GENRL)
    end
    timer.Simple(60, function()
        self:CleanAllWeapons()
    end)
end

local weaponCleanerTimer

if weaponCleanerTimer then
    timer.Remove(weaponCleanerTimer)
end

weaponCleanerTimer = timer.Create("WeaponCleanerTimer", 60 * MODULE.Delay, 0, function()
    BaseWars.WeaponCleaner:NotifyPlayers()
end)