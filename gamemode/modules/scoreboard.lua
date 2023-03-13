MODULE.Name = "Scoreboard"
MODULE.Author = "CreamCheese"
tag = "BaseWars.Scoreboard"

if CLIENT then

  ----------LAUNCH SEQUENCE----------

  local config = {
    superAdmin = {
        mute = true,
        kick = true,
        ban = true,
        jail = true,
        bring = true,
        goto = true,
        returnButton = true,
    },
    admin = {
        mute = true,
        kick = false,
        ban = false,
        jail = false,
        bring = true,
        goto = false,
        returnButton = true,
    },
    user = {
        mute = false,
        kick = false,
        ban = false,
        jail = false,
        bring = false,
        goto = false,
        returnButton = false,
    },
}



    local CreateScoreboard = function()
        local Scoreboard_Roundness = 8
        local Scoreboard_Color = Color(0, 0, 0, 220)
        local Scoreboard_XGap = 6
        local Scoreboard_YGap = 6
        local Scoreboard_TitleToNamesGap = 4
        local Title_Height = 12
        local Title_Color = Color(0, 60, 255)
        local Title_Font = "ScoreboardTitleFont"
        local Title_BackgroundRoundness = 4
        local Title_BackgroundColor = Color(30, 30, 30, 200)
        local Players_Spacing = 4
        local Players_EdgeGap = 4
        local Players_BackgroundRoundness = 4
        local Players_BackgroundColor = Color(30, 30, 30, 200)
        local PlayerBar_Height = 24
        local PlayerBar_Color = Color(255, 255, 255)
        local PlayerBar_Font = "ScoreboardPlayersFont"
        local PlayerBar_BackgroundRoundness = 4
        local PlayerBar_BackgroundColor = Color(0, 0, 0)
        local InfoBar_Height = 32
        local InfoBar_Color = Color(0, 60, 255)
        local InfoBar_Font = "ScoreboardInfoFont"
        local InfoBar_BackgroundRoundness = 4
        local InfoBar_BackgroundColor = Color(30, 30, 30, 200)
        local Columns = {}
        Columns[1] = {
            name = "Name",
            command = function(self, arg) return tostring(arg:Name()) end
        }
        Columns[2] = {
            name = "Rank",
            command = function(self, arg) return arg:GetUserGroup() end
        }
        Columns[3] = {
            name = "Faction",
            command = function(self, arg) return team.GetName(arg:Team()) end
        }
        Columns[4] = {
            name = "Level",
            command = function(self, arg) return arg:GetLevel() end
        }
        Columns[5] = {
            name = "Money",
            command = function(self, arg) return BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(arg:GetMoney()) end
        }
        Columns[6] = {
            name = "Ping",
            command = function(self, arg) return tostring(arg:Ping()) end
        }
        surface.CreateFont("ScoreboardTitleFont", {
            font = "CloseCaption_Normal",
            size = 42,
            weight = 1000,
            antialias = true
        })
        surface.CreateFont("ScoreboardInfoFont", {
            font = "CloseCaption_Normal",
            size = 28,
            weight = 1000,
            antialias = true
        })
        surface.CreateFont("ScoreboardPlayersFont", {
            font = "CloseCaption_Normal",
            size = 18,
            weight = 500,
            antialias = true
        })
        local Title_Text = GetHostName()
        Scoreboard = vgui.Create("DFrame")
        Scoreboard:SetSize(ScrW() * .75, ScrH() * .75)
        Scoreboard:SetPos((ScrW() * .25) * .5, (ScrH() * .25) * .5)
        Scoreboard:SetTitle("")
        Scoreboard:SetDraggable(false)
        Scoreboard:ShowCloseButton(false)
        Scoreboard.Open = function(self)
            Scoreboard:SetVisible(true)
        end
        Scoreboard.Close = function(self)
            Scoreboard:SetVisible(false)
        end
        Scoreboard.Paint = function(self)
            draw.RoundedBox(Scoreboard_Roundness, 0, 0, self:GetWide(), self:GetTall(), Scoreboard_Color)
        end
        Scoreboard.TitlePanel = vgui.Create("DPanel")
        Scoreboard.TitlePanel:SetParent(Scoreboard)
        Scoreboard.TitlePanel:SetPos(Scoreboard_XGap, Scoreboard_YGap)
        surface.SetFont(Title_Font)
        local w, h = surface.GetTextSize(Title_Text)
        local Height = h + (Title_Height * 2)
        Scoreboard.TitlePanel:SetSize(Scoreboard:GetWide() - (Scoreboard_XGap * 2), Height)
        Scoreboard.TitlePanel.Paint = function(self)
            draw.RoundedBox(Title_BackgroundRoundness, 0, 0, self:GetWide(), self:GetTall(), Title_BackgroundColor)
            surface.SetFont(Title_Font)
            surface.SetTextColor(Title_Color.r, Title_Color.g, Title_Color.b, Title_Color.a)
            surface.SetTextPos(self:GetWide() * .5 - (w * .5), self:GetTall() * .5 - (h * .5))
            surface.DrawText(Title_Text)
        end
        local Column_Width = Scoreboard:GetWide() - (Scoreboard_XGap * 2)
        local ColumnGap_Width = Column_Width / #Columns
        local ColumnGap_Half = ColumnGap_Width * .5
        Scoreboard.NamesListPanel = vgui.Create("DPanelList")
        Scoreboard.NamesListPanel.PlayerBars = {}
        Scoreboard.NamesListPanel.AdminBars = {}
        Scoreboard.NamesListPanel.NextRefresh = CurTime() + 3
        Scoreboard.NamesListPanel:SetParent(Scoreboard)
        Scoreboard.NamesListPanel:SetPos(Scoreboard_XGap, Scoreboard_YGap + Scoreboard.TitlePanel:GetTall() + Scoreboard_TitleToNamesGap + InfoBar_Height)
        Scoreboard.NamesListPanel:SetSize(Scoreboard:GetWide() - (Scoreboard_XGap * 2), Scoreboard:GetTall() - Scoreboard.TitlePanel:GetTall() - (Scoreboard_YGap * 2) - Scoreboard_TitleToNamesGap - InfoBar_Height)
        Scoreboard.NamesListPanel:SetSpacing(Players_Spacing)
        Scoreboard.NamesListPanel:SetPadding(Players_EdgeGap)
        Scoreboard.NamesListPanel:EnableHorizontal(false)
        Scoreboard.NamesListPanel:EnableVerticalScrollbar(true)
        Scoreboard.NamesListPanel.Refill = function(self)
            self:Clear()
            for k, pl in pairs(player.GetAll()) do
                local ID = tostring(pl:SteamID())
                self.PlayerBars[ID] = vgui.Create("DPanel")
                self.PlayerBars[ID]:SetPos(0, 0)
                self.PlayerBars[ID]:SetSize(Scoreboard.NamesListPanel:GetWide() - (Players_Spacing * 2), PlayerBar_Height)
                self.PlayerBars[ID].Paint = function(self)
                    draw.RoundedBox(PlayerBar_BackgroundRoundness, 0, 0, self:GetWide(), self:GetTall(), PlayerBar_BackgroundColor)
                    surface.SetFont(PlayerBar_Font)
                    surface.SetTextColor(PlayerBar_Color.r, PlayerBar_Color.g, PlayerBar_Color.b, PlayerBar_Color.a)
                    for k, v in pairs(Columns) do
                        local w, h = surface.GetTextSize(v:command(pl))
                        if k == 1 then
                            surface.SetTextPos((ColumnGap_Half * k) - (w * .5), self:GetTall() * .5 - (h * .5))
                        else
                            surface.SetTextPos((ColumnGap_Width * (k - 1)) + ColumnGap_Half - (w * .5), self:GetTall() * .5 - (h * .5))
                        end
                        surface.DrawText(v:command(pl))
                    end
                end
                local y = 20
                self:AddItem(self.PlayerBars[ID])
                self.AdminBars[ID] = vgui.Create("DPanel")
                self.AdminBars[k] = Player(pl:UserID())
                self.AdminBars[ID]:SetPos(0,0)
                self.AdminBars[ID]:SetAlpha(0)
                self.AdminBars[ID]:SetParent(Scoreboard.NamesListPanel)
                self.AdminBars[ID]:SetSize(20,y)
                local muteButton = vgui.Create("DButton", self.AdminBars[ID])
                muteButton:SetText("Mute")
                muteButton:SetSize(100, y)
                muteButton:Dock(LEFT)
                function muteButton:DoClick()
                    if(LocalPlayer():IsAdmin()) then
                        net.Start("Bw_MutePlayer")
                        net.WriteEntity(Scoreboard.NamesListPanel.AdminBars[k])
                        net.SendToServer()
                    end
                end
                local kickButton = vgui.Create("DButton", self.AdminBars[ID])
                kickButton:SetText("Kick")
                kickButton:SetSize(100, y)
                kickButton:Dock(LEFT)
                function kickButton:DoClick()
                    if LocalPlayer():IsAdmin() then
                        local frame = vgui.Create("DFrame")
                        frame:SetSize(300, 150)
                        frame:SetTitle("Kick Player")
                        frame:Center()
                        local label = vgui.Create("DLabel", frame)
                        label:SetText("Reason for kick:")
                        label:SetColor(Color(255,0,0))
                        label:SetSize(100, 30)
                        label:SetPos(10, 20)
                        local reasonText = vgui.Create("DTextEntry", frame)
                        reasonText:SetSize(200, 20)
                        reasonText:SetPos(10, 50)
                        local confirmButton = vgui.Create("DButton", frame)
                        confirmButton:SetText("Kick")
                        confirmButton:SetSize(80, 30)
                        confirmButton:SetPos(100, 100)
                        function confirmButton:DoClick()
                            net.Start("Bw_KickPlayer")
                            net.WriteEntity(Scoreboard.NamesListPanel.AdminBars[k])
                            net.WriteString(reasonText:GetValue())
                            net.SendToServer()
                            frame:Close()
                        end
                        frame:MakePopup()
                    end
                end
                local banButton = vgui.Create("DButton", self.AdminBars[ID])
                banButton:SetText("Ban")
                banButton:SetSize(100, y)
                banButton:Dock(LEFT)
                local jailButton = vgui.Create("DButton", self.AdminBars[ID])
                jailButton:SetText("Jail")
                jailButton:SetSize(100, y)
                jailButton:Dock(LEFT)
                function jailButton:DoClick()
                    print("Sending the Jail message to the server")
                    net.Start("Bw_JailPlayer")
                    net.WriteEntity(Scoreboard.NamesListPanel.AdminBars[k])
                    net.SendToServer()
                end
                local bringButton  = vgui.Create("DButton", self.AdminBars[ID])
                bringButton:SetText("Bring")
                bringButton:SetSize(100, y)
                bringButton:Dock(LEFT)
                function bringButton:DoClick()
                    net.Start("Bw_BringPlayer")
                    net.WriteEntity(Scoreboard.NamesListPanel.AdminBars[k])
                    net.SendToServer()
                end
                local gotoButton  = vgui.Create("DButton", self.AdminBars[ID])
                gotoButton:SetText("Goto")
                gotoButton:SetSize(100, y)
                gotoButton:Dock(LEFT)
                function gotoButton:DoClick()
                    net.Start("Bw_GotoPlayer")
                    net.WriteEntity(Scoreboard.NamesListPanel.AdminBars[k])
                    net.SendToServer()
                end
                local returnButton  = vgui.Create("DButton", self.AdminBars[ID])
                returnButton:SetText("Return")
                returnButton:SetSize(100, y)
                returnButton:Dock(LEFT)
                function returnButton:DoClick()
                    net.Start("Bw_ReturnPlayer")
                    net.WriteEntity(Scoreboard.NamesListPanel.AdminBars[k])
                    net.SendToServer()
                end
                if LocalPlayer():IsSuperAdmin() then
                    local playerType = "superAdmin"
                    self.AdminBars[ID]:SetAlpha(255)
                elseif LocalPlayer():IsAdmin() then
                    local playerType = "admin"
                    self.AdminBars[ID]:SetAlpha(255)
                else 
                    local playerType = "user"
                    self.AdminBars[ID]:SetAlpha(0)
                end 
                self:AddItem(self.AdminBars[ID]) 
                muteButton:SetVisible(config[playerType].mute)
                kickButton:SetVisible(config[playerType].kick)
                banButton:SetVisible(config[playerType].ban)
                jailButton:SetVisible(config[playerType].jail)
                bringButton:SetVisible(config[playerType].bring)
                gotoButton:SetVisible(config[playerType].goto)
                returnButton:SetVisible(config[playerType].returnButton)
                
            end
        end
        Scoreboard.NamesListPanel.Think = function(self)
            if self:IsVisible() and Scoreboard.NamesListPanel.NextRefresh < CurTime() then
                Scoreboard.NamesListPanel.NextRefresh = CurTime() + 3
                Scoreboard.NamesListPanel:Refill()
            end
        end
        Scoreboard.NamesListPanel.Paint = function(self)
            draw.RoundedBox(Players_BackgroundRoundness, 0, 0, self:GetWide(), self:GetTall(), Players_BackgroundColor)
        end
        Scoreboard.InfoBar = vgui.Create("DPanel")
        Scoreboard.InfoBar:SetParent(Scoreboard)
        Scoreboard.InfoBar:SetPos(Scoreboard_XGap, Scoreboard_YGap + Scoreboard.TitlePanel:GetTall() + Scoreboard_TitleToNamesGap)
        Scoreboard.InfoBar:SetSize(Scoreboard:GetWide() - (Scoreboard_XGap * 2), InfoBar_Height)
        Scoreboard.InfoBar.Paint = function(self)
            draw.RoundedBox(InfoBar_BackgroundRoundness, 0, 0, self:GetWide(), self:GetTall(), InfoBar_BackgroundColor)
            surface.SetFont(InfoBar_Font)
            surface.SetTextColor(InfoBar_Color.r, InfoBar_Color.g, InfoBar_Color.b, InfoBar_Color.a)
            for k, v in pairs(Columns) do
                local w, h = surface.GetTextSize(v.name)
                if k == 1 then
                    surface.SetTextPos((ColumnGap_Half * k) - (w * .5), self:GetTall() * .5 - (h * .5))
                else
                    surface.SetTextPos((ColumnGap_Width * (k - 1)) + ColumnGap_Half - (w * .5), self:GetTall() * .5 - (h * .5))
                end
                surface.DrawText(v.name)
            end
        end
        Scoreboard.NamesListPanel:Refill()
    end
    ----------Hooks----------
    function ScoreboardOpened()
        if not IsValid(Scoreboard) then
            CreateScoreboard()
        end
        Scoreboard:Open()
        gui.EnableScreenClicker(true)
        return true
    end
    hook.Add("ScoreboardShow", "Open scoreboard.", ScoreboardOpened)
    function ScoreboardClosed()
        if not IsValid(Scoreboard) then
            CreateScoreboard()
        end
        gui.EnableScreenClicker(false)
        Scoreboard:Close()
        return true
    end
    hook.Add("ScoreboardHide", "Close scoreboard.", ScoreboardClosed)
else
    --net messages handle
    util.AddNetworkString("Bw_KickPlayer")
    util.AddNetworkString("Bw_JailPlayer")
    util.AddNetworkString("Bw_MutePlayer")
    util.AddNetworkString("Bw_BringPlayer")
    util.AddNetworkString("Bw_GotoPlayer")
    util.AddNetworkString("Bw_ReturnPlayer")
    net.Receive("Bw_KickPlayer", function(len, ply)
        local target = net.ReadEntity()
        local reason = net.ReadString()
        ulx.kick(ply, {target}, reason)
    end)
    net.Receive("Bw_JailPlayer", function(len, ply)
        local target = net.ReadEntity()
        if target.jail then
            ulx.jail(ply, {target}, 0, true)
        else
            ulx.jail(ply, {target}, 0, false)
        end
    end)
    net.Receive("Bw_MutePlayer", function(length, ply)
        local target = net.ReadEntity()
        local playerCaller = ply
        if target.gimp then
            ulx.mute(playerCaller, {target}, true)
        else
            ulx.mute(playerCaller, {target}, false)
        end
    end)
    net.Receive("Bw_BringPlayer", function(len, ply)
        local target = net.ReadEntity()
        ulx.bring(ply, {target})
    end)
    net.Receive("Bw_GotoPlayer", function(len, ply)
        local target = net.ReadEntity()
        ulx.goto(ply, target)
    end)
    net.Receive("Bw_ReturnPlayer", function(len, ply)
        local target = net.ReadEntity()
        ulx.retrn(ply, target)
    end)
end