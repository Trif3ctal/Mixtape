SMODS.Joker {
    key = 'DemonDays',
    atlas = 'Jokers',
    pos = {
        x = 4,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_DemonDays',
    bgg_year = 2005,
    bgg_genres = { 'pop', 'rock', 'hiphop', 'electronic' },
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
    key = 'DemonDays',
    path = 'addsounds/Demon Days.ogg'
}
