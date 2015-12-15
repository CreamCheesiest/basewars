local me = LocalPlayer()
local tag = "BaseWars.NPCs.Menu"

local grayTop 		= Color(128, 128, 128, 250)
local grayBottom 	= Color(96, 96, 96, 250)

local nodePanelBg	= Color(192, 192, 192, 250)
local shadowColor 	= Color(0, 0, 0, 200)

local bigFont = tag .. ".BigFont"
local medFont = tag .. ".MedFont"
local smallFont = tag .. ".SmallFont"

surface.CreateFont(bigFont, {

	font = "Roboto",
	size = 32,

})

surface.CreateFont(medFont, {

	font = "Roboto",
	size = 18,

})

surface.CreateFont(smallFont, {

	font = "Roboto",
	size = 16,

})

local white = Color(255, 255, 255)
local gray = Color(192, 192, 192)
local black = Color(0, 0, 0)

local function PrepMenu(ent)

	local Name = ent.PrintName

	local mainFrame = vgui.Create("DFrame")

	mainFrame:SetSize(900, 600)
	mainFrame:Center()
	mainFrame:SetTitle(Name)
	mainFrame:SetIcon("icon16/application.png")
	mainFrame:MakePopup()

	function mainFrame:Paint(w, h)

		draw.RoundedBoxEx(8, 0, 0, w, 24, grayTop, true, true, false, false)
		draw.RoundedBox(0, 0, 24, w, h - 24, grayBottom)

	end
	
	local tabPanel = mainFrame:Add("DPropertySheet")

	tabPanel:Dock(FILL)
	tabPanel:SetWide(200)

	function tabPanel:MakeTab(name, icon)

		local dpanel = vgui.Create("DPanel")
		self:AddSheet(name, dpanel, icon)

		return dpanel

	end

	local HelpTab = tabPanel:MakeTab("Help", "icon16/help.png")
	local QuestsTab = tabPanel:MakeTab("Quests", "icon16/ruby_gear.png")
	
	return mainFrame

end

local pnl
local function MakeNotExist(...)

	if pnl and IsValid(pnl) then return end

	pnl = PrepMenu(...)
	
end

 local function ReceiveNet(len)
 
	local Ent = net.ReadEntity()
	
	MakeNotExist(Ent)
	
end
net.Receive(tag, ReceiveNet)
