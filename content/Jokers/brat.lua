SMODS.Joker {
    key = 'brat',
    atlas = 'Jokers',
    pos = {
        x = 8,
        y = 3
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    bgg_year = 2024,
    bgg_genres = { 'pop', 'electronic' },
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
