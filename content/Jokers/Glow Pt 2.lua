SMODS.Joker {
    key = 'GlowPt2',
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 2
    },
    rarity = 1,
    config = {
        extra = {
            mult = 0,
            add = 2
        }
    },
    bgg_addsound = 'bgg_GlowPt2',
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { stg.add, stg.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'mult',
                scalar_value = 'add'
            })
        end
        if context.final_scoring_step and G.GAME.blind.chips <= hand_chips * mult and not context.blueprint then
            card.ability.extra.mult = 0
            return {
                message = localize('k_reset')
            }
        end
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Sound {
    key = 'GlowPt2',
    path = 'addsounds/GlowPt2.ogg'
}