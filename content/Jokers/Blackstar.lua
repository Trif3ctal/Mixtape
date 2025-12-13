SMODS.Joker {
    key = 'Blackstar',
    atlas = 'Jokers',
    pos = {
        x = 8,
        y = 1
    },
    rarity = 1,
    config = {
        extra = {
            mult = 12
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = { stg.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local suits = {
                ['Spades'] = 0,
                ['Diamonds'] = 0
            }
            for i = 1, #context.scoring_hand do
                if not SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0 then
                        suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    end
                end
            end
            for i = 1, #context.scoring_hand do
                if SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
                        suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    end
                end
            end
            if suits["Spades"] > 0 and suits["Diamonds"] > 0 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
