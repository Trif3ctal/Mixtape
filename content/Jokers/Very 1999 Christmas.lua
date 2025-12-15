SMODS.Joker {
    key = 'Very1999Christmas',
    atlas = 'Jokers',
    pos = {
        x = 9,
        y = 2
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    bgg_year = 2024,
    bgg_genres = { 'jazz', },
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
