SMODS.Joker {
    key = 'Currents',
    atlas = 'Jokers',
    pos = {
        x = 6,
        y = 3
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_Currents',
    bgg_year = 2015,
    bgg_genres = { 'pop', 'rock' },
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
    end
}

SMODS.Sound {
    key = 'Currents',
    path = 'addsounds/Currents.ogg'
}
