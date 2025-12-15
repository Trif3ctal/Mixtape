SMODS.Joker {
    key = 'Chromakopia',
    atlas = 'Jokers',
    pos = {
        x = 8,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_Chromakopia',
    bgg_year = 2024,
    bgg_genres = { 'neosoul', 'hiphop' },
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
    key = 'Chromakopia',
    path = 'addsounds/Chromakopia.ogg'
}
