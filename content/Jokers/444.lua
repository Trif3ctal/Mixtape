SMODS.Joker {
    key = '444',
    atlas = 'Jokers',
    pos = {
        x = 9,
        y = 3
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_444',
    bgg_year = 2017,
    bgg_genres = { 'hiphop' },
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
    key = '444',
    path = 'addsounds/444.ogg'
}
