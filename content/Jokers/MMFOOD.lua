SMODS.Joker {
    key = 'MMFOOD',
    atlas = 'Jokers',
    pos = {
        x = 1,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_MMFOOD',
    bgg_year = 2004,
    bgg_genres = { 'hiphop', },
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
    key = "MMFOOD",
    path = "addsounds/MMFOOD.ogg"
}
