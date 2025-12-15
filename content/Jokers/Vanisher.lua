SMODS.Joker {
    key = 'Vanisher',
    atlas = 'Jokers',
    pos = {
        x = 4,
        y = 2
    },
    rarity = 1,
    config = {
        extra = {
            xmult = 1,
            increase = 0.75
        }
    },
    bgg_addsound = 'bgg_Vanisher',
    bgg_genres = {'hiphop', 'pop', 'folk', 'electronic'},
    bgg_year = '2025',
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { stg.increase, stg.xmult }
        }
    end,
    calculate = function(self, card, context)
        if context.ante_change and context.ante_change > 0 and not context.blueprint then
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
                xmult = card.ability.extra.xmult
            }
        end
    end
}

SMODS.Sound {
    key = 'Vanisher',
    path = 'addsounds/Vanisher.ogg'
}
