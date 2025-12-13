SMODS.Joker {
    key = 'VelvetUnderground',
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
            odds = 8,
            chips = 67
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'velvet_underground')
        return { vars = { card.ability.extra.chips, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'velvet_underground', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
