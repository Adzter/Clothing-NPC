include('shared.lua')

function ENT:Draw()
	self:DrawModel()
end

surface.CreateFont( "clothingDesc", {
	font = "Bebas Neue", 
	size = 25, 
	weight = 500, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
} )
surface.CreateFont( "clothingTitle", {
	font = "Bebas Neue", 
	size = 20, 
	weight = 500, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
} )
surface.CreateFont( "clothingArrow", {
	font = "Bebas Neue", 
	size = 200, 
	weight = 1000, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
} )

local function upperEachWord( str )
	strEx = string.Explode( " ", str )
	for k,v in pairs( strEx ) do
		strEx[k] = string.upper(string.sub(v, 1, 1)) .. string.sub( v, 2, string.len(v) )
	end

	return string.Implode(" ", strEx)
end
local function fancyName( str )
	str = string.GetFileFromFilename( str )
	str = string.Replace(str, "_", " ")
	str = upperEachWord( str )

	--Check if we should replace any words
	for k,v in pairs( clothingConfig.replaceList ) do
		if v[1] == str then
			str = v[2]
		end
	end
	
	return str
end
local function checkCustomMaterials( str )
	str = string.Explode( "/", str )
	
	if str[3] and str[4] then
		if str[3] == "group01" or "group02" then
			str = str[3] .. str[4]	
			return string.sub( str, 0, string.len( str )-7 )
		end
	end
	
	if str[3] then
		if str[3] == "monk.mdl" then
			return "gundealer"
		end
		
		if str[3] == "kleiner.mdl" then
			return "medic"
		end
		
		if str[3] == "leet.mdl" then
			return "hitman"
		end
		
		if str[3] == "arctic.mdl" then
			return "thief"
		end
		
		if str[3] == "swat.mdl" then
			return "swat"
		end
		
		if str[3] == "guerilla.mdl" then
			return "bmarket"
		end
		
		if str[3] == "breen.mdl" then
			return "mayor"
		end
	end
end

net.Receive( "sendClothingMenu", function()	
	local count = 0
	local materialCount = 1
	local currentTexture = "Loading"
	local customMaterials = clothingConfig[checkCustomMaterials( LocalPlayer():GetModel() )]
	
	if not customMaterials then 
		DFrame = vgui.Create( "DFrame" )
		DFrame:SetSize( 300, 200 )
		DFrame:Center()
		DFrame:SetTitle("")
		DFrame:MakePopup()
		
		function DFrame:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 240, 240, 240 ) )
			draw.RoundedBox( 0, 0, 0, w, 25, Color( 39, 174, 96) )
			draw.SimpleText( clothingConfig.shopName, "Trebuchet18", w/2, 3, Color(255,255,255), TEXT_ALIGN_CENTER, 0 )
			draw.SimpleText( clothingConfig.noClothing, "Trebuchet24", w/2, 65, Color(0,0,0), TEXT_ALIGN_CENTER, 0 )
			draw.SimpleText( clothingConfig.noClothing2, "Trebuchet24", w/2, 105, Color(0,0,0), TEXT_ALIGN_CENTER, 0 )
		end
		return
	end
	
	DFrame = vgui.Create( "DFrame" )
	DFrame:SetSize( 650, 550 )
	DFrame:Center()
	DFrame:SetTitle("")
	DFrame:MakePopup()
	
	function DFrame:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 240, 240, 240 ) )
		draw.RoundedBox( 0, 0, 0, w, 25, Color( 39, 174, 96) )
		draw.SimpleText( clothingConfig.shopName, "Trebuchet18", w/2, 3, Color(255,255,255), TEXT_ALIGN_CENTER, 0 )
	end
	
	local DModelPanel = vgui.Create( "DModelPanel", DFrame )
	DModelPanel:SetPos( 35, 10 )
	DModelPanel:SetSize( DFrame:GetWide() - 70, DFrame:GetTall()-25 )
	DModelPanel:SetModel( LocalPlayer():GetModel() )
	DModelPanel.Entity:SetAngles( Angle( 0, 45, 0 ) )
	currentTexture = fancyName( DModelPanel.Entity:GetMaterials()[1] )
	function DModelPanel:LayoutEntity( Entity ) end
	
	
	for k,v in pairs( DModelPanel.Entity:GetMaterials() ) do
		if fancyName( v ) == "Body" then
			currentTexture = fancyName( DModelPanel.Entity:GetMaterials()[k] )
			materialCount = k
		end
	end
	
	--[[
	local partLeft = vgui.Create( "DButton", DFrame )
	partLeft:SetText("")
	partLeft:SetPos( 60, -15 )
	partLeft:SetSize( 150, 100 )
	partLeft.Paint = function()
		draw.SimpleText( clothingConfig.leftArrow, "clothingArrow", partLeft:GetWide()/2, partLeft:GetTall()/2, clothingConfig.leftArrowCol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	partLeft.DoClick = function()
		materialCount = materialCount - 1
		
		if materialCount == 0 then
			materialCount = #DModelPanel.Entity:GetMaterials()
		elseif materialCount > #DModelPanel.Entity:GetMaterials() then
			materialCount = 1
		end

		currentTexture = fancyName(DModelPanel.Entity:GetMaterials()[materialCount])
	end
	
	local partRight = vgui.Create( "DButton", DFrame )
	partRight:SetText("")
	partRight:SetPos( 450, -15 )
	partRight:SetSize( 150, 100 )
	partRight.Paint = function()
		draw.SimpleText( clothingConfig.rightArrow, "clothingArrow", partRight:GetWide()/2, partRight:GetTall()/2, clothingConfig.rightArrowCol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	partRight.DoClick = function()
		materialCount = materialCount + 1
		
		if materialCount == 0 then
			materialCount = #DModelPanel.Entity:GetMaterials()
		elseif materialCount > #DModelPanel.Entity:GetMaterials() then
			materialCount = 1
		end

		currentTexture = fancyName( DModelPanel.Entity:GetMaterials()[materialCount] )
	end
	]]
	
	local outfitLeft = vgui.Create( "DButton", DFrame )
	outfitLeft:SetText("")
	outfitLeft:SetPos( 60, 150 )
	outfitLeft:SetSize( 150, 100 )
	outfitLeft.Paint = function()
		draw.SimpleText( clothingConfig.leftArrow, "clothingArrow", outfitLeft:GetWide()/2, outfitLeft:GetTall()/2, clothingConfig.leftArrowCol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	outfitLeft.DoClick = function()
		count = count - 1
		
		if count == -1 then
			count = #customMaterials
		elseif count > #customMaterials + 1 then
			count = 1
		end
		
		DModelPanel.Entity:SetSubMaterial( materialCount-1, customMaterials[count] )

		mat = materialCount - 1
		str = customMaterials[count] or ""
	end

	local outfitRight = vgui.Create( "DButton", DFrame )
	outfitRight:SetText("")
	outfitRight:SetPos( 450, 150 )
	outfitRight:SetSize( 150, 100 )
	outfitRight.Paint = function()
		draw.SimpleText( clothingConfig.rightArrow, "clothingArrow", outfitRight:GetWide()/2, outfitRight:GetTall()/2, clothingConfig.rightArrowCol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
	end
	outfitRight.DoClick = function()
		count = count + 1
		if count == 0 then
			count = #customMaterials
		elseif count > #customMaterials + 1 then
			count = 1
		end
		
		DModelPanel.Entity:SetSubMaterial( materialCount-1, customMaterials[count] )
		mat = materialCount - 1
		str = customMaterials[count] or ""
	end
	
	local DButton = vgui.Create("DButton", DFrame )
	DButton:SetPos( 490, 490 )
	DButton:SetText("")
	DButton:SetSize( 150, 50 )
	DButton.Paint = function()
		draw.RoundedBox( 0, 0, 0, DButton:GetWide(), DButton:GetTall(), Color( 39, 174, 96) )
		draw.SimpleText( clothingConfig.currency .. " " .. clothingConfig.price, "clothingDesc", DButton:GetWide()/2, DButton:GetTall()/2, Color(50,50,50), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	DButton.DoClick = function()
		net.Start("buyClothes")
			net.WriteString( mat )
			net.WriteString( str )
		net.SendToServer()
		
		DFrame:Remove()
	end
end)