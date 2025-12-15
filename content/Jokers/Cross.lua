SMODS.Joker {
    key = 'Cross',
    atlas = 'Jokers',
    pos = {
        x = 0,
        y = 1
    },
    rarity = 2,
    config = {
        extra = {
            xmult = 2
        }
    },
    bgg_addsound = 'bgg_Cross',
    bgg_year = 2007,
    bgg_genres = { 'electronic' },
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { stg.xmult }
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra

        if context.before and not context.blueprint then
            local target = context.scoring_hand[#context.scoring_hand]
            if not target.debuff then
                SMODS.debuff_card(target, true, card)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target:juice_up()
                        return true;
                    end
                }))
                return {
                    message = localize('k_debuffed')
                }
            end
        end

        if context.joker_main then
            local debuff_count = 0
            for k, v in pairs(context.scoring_hand) do
                if v.debuff then
                    debuff_count = debuff_count + 1
                end
            end
            return {
                xmult = stg.xmult * debuff_count
            }
        end
    end
}

SMODS.Sound {
    key = 'Cross',
    path = 'addsounds/Cross.ogg'
}
