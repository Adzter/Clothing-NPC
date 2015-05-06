--[[

	This file is mainly here to solve small issues,
	for example when you change your model the sub materials
	persist, meaning a body material could be applied to a 
	face material on a different model

--]]

-- Reset materials when the player changes job
hook.Add("OnPlayerChangedTeam", "clothingTeamFix", function( ply, before, after )
	for k,v in pairs( ply:GetMaterials() ) do
		ply:SetSubMaterial( k, nil )
	end
end )