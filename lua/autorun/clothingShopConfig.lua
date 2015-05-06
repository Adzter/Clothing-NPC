AddCSLuaFile()

--[[
   _____ _       _   _     _               _   _ _____   _____ 
  / ____| |     | | | |   (_)             | \ | |  __ \ / ____|
 | |    | | ___ | |_| |__  _ _ __   __ _  |  \| | |__) | |     
 | |    | |/ _ \| __| '_ \| | '_ \ / _` | | . ` |  ___/| |     
 | |____| | (_) | |_| | | | | | | | (_| | | |\  | |    | |____ 
  \_____|_|\___/ \__|_| |_|_|_| |_|\__, | |_| \_|_|     \_____|
                                    __/ |                      
                                   |___/                       
                                                                        
	Created by Adzter: http://steamcommunity.com/id/imadzter
	For NPIGamers: http://npigamers.com/

--]]

clothingConfig = {}

--Model of the NPC
clothingConfig.model = "models/Humans/Group02/Female_04.mdl"
--Name of the shop (shown in the GUI title)
clothingConfig.shopName = "Touching Cloth"
--No clothing for the playermodel error message
clothingConfig.noClothing = "Sorry! Out of stock"
--No clothing for the playermodel error message line 2
clothingConfig.noClothing2 = "Try a different character"
--Price for each time you change clothing
clothingConfig.price = 250
--Currency to be displayed before the price
clothingConfig.currency = "$"

--Left arrow text
clothingConfig.leftArrow = "←"
--Left arrow color
clothingConfig.leftArrowCol = Color( 0, 0, 0, 255 )
--Right arrow text
clothingConfig.rightArrow = "→"
--Right arrow color
clothingConfig.rightArrowCol = Color( 0, 0, 0, 255 )

clothingConfig.group01male = {
	"npigamers/humans/male/group01/custom_shirt01",
	"npigamers/humans/male/group01/custom_shirt02",
	"npigamers/humans/male/group02/malesurvivor1",
	"npigamers/humans/male/group02/malesurvivor4",
	"npigamers/humans/male/group02/malesurvivor7",
	"npigamers/humans/male/group02/malesurvivor9",
	"npigamers/humans/male/group02/malesurvivord",
	"npigamers/humans/male/group02/malesurvivore",
	"npigamers/humans/male/group02/malesurvivors",
	"npigamers/humans/male/group02/malesurvivorz",
}
clothingConfig.group02male = clothingConfig.group01male

clothingConfig.group01female = {
	"npigamers/humans/female/group02/fem_survivor1",
	"npigamers/humans/female/group02/fem_survivor2",
	"npigamers/humans/female/group02/fem_survivor6",
	"npigamers/humans/female/group02/fem_survivor7"
}
clothingConfig.group02female = clothingConfig.group01female
clothingConfig.gundealer = {
	"npigamers/gundealer/casual",
	"npigamers/gundealer/casual2",
	"npigamers/gundealer/soldier",
	"npigamers/gundealer/adidas"
}
clothingConfig.medic = {
	"npigamers/medic/business",
	"npigamers/medic/business2"
}
clothingConfig.hitman = {
	"npigamers/hitman/adidas",
	"npigamers/hitman/buckshot",
	"npigamers/hitman/casual",
	"npigamers/hitman/convict",
	"npigamers/hitman/highvis"
}
clothingConfig.thief = {
	"npigamers/thief/black",
	"npigamers/thief/blue",
	"npigamers/thief/camo",
	"npigamers/thief/camo2",
	"npigamers/thief/casual"
}
clothingConfig.swat = {
	"npigamers/swat/black",
	"npigamers/swat/blue",
	"npigamers/swat/green",
	"npigamers/swat/swat"
}
clothingConfig.bmarket = {
	"npigamers/bmarket/camo",
	"npigamers/bmarket/biker",
	"npigamers/bmarket/specops",
	"npigamers/bmarket/casual"
}
clothingConfig.mayor = {
	"npigamers/mayor/black",
	"npigamers/mayor/white",
	"npigamers/mayor/pin"
}

//====================================
//	LIST THAT IS SEARCHED THROUGH
//====================================
clothingConfig.groups = {
	clothingConfig.group01male,
	clothingConfig.group02male,
	clothingConfig.group03male,
	clothingConfig.group01female,
	clothingConfig.group02female,
	clothingConfig.group03female,
	clothingConfig.gundealer,
	clothingConfig.medic,
	clothingConfig.hitman,
	clothingConfig.thief,
	clothingConfig.swat,
	clothingConfig.bmarket,
	clothingConfig.mayor
}

--List of words you can replace
clothingConfig.replaceList = {
	{ "Dark Eyeball R", "Right Eye" },
	{ "Dark Eyeball L", "Left Eye" },
	{ "Eyeball R", "Right Eye" },
	{ "Eyeball L", "Left Eye" },
	{ "Players Sheet", "Body" },
	{ "Plyr Sheet", "Body" },
	{ "Erdim Cylmap", "Face" }
}