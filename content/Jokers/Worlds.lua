SMODS.Joker {
    key = 'Worlds',
    atlas = 'Jokers',
    pos = {
        x = 1,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_Worlds',
    bgg_year = 2014,
    bgg_genres = { 'electronic', },
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
    key = 'Worlds',
    path = 'addsounds/Worlds.ogg'
}
