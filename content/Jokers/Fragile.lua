SMODS.Joker {
    key = 'Fragile',
    atlas = 'Jokers',
    pos = {
        x = 3,
        y = 3
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_Fragile',
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
    key = 'Fragile',
    path = 'addsounds/Fragile.ogg'
}
