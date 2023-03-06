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

    hook.Add("HUDPaint", "PropCounter", function()
        if me:IsValid() then
            text = me:GetCount("props")
        else
            text = 0
        end
        local fontWidth, fontHeight = surface.GetTextSize(text)
        draw.DrawText(text .. "     /    " .. propLimit, fontName, (ScrW() - fontWidth) / 1.1, ScrH() / 1.19, Color(255, 255, 255), TEXT_ALIGN_RIGHT)
        surface.SetMaterial(Material("icon32/propicon.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect((ScrW() - fontWidth) / 1.19, ScrH() / 1.19, 32, 32)
    end)
end