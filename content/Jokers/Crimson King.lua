SMODS.Joker {
    key = 'CrimsonKing',
    atlas = 'Jokers',
    pos = {
        x = 0,
        y = 3
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    bgg_year = 1969,
    bgg_genres = { 'rock', },
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
