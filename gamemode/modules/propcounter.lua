MODULE.Name = "PropCounter"
MODULE.Author = "QuirkyLarry"
MODULE.Realm = 2


if CLIENT then
    local me = LocalPlayer()
    local fontName = "BaseWars.PropCounter"

    surface.CreateFont(fontName, {

        font = "Roboto",
        size = 30,
        weight = 800,

    })

    local propLimit = DPROP.DefaultPropLimit

    function MODULE:drawPropCounter()
        if me:IsValid() then
            text = me:GetCount("props")
        else
            text = 0
        end
        local fontWidth, fontHeight = surface.GetTextSize(text)
        local fontX = (ScrW() - fontWidth) / 1.1
        local fontY = ScrH() / 1.19
        draw.DrawText(text .. "     /    " .. propLimit, fontName, fontX, fontY, Color(255, 255, 255), TEXT_ALIGN_RIGHT)
        surface.SetMaterial(Material("icon32/propicon.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(fontX - 160, fontY, 32, 32)
    end

    hook.Add("InitPostEntity", "PropCounterInit", function()
        me = LocalPlayer()
        hook.Add("HUDPaint", "PropCounter", BaseWars.PropCounter.drawPropCounter)
    end)
end