SMODS.Joker {
    key = 'NeverKnowWhy',
    atlas = 'Jokers',
    pos = {
        x = 6,
        y = 2
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    -- jmix_addsound = 'jmix_templatestring',
    jmix_year = 2009,
    jmix_genres = { 'pop', 'rock' },
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
        if context.before and not context.blueprint and context.main_eval then
            for i = 1, #context.scoring_hand do
                local card_ = context.scoring_hand[i]
                if not SMODS.has_no_rank(card_) and card_:get_id() == 2 then
                    local random_enhancement = SMODS.poll_enhancement { key = 'NeverKnowWhy', guaranteed = true }
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.20,
                        func = function()
                            card_:flip()
                            play_sound('card1', 1)
                            card:juice_up(0.3, 0.5)
                            card_:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                    card_:set_ability(random_enhancement, nil, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.20,
                        func = function()
                            card_:flip()
                            play_sound('tarot2', 0.85, 0.6)
                            card_:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
            end
        end
    end
}
