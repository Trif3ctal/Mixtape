SMODS.Joker {
    key = 'Vessels',
    atlas = 'Jokers',
    pos = {
        x = 3,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_Vessels',
    bgg_year = 2017,
    bgg_genres = { 'rock' },
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
    key = 'Vessels',
    path = 'addsounds/Vessels.ogg'
}
