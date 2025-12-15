SMODS.Joker {
    key = 'V',
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 3
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_V',
    bgg_year = 2014,
    bgg_genres = { 'pop', 'electronic', 'rock' },
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
    key = 'V',
    path = 'addsounds/V.ogg'
}
