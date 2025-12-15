SMODS.Joker {
    key = 'BitterTongues',
    atlas = 'Jokers',
    pos = {
        x = 4,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    bgg_year = 2022,
    bgg_genres = { 'rock', 'pop'},
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
