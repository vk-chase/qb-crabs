Config = {}

-- General Settings
Config.PayType = 'bank' -- 'cash' or 'bank'
Config.NotifyType = 'rtx' -- 'rtx', 'qb', or 'okok'
Config.BankMoney = false -- false = cash, true = bank
Config.UseTimes = false -- false = sell fish anytime, true = sell between specified hours
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time

-- Blips
Config.DigsiteName = "Digging Site"
Config.SellBlip = "SeaFood Sales"

-- Locations
Config.PickupBlip = vector3(-2334.1, 2764.7, 3.15)
Config.DigsiteVector = vector3(-2334.10, 2764.70, 3.15)
Config.SellingSpot = vector3(-1039.09, -1353.44, 5.53)
Config.SellSeafoodVector = vector3(-1039.09, -1353.44, 5.55)
Config.SellReturn = vector3(-1039.09, -1353.44, 5.55) -- Blip location to sell fish

Config.SellReturnLocation = {
    [1] = {
        coords = vector3(-1039.09, -1353.44, 5.55),
        length = 1,
        width = 1,
        heading = 0,
        debugPoly = false,
        minZ = 3.53,
        maxZ = 7.53,
        distance = 3.0
    },
}

-- Return Items
Config.ReturnItems = {   
    { item = 'crayfish', price = math.random(5, 20) },
    { item = 'shrimp', price = math.random(100, 200) },
    { item = 'crabs', price = math.random(120, 220) },
}

-- Digging Rewards (moved from server file)
Config.DiggingRewards = {
    { item = "crayfish", chance = 60, min = 1, max = 8 },
    { item = "shrimp", chance = 20, min = 1, max = 2 },
    { item = "crabs", chance = 20, min = 1, max = 2 }
}
