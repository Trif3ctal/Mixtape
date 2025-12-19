SMODS.Joker {
    key = 'KeyOfLife',
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 4
    },
    rarity = 2,
    config = {
        extra = {
            xmult = 1,
            increase = 0.1
        }
    },
    bgg_addsound = 'bgg_KeyOfLife',
    bgg_year = 1976,
    bgg_genres = { 'soul', 'funk'},
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { stg.xmult, stg.increase }
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
        if context.before and next(context.poker_hands["Straight"]) and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'xmult',
                scalar_value = 'increase',
                message_key = 'a_xmult',
                message_colour = G.C.RED
            })
        end
        if context.joker_main then
            return {
                xmult = stg.xmult
            }
        end
    end
}

SMODS.Sound {
    key = 'KeyOfLife',
    path = 'addsounds/KeyOfLife.ogg'
}
