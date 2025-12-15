SMODS.Joker {
    key = 'WhitePony',
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 2
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    bgg_year = 2000,
    bgg_genres = { 'rock', 'metal' },
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
