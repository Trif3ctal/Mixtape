SMODS.Joker {
    key = 'Chaser',
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_Chaser',
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
    key = 'Chaser',
    path = 'addsounds/Chaser.ogg'
}
