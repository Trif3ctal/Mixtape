SMODS.Joker {
    key = 'RunTheJewels3',
    atlas = 'Jokers',
    pos = {
        x = 3,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_RTJ3',
    bgg_year = 2016,
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
    key = "RTJ3",
    path = "addsounds/RTJ3.ogg"
}