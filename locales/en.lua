
--- if you wanna translate, use this and make your own in the locales folder, cheers

local Translations = {
    error = {
        negative = 'Trying to sell a negative amount?',
        no_items = 'Not enough items',
        no_license = 'You do not have %{value} license',
    },
    success = {
        sold = 'You have sold %{value} x %{value2} for $%{value3}',
    },
    info = { 
        title = 'Sell Mudbug',
        open_return = 'Open the Mudbug Shop',
        sell = 'Sell Mudbug',
        sell_return = 'Sell Mudbug to Shop',
        fish_closed = 'Store is closed. Come back between %{value}:00 AM - %{value2}:00 PM',
        sell_items = 'Selling Price $%{value}',
        back = '⬅ Go Back',
        max = 'Max Amount %{value}',
    },


}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
