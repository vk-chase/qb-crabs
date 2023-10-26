Config = Config or {}

Config.PayType = 'bank' -- 'cash' or 'bank'
Config.NotifyType 'rtx' -- 'rtx' 'qb' or 'okok'
--### BLIPS ###--
Config.PickupBlip = {x = -2334.1  , y = 2764.7 ,z = 3.15}
Config.DigsiteVector = vector3(-2334.10, 2764.70, 3.15)
Config.SellingSpot = {x = -1039.09, y = -1353.44, z = 5.53}
Config.DigsiteName = "Digging Site"
Config.SellBlip = "SeaFood Sales"





Config.SellSeafoodVector = vector3(-1039.09, -1353.44, 5.55)
Config.SellReturn = vector3(-1039.09, -1353.44, 5.55) --### blip location ### to sell fish, can be same as next vecotr3
Config.SellReturnLocation = {
   [1] = {
           coords = vector3(-1039.09, -1353.44, 5.55), --sell coordz for target
           length = 1,
           width = 1,
           heading = 0,
           debugPoly = false,
           minZ = 5.53-2,
           maxZ = 5.53+2,
           distance = 3.0
       },
   }
Config.BankMoney = false -- false= cash || true= bank
Config.UseTimes = false -- false= sell fish anytime || true sell between hours 
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time

--[[ --####### BY DEFAULT #######--
    crawfish = 60% chance on success
    shrimp = 20% chance on success
    crabs = 20% chance on success
]]
Config.ReturnItems = {   
    { item = 'crayfish',  price = math.random(5,20) },--these are randomized and will randomize every restart
    { item = 'shrimp',  price = math.random(100,200) },
    { item = 'crabs',  price = math.random(120,220) },
 
 }
