AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

util.AddNetworkString("sendClothingMenu")
util.AddNetworkString("buyClothes")

net.Receive( "buyClothes", function( len, ply )
	// Get values from the client
	local mat = net.ReadString()
	local str = net.ReadString()

	// Make sure the player can afford
	if not ply:canAfford( clothingConfig.price ) then
		DarkRP.notify( ply, 1, 3, "You cannot afford this" )
	end

	// Make sure the material they're sending isn't some random one
	// by comparing it against the config file
	local found = false
	for k,v in pairs( clothingConfig.groups ) do
		if table.HasValue( v, str ) then
			found = true
		end
	end
	
	if not found then return end
	
	// Check if they're near an NPC
	local near = false
	for k,v in pairs( ents.FindByClass( "npc_clothing" ) ) do
		if ply:GetPos():Distance( v:GetPos() ) < 150 then
			near = true
		end
	end
	
	if not near then return end
	
	// Remove the money
	ply:addMoney( -clothingConfig.price )
	
	// Send the notification
	DarkRP.notify( ply, 0, 3, "You have purchased some clothing" )
	
	// Set the material
	ply:SetSubMaterial( tonumber( mat ), str )
end)

function ENT:Initialize()
	self:SetSolid( 2 )
	self:SetModel( clothingConfig.model )
	self:SetUseType( SIMPLE_USE )
	self:SetAnimation( 0 )
	
	self:SetMoveType( MOVETYPE_STEP )
	self:SetSolid( SOLID_BBOX )
	self:SetCollisionGroup(COLLISION_GROUP_PLAYER)
end

local cooldown = CurTime()
-- prevent spamming with a cooldown
function ENT:AcceptInput(ply, caller)
	if caller:IsPlayer() && cooldown < CurTime() then
		cooldown = CurTime() + 1
		net.Start("sendClothingMenu")
		net.Send( caller )
	end
end