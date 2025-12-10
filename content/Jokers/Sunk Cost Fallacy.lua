SMODS.Joker {
    key = 'SunkCostFallacy',
    atlas = 'Jokers',
    pos = {
        x = 2,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_SunkCostFallacy',
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
    key = 'SunkCostFallacy',
    path = 'addsounds/Sunk Cost Fallacy.ogg'
}
